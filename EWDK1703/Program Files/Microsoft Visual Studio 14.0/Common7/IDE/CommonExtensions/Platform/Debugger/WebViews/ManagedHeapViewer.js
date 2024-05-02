var Debugger;
(function (Debugger) {
    (function (ManagedMemoryAnalyzer) {
        (function (HeapViewer) {
            Microsoft.Plugin.addEventListener("pluginready", function () {
                try  {
                    var apex = Microsoft.Plugin.Utilities.JSONMarshaler.attachToPublishedObject("Microsoft.Test.Apex.VisualStudio.JavaScriptInjection.ApexExtensionMarshaler", {}, true);
                    if (apex !== null) {
                        apex._call("getApexJavaScript").done(function (result) {
                            if (result) {
                                console.log("got apex javascript files");
                                var scriptObj = document.createElement("script");
                                scriptObj.setAttribute("type", "text/javascript");
                                scriptObj.setAttribute("src", result);
                                var head = document.getElementsByTagName("head");
                                if (!head) {
                                    console.log("Unable to add apex script to document");
                                } else {
                                    head[0].appendChild(scriptObj);
                                    console.log("Added ApexJSExtension '" + result + "' to document");
                                }
                            } else {
                                console.log("no file was returned by getApexJavaScript, cannot inject TestExtension.ts for ApexJS framework");
                            }
                        }, function (error) {
                            console.log("Error when calling getApexJavaScript function:" + String(error));
                        });
                    } else {
                        console.log("Unable to connect to port marshaler 'Microsoft.Test.Apex.VisualStudio.JavaScriptInjection.ApexExtensionMarshaler'");
                    }
                } catch (e) {
                    console.log(e.toString());
                }
            });
        })(ManagedMemoryAnalyzer.HeapViewer || (ManagedMemoryAnalyzer.HeapViewer = {}));
        var HeapViewer = ManagedMemoryAnalyzer.HeapViewer;
    })(Debugger.ManagedMemoryAnalyzer || (Debugger.ManagedMemoryAnalyzer = {}));
    var ManagedMemoryAnalyzer = Debugger.ManagedMemoryAnalyzer;
})(Debugger || (Debugger = {}));
var Debugger;
(function (Debugger) {
    (function (ManagedMemoryAnalyzer) {
        (function (HeapViewer) {
            var HorizontalSplitter = (function () {
                function HorizontalSplitter(splitter, ratio, updateCallback) {
                    this.SplitRatioMin = 0.1;
                    this.SplitRatioMax = 0.9;
                    this._updateCallback = updateCallback;
                    this._splitter = splitter;
                    this._splitRatio = ratio;
                    this._isActive = false;
                    this._snappedContent = null;
                    this._splitterHeight = splitter.getBoundingClientRect().height;
                    this._container = splitter.parentElement;
                    this._top = this._container.children[0];
                    this._bottom = this._container.children[2];

                    this._splitter.style.cursor = "ns-resize";
                    this._events = new Array();
                    this._events["mousedown"] = this.onMouseDown.bind(this);
                    this._events["mouseup"] = this.onMouseUp.bind(this);
                    this._events["mousemove"] = this.onMouseMove.bind(this);
                    this._splitter.onmousedown = this._events["mousedown"];
                    window.addEventListener("mouseup", this._events["mouseup"]);
                    window.addEventListener("mousemove", this._events["mousemove"]);

                    this._events["resize"] = this.update.bind(this);
                    window.addEventListener('resize', this._events["resize"]);
                    this._container.addEventListener('resize', this._events["resize"]);

                    this.updateLayout();
                }
                HorizontalSplitter.prototype.update = function () {
                    if (this._snappedContent) {
                        this._snappedContentHeight = this._snappedContent.clientHeight;
                        this.snapToContent();
                    } else {
                        this.updateLayout();
                        this._updateCallback();
                    }
                };

                HorizontalSplitter.prototype.updateLayout = function (mouseY) {
                    var parent = this._container.parentElement;
                    var parentRect = parent.getBoundingClientRect();
                    var containerRect = this._container.getBoundingClientRect();
                    var containerHeight = (parentRect.height - containerRect.top) + "px";
                    if (this._container.style.height !== containerHeight) {
                        this._container.style.height = containerHeight;
                    }

                    containerRect = this._container.getBoundingClientRect();
                    var topHeight = 0;
                    var bottomHeight = 0;
                    var ratio = 0;

                    var splitterPosition = mouseY - containerRect.top;
                    if (splitterPosition) {
                        topHeight = splitterPosition - this._splitterHeight / 2;
                        bottomHeight = containerRect.height - this._splitterHeight / 2 - splitterPosition;
                        ratio = (topHeight + this._splitterHeight / 2) / containerRect.height;
                    } else {
                        ratio = this._splitRatio;
                        topHeight = Math.floor(ratio * containerRect.height - this._splitterHeight / 2);
                        bottomHeight = Math.floor((1 - ratio) * containerRect.height - this._splitterHeight / 2);
                    }

                    if ((ratio >= this.SplitRatioMin && ratio <= this.SplitRatioMax) || this._snappedContent) {
                        this._splitRatio = ratio;

                        this._top.style.top = "0px";
                        this._top.style.height = topHeight.toString() + "px";

                        this._bottom.style.top = (topHeight + this._splitterHeight).toString() + "px";
                        this._bottom.style.height = bottomHeight.toString() + "px";

                        this._splitter.style.top = topHeight.toString() + "px";
                    }
                };

                HorizontalSplitter.prototype.snapToContent = function (elem, snapToTop) {
                    if (elem) {
                        if (!this._snappedContent) {
                            this._unsnappedHeight = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getPosition(this._splitter, true)["y"];
                        }
                        this._snappedContent = elem;
                        this._snappedContentHeight = this._snappedContent.clientHeight;
                    } else if (!this._snappedContent) {
                        return;
                    }

                    var position = snapToTop ? this._snappedContentHeight + (this._splitterHeight / 2) : document.body.clientHeight - (this._snappedContentHeight + (this._splitterHeight / 2));

                    this.updateLayout(position);
                    this._updateCallback();
                };

                HorizontalSplitter.prototype.unsnapFromContent = function () {
                    if (this._snappedContent) {
                        this._snappedContent = null;
                        this.updateLayout(this._unsnappedHeight);
                        this._updateCallback();
                    }
                };

                HorizontalSplitter.prototype.dispose = function () {
                    this._splitter.onmousedown = null;
                    window.removeEventListener("mouseup", this._events["mouseup"]);
                    window.removeEventListener("mousemove", this._events["mousemove"]);
                    window.removeEventListener("resize", this._events["resize"]);
                    this._container.removeEventListener("resize", this._events["resize"]);
                    this._events = null;
                };

                HorizontalSplitter.prototype.onMouseDown = function (e) {
                    if (!this._snappedContent) {
                        this._isActive = true;
                    }
                };

                HorizontalSplitter.prototype.onMouseUp = function (e) {
                    if (!this._snappedContent && this._isActive) {
                        this._isActive = false;
                        this._updateCallback();
                    }
                };

                HorizontalSplitter.prototype.onMouseMove = function (e) {
                    if (!this._snappedContent && this._isActive) {
                        var containerRect = this._container.getBoundingClientRect();
                        this.updateLayout(e.pageY);
                        e.stopImmediatePropagation();
                        e.preventDefault();
                    }
                };
                return HorizontalSplitter;
            })();
            HeapViewer.HorizontalSplitter = HorizontalSplitter;
        })(ManagedMemoryAnalyzer.HeapViewer || (ManagedMemoryAnalyzer.HeapViewer = {}));
        var HeapViewer = ManagedMemoryAnalyzer.HeapViewer;
    })(Debugger.ManagedMemoryAnalyzer || (Debugger.ManagedMemoryAnalyzer = {}));
    var ManagedMemoryAnalyzer = Debugger.ManagedMemoryAnalyzer;
})(Debugger || (Debugger = {}));
var __extends = this.__extends || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    __.prototype = b.prototype;
    d.prototype = new __();
};
var Debugger;
(function (Debugger) {
    (function (ManagedMemoryAnalyzer) {
        (function (HeapViewer) {
            var MMADynamicGridViewer = (function (_super) {
                __extends(MMADynamicGridViewer, _super);
                function MMADynamicGridViewer(dataArray, root, options) {
                    _super.call(this, dataArray, root, options);

                    this._dataTipShown = false;
                    this._dataTipActivationCookie = 0;
                }
                MMADynamicGridViewer.prototype._trySorting = function (sortOrder, sortColumns) {
                    this.options().sortOrders = sortOrder;
                };

                MMADynamicGridViewer.prototype.getDatatipCell = function (e, element) {
                    return null;
                };

                MMADynamicGridViewer.prototype.createElementWithClass = function (tagName, className) {
                    var _this = this;
                    var element = _super.prototype.createElementWithClass.call(this, tagName, className);

                    if (className === "grid-cell" || className === "grid-cell-ref") {
                        element.addEventListener("mouseover", function (e) {
                            return _this.onColumnMouseOver(e, element);
                        });
                        element.addEventListener("mouseout", function (e) {
                            return _this.onColumnMouseOut(e, element);
                        });
                        element.addEventListener("mousedown", function (e) {
                            _this.tryToCloseDataTip(true);
                        });
                    }
                    return element;
                };

                MMADynamicGridViewer.prototype.onColumnMouseOver = function (e, element) {
                    var _this = this;
                    this.tryToCloseDataTip(true);

                    if (this._treeIconMouseOver)
                        return;

                    var valueColumnElement = this.getDatatipCell(e, element);
                    if (!valueColumnElement) {
                        return;
                    }

                    valueColumnElement.removeAttribute("data-plugin-vs-tooltip");
                    this._dataTipActivationCookie = window.setTimeout(function () {
                        if (_this._dataTipActivationCookie) {
                            _this.activateValueDataTip(e, valueColumnElement);
                        }
                    }, 300);
                };

                MMADynamicGridViewer.prototype.onColumnMouseOut = function (e, element) {
                    if (this._dataTipActivationCookie) {
                        window.clearTimeout(this._dataTipActivationCookie);
                        this._dataTipActivationCookie = 0;
                    }
                    if (this._dataTipShown) {
                        var toElement = e.toElement;
                        var forceClose = !!toElement && (toElement.classList.contains("grid-row") || toElement.classList.contains("grid-cell") || toElement.classList.contains("grid-cell-ref"));
                        this.tryToCloseDataTip(forceClose);
                    }
                };

                MMADynamicGridViewer.prototype.activateValueDataTip = function (e, valueColumn) {
                    var _this = this;
                    var row = valueColumn.parentElement;
                    if (!row) {
                        return;
                    }

                    var rowInfo = this.getRowInfoFromEvent(e, "." + row.classList.item(0));
                    if (!rowInfo) {
                        return;
                    }
                    var dataIndex = (rowInfo.dataIndex);

                    this._dataArray.get(dataIndex.path, function (value) {
                        var tag = value["Tag"];
                        var columnRect = valueColumn.getBoundingClientRect();

                        var x = Math.round(e.clientX);
                        var y = Math.round(e.clientY);
                        var left = Math.round(columnRect.left);
                        var right = Math.round(columnRect.right);
                        var top = Math.round(columnRect.top);
                        var bottom = Math.round(columnRect.bottom);
                        var isMousePointerInsideTheColumn = x >= left && x <= right && y >= top && y <= bottom;

                        var horizontalOffset = Math.min(20, Math.abs(x - right));
                        if (isMousePointerInsideTheColumn) {
                            var dataTipInfo = {
                                "tag": tag,
                                "x": x + horizontalOffset,
                                "y": top,
                                "left": left,
                                "top": top,
                                "right": right,
                                "bottom": bottom
                            };
                            _this._dataTipShown = true;
                            _this.adaptor()._call("ShowDataTip", dataTipInfo);
                        }
                    });
                };

                MMADynamicGridViewer.prototype.tryToCloseDataTip = function (closeForcefully) {
                    var _this = this;
                    if (closeForcefully) {
                        window.clearTimeout(this._dataTipActivationCookie);
                    }
                    try  {
                        this.adaptor()._call("CloseDataTip", closeForcefully).done(function (dataTipHasBeenClosed) {
                            if (dataTipHasBeenClosed) {
                                _this._dataTipShown = false;
                            }
                        });
                    } catch (err) {
                    }
                };

                MMADynamicGridViewer.prototype.onTreeIconMouseOver = function (e) {
                    this._treeIconMouseOver = true;
                    this.tryToCloseDataTip(true);
                };

                MMADynamicGridViewer.prototype.onTreeIconMouseOut = function (e) {
                    this._treeIconMouseOver = false;
                };

                MMADynamicGridViewer.prototype._onBlur = function (e) {
                    this.tryToCloseDataTip(false);
                    _super.prototype._onBlur.call(this, e);
                };

                MMADynamicGridViewer.prototype.addWatch = function () {
                    var _this = this;
                    var dataIndex = this.getSelectedDataIndex();

                    this._dataArray.get(dataIndex.path, function (value) {
                        var tag = value["Tag"];
                        _this.adaptor()._call("AddWatch", tag);
                    });
                };

                MMADynamicGridViewer.prototype.quickWatch = function () {
                    var _this = this;
                    var dataIndex = this.getSelectedDataIndex();

                    this._dataArray.get(dataIndex.path, function (value) {
                        _this.tryToCloseDataTip(true);
                        var tag = value["Tag"];
                        _this.adaptor()._call("QuickWatch", tag);
                    });
                };
                return MMADynamicGridViewer;
            })(Common.Controls.DynamicGrid.DynamicGridViewer);
            HeapViewer.MMADynamicGridViewer = MMADynamicGridViewer;

            var ProxyArrayWithAsyncPayload = (function (_super) {
                __extends(ProxyArrayWithAsyncPayload, _super);
                function ProxyArrayWithAsyncPayload(adaptor, gate, cacheSize) {
                    var _this = this;
                    _super.call(this, adaptor, gate, cacheSize);
                    this.adaptor().addEventListener(gate + "AsyncComplete", function (reply) {
                        return _this.onAsyncData(reply.Result);
                    });
                }
                ProxyArrayWithAsyncPayload.prototype.flushCache = function () {
                    this._mergedResultsStorage = {};
                    this._asyncResultsStorage = {};
                    this._asyncResultsNotReceived = {};
                    _super.prototype.flushCache.call(this);
                };

                ProxyArrayWithAsyncPayload.prototype.registerAsyncResultCallback = function (callback) {
                    this._asyncResultCallback = callback;
                };

                ProxyArrayWithAsyncPayload.prototype.get = function (index, func) {
                    var _this = this;
                    _super.prototype.get.call(this, index, function (value, needUpdate) {
                        if (_this._mergedResultsStorage[index]) {
                            func(_this._mergedResultsStorage[index], false);
                        } else {
                            if (value && value["Async"]) {
                                if (_this._asyncResultsStorage[index]) {
                                    value = _this._mergedResultsStorage[index] = _this.mergeObjects(value, _this._asyncResultsStorage[index]);
                                    delete _this._asyncResultsStorage[index];
                                } else {
                                    _this._asyncResultsNotReceived[index] = value;
                                }
                            }
                            func(value, needUpdate);
                        }
                    });
                };

                ProxyArrayWithAsyncPayload.prototype.onAsyncData = function (asyncResults) {
                    var _this = this;
                    asyncResults.forEach(function (asyncResult) {
                        var index = asyncResult["AsyncIndex"];

                        var value = _this._asyncResultsNotReceived[index];
                        if (!value) {
                            _this._asyncResultsStorage[index] = asyncResult;
                        } else {
                            _this._mergedResultsStorage[index] = _this.mergeObjects(value, asyncResult);
                            delete _this._asyncResultsNotReceived[index];

                            if (_this._asyncResultCallback) {
                                _this._asyncResultCallback(index, value);
                            }
                        }
                    });
                };

                ProxyArrayWithAsyncPayload.prototype.mergeObjects = function (to, from) {
                    for (var property in to) {
                        if (to.hasOwnProperty(property) && from.hasOwnProperty(property)) {
                            to[property] = from[property];
                        }
                    }
                    return to;
                };
                return ProxyArrayWithAsyncPayload;
            })(Common.Controls.DynamicGrid.ProxyArray);
            HeapViewer.ProxyArrayWithAsyncPayload = ProxyArrayWithAsyncPayload;
        })(ManagedMemoryAnalyzer.HeapViewer || (ManagedMemoryAnalyzer.HeapViewer = {}));
        var HeapViewer = ManagedMemoryAnalyzer.HeapViewer;
    })(Debugger.ManagedMemoryAnalyzer || (Debugger.ManagedMemoryAnalyzer = {}));
    var ManagedMemoryAnalyzer = Debugger.ManagedMemoryAnalyzer;
})(Debugger || (Debugger = {}));
var Debugger;
(function (Debugger) {
    (function (ManagedMemoryAnalyzer) {
        (function (HeapViewer) {
            var MemoryAnalyzerGridViewer = (function (_super) {
                __extends(MemoryAnalyzerGridViewer, _super);
                function MemoryAnalyzerGridViewer(root, viewChangedCallback, dataArray, gridContextMenu, columns, refGraphCallback, setFilterPlaceholderCallback, setFilterAndSortOrderHandler) {
                    this._dirtyFlag = false;

                    this._gridColumns = columns;
                    this._refGraphShowCallback = refGraphCallback;
                    this._setFilterPlaceholderCallback = setFilterPlaceholderCallback;
                    this._setFilterAndSortOrderHandler = setFilterAndSortOrderHandler;

                    var options = new Common.Controls.DynamicGrid.DynamicGridViewerOptions(gridContextMenu, null, this._gridColumns, null);
                    options.overflowColumn = true;
                    options.focusable = true;

                    this._refGraphNoDataElement = document.getElementById("managedHeapViewerRefGraphNoData");
                    this.showRefGraphNoData(true);

                    this._filterDomElement = document.getElementById("filterInput");
                    this._filter = "";

                    _super.call(this, dataArray, root, options);

                    this.setDefaultSortOrder();

                    this._viewChangedCallback = viewChangedCallback;
                }
                MemoryAnalyzerGridViewer.prototype.scheduleUpdate = function () {
                    var _this = this;
                    _super.prototype.scheduleUpdate.call(this, function () {
                        _this._viewChangedCallback(_this._dataArray.size() <= 0);
                    });
                };

                MemoryAnalyzerGridViewer.prototype.setDirty = function (dirty) {
                    this._dirtyFlag = dirty;
                };

                MemoryAnalyzerGridViewer.prototype.isDirty = function () {
                    return this._dirtyFlag;
                };

                MemoryAnalyzerGridViewer.prototype.resetView = function () {
                    this.refresh();
                    this._currentSelectedIndex = -1;
                    HeapViewer.MemoryAnalyzerViewer.instance.resetCurrentSelectedIndex();

                    this.showRefGraph(false);
                    this._clearSelection();
                    this.setDirty(false);
                };

                MemoryAnalyzerGridViewer.prototype.setFilterAsync = function (filterString) {
                    var _this = this;
                    if (filterString !== this._filter) {
                        this._filter = filterString;
                        this.adaptor()._call(this._setFilterAndSortOrderHandler, this._filter, this._sortOrderIndex, this._sortOrderOrder).done(function (refresh) {
                            if (refresh) {
                                _this.resetView();
                            }
                        });
                    }

                    if (this.rootElement.style.display !== "none" && this._filterDomElement.value !== this._filter) {
                        this._filterDomElement.value = this._filter;
                        if (!this._filter || this._filter.length === 0) {
                            this._filterDomElement.value = "";
                            this._setFilterPlaceholderCallback();
                        } else {
                            this._filterDomElement.placeholder = "";
                        }
                    }
                };

                MemoryAnalyzerGridViewer.prototype.resetFilter = function () {
                    this.setFilterAsync(this._filter);
                };

                MemoryAnalyzerGridViewer.prototype.clearFilter = function () {
                    this.setFilterAsync("");
                };

                MemoryAnalyzerGridViewer.prototype.clearCurrentSelection = function () {
                    this._currentSelectedIndex = -1;
                };

                MemoryAnalyzerGridViewer.prototype.hasFilter = function () {
                    if (this._filter) {
                        return true;
                    }

                    return false;
                };

                MemoryAnalyzerGridViewer.prototype.onCtrlC = function () {
                    var dataIndex = this.getSelectedDataIndex();
                    var rowText = this.getRowTextString(dataIndex);

                    if (rowText) {
                        HeapViewer.MemoryAnalyzerViewer.dataForClipboard = rowText;
                        HeapViewer.MemoryAnalyzerViewer.copySelectedRowToClipboard(null, null, null);
                    }
                };

                MemoryAnalyzerGridViewer.prototype.initializeContextMenu = function (dataIndex) {
                    var rowText = this.getRowTextString(dataIndex);
                    if (rowText) {
                        HeapViewer.MemoryAnalyzerViewer.dataForClipboard = rowText;
                        return true;
                    }

                    return false;
                };

                MemoryAnalyzerGridViewer.prototype._trySorting = function (sortOrder, sortColumns) {
                    var _this = this;
                    this._sortOrderIndex = sortOrder[0].index;
                    this._sortOrderOrder = sortOrder[0].order;
                    this.adaptor()._call(this._setFilterAndSortOrderHandler, this._filter, this._sortOrderIndex, this._sortOrderOrder).done(function () {
                        _this.getCanvas().scrollTop = 0;
                        _this.fireCustomEvent(_this.getCanvas(), "scroll");
                        _this.refresh();

                        _this._currentSelectedIndex = -1;
                        HeapViewer.MemoryAnalyzerViewer.instance.resetCurrentSelectedIndex();

                        _this._refGraphShowCallback(false);
                        _this._clearSelection();
                        _this._refGraphNoDataElement.style.display = "block";
                    });
                    _super.prototype._trySorting.call(this, sortOrder, sortColumns);
                };

                MemoryAnalyzerGridViewer.prototype.translateColumn = function (row, index) {
                    var retval = _super.prototype.translateColumn.call(this, row, index);
                    if (index === "Value") {
                        return retval;
                    }

                    if (!row) {
                        if (index === "TagName")
                            retval = Microsoft.Plugin.Resources.getString("LoadRowDataText");
                    } else {
                        if (index === "Count" || index === "StackViewCount") {
                            if (row.Count === -1)
                                retval = "";
                            else {
                                if (!retval)
                                    retval = "0";
                                retval = MemoryAnalyzer.FormattingHelpers.getDecimalLocaleString(retval, true, false);
                            }
                        } else if (index === "TotalSize" || index === "RetainedSize" || index === "StackViewTotalSize" || index === "AllocationListSize") {
                            if (row.Count === -1) {
                                retval = "";
                            } else {
                                if (!retval)
                                    retval = "0";
                                retval = MemoryAnalyzer.FormattingHelpers.getDecimalLocaleString(retval, true, false);
                            }
                        } else if (index === "TagName") {
                            retval = MemoryAnalyzer.FormattingHelpers.getNativeDigitLocaleString(retval);
                        } else if (index === "ObjAge") {
                            if (!retval)
                                retval = "";
                            retval = MemoryAnalyzer.FormattingHelpers.getDecimalLocaleString(retval, false, false);
                        } else {
                            if (row.Count === 0 && row.TotalSize !== 0 || row.Count === -1)
                                retval = "";
                            else {
                                if (!retval)
                                    retval = "0";
                                if (parseInt(retval))
                                    retval = MemoryAnalyzer.FormattingHelpers.getDecimalLocaleString(retval, true, true);
                            }
                        }
                    }
                    return retval;
                };

                MemoryAnalyzerGridViewer.prototype.translateExternalPathColumn = function (treePath, index) {
                    return index === "TagName" ? Microsoft.Plugin.Resources.getString("GridLastRow").replace("{0}", this.MaxRows.toString()) : "";
                };

                MemoryAnalyzerGridViewer.prototype.onSelectRow = function (rowIndex) {
                    if (this._currentSelectedIndex === this.getSelectedRowIndex())
                        return;
                    this.activateRow(rowIndex);
                };

                MemoryAnalyzerGridViewer.prototype.activateRow = function (rowIndex) {
                    this._currentSelectedIndex = this.getSelectedRowIndex();
                };

                MemoryAnalyzerGridViewer.prototype.reactivateCurrentRow = function () {
                    var selectedIndex = this.getSelectedRowIndex();
                    if (selectedIndex >= 0) {
                        this.activateRow(selectedIndex);
                    }
                };

                MemoryAnalyzerGridViewer.prototype.showRefGraph = function (show) {
                    this.showRefGraphNoData(!show);
                    this._refGraphShowCallback(show);
                };

                MemoryAnalyzerGridViewer.prototype.showRefGraphNoData = function (show) {
                    this._refGraphNoDataElement.style.display = show ? "block" : "none";
                };

                MemoryAnalyzerGridViewer.prototype.setDefaultSortOrder = function () {
                    this.onSort([new Common.Controls.Grid.SortOrderInfo(this._gridColumns[this._gridColumns.length - 1].index, "desc")], []);
                };
                return MemoryAnalyzerGridViewer;
            })(HeapViewer.MMADynamicGridViewer);
            HeapViewer.MemoryAnalyzerGridViewer = MemoryAnalyzerGridViewer;
        })(ManagedMemoryAnalyzer.HeapViewer || (ManagedMemoryAnalyzer.HeapViewer = {}));
        var HeapViewer = ManagedMemoryAnalyzer.HeapViewer;
    })(Debugger.ManagedMemoryAnalyzer || (Debugger.ManagedMemoryAnalyzer = {}));
    var ManagedMemoryAnalyzer = Debugger.ManagedMemoryAnalyzer;
})(Debugger || (Debugger = {}));
var Debugger;
(function (Debugger) {
    (function (ManagedMemoryAnalyzer) {
        (function (CodeTokenCategory) {
            CodeTokenCategory[CodeTokenCategory["Type"] = 0] = "Type";
            CodeTokenCategory[CodeTokenCategory["Field"] = 1] = "Field";
        })(ManagedMemoryAnalyzer.CodeTokenCategory || (ManagedMemoryAnalyzer.CodeTokenCategory = {}));
        var CodeTokenCategory = ManagedMemoryAnalyzer.CodeTokenCategory;

        (function (ContextMenuType) {
            ContextMenuType[ContextMenuType["First"] = 0] = "First";
            ContextMenuType[ContextMenuType["Types"] = 0] = "Types";
            ContextMenuType[ContextMenuType["Objects"] = 1] = "Objects";
            ContextMenuType[ContextMenuType["BackwardRefGraph"] = 2] = "BackwardRefGraph";
            ContextMenuType[ContextMenuType["ForwardRefGraph"] = 3] = "ForwardRefGraph";
            ContextMenuType[ContextMenuType["BackwardTypesRefGraph"] = 4] = "BackwardTypesRefGraph";
            ContextMenuType[ContextMenuType["ForwardTypesRefGraph"] = 5] = "ForwardTypesRefGraph";
            ContextMenuType[ContextMenuType["AllocationCallStack"] = 6] = "AllocationCallStack";
            ContextMenuType[ContextMenuType["AggregatedCallStacks"] = 7] = "AggregatedCallStacks";
            ContextMenuType[ContextMenuType["AllocationList"] = 8] = "AllocationList";
            ContextMenuType[ContextMenuType["Last"] = ContextMenuType.AllocationList] = "Last";
        })(ManagedMemoryAnalyzer.ContextMenuType || (ManagedMemoryAnalyzer.ContextMenuType = {}));
        var ContextMenuType = ManagedMemoryAnalyzer.ContextMenuType;

        (function (ContextMenuItem) {
            ContextMenuItem[ContextMenuItem["Copy"] = 0] = "Copy";
            ContextMenuItem[ContextMenuItem["Separator1"] = 1] = "Separator1";
            ContextMenuItem[ContextMenuItem["AddWatch"] = 2] = "AddWatch";
            ContextMenuItem[ContextMenuItem["QuickWatch"] = 3] = "QuickWatch";
            ContextMenuItem[ContextMenuItem["ViewInstances"] = 4] = "ViewInstances";
            ContextMenuItem[ContextMenuItem["Separator2"] = 5] = "Separator2";
            ContextMenuItem[ContextMenuItem["GoToDefinition"] = 6] = "GoToDefinition";
            ContextMenuItem[ContextMenuItem["FindAllReferences"] = 7] = "FindAllReferences";
            ContextMenuItem[ContextMenuItem["GotoSource"] = 8] = "GotoSource";
        })(ManagedMemoryAnalyzer.ContextMenuItem || (ManagedMemoryAnalyzer.ContextMenuItem = {}));
        var ContextMenuItem = ManagedMemoryAnalyzer.ContextMenuItem;

        (function (DebuggerMode) {
            DebuggerMode[DebuggerMode["Attached"] = 0] = "Attached";
            DebuggerMode[DebuggerMode["Running"] = 1] = "Running";
            DebuggerMode[DebuggerMode["Broken"] = 2] = "Broken";
            DebuggerMode[DebuggerMode["Detached"] = 3] = "Detached";
        })(ManagedMemoryAnalyzer.DebuggerMode || (ManagedMemoryAnalyzer.DebuggerMode = {}));
        var DebuggerMode = ManagedMemoryAnalyzer.DebuggerMode;

        (function (DiffResult) {
            DiffResult[DiffResult["SUCCESS"] = 0] = "SUCCESS";
            DiffResult[DiffResult["FAILURE"] = 1] = "FAILURE";
        })(ManagedMemoryAnalyzer.DiffResult || (ManagedMemoryAnalyzer.DiffResult = {}));
        var DiffResult = ManagedMemoryAnalyzer.DiffResult;

        (function (FeatureState) {
            FeatureState[FeatureState["NotAvailable"] = 0] = "NotAvailable";
            FeatureState[FeatureState["Disabled"] = 1] = "Disabled";
            FeatureState[FeatureState["Enabled"] = 2] = "Enabled";
        })(ManagedMemoryAnalyzer.FeatureState || (ManagedMemoryAnalyzer.FeatureState = {}));
        var FeatureState = ManagedMemoryAnalyzer.FeatureState;

        (function (Key_Presses) {
            Key_Presses[Key_Presses["ENTER"] = 13] = "ENTER";
            Key_Presses[Key_Presses["SPACE"] = 32] = "SPACE";
            Key_Presses[Key_Presses["DOWNARROW"] = 40] = "DOWNARROW";
        })(ManagedMemoryAnalyzer.Key_Presses || (ManagedMemoryAnalyzer.Key_Presses = {}));
        var Key_Presses = ManagedMemoryAnalyzer.Key_Presses;

        (function (Mouse_Buttons) {
            Mouse_Buttons[Mouse_Buttons["LEFT_BUTTON"] = 1] = "LEFT_BUTTON";
            Mouse_Buttons[Mouse_Buttons["MIDDLE_BUTTON"] = 2] = "MIDDLE_BUTTON";
            Mouse_Buttons[Mouse_Buttons["RIGHT_BUTTON"] = 3] = "RIGHT_BUTTON";
        })(ManagedMemoryAnalyzer.Mouse_Buttons || (ManagedMemoryAnalyzer.Mouse_Buttons = {}));
        var Mouse_Buttons = ManagedMemoryAnalyzer.Mouse_Buttons;

        (function (SnapshotType) {
            SnapshotType[SnapshotType["GC_DUMP"] = 1] = "GC_DUMP";
            SnapshotType[SnapshotType["LIVE_MANAGED"] = 2] = "LIVE_MANAGED";
            SnapshotType[SnapshotType["LIVE_NATIVE"] = 3] = "LIVE_NATIVE";
            SnapshotType[SnapshotType["X86_DUMP"] = 4] = "X86_DUMP";
            SnapshotType[SnapshotType["X64_DUMP"] = 5] = "X64_DUMP";
            SnapshotType[SnapshotType["ARM_DUMP"] = 6] = "ARM_DUMP";
        })(ManagedMemoryAnalyzer.SnapshotType || (ManagedMemoryAnalyzer.SnapshotType = {}));
        var SnapshotType = ManagedMemoryAnalyzer.SnapshotType;

        (function (HeapViewBroadcastEventType) {
            HeapViewBroadcastEventType[HeapViewBroadcastEventType["ANALYSIS_COMPLETE_SUCCESS"] = 0] = "ANALYSIS_COMPLETE_SUCCESS";
            HeapViewBroadcastEventType[HeapViewBroadcastEventType["VIEW_FILTER_CHANGED"] = 1] = "VIEW_FILTER_CHANGED";
            HeapViewBroadcastEventType[HeapViewBroadcastEventType["ANALYSIS_ERROR"] = 2] = "ANALYSIS_ERROR";
        })(ManagedMemoryAnalyzer.HeapViewBroadcastEventType || (ManagedMemoryAnalyzer.HeapViewBroadcastEventType = {}));
        var HeapViewBroadcastEventType = ManagedMemoryAnalyzer.HeapViewBroadcastEventType;

        (function (RefGraphDirection) {
            RefGraphDirection[RefGraphDirection["Forward"] = 0] = "Forward";
            RefGraphDirection[RefGraphDirection["Backward"] = 1] = "Backward";
        })(ManagedMemoryAnalyzer.RefGraphDirection || (ManagedMemoryAnalyzer.RefGraphDirection = {}));
        var RefGraphDirection = ManagedMemoryAnalyzer.RefGraphDirection;

        (function (ViewType) {
            ViewType[ViewType["TypesView"] = 0] = "TypesView";
            ViewType[ViewType["ObjectsView"] = 1] = "ObjectsView";
            ViewType[ViewType["AggregatedStacksView"] = 2] = "AggregatedStacksView";
        })(ManagedMemoryAnalyzer.ViewType || (ManagedMemoryAnalyzer.ViewType = {}));
        var ViewType = ManagedMemoryAnalyzer.ViewType;

        

        

        

        

        

        

        

        var DebuggerModeChangedEventArgs = (function () {
            function DebuggerModeChangedEventArgs() {
            }
            return DebuggerModeChangedEventArgs;
        })();
        ManagedMemoryAnalyzer.DebuggerModeChangedEventArgs = DebuggerModeChangedEventArgs;

        var MemoryAnalysisHelpers = (function () {
            function MemoryAnalysisHelpers() {
            }
            MemoryAnalysisHelpers.getChildById = function (id, root) {
                if (root.getAttribute("data-id") === id)
                    return root;
                if (!root.children)
                    return null;
                for (var i = 0; i < root.children.length; i++) {
                    var element = MemoryAnalysisHelpers.getChildById(id, root.children[i]);
                    if (element)
                        return element;
                }
                return null;
            };

            MemoryAnalysisHelpers.getPosition = function (element, fromCenter) {
                if (typeof fromCenter === "undefined") { fromCenter = true; }
                var position = new Array();
                var rect = element.getBoundingClientRect();

                position["x"] = rect.left;
                position["y"] = rect.top;

                if (fromCenter) {
                    position["x"] += element.offsetWidth / 2;
                    position["y"] += element.offsetHeight / 2;
                }

                return position;
            };

            MemoryAnalysisHelpers.formatResource = function (resourceString) {
                var values = [];
                for (var _i = 0; _i < (arguments.length - 1); _i++) {
                    values[_i] = arguments[_i + 1];
                }
                var formatted = Microsoft.Plugin.Resources.getString(resourceString);
                values.forEach(function (value, i) {
                    formatted = formatted.replace("{" + i + "}", value);
                });
                return formatted;
            };

            MemoryAnalysisHelpers.getFormattedDigitLocaleString = function (source) {
                return MemoryAnalyzer.FormattingHelpers.getNativeDigitLocaleString(source);
            };

            MemoryAnalysisHelpers.getNumberString = function (value, decimalDigits) {
                return MemoryAnalysisHelpers.getDecimalLocaleString(value, false, decimalDigits);
            };

            MemoryAnalysisHelpers.getSignedNumberString = function (value, decimalDigits) {
                return MemoryAnalysisHelpers.getDecimalLocaleString(value, true, decimalDigits);
            };

            MemoryAnalysisHelpers.getDecimalLocaleString = function (value, forceSign, decimalDigits) {
                return (decimalDigits !== undefined && decimalDigits >= 0) ? MemoryAnalyzer.FormattingHelpers.getDecimalLocaleString(value.toFixed(decimalDigits), true, forceSign) : MemoryAnalyzer.FormattingHelpers.getDecimalLocaleString(value, true, forceSign);
            };
            return MemoryAnalysisHelpers;
        })();
        ManagedMemoryAnalyzer.MemoryAnalysisHelpers = MemoryAnalysisHelpers;
    })(Debugger.ManagedMemoryAnalyzer || (Debugger.ManagedMemoryAnalyzer = {}));
    var ManagedMemoryAnalyzer = Debugger.ManagedMemoryAnalyzer;
})(Debugger || (Debugger = {}));
var Debugger;
(function (Debugger) {
    (function (ManagedMemoryAnalyzer) {
        (function (HeapViewer) {
            var MemoryAnalyzerObjectsGridViewer = (function (_super) {
                __extends(MemoryAnalyzerObjectsGridViewer, _super);
                function MemoryAnalyzerObjectsGridViewer(root, viewChangedCallback, setFilterPlaceholderCallback, dataArray, gridContextMenu, columns, refGraphCallback, stackCallback, maxObjectsCount) {
                    var _this = this;
                    gridContextMenu[1 /* Separator1 */].hidden = gridContextMenu[2 /* AddWatch */].hidden = gridContextMenu[3 /* QuickWatch */].hidden = function () {
                        return false;
                    };

                    gridContextMenu[5 /* Separator2 */].hidden = gridContextMenu[5 /* Separator2 */].disabled = function () {
                        return !HeapViewer.MemoryAnalyzerViewer.instance.IsDebuggingNativeMemory();
                    };
                    gridContextMenu[6 /* GoToDefinition */].hidden = function () {
                        return true;
                    };
                    gridContextMenu[7 /* FindAllReferences */].hidden = function () {
                        return true;
                    };
                    gridContextMenu[8 /* GotoSource */].hidden = gridContextMenu[8 /* GotoSource */].disabled = function () {
                        return !HeapViewer.MemoryAnalyzerViewer.instance.IsDebuggingNativeMemory();
                    };
                    gridContextMenu[8 /* GotoSource */].callback = function () {
                        return _this.goToSource();
                    };
                    gridContextMenu[2 /* AddWatch */].disabled = function () {
                        return !_this._isObjectInspectionAvailable;
                    };
                    gridContextMenu[3 /* QuickWatch */].disabled = function () {
                        return !_this._isObjectInspectionAvailable;
                    };
                    gridContextMenu[2 /* AddWatch */].callback = function () {
                        return _this.addWatch();
                    };
                    gridContextMenu[3 /* QuickWatch */].callback = function () {
                        return _this.quickWatch();
                    };

                    _super.call(this, root, viewChangedCallback, dataArray, gridContextMenu, columns, refGraphCallback, setFilterPlaceholderCallback, "ObjectSummariesSetFilterAndSortOrder");
                    this._stackCallback = stackCallback;

                    this._dataArray = dataArray;
                    if (maxObjectsCount !== 0) {
                        this.MaxRows = maxObjectsCount;
                    }
                    this._dataArray.registerAsyncResultCallback(function (index, value) {
                        return _this.updateValueColumnAsync(index, value);
                    });
                    this.adaptor().addEventListener("objectsFilteringProgress", function (reply) {
                        return _this.onObjectsFilteringProgress(reply.Progress, reply.DataUpdated);
                    });

                    this.adaptor()._call("IsObjectInspectionAvailable").done(function (result) {
                        _this._isObjectInspectionAvailable = result;
                    });

                    this.getCanvas().addEventListener("dblclick", function () {
                        _this.onDoubleClick.apply(_this, arguments);
                    });
                }
                MemoryAnalyzerObjectsGridViewer.prototype.onDoubleClick = function (e) {
                    this.goToSource();
                };

                MemoryAnalyzerObjectsGridViewer.prototype.goToSource = function () {
                    var _this = this;
                    var dataIndex = this.getSelectedDataIndex();

                    this._dataArray.get(dataIndex.path, function (value) {
                        var tag = value["Tag"];
                        _this.adaptor()._call("GotoSourceFromInstance", tag);
                    });
                };

                MemoryAnalyzerObjectsGridViewer.prototype.setCurrentTypeAsync = function (type) {
                    var _this = this;
                    this._dataArray.flushCache();
                    this.clearCurrentSelection();
                    this.adaptor()._call("ObjectsInspectionSetType", type).done(function (count) {
                        _this._dataArray.init(function () {
                            _this.activateWithDynamicData(count);
                            _this.setDefaultSortOrder();
                            _this.scheduleUpdate();
                        });
                    });
                };

                MemoryAnalyzerObjectsGridViewer.prototype.activateRow = function (rowIndex) {
                    var _this = this;
                    _super.prototype.activateRow.call(this, rowIndex);

                    var path = this.findPathByRow(rowIndex);
                    if (path.length() != 1)
                        throw Error("invalid path");

                    if (rowIndex >= this.MaxRows - 1) {
                        this.showRefGraph(false);
                    } else {
                        this._dataArray.get(path.path, function (value, needUpdate) {
                            var objectTag = value["Tag"];
                            _this.adaptor()._call("OnSelectObject", objectTag).done(function (isOk) {
                                if (isOk) {
                                    _this.showRefGraph(true);
                                    _this._stackCallback(true, objectTag);
                                }
                            });
                        });
                    }
                };

                MemoryAnalyzerObjectsGridViewer.prototype.translateExternalPathColumn = function (treePath, index) {
                    return index === "TagName" ? Microsoft.Plugin.Resources.getString("GridTrimLimit").replace("{0}", this.MaxRows.toString()) : "";
                };

                MemoryAnalyzerObjectsGridViewer.prototype.updateValueColumnAsync = function (path, value) {
                    var valuepath = value.path;

                    var rowInfo;
                    if (!valuepath) {
                        rowInfo = this.getRowInfo(path);
                    } else {
                        rowInfo = this.getRowInfo(valuepath.at(0));
                    }

                    if (!rowInfo) {
                        return;
                    }

                    var valueColumn = rowInfo.row.children[1];
                    valueColumn.innerText = value["Value"];
                };

                MemoryAnalyzerObjectsGridViewer.prototype.setFilterAsync = function (filterString) {
                    var _this = this;
                    this.setSearchProgressBarState(false, 0);
                    this.adaptor()._call("CancelObjectsFiltering").done(function () {
                        _this._dataArray.flushCache();
                        _this.clearCurrentSelection();
                        _super.prototype.setFilterAsync.call(_this, filterString);
                        if (filterString && filterString.length > 0) {
                            _this.setSearchProgressBarState(true, 0);
                        }
                    });
                };

                MemoryAnalyzerObjectsGridViewer.prototype.onObjectsFilteringProgress = function (progress, dataUpdated) {
                    if (dataUpdated) {
                        this._dataArray.flushCache();
                        this.clearCurrentSelection();
                        this.refresh();
                        this.showRefGraph(false);
                    }
                    this.setSearchProgressBarState(progress < 100, progress);
                };

                MemoryAnalyzerObjectsGridViewer.prototype.setSearchProgressBarState = function (show, progress) {
                    var filteringProgressBar = document.querySelector("#filterInputProgressBar");
                    filteringProgressBar.style.visibility = show ? "visible" : "hidden";
                    filteringProgressBar.value = progress;
                };

                MemoryAnalyzerObjectsGridViewer.prototype._trySorting = function (sortOrder, sortColumns) {
                    var _this = this;
                    this.adaptor()._call("CancelAsyncObjectsEvaluation").done(function () {
                        _this._dataArray.flushCache();
                        _this.clearCurrentSelection();
                        _super.prototype._trySorting.call(_this, sortOrder, sortColumns);
                    });
                };

                MemoryAnalyzerObjectsGridViewer.prototype.getDatatipCell = function (e, element) {
                    if (!this._isObjectInspectionAvailable) {
                        return null;
                    }

                    var rowElement = element.parentNode;
                    if (!rowElement || rowElement.children.length < 1)
                        throw Error("incorrect grid control row");
                    var valueColumnElement = rowElement.children[1];
                    if (valueColumnElement !== element)
                        return null;
                    return valueColumnElement;
                };

                MemoryAnalyzerObjectsGridViewer.prototype._onKeyDown = function (e) {
                    if (e.keyCode === 13 /* ENTER */ && !this.isDirty() && this._isObjectInspectionAvailable) {
                        this.quickWatch();
                        return true;
                    }
                    return _super.prototype._onKeyDown.call(this, e);
                };
                return MemoryAnalyzerObjectsGridViewer;
            })(HeapViewer.MemoryAnalyzerGridViewer);
            HeapViewer.MemoryAnalyzerObjectsGridViewer = MemoryAnalyzerObjectsGridViewer;
        })(ManagedMemoryAnalyzer.HeapViewer || (ManagedMemoryAnalyzer.HeapViewer = {}));
        var HeapViewer = ManagedMemoryAnalyzer.HeapViewer;
    })(Debugger.ManagedMemoryAnalyzer || (Debugger.ManagedMemoryAnalyzer = {}));
    var ManagedMemoryAnalyzer = Debugger.ManagedMemoryAnalyzer;
})(Debugger || (Debugger = {}));
var Debugger;
(function (Debugger) {
    (function (ManagedMemoryAnalyzer) {
        (function (HeapViewer) {
            var MemoryAnalyzerViewer = (function () {
                function MemoryAnalyzerViewer() {
                    var _this = this;
                    this.TAG_COLUMN_WIDTH = 500;
                    this.NUMERIC_COLUMN_WIDTH = 150;
                    this.INDICATOR_COLUMN_WIDTH = 50;
                    this.STACKFRAME_COLUMN_WIDTH = 1000;
                    this.LANG_COLUMN_WIDTH = 100;
                    this._refsViewerCache = [null, null];
                    this._typeRefsViewerCache = [null, null];
                    Microsoft.Plugin.Tooltip.defaultTooltipContentToHTML = false;

                    Microsoft.Plugin.VS.Keyboard.setZoomState(false);

                    this._adaptor = Microsoft.Plugin.Utilities.JSONMarshaler.attachToPublishedObject("Microsoft.VisualStudio.Debugger.MemorySnapshotDetailViewModelMarshaler", {}, true);

                    document.addEventListener("keydown", function (e) {
                        if (e.keyCode === 112 /* F1 */) {
                            _this._adaptor._call("ShowHelp");
                            e.preventDefault();
                            e.stopPropagation();
                            return false;
                        }
                    });

                    window.addEventListener("focus", function (e) {
                        _this._adaptor._call("OnWindowActivated");
                    });

                    window.addEventListener("click", function (e) {
                        _this._adaptor._call("OnWindowActivated");
                    });

                    document.addEventListener("keydown", function (e) {
                        var target = e.target;
                        if (target && target.tagName != "INPUT") {
                            if (_this._viewType === 1 /* ObjectsView */ && e.keyCode === 8 /* BACKSPACE */) {
                                _this.setViewType(0 /* TypesView */, null);
                            }
                        }
                    });

                    this._adaptor._call("IsDebuggingNativeMemory").done(function (result) {
                        _this._debugNativeMemory = result;
                        if (result == true) {
                            var refGraphNoData = document.querySelector("#managedHeapViewerRefGraphNoData");
                            var stackHeader = document.getElementById("stackHeader");
                            var nativeStackViewerContainer = document.getElementById("nativeStackViewerContainer");
                            var nativeAllocationListContainer = document.getElementById("nativeAllocationListContainer");
                            refGraphNoData.innerHTML = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("GotoInstancesView");
                            stackHeader.style.display = "none";
                            nativeStackViewerContainer.style.display = "none";
                            nativeAllocationListContainer.style.display = "none";
                        }
                    });

                    this._adaptor._call("GetViewSettingsState").done(function (result) {
                        _this._viewSettingsState = result;
                    });

                    this._adaptor.addEventListener("ideBFNavigate", function (navigateTo) {
                        _this.setViewType(navigateTo.Type, navigateTo.Title);
                    });

                    this._adaptor.addEventListener("DebuggerModeChanged", function () {
                        _this._adaptor._call("IsObjectInspectionAvailable").done(function (isObjectInspectionAvailable) {
                            if (_this._isObjectInspectionAvailable !== isObjectInspectionAvailable) {
                                _this._isObjectInspectionAvailable = isObjectInspectionAvailable;
                                _this.initializeInstanceColumns(isObjectInspectionAvailable);
                                _this.updateNotificationBar();

                                if (_this._objectsViewer) {
                                    _this._adaptor._call("GetDefaultViewSettings").done(function (options) {
                                        _this.initializeObjectViewer(options.snapshotType, options.numberOfObjectsPerType);
                                    });
                                    _this._filterDomElement.disabled = !isObjectInspectionAvailable;
                                }
                            }
                        });
                    });

                    this.setViewType(0 /* TypesView */, null);
                    this._refGraphDirection = 1 /* Backward */;
                    this._adaptor._call("ChangeGraphDirection", this._refGraphDirection);
                    this.updateRefGraphDirectionUIElements(false);

                    this._canJustMyCode = false;
                    this._canCollapseSmallObjects = false;
                    this._canHideUndeterminedTypes = false;
                    this._justMyCode = false;
                    this._collapseSmallObjects = false;
                    this._hideUndeterminedTypes = false;
                    this._isAggregatedCallStackExpandRoot = true;
                    this._setFilterPlaceholderCallback = this.showFilterPlaceholder.bind(this);

                    this.diffCompleteEventAsync = this.diffCompleteEventAsync.bind(this);

                    document.getElementById("typesObjectsEmptyMessage").innerText = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("TypesObjectsEmptyMessage");
                    document.getElementById("allocationStackEmptyMessage").innerText = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("AllocationStackEmptyMessage");
                    document.getElementById("allocationStackEmptyMessageDiv").style.display = "none";

                    this._adaptor.addEventListener("diffComplete", this.diffCompleteEventAsync);

                    this._adaptor.addEventListener("heapViewBroadcastEvent", function (eventArgs) {
                        switch (eventArgs.Type) {
                            case 1 /* VIEW_FILTER_CHANGED */:
                                _this._adaptor._call("GetDefaultViewSettings").done(function (options) {
                                    var myViewHasBeenUpdated = (_this._justMyCode === options.justMyCode || options.justMyCode === undefined) && (_this._collapseSmallObjects === options.collapseSmallObjects || options.collapseSmallObjects === undefined) && (_this._hideUndeterminedTypes === options.hideUndeterminedTypes || options.hideUndeterminedTypes === undefined);

                                    if (!myViewHasBeenUpdated) {
                                        _this._justMyCode = _this.getOption(_this._justMyCode, options.justMyCode);
                                        _this._collapseSmallObjects = _this.getOption(_this._collapseSmallObjects, options.collapseSmallObjects);
                                        _this._hideUndeterminedTypes = _this.getOption(_this._hideUndeterminedTypes, options.hideUndeterminedTypes);
                                        _this.applyViewFilter();
                                    }
                                });
                                break;
                        }
                    });

                    this._adaptor._call("DiffSnapshotId").done(function (id) {
                        var isInDiff = false;
                        if (id) {
                            _this._activeDropDownName = id;
                            isInDiff = true;
                        }

                        _this._adaptor._call("IsObjectInspectionAvailable").done(function (isObjectInspectionAvailable) {
                            _this._isObjectInspectionAvailable = isObjectInspectionAvailable;

                            var windowWidth = document.body.clientWidth;
                            if (!windowWidth || windowWidth < 425) {
                                windowWidth = 425;
                            }

                            var tagColumnWidth = MemoryAnalyzerViewer.TAG_COLUMN_RATIO * windowWidth;
                            _this.TAG_COLUMN_WIDTH = tagColumnWidth < MemoryAnalyzerViewer.MAX_TAG_COLUMN_WIDTH ? tagColumnWidth : MemoryAnalyzerViewer.MAX_TAG_COLUMN_WIDTH;
                            var numericColumnWidth = MemoryAnalyzerViewer.NUMERIC_COLUMN_RATIO * windowWidth;
                            _this.NUMERIC_COLUMN_WIDTH = numericColumnWidth < MemoryAnalyzerViewer.MAX_NUMERIC_COLUMN_WIDTH ? numericColumnWidth : MemoryAnalyzerViewer.MAX_NUMERIC_COLUMN_WIDTH;

                            _this.initializeTypeColumns(isInDiff);
                            _this.initializeReferenceGraphColumns(isInDiff);
                            _this.initializeInstanceColumns(isObjectInspectionAvailable);
                            _this.initializeCallstackColumns();
                            _this.initializeAggCallstackColumns(isInDiff, _this.TAG_COLUMN_WIDTH, _this.NUMERIC_COLUMN_WIDTH, _this.TAG_COLUMN_WIDTH);
                            _this.initializeAllocationListColumns(_this.TAG_COLUMN_WIDTH, _this.NUMERIC_COLUMN_WIDTH, _this.TAG_COLUMN_WIDTH);

                            _this.initializeContextMenus();
                            _this.initializeUIElementsAsync();
                            _this.refreshUIAsync();
                        });
                    });
                }
                MemoryAnalyzerViewer.copySelectedRowToClipboard = function (menuId, menuItem, targetId) {
                    if (MemoryAnalyzerViewer.dataForClipboard)
                        window.clipboardData.setData('Text', MemoryAnalyzerViewer.dataForClipboard);
                };

                MemoryAnalyzerViewer.prototype.IsDebuggingNativeMemory = function () {
                    return this._debugNativeMemory;
                };

                MemoryAnalyzerViewer.prototype.diffCompleteEventAsync = function (eventArgs) {
                    if (eventArgs.Type === 0 /* SUCCESS */) {
                        this._adaptor.removeEventListener("diffCompleteEvent", this.diffCompleteEventAsync);

                        window.location.reload();
                    } else {
                        this._diffDropDown.disabled = false;
                    }
                };

                MemoryAnalyzerViewer.prototype.initializeViewSettingsMenu = function () {
                    var _this = this;
                    var menuItems = new Array();
                    menuItems.push({
                        id: "menuJustMyCode",
                        callback: function () {
                            _this.toggleJustMyCodeAsync();
                        },
                        label: ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("ViewSettingsJustMyCodeMenuItem"),
                        type: 0 /* checkbox */,
                        iconEnabled: null,
                        iconDisabled: null,
                        accessKey: null,
                        hidden: function () {
                            return !_this._canJustMyCode;
                        },
                        disabled: function () {
                            return !_this._canJustMyCode;
                        },
                        checked: function () {
                            return _this._justMyCode;
                        },
                        cssClass: null,
                        submenu: null
                    });

                    menuItems.push({
                        id: "menuCollapseSmallObjects",
                        callback: function () {
                            _this.toggleCollapseSmallObjectsAsync();
                        },
                        label: ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("ViewSettingsCollapseSmallObjectsMenuItem"),
                        type: 0 /* checkbox */,
                        iconEnabled: null,
                        iconDisabled: null,
                        accessKey: null,
                        hidden: function () {
                            return !_this._canCollapseSmallObjects;
                        },
                        disabled: function () {
                            return !_this._canCollapseSmallObjects;
                        },
                        checked: function () {
                            return _this._collapseSmallObjects;
                        },
                        cssClass: null,
                        submenu: null
                    });

                    menuItems.push({
                        id: "menuHideUndeterminedTypes",
                        callback: function () {
                            _this.toggleHideUndeterminedTypesAsync();
                        },
                        label: ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("ViewSettingsHideUndeterminedTypesMenuItem"),
                        type: 0 /* checkbox */,
                        iconEnabled: null,
                        iconDisabled: null,
                        accessKey: null,
                        hidden: function () {
                            return !_this._canHideUndeterminedTypes;
                        },
                        disabled: function () {
                            return !_this._canHideUndeterminedTypes;
                        },
                        checked: function () {
                            return _this._hideUndeterminedTypes;
                        },
                        cssClass: null,
                        submenu: null
                    });

                    this._viewSettingsMenu = Microsoft.Plugin.ContextMenu.create(menuItems);
                };

                MemoryAnalyzerViewer.prototype.toggleJustMyCodeAsync = function () {
                    if (this._viewSettingsState["JustMyCode"] === 2 /* Enabled */) {
                        this._justMyCode = !this._justMyCode;
                        this.applyViewFilter();
                    }
                };

                MemoryAnalyzerViewer.prototype.toggleCollapseSmallObjectsAsync = function () {
                    if (this._viewSettingsState["CollapseSmallObjects"] === 2 /* Enabled */) {
                        this._collapseSmallObjects = !this._collapseSmallObjects;
                        this.applyViewFilter();
                    }
                };

                MemoryAnalyzerViewer.prototype.toggleHideUndeterminedTypesAsync = function () {
                    if (this._viewSettingsState["HideUndeterminedTypes"] === 2 /* Enabled */) {
                        this._hideUndeterminedTypes = !this._hideUndeterminedTypes;
                        this.applyViewFilter();
                    }
                };

                MemoryAnalyzerViewer.prototype.applyViewFilter = function () {
                    var _this = this;
                    this._typesViewer.setDirty(true);
                    this._objectsViewer.setDirty(true);

                    var justMyCode, collapseSmallObjects, hideUndeterminedTypes;
                    if (this._viewSettingsState["JustMyCode"] === 2 /* Enabled */) {
                        justMyCode = this._justMyCode;
                    }
                    if (this._viewSettingsState["CollapseSmallObjects"] === 2 /* Enabled */) {
                        collapseSmallObjects = this._collapseSmallObjects;
                    }
                    if (this._viewSettingsState["HideUndeterminedTypes"] === 2 /* Enabled */) {
                        hideUndeterminedTypes = this._hideUndeterminedTypes;
                    }

                    this._adaptor._call("ApplyViewFilter", justMyCode, collapseSmallObjects, hideUndeterminedTypes).done(function () {
                        _this.updateViewFilter();
                        _this._typesViewer.resetView();
                        _this._objectsViewer.resetView();
                    });
                };

                MemoryAnalyzerViewer.prototype.updateViewFilter = function () {
                    var viewSettingsDiv = document.getElementById("viewSettingsDiv");

                    if (this._justMyCode || this._collapseSmallObjects || this._hideUndeterminedTypes) {
                        viewSettingsDiv.classList.add("ViewSettingsEnabled");

                        var activeSettings = new Array();

                        if (this._justMyCode) {
                            activeSettings.push(ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("NotificationBarJMCEnabled"));
                        }

                        if (this._collapseSmallObjects) {
                            activeSettings.push(ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("NotificationBarCollapseSmallObjectsEnabled"));
                        }

                        if (this._hideUndeterminedTypes) {
                            activeSettings.push(ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("NotificationBarHideUndeterminedTypesEnabled"));
                        }

                        var tooltipText = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("NotificationBarMessage", activeSettings.join(", "));
                        viewSettingsDiv.onmouseover = (function () {
                            return Microsoft.Plugin.Tooltip.show(tooltipText);
                        });
                        viewSettingsDiv.onmouseleave = (function () {
                            return Microsoft.Plugin.Tooltip.dismiss();
                        });
                    } else {
                        viewSettingsDiv.classList.remove("ViewSettingsEnabled");
                        viewSettingsDiv.onmouseover = null;
                    }
                };

                MemoryAnalyzerViewer.prototype.updateNotificationBar = function () {
                    if (!this._notificationBar) {
                        return;
                    }

                    if (this._viewType === 1 /* ObjectsView */ && !this._isObjectInspectionAvailable) {
                        this._notificationBar.style.display = "";
                        this._notificationBarMessage.innerText = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("NotificationBarStaleMessage");
                    } else if (this._viewType === 0 /* TypesView */ && this._heapStatusMessage) {
                        this._notificationBar.style.display = "";
                        this._notificationBarMessage.innerText = this._heapStatusMessage;
                    } else {
                        this._notificationBar.style.display = "none";
                    }

                    if (this._splitter) {
                        this._splitter.update();
                    }
                };

                MemoryAnalyzerViewer.prototype.initializeContextMenus = function () {
                    this.initializeViewSettingsMenu();
                    this._gridContextMenuOptions = new Array();

                    for (var menu = 0; menu <= ManagedMemoryAnalyzer.ContextMenuType.Last; menu++) {
                        var menuItems = new Array();

                        menuItems[0 /* Copy */] = {
                            id: "menuItem0" + menu,
                            callback: MemoryAnalyzerViewer.copySelectedRowToClipboard,
                            label: ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("ContextMenuCopy"),
                            type: 1 /* command */,
                            iconEnabled: "vs-image-menu-copy-enabled",
                            iconDisabled: "vs-image-menu-copy-disabled",
                            accessKey: "Ctrl+C",
                            hidden: function () {
                                return false;
                            },
                            disabled: function () {
                                return false;
                            },
                            checked: function () {
                                return false;
                            },
                            cssClass: null,
                            submenu: null
                        };

                        menuItems[1 /* Separator1 */] = {
                            id: "menuItem1" + menu,
                            callback: function () {
                            },
                            label: null,
                            type: 3 /* separator */,
                            iconEnabled: null,
                            iconDisabled: null,
                            accessKey: null,
                            hidden: function () {
                                return true;
                            },
                            disabled: function () {
                                return false;
                            },
                            checked: function () {
                                return false;
                            },
                            cssClass: null,
                            submenu: null
                        };

                        menuItems[2 /* AddWatch */] = {
                            id: "menuItem2" + menu,
                            callback: function () {
                            },
                            label: ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("ContextMenuAddWatch"),
                            type: 1 /* command */,
                            iconEnabled: "vs-mma-watch",
                            iconDisabled: "vs-mma-watch",
                            accessKey: null,
                            hidden: function () {
                                return true;
                            },
                            disabled: function () {
                                return false;
                            },
                            checked: function () {
                                return false;
                            },
                            cssClass: null,
                            submenu: null
                        };

                        menuItems[4 /* ViewInstances */] = {
                            id: "menuItem3" + menu,
                            callback: function () {
                            },
                            label: ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("ContextMenuViewInstances"),
                            type: 1 /* command */,
                            iconEnabled: "vs-mma-inspect",
                            iconDisabled: "vs-mma-inspect",
                            accessKey: null,
                            hidden: function () {
                                return true;
                            },
                            disabled: function () {
                                return false;
                            },
                            checked: function () {
                                return false;
                            },
                            cssClass: null,
                            submenu: null
                        };

                        menuItems[3 /* QuickWatch */] = {
                            id: "menuItem4" + menu,
                            callback: function () {
                            },
                            label: ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("ContextMenuQuickWatch"),
                            type: 1 /* command */,
                            iconEnabled: "vs-mma-watch",
                            iconDisabled: "vs-mma-watch",
                            accessKey: null,
                            hidden: function () {
                                return true;
                            },
                            disabled: function () {
                                return false;
                            },
                            checked: function () {
                                return false;
                            },
                            cssClass: null,
                            submenu: null
                        };

                        menuItems[5 /* Separator2 */] = {
                            id: "menuItem5" + menu,
                            callback: function () {
                            },
                            label: null,
                            type: 3 /* separator */,
                            iconEnabled: null,
                            iconDisabled: null,
                            accessKey: null,
                            hidden: function () {
                                return false;
                            },
                            disabled: function () {
                                return false;
                            },
                            checked: function () {
                                return false;
                            },
                            cssClass: null,
                            submenu: null
                        };

                        menuItems[6 /* GoToDefinition */] = {
                            id: "menuItem6" + menu,
                            callback: function () {
                            },
                            label: ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("ContextMenuGoToDefinition"),
                            type: 1 /* command */,
                            iconEnabled: null,
                            iconDisabled: null,
                            accessKey: "F12",
                            hidden: function () {
                                return false;
                            },
                            disabled: function () {
                                return false;
                            },
                            checked: function () {
                                return false;
                            },
                            cssClass: null,
                            submenu: null
                        };

                        menuItems[7 /* FindAllReferences */] = {
                            id: "menuItem7" + menu,
                            callback: function () {
                            },
                            label: ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("ContextMenuFindAllReferences"),
                            type: 1 /* command */,
                            iconEnabled: null,
                            iconDisabled: null,
                            accessKey: "Shift+F12",
                            hidden: function () {
                                return false;
                            },
                            disabled: function () {
                                return false;
                            },
                            checked: function () {
                                return false;
                            },
                            cssClass: null,
                            submenu: null
                        };

                        menuItems[8 /* GotoSource */] = {
                            id: "menuItem8" + menu,
                            callback: function () {
                            },
                            label: ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("ContextMenuGotoSource"),
                            type: 1 /* command */,
                            iconEnabled: null,
                            iconDisabled: null,
                            accessKey: null,
                            hidden: function () {
                                return true;
                            },
                            disabled: function () {
                                return true;
                            },
                            checked: function () {
                                return false;
                            },
                            cssClass: null,
                            submenu: null
                        };

                        this._gridContextMenuOptions[menu] = menuItems;
                    }
                };

                MemoryAnalyzerViewer.prototype.initializeUIElementsAsync = function () {
                    var _this = this;
                    this._adaptor._call("GetSnapshotId").done(function (result) {
                        _this._snapshotId = result;

                        _this._filterDomElement = document.getElementById("filterInput");

                        var searchFilterDiv = document.getElementById("searchFilterDiv");
                        searchFilterDiv.onmouseover = function () {
                            var content;
                            if (_this._viewType === 1 /* ObjectsView */) {
                                content = _this._isObjectInspectionAvailable ? ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("ObjectsFilterTooltipEnabled") : ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("ObjectsFilterTooltipDisabled");
                            } else {
                                content = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("TypesFilterTooltip");
                            }
                            var config = {
                                content: content,
                                delay: MemoryAnalyzerViewer.TooltipDelay,
                                duration: MemoryAnalyzerViewer.TooltipDuration
                            };
                            Microsoft.Plugin.Tooltip.show(config);
                        };
                        searchFilterDiv.onmouseleave = (function () {
                            return Microsoft.Plugin.Tooltip.dismiss();
                        });

                        _this.showFilterPlaceholder();
                        document.getElementById("diffDropDownCaption").innerHTML = MemoryAnalyzer.FormattingHelpers.forceNonBreakingSpaces(ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("CompareToCaption"));

                        _this._adaptor._call("ProcessName").done(function (pname) {
                            var headerLabel;
                            if (pname) {
                                var splitPosition = pname.indexOf(':');
                                pname = splitPosition > 0 ? pname.substr(0, splitPosition - 1) : pname;
                                if (!_this._debugNativeMemory) {
                                    headerLabel = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("ManagedMemoryLabelWithProcessName", pname);
                                } else {
                                    headerLabel = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("NativeMemoryLabelWithProcessName", pname);
                                }
                            } else {
                                if (!_this._debugNativeMemory) {
                                    headerLabel = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("ManagedMemoryLabel");
                                } else {
                                    headerLabel = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("NativeMemoryLabel");
                                }
                            }

                            headerLabel = MemoryAnalyzer.FormattingHelpers.forceNonBreakingSpaces(headerLabel);

                            var viewGeneralCaption = document.getElementById("viewGeneralCaptionDiv");
                            var viewGeneralCaptionContainerDiv = document.getElementById("viewGeneralCaptionDiv");

                            viewGeneralCaption.innerHTML = headerLabel;
                            if (viewGeneralCaptionContainerDiv.scrollWidth > viewGeneralCaptionContainerDiv.offsetWidth)
                                viewGeneralCaption.title = headerLabel;
                        });

                        _this._filterDomElement.onkeypress = function (e) {
                            if (_this._filterDomElement.value) {
                                _this._filterDomElement.placeholder = "";
                            }
                            if (e.keyCode == 13 /* ENTER */) {
                                _this.getActiveView().setFilterAsync(_this._filterDomElement.value);
                            } else if (e.keyCode === 27 /* ESCAPE */) {
                                _this._filterDomElement.value = "";
                                _this.getActiveView().setFilterAsync("");
                                _this.showFilterPlaceholder();
                            }
                        };

                        _this._filterDomElement.oninput = function (e) {
                            if (_this._filterDomElement.value === "" && _this._filterDomElement.placeholder === "") {
                                _this.getActiveView().setFilterAsync(_this._filterDomElement.value);
                                _this.showFilterPlaceholder();
                            }
                        };

                        _this._viewSettingsDiv = document.getElementById("viewSettingsDiv");
                        var viewSettingsClick = function () {
                            _this._viewSettingsMenuClicked = true;

                            setTimeout(function () {
                                _this.showViewSettingsContextMenu();
                            }, 0);
                        };
                        _this._viewSettingsDiv.onmousedown = function () {
                            _this._viewSettingsDiv.onmouseup = viewSettingsClick;
                        };
                        _this._viewSettingsDiv.onmouseleave = function () {
                            _this._viewSettingsDiv.onmouseup = null;
                        };

                        _this._viewSettingsDiv.addEventListener("keyup", function (e) {
                            if ((e.keyCode === 13 /* ENTER */) || (e.keyCode === 121 /* F10 */ && e.shiftKey) || (e.keyCode === 93 /* MENU */)) {
                                _this.showViewSettingsContextMenu();
                                return false;
                            }

                            return true;
                        });

                        _this._viewSettingsDiv.onfocus = function () {
                            if (_this._viewSettingsMenuClicked) {
                                _this._viewSettingsDiv.style.outline = "none";
                                _this._viewSettingsMenuClicked = false;
                            } else {
                                _this._viewSettingsDiv.style.outline = "";
                            }
                        };

                        _this._notificationBar = document.getElementById("notificationBar");
                        _this._notificationBarMessage = document.getElementById("notificationBarMessage");
                        _this._diffDropDown = document.getElementById("diffDropDown");

                        _this._diffDropDown.onchange = function (e) {
                            if (_this._diffDropDown.selectedIndex > 0) {
                                if (_this._diffDropDown.value === "Browse") {
                                    _this._adaptor._call("Browse").done(function (result) {
                                        if (result && result !== _this._activeDropDownName) {
                                            _this.diffAgainstAsync(result);
                                        } else {
                                            _this.refreshDropDownAsync();
                                        }
                                    });
                                } else {
                                    _this.diffAgainstAsync(_this._diffDropDown.value);
                                }
                            } else if (_this._diffDropDown.selectedIndex === 0) {
                                _this._activeDropDownName = "";
                                _this._adaptor._call("CompareWithNone").done(function () {
                                    window.location.reload();
                                });
                            }
                        };

                        _this._diffDropDown.onmouseenter = function (e) {
                            _this._diffDropDownHasMouseFocus = true;
                            _this.refreshDropDownAsync();
                        };

                        _this._diffDropDown.onmouseleave = function (e) {
                            _this._diffDropDownHasMouseFocus = false;
                        };

                        _this._diffDropDown.onfocusin = function (e) {
                            if (!_this._diffDropDownHasMouseFocus) {
                                _this.refreshDropDownAsync();
                            }
                        };

                        _this.refreshDropDownAsync();
                    });
                };

                MemoryAnalyzerViewer.prototype.showViewSettingsContextMenu = function () {
                    var rect = this._viewSettingsDiv.getBoundingClientRect();
                    if (this._viewSettingsMenu) {
                        this._viewSettingsMenu.show(rect.left, rect.bottom);
                    }
                };

                MemoryAnalyzerViewer.prototype.initializeTypeColumns = function (isInDiff) {
                    var name = new Common.Controls.Grid.ColumnInfo("TagName", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("Type"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("TypeTooltip"), this.TAG_COLUMN_WIDTH, true);

                    var count = new Common.Controls.Grid.ColumnInfo("Count", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("Count"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("CountTooltip"), this.NUMERIC_COLUMN_WIDTH, true, null, function () {
                        return "rightAlignedColumn";
                    }, null, "desc");

                    var size = new Common.Controls.Grid.ColumnInfo("TotalSize", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("TotalSize"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("SizeTooltip"), this.NUMERIC_COLUMN_WIDTH, true, null, function () {
                        return "rightAlignedColumn";
                    }, null, "desc");

                    if (isInDiff) {
                        var countDiff = new Common.Controls.Grid.ColumnInfo("CountDiff", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("CountDiff"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("CountDiffTooltip"), this.NUMERIC_COLUMN_WIDTH, true, null, function () {
                            return "rightAlignedColumn";
                        }, null, "desc");

                        var sizeDiff = new Common.Controls.Grid.ColumnInfo("TotalSizeDiff", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("TotalSizeDiff"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("TotalSizeDiffTooltip"), this.NUMERIC_COLUMN_WIDTH, true, null, function () {
                            return "rightAlignedColumn";
                        }, null, "desc");
                    }

                    if (this._debugNativeMemory) {
                        if (isInDiff) {
                            var newAllocations = new Common.Controls.Grid.ColumnInfo("NewAllocationCount", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("NewAllocationCount"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("NewAllocationCountToolTip"), this.NUMERIC_COLUMN_WIDTH, true, null, function () {
                                return "rightAlignedColumn";
                            }, null, "desc");

                            this._typeColumns = [name, countDiff, sizeDiff, newAllocations, count, size];
                            this._countColumnIndex = 4;
                        } else {
                            this._typeColumns = [name, count, size];
                            this._countColumnIndex = 1;
                        }
                    } else {
                        var retained = new Common.Controls.Grid.ColumnInfo("RetainedSize", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("RetainedSize"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("RetainedSizeTooltip"), this.NUMERIC_COLUMN_WIDTH, true, null, function () {
                            return "rightAlignedColumn";
                        }, null, "desc");

                        if (isInDiff) {
                            var retainedDiff = new Common.Controls.Grid.ColumnInfo("RetainedSizeDiff", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("RetainedSizeDiff"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("RetainedSizeDiffTooltip"), this.NUMERIC_COLUMN_WIDTH + 11, true, null, function () {
                                return "rightAlignedColumn";
                            }, null, "desc");

                            this._typeColumns = [name, countDiff, sizeDiff, retainedDiff, count, size, retained];
                            this._countColumnIndex = 4;
                        } else {
                            this._typeColumns = [name, count, size, retained];
                            this._countColumnIndex = 1;
                        }
                    }
                };

                MemoryAnalyzerViewer.prototype.initializeReferenceGraphColumns = function (isInDiff) {
                    var _this = this;
                    var objectBackwardName = new Common.Controls.Grid.ColumnInfo("TagName", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("Instance"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("InstanceTooltip"), this.TAG_COLUMN_WIDTH, false);
                    objectBackwardName.fixed = true;

                    var objectForwardName = new Common.Controls.Grid.ColumnInfo("TagName", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("Instance"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("InstanceTooltip"), this.TAG_COLUMN_WIDTH, false);
                    objectForwardName.getHeaderCellContents = function () {
                        return _this.drawForwardReferenceGraphHeaderCell("Instance");
                    };

                    var objectForwardSize = new Common.Controls.Grid.ColumnInfo("TotalSize", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("InstanceSize"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("InstanceSizeTooltip"), this.NUMERIC_COLUMN_WIDTH, true, null, function () {
                        return "rightAlignedColumn";
                    }, null, "desc");

                    var objectForwardRetainedSize = new Common.Controls.Grid.ColumnInfo("RetainedSize", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("RetainedSize"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("InstanceRetainedSizeTooltip"), this.NUMERIC_COLUMN_WIDTH, true, null, function () {
                        return "rightAlignedColumn";
                    }, null, "desc");

                    var typeBackwardName = new Common.Controls.Grid.ColumnInfo("TagName", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("Type"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("TypeTooltip"), this.TAG_COLUMN_WIDTH, false);

                    var typeBackwardCount = new Common.Controls.Grid.ColumnInfo("RetainedCount", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("TypeRefGraphRetainedCountColumn"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("TypeRefGraphRetainedCountColumnTooltip"), this.NUMERIC_COLUMN_WIDTH, true, null, function () {
                        return "rightAlignedColumn";
                    }, null, "desc");

                    var typeForwardName = new Common.Controls.Grid.ColumnInfo("TagName", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("Type"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("TypeTooltip"), this.TAG_COLUMN_WIDTH, false);
                    typeForwardName.getHeaderCellContents = function () {
                        return _this.drawForwardReferenceGraphHeaderCell("Type");
                    };

                    var typeForwardCount = new Common.Controls.Grid.ColumnInfo("RefCount", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("TypeRefGraphRetainedCountColumn"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("TypeRefGraphRetainedCountColumnTooltip"), this.NUMERIC_COLUMN_WIDTH, true, null, function () {
                        return "rightAlignedColumn";
                    }, null, "desc");

                    var typeForwardSize = new Common.Controls.Grid.ColumnInfo("TotalSize", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("TotalSize"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("SizeTooltip"), this.NUMERIC_COLUMN_WIDTH, true, null, function () {
                        return "rightAlignedColumn";
                    }, null, "desc");

                    var typeForwardRetainedSize = new Common.Controls.Grid.ColumnInfo("RetainedSize", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("RetainedSize"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("RetainedSizeTooltip"), this.NUMERIC_COLUMN_WIDTH, true, null, function () {
                        return "rightAlignedColumn";
                    }, null, "desc");

                    if (isInDiff) {
                        var typeBackwardCountDiff = new Common.Controls.Grid.ColumnInfo("RetainedCountDiff", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("TypeRefGraphRetainedCountDiffColumn"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("TypeRefGraphRetainedCountDiffColumnTooltip"), this.NUMERIC_COLUMN_WIDTH, true, null, function () {
                            return "rightAlignedColumn";
                        }, null, "desc");

                        var typeForwardCountDiff = new Common.Controls.Grid.ColumnInfo("RefCountDiff", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("TypeRefGraphRetainedCountDiffColumn"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("TypeRefGraphRetainedCountDiffColumnTooltip"), this.NUMERIC_COLUMN_WIDTH, true, null, function () {
                            return "rightAlignedColumn";
                        }, null, "desc");

                        var typeForwardSizeDiff = new Common.Controls.Grid.ColumnInfo("TotalSizeDiff", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("TotalSizeDiff"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("TotalSizeDiffTooltip"), this.NUMERIC_COLUMN_WIDTH, true, null, function () {
                            return "rightAlignedColumn";
                        }, null, "desc");

                        var typeForwardRetainedSizeDiff = new Common.Controls.Grid.ColumnInfo("RetainedSizeDiff", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("RetainedSizeDiff"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("RetainedSizeDiffTooltip"), this.NUMERIC_COLUMN_WIDTH, true, null, function () {
                            return "rightAlignedColumn";
                        }, null, "desc");

                        this._typeBackwardRefGraphColumns = [typeBackwardName, typeBackwardCountDiff, typeBackwardCount];
                        this._typeForwardRefGraphColumns = [typeForwardName, typeForwardCountDiff, typeForwardSizeDiff, typeForwardRetainedSizeDiff, typeForwardCount, typeForwardSize, typeForwardRetainedSize];
                        this._objectBackwardRefGraphColumns = [objectBackwardName];
                        this._objectForwardRefGraphColumns = [objectForwardName, objectForwardSize, objectForwardRetainedSize];
                    } else {
                        this._typeBackwardRefGraphColumns = [typeBackwardName, typeBackwardCount];
                        this._typeForwardRefGraphColumns = [typeForwardName, typeForwardCount, typeForwardSize, typeForwardRetainedSize];
                        this._objectBackwardRefGraphColumns = [objectBackwardName];
                        this._objectForwardRefGraphColumns = [objectForwardName, objectForwardSize, objectForwardRetainedSize];
                    }
                };

                MemoryAnalyzerViewer.prototype.initializeInstanceColumns = function (showValueColumn) {
                    var name = new Common.Controls.Grid.ColumnInfo("TagName", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("Instance"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("InstanceTooltip"), this.NUMERIC_COLUMN_WIDTH, true);

                    var size = new Common.Controls.Grid.ColumnInfo("TotalSize", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("InstanceSize"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("InstanceSizeTooltip"), this.NUMERIC_COLUMN_WIDTH, true, null, function () {
                        return "rightAlignedColumn";
                    }, null, "desc");

                    var retainedSize = new Common.Controls.Grid.ColumnInfo("RetainedSize", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("RetainedSize"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("InstanceRetainedSizeTooltip"), this.NUMERIC_COLUMN_WIDTH, true, null, function () {
                        return "rightAlignedColumn";
                    }, null, "desc");

                    if (showValueColumn) {
                        var value = new Common.Controls.Grid.ColumnInfo("Value", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("Value"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("ValueTooltip"), this.TAG_COLUMN_WIDTH, false);
                        this._instanceColumns = [name, value, size, retainedSize];
                    } else {
                        this._instanceColumns = [name, size, retainedSize];
                    }

                    if (this._debugNativeMemory) {
                        var retainedSizeColIndex = this._instanceColumns.length - 1;

                        this._instanceColumns.splice(retainedSizeColIndex, 1, new Common.Controls.Grid.ColumnInfo("ObjAge", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("InstanceAgeInMilliSeconds"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("InstanceAgeInMilliSecondsTooltip"), this.NUMERIC_COLUMN_WIDTH, true, null, function () {
                            return "rightAlignedColumn";
                        }, null, "desc"));
                    }
                };

                MemoryAnalyzerViewer.prototype.initializeCallstackColumns = function () {
                    var indicator = new Common.Controls.Grid.ColumnInfo("SpecialIndication", "", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("SpecialIndication"), this.INDICATOR_COLUMN_WIDTH, false);

                    var name = new Common.Controls.Grid.ColumnInfo("TagName", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("AllocationCallStackName"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("StackFrames"), this.STACKFRAME_COLUMN_WIDTH, false);

                    var language = new Common.Controls.Grid.ColumnInfo("Language", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("AllocationCallStackLanguage"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("FrameLanguage"), this.LANG_COLUMN_WIDTH, false);

                    this._callStackColumns = [indicator, name, language];
                };

                MemoryAnalyzerViewer.prototype.initializeAggCallstackColumns = function (isInDiff, identifierWidth, dataWidth, moduleWidth) {
                    var identifier = new Common.Controls.Grid.ColumnInfo("Identifier", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("Identifier"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("IdentifierTooltip"), identifierWidth, true);

                    var count = new Common.Controls.Grid.ColumnInfo("StackViewCount", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("StackViewCount"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("StackViewCountTooltip"), dataWidth, true, null, function () {
                        return "rightAlignedColumn";
                    }, null, "desc");

                    var size = new Common.Controls.Grid.ColumnInfo("StackViewTotalSize", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("StackViewTotalSize"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("StackViewSizeTooltip"), dataWidth, true, null, function () {
                        return "rightAlignedColumn";
                    }, null, "desc");

                    var moduleName = new Common.Controls.Grid.ColumnInfo("Module", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("Module"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("ModuleTooltip"), moduleWidth, true);

                    if (isInDiff) {
                        var countDiff = new Common.Controls.Grid.ColumnInfo("StackViewCountDiff", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("StackViewDiffCount"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("StackViewDiffCountTooltip"), dataWidth, true, null, function () {
                            return "rightAlignedColumn";
                        }, null, "desc");

                        var sizeDiff = new Common.Controls.Grid.ColumnInfo("StackViewTotalSizeDiff", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("StackViewDiffSize"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("StackViewDiffSizeTooltip"), dataWidth, true, null, function () {
                            return "rightAlignedColumn";
                        }, null, "desc");

                        this._aggregatedCallStacksColumns = [identifier, countDiff, sizeDiff, count, size, moduleName];
                    } else {
                        this._aggregatedCallStacksColumns = [identifier, count, size, moduleName];
                    }
                };

                MemoryAnalyzerViewer.prototype.initializeAllocationListColumns = function (identifierWidth, dataWidth, moduleWidth) {
                    var identifier = new Common.Controls.Grid.ColumnInfo("AllocationListIdentifier", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("AllocationListIdentifier"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("IdentifierTooltip"), identifierWidth, true);

                    var instance = new Common.Controls.Grid.ColumnInfo("AllocationListInstance", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("AllocationListInstance"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("AllocationListInstanceTooltip"), dataWidth, true, null, function () {
                        return "rightAlignedColumn";
                    }, null, "desc");

                    var type = new Common.Controls.Grid.ColumnInfo("AllocationListType", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("AllocationListType"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("AllocationListTypeTooltip"), moduleWidth, true);

                    var size = new Common.Controls.Grid.ColumnInfo("AllocationListSize", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("AllocationListSize"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("AllocationListSizeToolTip"), dataWidth, true, null, function () {
                        return "rightAlignedColumn";
                    }, null, "desc");

                    var moduleName = new Common.Controls.Grid.ColumnInfo("AllocationListModule", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("AllocationListModule"), ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("AllocationListModuleTooltip"), moduleWidth, true);

                    this._allocationListColumns = [identifier, instance, type, size, moduleName];
                };

                MemoryAnalyzerViewer.prototype.drawForwardReferenceGraphHeaderCell = function (columnTitleResourceName) {
                    var cellElement = document.createElement("div");
                    cellElement.classList.add("title");
                    cellElement.classList.add("indented-title");
                    cellElement.classList.add("icon-grid");

                    if (this._justMyCode || this._collapseSmallObjects) {
                        var icon = document.createElement('div');
                        icon.innerHTML = document.getElementById("IconTemplate").innerHTML;
                        ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getChildById("icon", icon).classList.add("NotificationIcon");
                        icon.children[0].classList.add("icon-information");
                        icon.children[0].style.msGridColumn = "2";
                        icon.children[0].title = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("ReferencesViewNoViewMessage");
                        cellElement.innerHTML = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource(columnTitleResourceName) + icon.innerHTML;
                    } else {
                        cellElement.innerText = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource(columnTitleResourceName);
                    }

                    return cellElement;
                };

                MemoryAnalyzerViewer.prototype.diffAgainstAsync = function (diffName, hideWarning) {
                    var _this = this;
                    if (typeof hideWarning === "undefined") { hideWarning = false; }
                    this._diffDropDown.disabled = true;
                    this._adaptor._call("SetViewModeBeforeDiff", this._viewType);

                    this._adaptor._call("StartManagedMemoryAnalysisAndDiff", diffName).done(function (result) {
                        if (!result) {
                            _this._diffDropDown.disabled = false;
                        } else {
                        }
                    });
                };

                MemoryAnalyzerViewer.prototype.refreshUIAsync = function () {
                    var _this = this;
                    if (this._typesViewer)
                        this._typesViewer = null;
                    if (this._splitter)
                        this._splitter.dispose();

                    var div = document.querySelector("#managedHeapTypesViewerContainer");
                    while (div.firstChild) {
                        div.removeChild(div.firstChild);
                    }

                    if (this._typesDataSource) {
                        this._typesDataSource.flushCache();
                        this._typesDataSource = null;
                    }

                    if (this._objectsDataSource) {
                        this._objectsDataSource.flushCache();
                        this._objectsDataSource = null;
                    }

                    if (this._callStackDataSource) {
                        this._callStackDataSource.flushCache();
                        this._callStackDataSource = null;
                    }

                    if (this._aggregatedCallStacksDataSource) {
                        this._aggregatedCallStacksDataSource.flushCache();
                        this._aggregatedCallStacksDataSource = null;
                    }

                    if (this._allocationListDataSource) {
                        this._allocationListDataSource.flushCache();
                        this._allocationListDataSource = null;
                    }

                    this._typesDataSource = new Common.Controls.DynamicGrid.ProxyArray(this._adaptor, "TypeSummaries", MemoryAnalyzerViewer.ProxyArrayCacheSize);
                    this._objectsDataSource = new HeapViewer.ProxyArrayWithAsyncPayload(this._adaptor, "ObjectSummaries", MemoryAnalyzerViewer.ProxyArrayCacheSize);

                    if (this._debugNativeMemory) {
                        var RETAINEDSIZE_COLUMN_INDEX = 3;
                        var NUMERIC_COLUMN_WIDTH = 150;

                        this._callStackDataSource = new Common.Controls.DynamicGrid.ProxyArray(this._adaptor, "StackSummaries", MemoryAnalyzerViewer.ProxyArrayCacheSize);
                        this._aggregatedCallStacksDataSource = new HeapViewer.ProxyArrayWithAsyncPayload(this._adaptor, "AggStackSummaries", MemoryAnalyzerViewer.ProxyArrayCacheSize);
                        this._allocationListDataSource = new HeapViewer.ProxyArrayWithAsyncPayload(this._adaptor, "AllocationListSummaries", MemoryAnalyzerViewer.ProxyArrayCacheSize);
                    }

                    this._adaptor._call("GetDefaultViewSettings").done(function (options) {
                        _this._snapshotType = options.snapshotType;

                        _this.setRefGraphDirectionAsync(_this._refGraphDirection, function () {
                            _this._typesDataSource.init(function () {
                                _this.initializeTypeViewer(options.snapshotType, options.sortColumn);
                                _this.initializeObjectViewer(options.snapshotType, options.numberOfObjectsPerType);

                                _this._canJustMyCode = _this._viewSettingsState["JustMyCode"] === 2 /* Enabled */;
                                if (_this._canJustMyCode) {
                                    _this._justMyCode = options.justMyCode;
                                }

                                _this._canCollapseSmallObjects = _this._viewSettingsState["CollapseSmallObjects"] === 2 /* Enabled */;
                                if (_this._canCollapseSmallObjects) {
                                    _this._collapseSmallObjects = options.collapseSmallObjects;
                                }

                                _this._canHideUndeterminedTypes = _this._viewSettingsState["HideUndeterminedTypes"] === 2 /* Enabled */;
                                if (_this._canHideUndeterminedTypes) {
                                    _this._hideUndeterminedTypes = options.hideUndeterminedTypes;
                                }

                                _this.updateViewFilter();
                                _this.updateNotificationBar();

                                _this._splitter = new HeapViewer.HorizontalSplitter(document.getElementById("splitter"), 0.6, function () {
                                    if (_this._viewType === 0 /* TypesView */) {
                                        _this._typesViewer.scheduleUpdate();
                                        _this._typeRefsViewer.scheduleUpdate();
                                    } else {
                                        _this._objectsViewer.scheduleUpdate();
                                        _this._refsViewer.scheduleUpdate();
                                        if (_this._callStackViewer && _this._viewType === 1 /* ObjectsView */) {
                                            _this._callStackViewer.scheduleUpdate();
                                        }
                                    }
                                });
                                if (_this._snapshotType === 3 /* LIVE_NATIVE */ || _this._debugNativeMemory) {
                                    _this._splitter.snapToContent(document.getElementById("managedHeapViewerRefGraphNoData"));
                                }

                                if (options.initalViewMode === 2 /* AggregatedStacksView */) {
                                    _this.setViewType(2 /* AggregatedStacksView */, null);
                                }
                            });
                        });
                    });

                    this.showSamplingIconAsync().done(function () {
                        return _this.showHeapStatusMessageAsync();
                    });
                };

                MemoryAnalyzerViewer.prototype.initializeTypeViewer = function (snapshotType, sortColumn) {
                    var _this = this;
                    if (this._typesViewer) {
                        while (this._typesViewer.rootElement.hasChildNodes()) {
                            this._typesViewer.rootElement.removeChild(this._typesViewer.rootElement.firstChild);
                        }
                    }

                    this._typesViewer = new MemoryAnalyzerTypesGridViewer(document.querySelector("#managedHeapTypesViewerContainer"), function (visible) {
                        if (_this._viewType === 0 /* TypesView */) {
                            if (visible === true) {
                                document.getElementById("typesObjectsEmptyMessageDiv").style.display = "";
                                document.getElementById("typesObjectsEmptyMessage").innerText = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("TypesObjectsEmptyMessage");
                            } else {
                                document.getElementById("typesObjectsEmptyMessageDiv").style.display = "none";
                            }
                        }
                    }, this._typesDataSource, this._gridContextMenuOptions[0 /* Types */], this._typeColumns, sortColumn, function (showTypeRefGraph) {
                        if (showTypeRefGraph) {
                            _this._typeRefsViewer.refresh();
                            _this._typeRefsViewer.expandRoot();
                        }
                        _this.updateRefGraphDirectionUIElements(showTypeRefGraph);
                        _this._typeRefsViewer.showGraph(showTypeRefGraph);
                    }, function (disableRefGraph) {
                        if (disableRefGraph) {
                            var refGraphHeader = document.getElementById("refGraphHeader");
                            var refGraphNoData = document.querySelector("#managedHeapViewerRefGraphNoData");
                            var managedHeapViewerForwardRefGraphContainer = document.querySelector("#managedHeapViewerForwardRefGraphContainer");
                            var managedHeapViewerBackwardRefGraphContainer = document.querySelector("#managedHeapViewerBackwardRefGraphContainer");
                            var managedHeapViewerForwardTypeRefGraphContainer = document.querySelector("#managedHeapViewerForwardTypeRefGraphContainer");
                            var managedHeapViewerBackwardTypeRefGraphContainer = document.querySelector("#managedHeapViewerBackwardTypeRefGraphContainer");

                            refGraphHeader.style.display = "none";
                            refGraphNoData.style.display = "none";
                            if (managedHeapViewerForwardRefGraphContainer) {
                                managedHeapViewerForwardRefGraphContainer.style.display = "none";
                            }
                            if (managedHeapViewerBackwardRefGraphContainer) {
                                managedHeapViewerBackwardRefGraphContainer.style.display = "none";
                            }
                            if (managedHeapViewerForwardTypeRefGraphContainer) {
                                managedHeapViewerForwardTypeRefGraphContainer.style.display = "none";
                            }
                            if (managedHeapViewerBackwardTypeRefGraphContainer) {
                                managedHeapViewerBackwardTypeRefGraphContainer.style.display = "none";
                            }
                        }
                    }, function (path, rowData, typeName) {
                        _this._objectsViewer.setCurrentTypeAsync(rowData.Tag);
                        _this.setViewType(1 /* ObjectsView */, typeName);
                    }, this._setFilterPlaceholderCallback, snapshotType);
                };

                MemoryAnalyzerViewer.prototype.initializeObjectViewer = function (snapshotType, maxObjectsCount) {
                    var _this = this;
                    if (this._objectsViewer) {
                        while (this._objectsViewer.rootElement.hasChildNodes()) {
                            this._objectsViewer.rootElement.removeChild(this._objectsViewer.rootElement.firstChild);
                        }
                    }

                    this._objectsViewer = new HeapViewer.MemoryAnalyzerObjectsGridViewer(document.getElementById("managedHeapObjectsViewerContainer"), function (visible) {
                        if (_this._viewType === 1 /* ObjectsView */) {
                            if (visible === true) {
                                document.getElementById("typesObjectsEmptyMessageDiv").style.display = "";
                                document.getElementById("typesObjectsEmptyMessage").innerText = _this._debugNativeMemory ? ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("NativeTypesObjectsEmptyMessage") : ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("TypesObjectsEmptyMessage");
                            } else {
                                document.getElementById("typesObjectsEmptyMessageDiv").style.display = "none";
                            }
                        }
                    }, this._setFilterPlaceholderCallback, this._objectsDataSource, this._gridContextMenuOptions[1 /* Objects */], this._instanceColumns, function (showRefGraph) {
                        if (showRefGraph) {
                            _this._refsViewer.refresh();
                            _this._refsViewer.expandRoot();
                        }
                        _this.updateRefGraphDirectionUIElements(showRefGraph);
                        _this._refsViewer.showGraph(showRefGraph);
                    }, function (showStackFrames, objectTag) {
                        var refGraphHeader = document.getElementById("refGraphHeader");
                        var refGraphNoData = document.querySelector("#managedHeapViewerRefGraphNoData");
                        var managedHeapViewerForwardRefGraphContainer = document.querySelector("#managedHeapViewerForwardRefGraphContainer");
                        var managedHeapViewerBackwardRefGraphContainer = document.querySelector("#managedHeapViewerBackwardRefGraphContainer");
                        var managedHeapViewerForwardTypeRefGraphContainer = document.querySelector("#managedHeapViewerForwardTypeRefGraphContainer");
                        var managedHeapViewerBackwardTypeRefGraphContainer = document.querySelector("#managedHeapViewerBackwardTypeRefGraphContainer");
                        var nativeAllocationListContainer = document.getElementById("nativeAllocationListContainer");

                        var stackHeader = document.getElementById("stackHeader");
                        var stackHeaderContent = document.getElementById("StackHeaderContent");
                        var nativeStackViewerContainer = document.getElementById("nativeStackViewerContainer");

                        if (!_this._debugNativeMemory) {
                            stackHeader.style.display = "none";
                            nativeStackViewerContainer.style.display = "none";
                        } else {
                            if (!showStackFrames) {
                                stackHeader.style.display = "none";
                                nativeStackViewerContainer.style.display = "none";
                                refGraphNoData.innerHTML = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("DisplayStackView");
                            } else {
                                refGraphNoData.innerHTML = "";
                                refGraphNoData.style.display = "none";

                                refGraphHeader.style.display = "none";
                                if (managedHeapViewerForwardRefGraphContainer) {
                                    managedHeapViewerForwardRefGraphContainer.style.display = "none";
                                }
                                if (managedHeapViewerBackwardRefGraphContainer) {
                                    managedHeapViewerBackwardRefGraphContainer.style.display = "none";
                                }
                                if (managedHeapViewerForwardTypeRefGraphContainer) {
                                    managedHeapViewerForwardTypeRefGraphContainer.style.display = "none";
                                }
                                if (managedHeapViewerBackwardTypeRefGraphContainer) {
                                    managedHeapViewerBackwardTypeRefGraphContainer.style.display = "none";
                                }
                                if (nativeAllocationListContainer) {
                                    nativeAllocationListContainer.style.display = "none";
                                }
                                stackHeader.style.display = "block";
                                stackHeaderContent.title = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("AllocationCallStack");
                                stackHeaderContent.text = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("AllocationCallStack");
                                stackHeaderContent.className = "enabled";
                                nativeStackViewerContainer.style.display = "";

                                if (!_this._callStackViewer) {
                                    _this._callStackViewer = new MemoryAnalyzerCallStackGridViewer(document.querySelector("#nativeStackViewerContainer"), function (visible) {
                                        document.getElementById("allocationStackEmptyMessageDiv").style.display = (visible === true) ? "block" : "none";
                                    }, _this._setFilterPlaceholderCallback, _this._callStackDataSource, _this._gridContextMenuOptions[6 /* AllocationCallStack */], _this._callStackColumns, snapshotType);
                                } else {
                                    _this._callStackViewer.resetView();
                                }
                            }
                        }
                    }, maxObjectsCount);
                };

                MemoryAnalyzerViewer.prototype.InitializeAggregatedCallStacksViewer = function () {
                    var _this = this;
                    if (this._debugNativeMemory) {
                        if (!this._aggregatedCallStacksViewer) {
                            this._aggregatedCallStacksViewer = new MemoryAnalyzerAggregatedCallStackGridViewer(document.getElementById("aggregatedCallStacksViewerContainer"), function (visible) {
                                if (_this._viewType === 2 /* AggregatedStacksView */) {
                                    document.querySelector("#typesObjectsEmptyMessageDiv").style.display = (visible === true) ? "block" : "none";
                                }
                                if (_this._isAggregatedCallStackExpandRoot) {
                                    _this._aggregatedCallStacksViewer.expandRoot();
                                    _this._isAggregatedCallStackExpandRoot = false;
                                }
                            }, this._setFilterPlaceholderCallback, this._aggregatedCallStacksDataSource, this._gridContextMenuOptions[7 /* AggregatedCallStacks */], this._aggregatedCallStacksColumns, function (showStackFrames) {
                                _this.InitializeAllocationListViewer(showStackFrames);
                            });
                        }
                    } else {
                        this._aggregatedCallStacksViewer = null;
                    }
                };

                MemoryAnalyzerViewer.prototype.InitializeAllocationListViewer = function (showAllocationList) {
                    var refGraphHeader = document.getElementById("refGraphHeader");
                    var refGraphNoData = document.querySelector("#managedHeapViewerRefGraphNoData");
                    var managedHeapViewerForwardRefGraphContainer = document.querySelector("#managedHeapViewerForwardRefGraphContainer");
                    var managedHeapViewerBackwardRefGraphContainer = document.querySelector("#managedHeapViewerBackwardRefGraphContainer");
                    var managedHeapViewerForwardTypeRefGraphContainer = document.querySelector("#managedHeapViewerForwardTypeRefGraphContainer");
                    var managedHeapViewerBackwardTypeRefGraphContainer = document.querySelector("#managedHeapViewerBackwardTypeRefGraphContainer");
                    var stackHeader = document.getElementById("stackHeader");
                    var stackHeaderContent = document.getElementById("StackHeaderContent");
                    var nativeStackViewerContainer = document.getElementById("nativeStackViewerContainer");
                    var nativeAllocationListContainer = document.getElementById("nativeAllocationListContainer");

                    if (!this._debugNativeMemory) {
                        stackHeader.style.display = "none";
                        nativeAllocationListContainer.style.display = "none";
                    } else {
                        if (!showAllocationList) {
                            stackHeader.style.display = "none";
                            nativeAllocationListContainer.style.display = "none";
                            refGraphNoData.innerHTML = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("SelectIdentifierForAllocationList");
                        } else {
                            refGraphNoData.innerHTML = "";
                            refGraphNoData.style.display = "none";

                            refGraphHeader.style.display = "none";
                            if (managedHeapViewerForwardRefGraphContainer) {
                                managedHeapViewerForwardRefGraphContainer.style.display = "none";
                            }
                            if (managedHeapViewerBackwardRefGraphContainer) {
                                managedHeapViewerBackwardRefGraphContainer.style.display = "none";
                            }
                            if (managedHeapViewerForwardTypeRefGraphContainer) {
                                managedHeapViewerForwardTypeRefGraphContainer.style.display = "none";
                            }
                            if (managedHeapViewerBackwardTypeRefGraphContainer) {
                                managedHeapViewerBackwardTypeRefGraphContainer.style.display = "none";
                            }
                            if (nativeStackViewerContainer) {
                                nativeStackViewerContainer.style.display = "none";
                            }
                            stackHeader.style.display = "block";
                            stackHeaderContent.title = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("AllocationList");
                            stackHeaderContent.text = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("AllocationList");
                            stackHeaderContent.className = "enabled";
                            nativeAllocationListContainer.style.display = "";

                            if (!this._allocationListViewer) {
                                this._allocationListViewer = new MemoryAnalyzerAllocationListGridViewer(document.querySelector("#nativeAllocationListContainer"), function (visible) {
                                    document.getElementById("allocationStackEmptyMessageDiv").style.display = (visible === true) ? "block" : "none";
                                }, this._setFilterPlaceholderCallback, this._allocationListDataSource, this._gridContextMenuOptions[6 /* AllocationCallStack */], this._allocationListColumns);
                            } else {
                                this._allocationListViewer.resetView();
                            }
                        }
                    }
                };

                MemoryAnalyzerViewer.prototype.refreshDropDownAsync = function () {
                    var _this = this;
                    if (!this._diffDropDown || this._diffDropDown.disabled) {
                        return;
                    }

                    this._adaptor._call("OtherActiveMemoryAnalysisInstanceNames").done(function (result) {
                        _this._diffDropDownTitleElement = new Option(ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("SelectDefault"), "0");

                        _this._diffDropDown.options.length = 0;
                        _this._diffDropDown.options.add(_this._diffDropDownTitleElement);

                        var index = 0;

                        for (var key in result) {
                            if (result.hasOwnProperty(key)) {
                                var optionText = (MemoryAnalyzer.FormattingHelpers.getNativeDigitLocaleString(MemoryAnalyzer.FormattingHelpers.trimLongString(result[key])));

                                _this._diffDropDown.options.add(new Option(optionText, key));
                                if (_this._activeDropDownName === key)
                                    index = _this._diffDropDown.options.length - 1;
                            }
                        }

                        if (!_this._debugNativeMemory && _this._snapshotType !== undefined && _this._snapshotType !== 2 /* LIVE_MANAGED */ && _this._snapshotType !== 3 /* LIVE_NATIVE */) {
                            _this._diffDropDown.options.add(new Option(ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("SelectBrowse"), "Browse"));
                        }

                        if (_this._activeDropDownName) {
                            _this._diffDropDownTitleElement.innerText = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("SelectDefaultNone");

                            if (_this._diffDropDown.classList.contains("disabledColor"))
                                _this._diffDropDown.classList.remove("disabledColor");
                        } else {
                            if (!_this._diffDropDown.classList.contains("disabledColor"))
                                _this._diffDropDown.classList.add("disabledColor");
                        }

                        _this._diffDropDown.selectedIndex = index;
                    });
                };

                MemoryAnalyzerViewer.prototype.showSamplingIconAsync = function () {
                    var _this = this;
                    return this._adaptor._call("IsSamplingEnabled").then(function (result) {
                        if (result) {
                            var icon = document.createElement('div');
                            icon.innerHTML = document.getElementById("IconTemplate").innerHTML;
                            ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getChildById("icon", icon).classList.add("NotificationIcon");
                            ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getChildById("container", icon).classList.add("SamplingIcon");

                            if (!_this._countColumnIndex || _this._typeColumns[_this._countColumnIndex].index !== "Count") {
                                throw Error("incorrect column");
                            }

                            var countColumn = _this._typeColumns[_this._countColumnIndex];
                            countColumn.hasHTMLContent = true;
                            countColumn.text += icon.innerHTML;
                            countColumn.tooltip = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("SamplingEnabledTooltip");

                            countColumn = _this.getTypeRefGraphColumns()[1];
                            if (countColumn.index !== "RetainedCount" && countColumn.index !== "RefCount") {
                                throw Error("incorrect column");
                            }
                            countColumn.hasHTMLContent = true;
                            countColumn.text += icon.innerHTML;
                            countColumn.tooltip = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("SamplingEnabledTooltip");
                        }
                    });
                };

                MemoryAnalyzerViewer.prototype.showHeapStatusMessageAsync = function () {
                    var _this = this;
                    return this._adaptor._call("GetHeapStatusMessage").then(function (result) {
                        if (result) {
                            _this._heapStatusMessage = result;
                            _this.updateNotificationBar();
                        }
                    });
                };

                MemoryAnalyzerViewer.prototype.setViewType = function (inspectionType, title) {
                    var viewerDomElement = [];
                    viewerDomElement[0 /* TypesView */] = document.getElementById("managedHeapTypesViewerContainer");
                    viewerDomElement[1 /* ObjectsView */] = document.getElementById("managedHeapObjectsViewerContainer");
                    viewerDomElement[2 /* AggregatedStacksView */] = document.querySelector("#aggregatedCallStacksViewerContainer");
                    var viewSettings = document.getElementById("viewSettingsDiv");
                    var diffDropDown = document.getElementById("diffDropDownDiv");
                    var refGraphNoData = document.getElementById("managedHeapViewerRefGraphNoData");
                    var stackHeader = document.getElementById("stackHeader");
                    var nativeStackViewerContainer = document.getElementById("nativeStackViewerContainer");
                    var nativeAllocationListContainer = document.getElementById("nativeAllocationListContainer");
                    var generalCaption = document.getElementById("viewGeneralCaptionDiv");

                    refGraphNoData.innerHTML = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource(inspectionType === 0 /* TypesView */ ? "TypeRefGraphNoData" : "ObjectRefGraphNoData");

                    stackHeader.style.display = "none";
                    nativeStackViewerContainer.style.display = "none";
                    nativeAllocationListContainer.style.display = "none";
                    if (this._debugNativeMemory) {
                        if (inspectionType === 0 /* TypesView */) {
                            refGraphNoData.innerHTML = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("GotoInstancesView");
                        } else if (inspectionType === 1 /* ObjectsView */) {
                            refGraphNoData.innerHTML = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("DisplayStackView");
                        } else {
                            refGraphNoData.innerHTML = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("SelectIdentifierToShowAllocations", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("ViewModeTypesView"));
                        }

                        if (inspectionType === 0 /* TypesView */) {
                            this._splitter.snapToContent(refGraphNoData);
                        } else {
                            this._splitter.unsnapFromContent();
                        }
                    }

                    if (inspectionType === 0 /* TypesView */) {
                        viewerDomElement[0 /* TypesView */].style.display = "";
                        viewerDomElement[1 /* ObjectsView */].style.display = "none";
                        viewerDomElement[2 /* AggregatedStacksView */].style.display = "none";

                        diffDropDown.style.display = viewSettings.style.display = "";
                        generalCaption.style.display = "";
                        this.refreshAggregatedStacksView(inspectionType, title);

                        if (this._objectsViewer) {
                            this._objectsViewer.tryToCloseDataTip(true);
                            this._objectsViewer.showRefGraph(false);
                            this._objectsViewer.resetView();
                            this._objectsViewer.clearFilter();
                        }
                        if (this._aggregatedCallStacksViewer) {
                            this._aggregatedCallStacksViewer.tryToCloseDataTip(true);
                            this._aggregatedCallStacksViewer.showRefGraph(false);
                            this._aggregatedCallStacksViewer.clearFilter();
                            this._isAggregatedCallStackExpandRoot = true;
                        }
                        if (this._typesViewer) {
                            this._typesViewer.showRefGraph(false);
                            this._typesViewer.resetFilter();
                            this._typesViewer.clearCurrentSelection();
                            this._typesViewer.scheduleUpdate();
                        }
                    } else if (inspectionType === 1 /* ObjectsView */) {
                        viewerDomElement[0 /* TypesView */].style.display = "none";
                        viewerDomElement[1 /* ObjectsView */].style.display = "";
                        viewerDomElement[2 /* AggregatedStacksView */].style.display = "none";

                        diffDropDown.style.display = viewSettings.style.display = "none";
                        generalCaption.style.display = "none";
                        this.refreshAggregatedStacksView(inspectionType, title);

                        if (this._typesViewer) {
                            this._typesViewer.showRefGraph(false);
                        }
                        if (this._objectsViewer) {
                            this._objectsViewer.showRefGraph(false);
                            this._objectsViewer.resetFilter();
                            this._objectsViewer.scheduleUpdate();
                        }
                        if (this._aggregatedCallStacksViewer) {
                            this._aggregatedCallStacksViewer.tryToCloseDataTip(true);
                            this._aggregatedCallStacksViewer.showRefGraph(false);
                            this._aggregatedCallStacksViewer.clearFilter();
                            this._isAggregatedCallStackExpandRoot = true;
                        }
                    } else {
                        this.InitializeAggregatedCallStacksViewer();
                        viewerDomElement[0 /* TypesView */].style.display = "none";
                        viewerDomElement[1 /* ObjectsView */].style.display = "none";
                        viewerDomElement[2 /* AggregatedStacksView */].style.display = "";
                        generalCaption.style.display = "";
                        diffDropDown.style.display = viewSettings.style.display = "";
                        this.refreshAggregatedStacksView(inspectionType, title);
                        if (this._typesViewer) {
                            this._typesViewer.showRefGraph(false);
                        }
                        if (this._objectsViewer) {
                            this._objectsViewer.tryToCloseDataTip(true);
                            this._objectsViewer.showRefGraph(false);
                            this._objectsViewer.resetView();
                            this._objectsViewer.clearFilter();
                        }
                        if (this._aggregatedCallStacksViewer) {
                            this._aggregatedCallStacksViewer.resetView();
                            this._aggregatedCallStacksViewer.showRefGraph(false);
                            this._aggregatedCallStacksViewer.resetFilter();
                            this._aggregatedCallStacksViewer.scheduleUpdate();
                        }
                    }

                    this._viewType = inspectionType;

                    if (this._filterDomElement) {
                        this.showFilterPlaceholder();
                        this._filterDomElement.disabled = inspectionType == 1 /* ObjectsView */ && !this._isObjectInspectionAvailable;
                    }

                    this.updateBackButton(title);
                    this.updateNotificationBar();
                };

                MemoryAnalyzerViewer.prototype.showFilterPlaceholder = function () {
                    this._filterDomElement.placeholder = MemoryAnalyzer.FormattingHelpers.forceNonBreakingSpaces(ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource(this._viewType == 1 /* ObjectsView */ ? "InstancesFilter" : "TypesFilter"));
                };

                MemoryAnalyzerViewer.prototype.refreshAggregatedStacksView = function (viewType, title) {
                    var _this = this;
                    var viewModeDropDown = document.getElementById("viewModeDropDownDiv");
                    var viewDropDownCaption = document.querySelector("#viewModeCaption");
                    var viewDropDown = document.querySelector("#viewModeDropDown");

                    if (viewType === 0 /* TypesView */ || viewType === 2 /* AggregatedStacksView */) {
                        this._adaptor._call("GetAggregatedStackUIState").done(function (result) {
                            if (result === 0) {
                                viewDropDown.disabled = viewDropDown.hidden = true;
                                viewModeDropDown.style.display = viewDropDownCaption.style.display = "none";
                                return;
                            } else {
                                viewModeDropDown.style.display = viewDropDownCaption.style.display = "";
                                viewDropDown.disabled = viewDropDown.hidden = false;
                                viewDropDownCaption.innerHTML = MemoryAnalyzer.FormattingHelpers.forceNonBreakingSpaces(ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("ViewMode"));

                                viewDropDown.options.length = 0;
                                if (viewType == 0 /* TypesView */) {
                                    viewDropDown.options.add(new Option(MemoryAnalyzer.FormattingHelpers.forceNonBreakingSpaces(ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("ViewModeTypesView")), "TypesView", true, true));
                                    viewDropDown.options.add(new Option(MemoryAnalyzer.FormattingHelpers.forceNonBreakingSpaces(ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("ViewModeStackView")), "StacksView", false, false));
                                } else {
                                    viewDropDown.options.add(new Option(MemoryAnalyzer.FormattingHelpers.forceNonBreakingSpaces(ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("ViewModeTypesView")), "TypesView", false, false));
                                    viewDropDown.options.add(new Option(MemoryAnalyzer.FormattingHelpers.forceNonBreakingSpaces(ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("ViewModeStackView")), "StacksView", true, true));
                                }

                                viewDropDown.onchange = function (e) {
                                    if (viewDropDown.selectedIndex !== 0) {
                                        _this.setViewType(2 /* AggregatedStacksView */, "Stack View");
                                    } else if (viewDropDown.selectedIndex === 0) {
                                        _this.setViewType(0 /* TypesView */, null);
                                    }
                                };
                            }
                        });
                    } else {
                        viewDropDown.disabled = viewDropDown.hidden = true;
                        viewModeDropDown.style.display = viewDropDownCaption.style.display = "none";
                    }
                };

                MemoryAnalyzerViewer.prototype.updateBackButton = function (title) {
                    var _this = this;
                    document.getElementById("goBackDiv").style.display = (this._viewType === 1 /* ObjectsView */) ? "" : "none";

                    if (this._viewType === 1 /* ObjectsView */) {
                        var goBackIcon = document.getElementById("goBackIcon");
                        goBackIcon.onmousedown = function () {
                            goBackIcon.onmouseup = function () {
                                _this.setViewType(0 /* TypesView */, null);
                            };
                        };
                        goBackIcon.onmouseleave = function () {
                            goBackIcon.onmouseup = null;
                        };

                        var goBackTypeCaption = document.getElementById("goBackCaption");
                        var instancesOfText = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("InstancesOfHeader", title);
                        goBackTypeCaption.innerHTML = MemoryAnalyzer.FormattingHelpers.forceHtmlRendering(instancesOfText);
                    }

                    this._adaptor._call("RegisterIDENavigationPoint", this._viewType, this._viewType === 0 /* TypesView */ ? ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("BackButtonType") : title);
                };

                MemoryAnalyzerViewer.prototype.setRefGraphDirectionAsync = function (direction, done) {
                    var _this = this;
                    this._refGraphDirection = direction;

                    this._adaptor._call("ChangeGraphDirection", this._refGraphDirection).done(function () {
                        var refGraphDom = document.querySelector(direction === 0 /* Forward */ ? "#managedHeapViewerForwardRefGraphContainer" : "#managedHeapViewerBackwardRefGraphContainer");
                        var typeRefGraphDom = document.querySelector(direction === 0 /* Forward */ ? "#managedHeapViewerForwardTypeRefGraphContainer" : "#managedHeapViewerBackwardTypeRefGraphContainer");
                        var oppositeRefGraphDom = document.querySelector(direction === 1 /* Backward */ ? "#managedHeapViewerForwardRefGraphContainer" : "#managedHeapViewerBackwardRefGraphContainer");
                        var oppositeTypeRefGraphDom = document.querySelector(direction === 1 /* Backward */ ? "#managedHeapViewerForwardTypeRefGraphContainer" : "#managedHeapViewerBackwardTypeRefGraphContainer");

                        if (_this._viewType === 1 /* ObjectsView */) {
                            refGraphDom.style.display = "block";
                        } else if (_this._viewType === 0 /* TypesView */) {
                            typeRefGraphDom.style.display = "block";
                        }

                        oppositeRefGraphDom.style.display = oppositeTypeRefGraphDom.style.display = "none";

                        var div = document.querySelector("#managedHeapViewerRefGraphNoData");
                        div.style.display = "none";

                        var refGraphIsAlreadyInCache = false;

                        if (_this._refsViewerCache[_this._refGraphDirection]) {
                            _this._refsViewer = _this._refsViewerCache[_this._refGraphDirection];
                            refGraphIsAlreadyInCache = true;
                        } else {
                            var refGraphDataArray = new Common.Controls.DynamicGrid.ProxyArray(_this._adaptor, _this.getObjectRefGraphDataSource(), MemoryAnalyzerViewer.ProxyArrayCacheSize);
                            refGraphDataArray.init(function () {
                                var contextMenu = _this._gridContextMenuOptions[direction === 0 /* Forward */ ? 3 /* ForwardRefGraph */ : 2 /* BackwardRefGraph */];
                                _this._refsViewerCache[_this._refGraphDirection] = _this._refsViewer = new MemoryAnalyzerRefGraphViewer(refGraphDom, refGraphDataArray, contextMenu, _this.getObjectRefGraphColumns(), _this._refGraphDirection);

                                if (_this._viewType === 1 /* ObjectsView */) {
                                    _this.updateRefGraphDirectionUIElements(false);

                                    _this._refsViewer.showGraph(true);
                                    if (_this._objectsViewer)
                                        _this._objectsViewer.reactivateCurrentRow();
                                }
                            });
                        }

                        if (_this._typeRefsViewerCache[_this._refGraphDirection]) {
                            _this._typeRefsViewer = _this._typeRefsViewerCache[_this._refGraphDirection];
                            refGraphIsAlreadyInCache = true;
                        } else {
                            var typeRefGraphDataArray = new Common.Controls.DynamicGrid.ProxyArray(_this._adaptor, _this.getTypeRefGraphDataSource(), MemoryAnalyzerViewer.ProxyArrayCacheSize);
                            typeRefGraphDataArray.init(function () {
                                var contextMenu = _this._gridContextMenuOptions[direction === 0 /* Forward */ ? 5 /* ForwardTypesRefGraph */ : 4 /* BackwardTypesRefGraph */];
                                _this._typeRefsViewerCache[_this._refGraphDirection] = _this._typeRefsViewer = new MemoryAnalyzerTypeRefGraphViewer(typeRefGraphDom, typeRefGraphDataArray, contextMenu, _this.getTypeRefGraphColumns(), _this._refGraphDirection);

                                if (_this._viewType === 0 /* TypesView */) {
                                    _this.updateRefGraphDirectionUIElements(false);

                                    _this._typeRefsViewer.showGraph(true);
                                    if (_this._typesViewer) {
                                        _this._typesViewer.reactivateCurrentRow();
                                    }
                                }
                            });
                        }

                        if (refGraphIsAlreadyInCache) {
                            _this.updateRefGraphDirectionUIElements(true);
                            _this._typeRefsViewer.refreshSortingOrder(function () {
                                var currentRowHasNotChanged = (_this._viewType === 0 /* TypesView */ && _this._typesViewer && _this._currentSelectedIndexBeforeSwitchingGraphDirection !== _this._typesViewer.getSelectedRowIndex()) || (_this._viewType === 1 /* ObjectsView */ && _this._objectsViewer && _this._currentSelectedIndexBeforeSwitchingGraphDirection !== _this._objectsViewer.getSelectedRowIndex());
                                if (currentRowHasNotChanged) {
                                    if (_this._viewType === 1 /* ObjectsView */)
                                        _this._objectsViewer.reactivateCurrentRow();
                                    if (_this._viewType === 0 /* TypesView */)
                                        _this._typesViewer.reactivateCurrentRow();
                                } else {
                                    if (_this._viewType === 1 /* ObjectsView */) {
                                        _this._refsViewer.scheduleUpdate();
                                    } else if (_this._viewType === 0 /* TypesView */) {
                                        _this._typeRefsViewer.scheduleUpdate();
                                    }
                                }

                                if (_this._typesViewer) {
                                    _this._currentSelectedIndexBeforeSwitchingGraphDirection = _this._typesViewer.getSelectedRowIndex();
                                }
                            });
                        } else {
                            _this._currentSelectedIndexBeforeSwitchingGraphDirection = _this._typesViewer ? _this._typesViewer.getSelectedRowIndex() : -1;
                        }

                        if (done) {
                            done();
                        }
                    });
                    return this._refGraphDirection;
                };

                MemoryAnalyzerViewer.prototype.resetCurrentSelectedIndex = function () {
                    this._currentSelectedIndexBeforeSwitchingGraphDirection = -1;
                    this.updateRefGraphDirectionUIElements(false);
                };

                MemoryAnalyzerViewer.prototype.getOption = function (option, value) {
                    return value !== undefined ? value : option;
                };

                MemoryAnalyzerViewer.prototype.updateRefGraphDirectionUIElements = function (showTabs) {
                    var _this = this;
                    var refGraphHeader = document.getElementById("refGraphHeader");
                    var referencingGraph = document.getElementById("referencingGraph");
                    var referencedGraph = document.getElementById("referencedGraph");

                    if (!showTabs) {
                        refGraphHeader.style.display = "none";
                    } else {
                        refGraphHeader.style.display = "block";

                        referencingGraph.innerText = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("ReferencingGraph");
                        referencingGraph.title = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource(this._viewType === 0 /* TypesView */ ? "ReferencingGraphTypesTooltip" : "ReferencingGraphObjectsTooltip");

                        referencedGraph.innerText = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource(this._viewType === 0 /* TypesView */ ? "ReferencedGraphTypes" : "ReferencedGraphObjects");
                        referencedGraph.title = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource(this._viewType === 0 /* TypesView */ ? "ReferencedGraphTypesTooltip" : "ReferencedGraphObjectsTooltip");

                        if (this._refGraphDirection === 1 /* Backward */) {
                            referencingGraph.className = "disabled";
                            referencedGraph.className = "enabled";

                            referencingGraph.onclick = undefined;
                            referencedGraph.onclick = function (e) {
                                _this._adaptor._call(_this._viewType === 0 /* TypesView */ ? "OnSelectTypeRefGraph" : "OnSelectObjectRefGraph", 0 /* Forward */);

                                _this.setRefGraphDirectionAsync(0 /* Forward */);
                            };
                        } else {
                            referencingGraph.className = "enabled";
                            referencedGraph.className = "disabled";

                            referencedGraph.onclick = undefined;
                            referencingGraph.onclick = function (e) {
                                _this._adaptor._call(_this._viewType === 0 /* TypesView */ ? "OnSelectTypeRefGraph" : "OnSelectObjectRefGraph", 1 /* Backward */);

                                _this.setRefGraphDirectionAsync(1 /* Backward */);
                            };
                        }
                    }
                };

                MemoryAnalyzerViewer.prototype.getTypeRefGraphColumns = function () {
                    return this._refGraphDirection == 0 /* Forward */ ? this._typeForwardRefGraphColumns : this._typeBackwardRefGraphColumns;
                };

                MemoryAnalyzerViewer.prototype.getTypeRefGraphDataSource = function () {
                    return this._refGraphDirection == 0 /* Forward */ ? "TypeForwardRefGraph" : "TypeRefGraph";
                };

                MemoryAnalyzerViewer.prototype.getObjectRefGraphColumns = function () {
                    return this._refGraphDirection == 0 /* Forward */ ? this._objectForwardRefGraphColumns : this._objectBackwardRefGraphColumns;
                };

                MemoryAnalyzerViewer.prototype.getObjectRefGraphDataSource = function () {
                    return this._refGraphDirection == 0 /* Forward */ ? "ForwardRefGraph" : "RefGraph";
                };

                MemoryAnalyzerViewer.prototype.getActiveView = function () {
                    if (this._viewType === 1 /* ObjectsView */) {
                        return this._objectsViewer;
                    } else if (this._viewType === 2 /* AggregatedStacksView */) {
                        return this._aggregatedCallStacksViewer;
                    } else {
                        return this._typesViewer;
                    }
                };
                MemoryAnalyzerViewer.ProxyArrayCacheSize = 1000;

                MemoryAnalyzerViewer.TooltipDelay = 500;
                MemoryAnalyzerViewer.TooltipDuration = 6000;

                MemoryAnalyzerViewer.MAX_TAG_COLUMN_WIDTH = 500;
                MemoryAnalyzerViewer.MAX_NUMERIC_COLUMN_WIDTH = 150;
                MemoryAnalyzerViewer.TAG_COLUMN_RATIO = 0.47;
                MemoryAnalyzerViewer.NUMERIC_COLUMN_RATIO = 0.24;
                return MemoryAnalyzerViewer;
            })();
            HeapViewer.MemoryAnalyzerViewer = MemoryAnalyzerViewer;

            var MemoryAnalyzerTypesGridViewer = (function (_super) {
                __extends(MemoryAnalyzerTypesGridViewer, _super);
                function MemoryAnalyzerTypesGridViewer(root, viewChangedCallback, dataArray, gridContextMenu, columns, sortColumn, refGraphCallback, nativeDisableRefGraph, switchToObjectsView, setFilterPlaceholderCallback, snapshotType) {
                    var _this = this;
                    this._snapshotType = snapshotType;
                    var allowObjectsView = this.allowObjectsView();
                    gridContextMenu[1 /* Separator1 */].hidden = gridContextMenu[4 /* ViewInstances */].hidden = function () {
                        return !allowObjectsView;
                    };
                    if (allowObjectsView) {
                        gridContextMenu[4 /* ViewInstances */].disabled = function () {
                            var disableMenuItem;
                            _this.checkIfBaselineOnlyTypeAsync(_this.getRowInfo(_this.getSelectedRowIndex()), function (isBaselineOnlyType) {
                                disableMenuItem = isBaselineOnlyType;
                            });
                            return disableMenuItem;
                        };
                    }

                    gridContextMenu[4 /* ViewInstances */].callback = function () {
                        var row = _this.getRowInfo(_this.getSelectedRowIndex());
                        if (row)
                            _this.switchToObjects(row);
                    };

                    gridContextMenu[6 /* GoToDefinition */].callback = function () {
                        return _this.goToDefinition();
                    };
                    gridContextMenu[7 /* FindAllReferences */].callback = function () {
                        return _this.findAllReferences();
                    };

                    this._goToDefinitionState = 0 /* NotAvailable */;
                    this._findAllReferencesState = 0 /* NotAvailable */;

                    gridContextMenu[5 /* Separator2 */].hidden = gridContextMenu[8 /* GotoSource */].hidden = function () {
                        return true;
                    };
                    gridContextMenu[6 /* GoToDefinition */].hidden = function () {
                        return _this._goToDefinitionState === 0 /* NotAvailable */;
                    };
                    gridContextMenu[7 /* FindAllReferences */].hidden = function () {
                        return _this._findAllReferencesState === 0 /* NotAvailable */;
                    };

                    gridContextMenu[5 /* Separator2 */].disabled = gridContextMenu[6 /* GoToDefinition */].disabled = function () {
                        return _this._goToDefinitionState === 1 /* Disabled */;
                    };
                    gridContextMenu[7 /* FindAllReferences */].disabled = function () {
                        return _this._findAllReferencesState === 1 /* Disabled */;
                    };

                    this._defaultSortColumn = columns[columns.length - 1].index;
                    if (sortColumn) {
                        var sortColumnTitle = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource(sortColumn);
                        columns.forEach(function (column) {
                            if (column.text === sortColumnTitle) {
                                _this._defaultSortColumn = column.index;
                            }
                        });
                    }

                    _super.call(this, root, viewChangedCallback, dataArray, gridContextMenu, columns, refGraphCallback, setFilterPlaceholderCallback, "TypeSummariesSetFilterAndSortOrder");

                    this.getGotoDefinitionStateAsync();
                    this.getFindAllReferencesStateAsync();

                    this._switchToObjectsViewCallback = switchToObjectsView;
                    this._nativeDisableRefGraph = nativeDisableRefGraph;

                    if (this.allowObjectsView()) {
                        this.getCanvas().addEventListener("dblclick", function () {
                            _this.onDoubleClick.apply(_this, arguments);
                        });
                    }

                    this._nativeDisableRefGraph(MemoryAnalyzerViewer.instance.IsDebuggingNativeMemory());
                }
                MemoryAnalyzerTypesGridViewer.prototype.setDefaultSortOrder = function () {
                    this.onSort([new Common.Controls.Grid.SortOrderInfo(this._defaultSortColumn, "desc")], []);
                };

                MemoryAnalyzerTypesGridViewer.prototype.getGotoDefinitionStateAsync = function () {
                    var _this = this;
                    this.adaptor()._call("GetGoToDefinitionState").done(function (result) {
                        _this._goToDefinitionState = result;
                    });
                };

                MemoryAnalyzerTypesGridViewer.prototype.getFindAllReferencesStateAsync = function () {
                    var _this = this;
                    this.adaptor()._call("GetFindAllReferencesState").done(function (result) {
                        _this._findAllReferencesState = result;
                    });
                };

                MemoryAnalyzerTypesGridViewer.prototype.goToDefinition = function () {
                    var _this = this;
                    var dataIndex = this.getSelectedDataIndex();

                    this._dataArray.get(dataIndex.path, function (value) {
                        var tag = value["Tag"];
                        _this.adaptor()._call("GoToDefinition", tag, 0 /* Type */);
                    });
                };

                MemoryAnalyzerTypesGridViewer.prototype.findAllReferences = function () {
                    var _this = this;
                    var dataIndex = this.getSelectedDataIndex();

                    this._dataArray.get(dataIndex.path, function (value) {
                        var tag = value["Tag"];
                        _this.adaptor()._call("FindAllReferences", tag, 0 /* Type */);
                    });
                };

                MemoryAnalyzerTypesGridViewer.prototype.updateMouseOverRowStyle = function (row) {
                    this.pinObjectsViewIcon(row, "SnapshotGotoObjectsIconHover", false);
                };

                MemoryAnalyzerTypesGridViewer.prototype.updateMouseOutRowStyle = function (row) {
                    this.unpinObjectsViewIcon(row, "SnapshotGotoObjectsIconHover");
                };

                MemoryAnalyzerTypesGridViewer.prototype.updateSelectedRowStyle = function (row) {
                    this.pinObjectsViewIcon(row, "SnapshotGotoObjectsIconSelection", true);
                };

                MemoryAnalyzerTypesGridViewer.prototype.updateUnselectedRowStyle = function (row) {
                    this.unpinObjectsViewIcon(row, "SnapshotGotoObjectsIconSelection");
                };

                MemoryAnalyzerTypesGridViewer.prototype.pinObjectsViewIcon = function (row, cssClass, override) {
                    var _this = this;
                    if (!this.allowObjectsView())
                        return;

                    if (!row || row.row.children.length === 0)
                        throw Error("invalid row structure");

                    var column = (row.row.children[0]);
                    if (this.isUndeterminedNativeType(column.innerText)) {
                        column.addEventListener("mouseover", function (e) {
                            var config = {
                                content: ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("UnDeterminedTypeToolTip"),
                                delay: MemoryAnalyzerViewer.TooltipDelay,
                                duration: MemoryAnalyzerViewer.TooltipDuration
                            };
                            Microsoft.Plugin.Tooltip.show(config);
                        });
                    }
                    if (column.children.length === 0 || override) {
                        var icon;
                        var overlay;
                        if (override && column.children[0] && column.children[1]) {
                            icon = column.children[0];
                            overlay = column.children[1];
                        } else {
                            var template = document.getElementById("IconTemplate");
                            icon = document.createElement('span');
                            icon.innerHTML = template.innerHTML;
                            ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getChildById("icon", icon).classList.add("ViewInstancesIcon");
                            overlay = document.createElement('span');
                        }

                        var tooltipText;
                        icon.className = cssClass;
                        overlay.className = cssClass;
                        overlay.classList.add("SnapshotGotoObjectsIconOverlay");

                        this.checkIfBaselineOnlyTypeAsync(row, function (isBaselineOnlyType) {
                            if (isBaselineOnlyType) {
                                tooltipText = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("ObjectNotAvailable");
                                ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getChildById("icon", icon).classList.add("SnapshotGotoObjectsIconGrayOut");
                            } else {
                                tooltipText = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("ViewInstancesTooltip", column.textContent);

                                overlay.addEventListener("mousedown", function (e) {
                                    if (_this.isDirty())
                                        return;

                                    Microsoft.Plugin.Tooltip.dismiss();
                                    Microsoft.Plugin.ContextMenu.dismissAll();
                                    if (!e.button) {
                                        _this.switchToObjects(row);
                                    }
                                    e.stopPropagation();
                                });
                            }

                            overlay.addEventListener("mouseover", function (e) {
                                Microsoft.Plugin.Tooltip.show(tooltipText);
                            });

                            column.appendChild(icon);
                            column.appendChild(overlay);
                        });
                    }
                };

                MemoryAnalyzerTypesGridViewer.prototype.unpinObjectsViewIcon = function (row, cssClass) {
                    if (!this.allowObjectsView())
                        return;

                    if (!row || row.row.children.length == 0)
                        throw Error("invalid row structure");

                    var column = (row.row.children[0]);

                    while (column.children[0] && column.children[0].classList.contains(cssClass)) {
                        column.removeChild(column.children[0]);
                    }
                };

                MemoryAnalyzerTypesGridViewer.prototype._onKeyDown = function (e) {
                    if (this.allowObjectsView() && e.keyCode === 13 /* ENTER */ && !this.isDirty()) {
                        var rowInfo = this.getRowInfo(this.getSelectedRowIndex());
                        if (rowInfo) {
                            Microsoft.Plugin.Tooltip.dismiss();
                            this.switchToObjects(rowInfo);
                            return true;
                        }
                    }

                    if (e.shiftKey && e.keyCode === 123 /* F12 */ && this._findAllReferencesState === 2 /* Enabled */ && this.getSelectedRowIndex() >= 0) {
                        this.findAllReferences();
                        return true;
                    }

                    if (e.keyCode == 123 /* F12 */ && this._goToDefinitionState === 2 /* Enabled */ && this.getSelectedRowIndex() >= 0) {
                        this.goToDefinition();
                        return true;
                    }

                    return _super.prototype._onKeyDown.call(this, e);
                };

                MemoryAnalyzerTypesGridViewer.prototype.switchToObjects = function (row) {
                    var _this = this;
                    this.checkIfBaselineOnlyTypeAsync(row, function (isBaselineOnlyType) {
                        if (!isBaselineOnlyType) {
                            var dataIndex = (row.dataIndex);
                            var typeName = row.row.children[0].innerText;
                            _this._dataArray.get(dataIndex.path, function (data) {
                                _this._switchToObjectsViewCallback(dataIndex, data, typeName);
                            });
                        }
                    });
                };

                MemoryAnalyzerTypesGridViewer.prototype.activateRow = function (rowIndex) {
                    var _this = this;
                    _super.prototype.activateRow.call(this, rowIndex);

                    if (!MemoryAnalyzerViewer.instance.IsDebuggingNativeMemory()) {
                        if (rowIndex >= this.MaxRows - 1) {
                            this.showRefGraph(false);
                        } else {
                            var path = this.findPathByRow(rowIndex);
                            if (path.length() != 1)
                                throw Error("invalid path");

                            this._dataArray.get(path.path, function (value, needUpdate) {
                                _this.adaptor()._call("OnSelectType", value["Tag"]).done(function (isOk) {
                                    if (isOk) {
                                        _this.showRefGraph(true);
                                    }
                                });
                            });
                        }
                    }
                };

                MemoryAnalyzerTypesGridViewer.prototype.allowObjectsView = function () {
                    return this._snapshotType !== 1 /* GC_DUMP */;
                };

                MemoryAnalyzerTypesGridViewer.prototype.isUndeterminedNativeType = function (typeName) {
                    if (MemoryAnalyzerViewer.instance.IsDebuggingNativeMemory()) {
                        return typeName === ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("UndeterminedTypeString");
                    }
                    return false;
                };

                MemoryAnalyzerTypesGridViewer.prototype.checkIfBaselineOnlyTypeAsync = function (rowInfo, callback) {
                    if (rowInfo && callback) {
                        var dataIndexTreePath = (rowInfo.dataIndex);

                        this._dataArray.get(dataIndexTreePath.path, function (data) {
                            if (data["Count"]) {
                                callback(false);
                            } else {
                                callback(true);
                            }
                        });
                    }
                };

                MemoryAnalyzerTypesGridViewer.prototype.onDoubleClick = function (e) {
                    var rowInfo = this.getRowInfoFromEvent(e, "." + this.options().rowClass);
                    if (rowInfo) {
                        this.switchToObjects(rowInfo);
                    }
                };
                return MemoryAnalyzerTypesGridViewer;
            })(HeapViewer.MemoryAnalyzerGridViewer);

            var MemoryAnalyzerCallStackGridViewer = (function (_super) {
                __extends(MemoryAnalyzerCallStackGridViewer, _super);
                function MemoryAnalyzerCallStackGridViewer(root, viewChangedCallback, setFilterPlaceholderCallback, dataArray, gridContextMenu, columns, snapshotType) {
                    var _this = this;
                    this._snapshotType = snapshotType;
                    this._goToSourceState = 0 /* NotAvailable */;

                    gridContextMenu[1 /* Separator1 */].hidden = function () {
                        return _this._goToSourceState === 0 /* NotAvailable */;
                    };
                    gridContextMenu[4 /* ViewInstances */].hidden = function () {
                        return true;
                    };
                    gridContextMenu[6 /* GoToDefinition */].hidden = function () {
                        return true;
                    };
                    gridContextMenu[7 /* FindAllReferences */].hidden = function () {
                        return true;
                    };
                    gridContextMenu[5 /* Separator2 */].hidden = function () {
                        return true;
                    };
                    gridContextMenu[8 /* GotoSource */].callback = function () {
                        return _this.goToSource();
                    };
                    gridContextMenu[8 /* GotoSource */].hidden = function () {
                        return _this._goToSourceState === 0 /* NotAvailable */;
                    };
                    gridContextMenu[8 /* GotoSource */].disabled = function () {
                        return _this._goToSourceState === 1 /* Disabled */;
                    };

                    _super.call(this, root, viewChangedCallback, dataArray, gridContextMenu, columns, function (showTypeRefGraph) {
                    }, setFilterPlaceholderCallback, "StackSummariesSetFilterAndSortOrder");
                    this.getGotoSourceStateAsync();
                    this.getCanvas().addEventListener("dblclick", function () {
                        _this.onDoubleClick.apply(_this, arguments);
                    });
                }
                MemoryAnalyzerCallStackGridViewer.prototype.getGotoSourceStateAsync = function () {
                    var _this = this;
                    this.adaptor()._call("GetGoToSourceState").done(function (result) {
                        _this._goToSourceState = result;
                    });
                };

                MemoryAnalyzerCallStackGridViewer.prototype.onDoubleClick = function (e) {
                    this.goToSource();
                };

                MemoryAnalyzerCallStackGridViewer.prototype.goToSource = function () {
                    var _this = this;
                    var dataIndex = this.getSelectedDataIndex();

                    this._dataArray.get(dataIndex.path, function (value) {
                        var tag = value["TagName"];
                        _this.adaptor()._call("GotoSource", tag);
                    });
                };
                return MemoryAnalyzerCallStackGridViewer;
            })(HeapViewer.MemoryAnalyzerGridViewer);

            var MemoryAnalyzerAggregatedCallStackGridViewer = (function (_super) {
                __extends(MemoryAnalyzerAggregatedCallStackGridViewer, _super);
                function MemoryAnalyzerAggregatedCallStackGridViewer(root, viewChangedCallback, setFilterPlaceholderCallback, dataArray, gridContextMenu, columns, allocationListCallback) {
                    var _this = this;
                    this._goToSourceState = 0 /* NotAvailable */;
                    this._allocationListCallback = allocationListCallback;
                    this._searchString = "";

                    gridContextMenu[1 /* Separator1 */].hidden = function () {
                        return true;
                    };
                    gridContextMenu[4 /* ViewInstances */].hidden = function () {
                        return true;
                    };
                    gridContextMenu[6 /* GoToDefinition */].hidden = function () {
                        return true;
                    };
                    gridContextMenu[7 /* FindAllReferences */].hidden = function () {
                        return true;
                    };
                    gridContextMenu[5 /* Separator2 */].hidden = function () {
                        return true;
                    };
                    gridContextMenu[8 /* GotoSource */].callback = function () {
                        return _this.goToSource();
                    };
                    gridContextMenu[8 /* GotoSource */].hidden = function () {
                        return true;
                    };
                    gridContextMenu[8 /* GotoSource */].disabled = function () {
                        return true;
                    };

                    this._dataArray = dataArray;
                    this._dataArray.registerAsyncResultCallback(function (index, value) {
                        return _this.updateRowValueAsync(index, value);
                    });

                    this._defaultSortColumn = columns[1].index;

                    _super.call(this, root, viewChangedCallback, dataArray, gridContextMenu, columns, function (showTypeRefGraph) {
                    }, setFilterPlaceholderCallback, "AggStackSummariesSetFilterAndSortOrder");
                    this.getGotoSourceStateAsync();
                    this.getCanvas().addEventListener("dblclick", function () {
                        _this.onDoubleClick.apply(_this, arguments);
                    });
                }
                MemoryAnalyzerAggregatedCallStackGridViewer.prototype.getGotoSourceStateAsync = function () {
                    var _this = this;
                    this.adaptor()._call("GetGoToSourceState").done(function (result) {
                        _this._goToSourceState = result;
                    });
                };

                MemoryAnalyzerAggregatedCallStackGridViewer.prototype.setDefaultSortOrder = function () {
                    this.onSort([new Common.Controls.Grid.SortOrderInfo(this._defaultSortColumn, "desc")], []);
                };

                MemoryAnalyzerAggregatedCallStackGridViewer.prototype.updateColumnAsync = function (row, value, index, columnName) {
                    var columnElt = row.children[index];
                    columnElt.innerText = value[columnName];
                };

                MemoryAnalyzerAggregatedCallStackGridViewer.prototype.updateRowValueAsync = function (path, value) {
                    var valuepath = value.path;

                    var rowInfo;
                    if (!valuepath) {
                        rowInfo = this.getRowInfo(path);
                    } else {
                        rowInfo = this.getRowInfo(valuepath.at(0));
                    }

                    if (!rowInfo) {
                        return;
                    }

                    rowInfo.row.SubItemsCount = value["SubItemsCount"];

                    if (rowInfo.row.children.length === 4) {
                        this.updateColumnAsync(rowInfo.row, value, 0, "Identifier");
                        this.updateColumnAsync(rowInfo.row, value, 1, "StackViewCount");
                        this.updateColumnAsync(rowInfo.row, value, 2, "StackViewTotalSize");
                        this.updateColumnAsync(rowInfo.row, value, 3, "Module");
                    } else {
                        this.updateColumnAsync(rowInfo.row, value, 0, "Identifier");
                        this.updateColumnAsync(rowInfo.row, value, 1, "StackViewCountDiff");
                        this.updateColumnAsync(rowInfo.row, value, 2, "StackViewTotalSizeDiff");
                        this.updateColumnAsync(rowInfo.row, value, 3, "StackViewCount");
                        this.updateColumnAsync(rowInfo.row, value, 4, "StackViewTotalSize");
                        this.updateColumnAsync(rowInfo.row, value, 5, "Module");
                    }

                    this.markRowDirty([0]);
                    this.scheduleUpdate();
                    this.expandRoot();
                };

                MemoryAnalyzerAggregatedCallStackGridViewer.prototype.onDoubleClick = function (e) {
                    this.goToSource();
                };

                MemoryAnalyzerAggregatedCallStackGridViewer.prototype.goToSource = function () {
                    var _this = this;
                    var dataIndex = this.getSelectedDataIndex();

                    this._dataArray.get(dataIndex.path, function (value) {
                        var tag = value["TagName"];
                        _this.adaptor()._call("GotoSource", tag);
                    });
                };

                MemoryAnalyzerAggregatedCallStackGridViewer.prototype.expandRoot = function () {
                    this.expandNode(new Common.Controls.DynamicGrid.TreePath([0]));
                };

                MemoryAnalyzerAggregatedCallStackGridViewer.prototype.expandNode = function (treePath) {
                    var _this = this;
                    this._dataArray.get(treePath.path, function (row, needUpdate) {
                        _this.getExpandedPaths().expand(treePath, row.SubItemsCount);
                        _this.updateCounts(row.SubItemsCount);
                        _this.markRowDirty(treePath.path);

                        if (row.SubItemsCount === 1) {
                            var childPath = new Common.Controls.DynamicGrid.TreePath([]);
                            for (var j = 0; j < treePath.path.length; j++) {
                                childPath.path.push(treePath.path[j]);
                            }
                            childPath.path.push(0);

                            _this.expandNode(childPath);
                        } else if (needUpdate) {
                            _this.scheduleUpdate();
                        }
                    });
                };

                MemoryAnalyzerAggregatedCallStackGridViewer.prototype.activateRow = function (rowIndex) {
                    var _this = this;
                    _super.prototype.activateRow.call(this, rowIndex);

                    var path = this.findPathByRow(rowIndex);

                    if (rowIndex >= this.MaxRows - 1) {
                        this.showRefGraph(false);
                    } else {
                        this._dataArray.get(path.path, function (value, needUpdate) {
                            var allocationListCount = 0;
                            if (value !== undefined) {
                                allocationListCount = value["StackViewCount"];
                            }
                            _this.adaptor()._call("OnSelectStackFrame", path.path, allocationListCount).done(function (isOk) {
                                if (isOk) {
                                    _this.showRefGraph(false);
                                    _this._allocationListCallback(true);
                                }
                            });
                        });
                    }
                };

                MemoryAnalyzerAggregatedCallStackGridViewer.prototype.setFilterAsync = function (filterString) {
                    var _this = this;
                    if (filterString !== this._searchString) {
                        this._searchString = filterString;
                        _super.prototype.setFilterAsync.call(this, filterString);
                    }

                    if (this._searchString !== "" && this._searchString !== undefined) {
                        this.setSearchProgressBarState(false, 0);
                        this.clearCurrentSelection();
                        this.adaptor()._call("FindNextAggregatedCallStack", this._searchString).done(function (results) {
                            if (results && results.length > 0) {
                                var correctedArray = [];
                                for (var i = 0; i < results.length; i++) {
                                    correctedArray.push(+results[i]);
                                }
                                _this.goToSearchResult(new Common.Controls.DynamicGrid.TreePath(correctedArray));
                            } else {
                                alert(ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("SearchResultNotFound"));
                            }
                        });
                    }
                };

                MemoryAnalyzerAggregatedCallStackGridViewer.prototype.setSearchProgressBarState = function (show, progress) {
                    var filteringProgressBar = document.querySelector("#filterInputProgressBar");
                    filteringProgressBar.style.visibility = show ? "visible" : "hidden";
                    filteringProgressBar.value = progress;
                };

                MemoryAnalyzerAggregatedCallStackGridViewer.prototype.moveToRow = function (path) {
                    if (this.getExpandedPaths()) {
                        path.externalPath = true;
                        var index = this.findRowIndexByTreePath(path);
                        this.setSelectedRowIndex(index);
                        this.getSelectedRowIntoViewCenter();
                        this.getElement().focus();
                    }
                };

                MemoryAnalyzerAggregatedCallStackGridViewer.prototype.goToSearchResult = function (treePath, localTreePath) {
                    var _this = this;
                    if (!localTreePath) {
                        var localTreePath = new Common.Controls.DynamicGrid.TreePath([]);

                        localTreePath.path.push(treePath.path[0]);
                    }

                    this._dataArray.get(localTreePath.path, function (row, needUpdate) {
                        if (localTreePath.length() === treePath.length()) {
                            _this.moveToRow(treePath);
                            _this.scheduleUpdate();
                            _this.setSearchProgressBarState(true, 0);
                            return;
                        }

                        var expandedPaths = _this.getExpandedPaths();
                        if (expandedPaths.expansionStatus(localTreePath) === -1) {
                            expandedPaths.expand(localTreePath, row.SubItemsCount);
                            _this.updateCounts(row.SubItemsCount);
                            _this.markRowDirty(localTreePath.path);
                        }

                        localTreePath.path.push(treePath.path[localTreePath.length()]);
                        _this.goToSearchResult(treePath, localTreePath);
                    });
                };
                return MemoryAnalyzerAggregatedCallStackGridViewer;
            })(HeapViewer.MemoryAnalyzerGridViewer);

            var MemoryAnalyzerAllocationListGridViewer = (function (_super) {
                __extends(MemoryAnalyzerAllocationListGridViewer, _super);
                function MemoryAnalyzerAllocationListGridViewer(root, viewChangedCallback, setFilterPlaceholderCallback, dataArray, gridContextMenu, columns) {
                    var _this = this;
                    this._goToSourceState = 0 /* NotAvailable */;
                    this._dataArray = dataArray;
                    this._dataArray.registerAsyncResultCallback(function (index, value) {
                        return _this.updateAllocationRowValueAsync(index, value);
                    });

                    gridContextMenu[1 /* Separator1 */].hidden = function () {
                        return true;
                    };
                    gridContextMenu[4 /* ViewInstances */].hidden = function () {
                        return true;
                    };
                    gridContextMenu[6 /* GoToDefinition */].hidden = function () {
                        return true;
                    };
                    gridContextMenu[7 /* FindAllReferences */].hidden = function () {
                        return true;
                    };
                    gridContextMenu[5 /* Separator2 */].hidden = function () {
                        return true;
                    };
                    gridContextMenu[8 /* GotoSource */].callback = function () {
                        return _this.goToSource();
                    };
                    gridContextMenu[8 /* GotoSource */].hidden = function () {
                        return true;
                    };
                    gridContextMenu[8 /* GotoSource */].disabled = function () {
                        return true;
                    };

                    _super.call(this, root, viewChangedCallback, dataArray, gridContextMenu, columns, function (showTypeRefGraph) {
                    }, setFilterPlaceholderCallback, "AllocationListSummariesSetFilterAndSortOrder");
                    this.getGotoSourceStateAsync();
                    this.getCanvas().addEventListener("dblclick", function () {
                        _this.onDoubleClick.apply(_this, arguments);
                    });
                }
                MemoryAnalyzerAllocationListGridViewer.prototype.getGotoSourceStateAsync = function () {
                    var _this = this;
                    this.adaptor()._call("GetGoToSourceState").done(function (result) {
                        _this._goToSourceState = result;
                    });
                };

                MemoryAnalyzerAllocationListGridViewer.prototype.onDoubleClick = function (e) {
                    this.goToSource();
                };

                MemoryAnalyzerAllocationListGridViewer.prototype.goToSource = function () {
                    var _this = this;
                    var dataIndex = this.getSelectedDataIndex();

                    this._dataArray.get(dataIndex.path, function (value) {
                        var tag = value["TagName"];
                        _this.adaptor()._call("GotoSource", tag);
                    });
                };

                MemoryAnalyzerAllocationListGridViewer.prototype.expandNode = function (treePath) {
                    var _this = this;
                    this.getValue(treePath, function (value) {
                        var stackId = value["StackIdentifier"];
                        _this.adaptor()._call("SetStackIdentifier", treePath.path[0], stackId);

                        _this._dataArray.get(treePath.path, function (row, needUpdate) {
                            _this.getExpandedPaths().expand(treePath, row.SubItemsCount);
                            _this.updateCounts(row.SubItemsCount);
                            _this.markRowDirty(treePath.path);

                            if (needUpdate) {
                                _this.scheduleUpdate();
                            }
                        });
                    });
                };

                MemoryAnalyzerAllocationListGridViewer.prototype.updateColumnAsync = function (row, value, index, columnName) {
                    var columnElt = row.children[index];
                    columnElt.innerText = value[columnName];
                };

                MemoryAnalyzerAllocationListGridViewer.prototype.updateAllocationRowValueAsync = function (path, value) {
                    var valuepath = value.path;

                    var rowInfo;
                    if (!valuepath) {
                        rowInfo = this.getRowInfo(path);
                    } else {
                        rowInfo = this.getRowInfo(valuepath.at(0));
                    }

                    if (!rowInfo) {
                        return;
                    }

                    rowInfo.row.SubItemsCount = value["SubItemsCount"];

                    if (rowInfo.row.children.length === 5) {
                        this.updateColumnAsync(rowInfo.row, value, 0, "AllocationListIdentifier");
                        this.updateColumnAsync(rowInfo.row, value, 1, "AllocationListInstance");
                        this.updateColumnAsync(rowInfo.row, value, 2, "AllocationListType");
                        this.updateColumnAsync(rowInfo.row, value, 3, "AllocationListSize");
                        this.updateColumnAsync(rowInfo.row, value, 4, "AllocationListModule");
                    } else {
                        this.updateColumnAsync(rowInfo.row, value, 0, "AllocationListIdentifier");
                        this.updateColumnAsync(rowInfo.row, value, 1, "AllocationListInstance");
                        this.updateColumnAsync(rowInfo.row, value, 2, "AllocationListValue");
                        this.updateColumnAsync(rowInfo.row, value, 3, "AllocationListType");
                        this.updateColumnAsync(rowInfo.row, value, 4, "AllocationListSize");
                        this.updateColumnAsync(rowInfo.row, value, 5, "AllocationListModule");
                    }

                    this.markRowDirty([0]);
                    this.scheduleUpdate();
                };
                return MemoryAnalyzerAllocationListGridViewer;
            })(HeapViewer.MemoryAnalyzerGridViewer);

            var MemoryAnalyzerTypeRefGraphViewer = (function (_super) {
                __extends(MemoryAnalyzerTypeRefGraphViewer, _super);
                function MemoryAnalyzerTypeRefGraphViewer(root, dataArray, gridContextMenu, columns, direction) {
                    var _this = this;
                    this._gridColumns = columns;
                    var options = new Common.Controls.DynamicGrid.DynamicGridViewerOptions(gridContextMenu, null, this._gridColumns, null);
                    options.overflowColumn = true;
                    options.header = true;
                    options.focusable = true;

                    gridContextMenu[6 /* GoToDefinition */].callback = function () {
                        return _this.goToDefinition();
                    };
                    gridContextMenu[7 /* FindAllReferences */].callback = function () {
                        return _this.findAllReferences();
                    };

                    this._goToDefinitionState = 0 /* NotAvailable */;
                    this._findAllReferencesState = 0 /* NotAvailable */;

                    gridContextMenu[5 /* Separator2 */].hidden = gridContextMenu[6 /* GoToDefinition */].hidden = function () {
                        return _this._goToDefinitionState === 0 /* NotAvailable */;
                    };
                    gridContextMenu[7 /* FindAllReferences */].hidden = function () {
                        return _this._findAllReferencesState === 0 /* NotAvailable */;
                    };

                    gridContextMenu[5 /* Separator2 */].disabled = gridContextMenu[6 /* GoToDefinition */].disabled = function () {
                        return _this._goToDefinitionState === 1 /* Disabled */;
                    };
                    gridContextMenu[7 /* FindAllReferences */].disabled = function () {
                        return _this._findAllReferencesState === 1 /* Disabled */;
                    };
                    gridContextMenu[8 /* GotoSource */].hidden = function () {
                        return true;
                    };

                    _super.call(this, dataArray, root, options);

                    this.getGotoDefinitionStateAsync();
                    this.getFindAllReferencesStateAsync();

                    this._graphDomElement = root;
                    this._graphDirection = direction;
                    this.showGraph(false);

                    this.onSort([new Common.Controls.Grid.SortOrderInfo(this._gridColumns[this._gridColumns.length - 1].index, "desc")], []);
                }
                MemoryAnalyzerTypeRefGraphViewer.prototype.getGotoDefinitionStateAsync = function () {
                    var _this = this;
                    this.adaptor()._call("GetGoToDefinitionState").done(function (result) {
                        _this._goToDefinitionState = result;
                    });
                };

                MemoryAnalyzerTypeRefGraphViewer.prototype.getFindAllReferencesStateAsync = function () {
                    var _this = this;
                    this.adaptor()._call("GetFindAllReferencesState").done(function (result) {
                        _this._findAllReferencesState = result;
                    });
                };

                MemoryAnalyzerTypeRefGraphViewer.prototype.goToDefinition = function () {
                    var _this = this;
                    var dataIndex = this.getSelectedDataIndex();

                    this._dataArray.get(dataIndex.path, function (value) {
                        var tag = value["Tag"];
                        var category = value["Category"];
                        _this.adaptor()._call("GoToDefinition", tag, category);
                    });
                };

                MemoryAnalyzerTypeRefGraphViewer.prototype.findAllReferences = function () {
                    var _this = this;
                    var dataIndex = this.getSelectedDataIndex();

                    this._dataArray.get(dataIndex.path, function (value) {
                        var tag = value["Tag"];
                        var category = value["Category"];
                        _this.adaptor()._call("FindAllReferences", tag, category);
                    });
                };

                MemoryAnalyzerTypeRefGraphViewer.prototype._onKeyDown = function (e) {
                    if (e.shiftKey && e.keyCode === 123 /* F12 */ && this._findAllReferencesState === 2 /* Enabled */ && this.getSelectedRowIndex() >= 0) {
                        this.findAllReferences();
                        return true;
                    }

                    if (e.keyCode == 123 /* F12 */ && this._goToDefinitionState === 2 /* Enabled */ && this.getSelectedRowIndex() >= 0) {
                        this.goToDefinition();
                        return true;
                    }

                    return _super.prototype._onKeyDown.call(this, e);
                };

                MemoryAnalyzerTypeRefGraphViewer.prototype.translateColumn = function (row, index) {
                    var retval;
                    if (!row) {
                        if (index === "TagName")
                            retval = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("LoadRowDataText");
                    } else {
                        retval = row && row[index] !== undefined ? row[index] : "";

                        if ((index === "RetainedCount" || index === "RefCount" || index === "RetainedSize" || index === "Count" || index === "TotalSize") && retval !== "") {
                            retval = MemoryAnalyzer.FormattingHelpers.getDecimalLocaleString(retval, true, false);
                        }
                        if (index.search("Diff") !== -1) {
                            if (row["RetainedCount"] !== undefined || row["RefCount"] !== undefined) {
                                retval = MemoryAnalyzer.FormattingHelpers.getDecimalLocaleString(retval, true, true);
                            } else
                                retval = "";
                        }
                    }
                    return retval;
                };

                MemoryAnalyzerTypeRefGraphViewer.prototype.translateExternalPathColumn = function (treePath, index) {
                    return index === "TagName" ? ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("GridLastRow", (this.getFirstLevelCount() - treePath.path[0]).toString()) : "";
                };

                MemoryAnalyzerTypeRefGraphViewer.prototype.showGraph = function (show) {
                    this._graphDomElement.style.display = show ? "block" : "none";
                    if (show) {
                        this.initializeDataSource();
                        this.scheduleUpdate();
                    }
                };

                MemoryAnalyzerTypeRefGraphViewer.prototype.expandRoot = function () {
                    this.expandNode(new Common.Controls.DynamicGrid.TreePath([0]));
                };

                MemoryAnalyzerTypeRefGraphViewer.prototype.onCtrlC = function () {
                    var dataIndex = this.getSelectedDataIndex();
                    var rowText = this.getRowTextString(dataIndex);

                    if (rowText) {
                        MemoryAnalyzerViewer.dataForClipboard = rowText;
                        MemoryAnalyzerViewer.copySelectedRowToClipboard(null, null, null);
                    }
                };

                MemoryAnalyzerTypeRefGraphViewer.prototype.initializeContextMenu = function (dataIndex) {
                    var rowText = this.getRowTextString(dataIndex);
                    if (rowText) {
                        MemoryAnalyzerViewer.dataForClipboard = rowText;
                        return true;
                    }

                    return false;
                };

                MemoryAnalyzerTypeRefGraphViewer.prototype._trySorting = function (sortOrder, sortColumns) {
                    var _this = this;
                    this._sortOrderIndex = sortOrder[0].index;
                    this._sortOrderOrder = sortOrder[0].order;
                    this.refreshSortingOrder(function () {
                        _this.refresh();
                        _this.expandRoot();
                    });
                    _super.prototype._trySorting.call(this, sortOrder, sortColumns);
                };

                MemoryAnalyzerTypeRefGraphViewer.prototype.refreshSortingOrder = function (next) {
                    if (typeof next === "undefined") { next = function () {
                    }; }
                    this.adaptor()._call("TypeRefGraphSetSortOrder", this._sortOrderIndex, this._sortOrderOrder).done(function () {
                        next();
                    });
                };

                MemoryAnalyzerTypeRefGraphViewer.prototype.onSelectRow = function (rowIndex) {
                    this.adaptor()._call("OnSelectTypeRefGraph", this._graphDirection);
                };
                return MemoryAnalyzerTypeRefGraphViewer;
            })(HeapViewer.MMADynamicGridViewer);

            var MemoryAnalyzerRefGraphViewer = (function (_super) {
                __extends(MemoryAnalyzerRefGraphViewer, _super);
                function MemoryAnalyzerRefGraphViewer(root, dataArray, gridContextMenu, columns, direction) {
                    var _this = this;
                    this._gridColumns = columns;
                    this._graphDirection = direction;

                    if (this._graphDirection === 1 /* Backward */) {
                        this._gridColumns[0].getCellContents = function (rowInfo, dataIndex, expandedState, level, column, indentIndex, columnOrder) {
                            return _this._drawRefCell(rowInfo, dataIndex, expandedState, level, column, indentIndex, columnOrder);
                        };
                    }

                    var options = new Common.Controls.DynamicGrid.DynamicGridViewerOptions(gridContextMenu, null, this._gridColumns, null);
                    options.overflowColumn = true;
                    options.focusable = true;

                    gridContextMenu[1 /* Separator1 */].hidden = gridContextMenu[2 /* AddWatch */].hidden = gridContextMenu[3 /* QuickWatch */].hidden = function () {
                        return false;
                    };

                    gridContextMenu[2 /* AddWatch */].disabled = gridContextMenu[3 /* QuickWatch */].disabled = function () {
                        return !_this._isObjectInspectionAvailable;
                    };

                    gridContextMenu[5 /* Separator2 */].hidden = gridContextMenu[6 /* GoToDefinition */].hidden = function () {
                        return true;
                    };
                    gridContextMenu[7 /* FindAllReferences */].hidden = function () {
                        return true;
                    };
                    gridContextMenu[8 /* GotoSource */].hidden = function () {
                        return true;
                    };

                    gridContextMenu[2 /* AddWatch */].callback = function () {
                        return _this.addWatch();
                    };
                    gridContextMenu[3 /* QuickWatch */].callback = function () {
                        return _this.quickWatch();
                    };

                    _super.call(this, dataArray, root, options);

                    this._graphDomElement = root;
                    this.showGraph(false);

                    this._graphDomElement.addEventListener("onkeydown", this._onKeyDown);

                    this.adaptor().addEventListener("DebuggerModeChanged", function (reply) {
                        return _this.onDebuggerModeChanged(reply.NewMode, reply.OldMode);
                    });

                    this.adaptor()._call("IsObjectInspectionAvailable").done(function (result) {
                        _this._isObjectInspectionAvailable = result;
                    });
                }
                MemoryAnalyzerRefGraphViewer.prototype.translateColumn = function (row, index) {
                    var retval;
                    if (!row) {
                        if (index === "TagName")
                            retval = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("LoadRowDataText");
                    } else if (this._graphDirection === 0 /* Forward */) {
                        if (index === "TagName") {
                            retval = MemoryAnalyzer.FormattingHelpers.getNativeDigitLocaleString(row["TypeName"] + "    " + row["TagName"]);
                        } else {
                            retval = MemoryAnalyzer.FormattingHelpers.getDecimalLocaleString(_super.prototype.translateColumn.call(this, row, index), true, false);
                        }
                    } else {
                        retval = MemoryAnalyzer.FormattingHelpers.getNativeDigitLocaleString(row["TypeName"] + "    " + row["TagName"]);
                    }
                    return retval;
                };

                MemoryAnalyzerRefGraphViewer.prototype.translateExternalPathColumn = function (treePath, index) {
                    return index === "TagName" ? ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("GridLastRow", (this.getFirstLevelCount() - treePath.path[0]).toString()) : "";
                };

                MemoryAnalyzerRefGraphViewer.prototype.showGraph = function (show) {
                    this._graphDomElement.style.display = show ? "block" : "none";
                    this.tryToCloseDataTip(true);
                    if (show) {
                        this.initializeDataSource();
                        this.scheduleUpdate();
                    }
                };

                MemoryAnalyzerRefGraphViewer.prototype.expandRoot = function () {
                    var treePath = new Common.Controls.DynamicGrid.TreePath([0]);

                    if (this._graphDirection === 0 /* Forward */) {
                        this.expandNode(treePath);
                    } else {
                        this.expandPathToRoot(treePath, this._dataArray.dataSourceGeneration());
                    }
                };

                MemoryAnalyzerRefGraphViewer.prototype.expandPathToRoot = function (treePath, dataSourceGeneration, callback) {
                    var _this = this;
                    this.getValue(treePath, function (value, needUpdate) {
                        if (dataSourceGeneration !== _this._dataArray.dataSourceGeneration()) {
                            return;
                        }
                        if (value.IsOnPathToRoot === true) {
                            _this.expandNode(treePath);
                            var subItemsCount = value["SubItemsCount"];
                            _this.expandPathToRootHelper(treePath, 0, subItemsCount, dataSourceGeneration, callback);
                        } else if (callback) {
                            callback();
                        }
                    });
                };

                MemoryAnalyzerRefGraphViewer.prototype.onDebuggerModeChanged = function (newMode, oldMode) {
                    var _this = this;
                    this.adaptor()._call("IsObjectInspectionAvailable").done(function (result) {
                        _this._isObjectInspectionAvailable = result;
                    });
                };

                MemoryAnalyzerRefGraphViewer.prototype.expandPathToRootHelper = function (treePath, i, subItemsCount, dataSourceGeneration, callback) {
                    var _this = this;
                    if (dataSourceGeneration !== this._dataArray.dataSourceGeneration()) {
                        return;
                    }
                    if (i < subItemsCount) {
                        var childTreePath = new Common.Controls.DynamicGrid.TreePath(treePath.path);
                        childTreePath.concat(new Common.Controls.DynamicGrid.TreePath([i]));
                        this.expandPathToRoot(childTreePath, dataSourceGeneration, function () {
                            if (dataSourceGeneration !== _this._dataArray.dataSourceGeneration()) {
                                return;
                            }
                            _this.expandPathToRootHelper(treePath, i + 1, dataSourceGeneration, subItemsCount);
                        });
                    } else if (callback)
                        callback();
                };

                MemoryAnalyzerRefGraphViewer.prototype._drawRefCell = function (rowInfo, dataIndex, expandedState, level, column, indentIndex, columnOrder) {
                    var _this = this;
                    column.width = this.canvasClientWidth() - 4;

                    var cellElement = this.createElementWithClass("div", "grid-cell-ref");
                    cellElement.style.width = (column.width) + "px";

                    var value = this.getColumnText(dataIndex, column, columnOrder);

                    Common.Controls.Grid.GridControl._setTooltip(cellElement, column.hasHTMLContent ? "" : value, 65);

                    if (value) {
                        cellElement.innerText = value;
                    } else {
                        cellElement.innerHTML = "&nbsp;";
                    }

                    if (columnOrder === indentIndex && level > 0) {
                        var indent = ((level * 16) - 13);
                        column.indentOffset = indent;
                        if (expandedState !== 0) {
                            var treeSign = this.createElementWithClass("div", "icon grid-tree-icon");
                            treeSign.style.left = indent + "px";
                            cellElement.appendChild(treeSign);
                            if (expandedState > 0) {
                                treeSign.classList.add("icon-tree-expanded");
                            } else {
                                treeSign.classList.add("icon-tree-collapsed");
                            }

                            treeSign.addEventListener("mouseover", function (e) {
                                _this.onTreeIconMouseOver(e);
                            });
                            treeSign.addEventListener("mouseout", function (e) {
                                _this.onTreeIconMouseOut(e);
                            });
                        }

                        cellElement.style.textIndent = (level * 16) + "px";
                    }

                    return cellElement;
                };

                MemoryAnalyzerRefGraphViewer.prototype.onCtrlC = function () {
                    var dataIndex = this.getSelectedDataIndex();
                    var rowText = this.getRowTextString(dataIndex);

                    if (rowText) {
                        MemoryAnalyzerViewer.dataForClipboard = rowText;
                        MemoryAnalyzerViewer.copySelectedRowToClipboard(null, null, null);
                    }
                };

                MemoryAnalyzerRefGraphViewer.prototype.initializeContextMenu = function (dataIndex) {
                    var rowText = this.getRowTextString(dataIndex);
                    if (rowText) {
                        MemoryAnalyzerViewer.dataForClipboard = rowText;
                        return true;
                    }

                    return false;
                };

                MemoryAnalyzerRefGraphViewer.prototype._onContainerResize = function (e) {
                    if (this._graphDirection === 1 /* Backward */) {
                        this._gridColumns[0].width = this.canvasClientWidth() - 4;
                    }
                    _super.prototype._onContainerResize.call(this, e);
                };

                MemoryAnalyzerRefGraphViewer.prototype._updateViewport = function (includeNonDirtyRows) {
                    _super.prototype._updateViewport.call(this, includeNonDirtyRows);

                    if (this._graphDirection === 1 /* Backward */) {
                        this.widenRows(this.canvasClientWidth());
                    }
                };

                MemoryAnalyzerRefGraphViewer.prototype._trySorting = function (sortOrder, sortColumns) {
                    var _this = this;
                    this._sortOrderIndex = sortOrder[0].index;
                    this._sortOrderOrder = sortOrder[0].order;
                    this.refreshSortingOrder(function () {
                        _this.refresh();
                        _this.expandRoot();
                    });
                    _super.prototype._trySorting.call(this, sortOrder, sortColumns);
                };

                MemoryAnalyzerRefGraphViewer.prototype.refreshSortingOrder = function (next) {
                    if (typeof next === "undefined") { next = function () {
                    }; }
                    this.adaptor()._call("ForwardRefGraphSetSortOrder", this._sortOrderIndex, this._sortOrderOrder).done(function () {
                        next();
                    });
                };

                MemoryAnalyzerRefGraphViewer.prototype.getDatatipCell = function (e, element) {
                    if (!this._isObjectInspectionAvailable) {
                        return null;
                    }

                    var rowElement = element.parentNode;
                    if (!rowElement || rowElement.children.length < 1)
                        throw Error("incorrect grid control row");
                    var valueColumnElement = rowElement.children[0];
                    if (valueColumnElement !== element)
                        return null;
                    return valueColumnElement;
                };

                MemoryAnalyzerRefGraphViewer.prototype.onSelectRow = function (rowIndex) {
                    this.adaptor()._call("OnSelectObjectRefGraph", this._graphDirection);
                };

                MemoryAnalyzerRefGraphViewer.prototype._onKeyDown = function (e) {
                    if (e.keyCode === 13 /* ENTER */ && this._isObjectInspectionAvailable) {
                        this.quickWatch();
                        return true;
                    }
                    return _super.prototype._onKeyDown.call(this, e);
                };
                return MemoryAnalyzerRefGraphViewer;
            })(HeapViewer.MMADynamicGridViewer);

            function isHighContrastThemeCompatibilityProblem() {
                if (!document.body.classList.contains("IE9"))
                    return false;

                var TestColor = 'rgb(31, 41, 59)';
                var testDiv = document.createElement('div');
                testDiv.style.color = TestColor;
                document.body.appendChild(testDiv);

                var color = testDiv.currentStyle.color;

                document.body.removeChild(testDiv);
                return color !== TestColor;
            }

            function showHighContrastUnsupportedMessage() {
                var splash = document.createElement("div");
                splash.className = "SplashScreen";
                var message = document.createElement("div");
                message.innerHTML = "<a href='http://go.microsoft.com/fwlink/p/?LinkId=331160' target='_blank'>" + ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("HighContrastUnsupportedBrowserMessage") + "</a>";
                splash.appendChild(message);
                document.body.appendChild(splash);
            }

            Microsoft.Plugin.addEventListener("pluginready", function () {
                if (isHighContrastThemeCompatibilityProblem()) {
                    showHighContrastUnsupportedMessage();
                } else {
                    MemoryAnalyzerViewer.instance = new MemoryAnalyzerViewer();
                }
            });
        })(ManagedMemoryAnalyzer.HeapViewer || (ManagedMemoryAnalyzer.HeapViewer = {}));
        var HeapViewer = ManagedMemoryAnalyzer.HeapViewer;
    })(Debugger.ManagedMemoryAnalyzer || (Debugger.ManagedMemoryAnalyzer = {}));
    var ManagedMemoryAnalyzer = Debugger.ManagedMemoryAnalyzer;
})(Debugger || (Debugger = {}));

// SIG // Begin signature block
// SIG // MIIa/wYJKoZIhvcNAQcCoIIa8DCCGuwCAQExCzAJBgUr
// SIG // DgMCGgUAMGcGCisGAQQBgjcCAQSgWTBXMDIGCisGAQQB
// SIG // gjcCAR4wJAIBAQQQEODJBs441BGiowAQS9NQkAIBAAIB
// SIG // AAIBAAIBAAIBADAhMAkGBSsOAwIaBQAEFKZew78cKCjH
// SIG // wTg843YwgISJUWDloIIVgjCCBMMwggOroAMCAQICEzMA
// SIG // AABxsy6Ka4KqH04AAAAAAHEwDQYJKoZIhvcNAQEFBQAw
// SIG // dzELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0
// SIG // b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1p
// SIG // Y3Jvc29mdCBDb3Jwb3JhdGlvbjEhMB8GA1UEAxMYTWlj
// SIG // cm9zb2Z0IFRpbWUtU3RhbXAgUENBMB4XDTE1MDMyMDE3
// SIG // MzIwM1oXDTE2MDYyMDE3MzIwM1owgbMxCzAJBgNVBAYT
// SIG // AlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQH
// SIG // EwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29y
// SIG // cG9yYXRpb24xDTALBgNVBAsTBE1PUFIxJzAlBgNVBAsT
// SIG // Hm5DaXBoZXIgRFNFIEVTTjpCOEVDLTMwQTQtNzE0NDEl
// SIG // MCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2Vy
// SIG // dmljZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
// SIG // ggEBAOqRvbKI/RRvITYoA2YzOmYI+1tLpKugKDRKQzII
// SIG // wIblyT3VJbx7PmKH1n3vD3RTo/GRY4h0f+gkzQNQxfHK
// SIG // ABZ7pTmwBhw8RH7568SygbwXI7r9ZTgZhX/KoCn99jrA
// SIG // Cy9o9OA0Tn1vF8Bumar6f2El0SZw0nR932FzXM5UKjlR
// SIG // AzMJ+FCteMeJCLbUhSo/19gfUerv/GhetcHnB2gyjS9y
// SIG // Uf4DMUdRxdLrcgevIJX42mr4d2fkYJpwTKtFy34Ir+WB
// SIG // 1FfPOswTdZ0mzaCiaVC8OoiU37BUON6JOc2GMqWQD36/
// SIG // 7cyUJaZBhmEmx903flwN6BfKN3/oJLZOtPgbI+sCAwEA
// SIG // AaOCAQkwggEFMB0GA1UdDgQWBBT4/SOHBZSAVs0zpUHC
// SIG // bMwINsiyojAfBgNVHSMEGDAWgBQjNPjZUkZwCu1A+3b7
// SIG // syuwwzWzDzBUBgNVHR8ETTBLMEmgR6BFhkNodHRwOi8v
// SIG // Y3JsLm1pY3Jvc29mdC5jb20vcGtpL2NybC9wcm9kdWN0
// SIG // cy9NaWNyb3NvZnRUaW1lU3RhbXBQQ0EuY3JsMFgGCCsG
// SIG // AQUFBwEBBEwwSjBIBggrBgEFBQcwAoY8aHR0cDovL3d3
// SIG // dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWNyb3Nv
// SIG // ZnRUaW1lU3RhbXBQQ0EuY3J0MBMGA1UdJQQMMAoGCCsG
// SIG // AQUFBwMIMA0GCSqGSIb3DQEBBQUAA4IBAQAtBLTKKQtZ
// SIG // /C7qoK9MTmgE+JLtKcJmzGtwyYfovof8XfTdT6Uab3iX
// SIG // rWsFOFFBcp055Bobw21x/HC208y2kFgEKD/WHu+DsxQY
// SIG // DJUL96URE5jGhVZe7jO0DDe1gOr1EmjZLnuGCHI7FHvU
// SIG // 2dAWT8AvCx8tyuUb0K7phLCPC11zuBaBQCNYLOphqv69
// SIG // f9ONWnD8ec1mlmVjtQUSduIqOyvtgqya7CdBp5cOIxaf
// SIG // QchObVMRQATMYJnamOwrrpf74H31uosA9CUXf2J6u1FX
// SIG // wfDwzZwbYXOtlYwrdiKoq3A4tAEofWZCU96f9Ad8WjAO
// SIG // ggNZ9oSGuRUlYrAL0s/x25ZFMIIE7DCCA9SgAwIBAgIT
// SIG // MwAAAQosea7XeXumrAABAAABCjANBgkqhkiG9w0BAQUF
// SIG // ADB5MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGlu
// SIG // Z3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMV
// SIG // TWljcm9zb2Z0IENvcnBvcmF0aW9uMSMwIQYDVQQDExpN
// SIG // aWNyb3NvZnQgQ29kZSBTaWduaW5nIFBDQTAeFw0xNTA2
// SIG // MDQxNzQyNDVaFw0xNjA5MDQxNzQyNDVaMIGDMQswCQYD
// SIG // VQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
// SIG // A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
// SIG // IENvcnBvcmF0aW9uMQ0wCwYDVQQLEwRNT1BSMR4wHAYD
// SIG // VQQDExVNaWNyb3NvZnQgQ29ycG9yYXRpb24wggEiMA0G
// SIG // CSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCS/G82u+ED
// SIG // uSjWRtGiYbqlRvtjFj4u+UfSx+ztx5mxJlF1vdrMDwYU
// SIG // EaRsGZ7AX01UieRNUNiNzaFhpXcTmhyn7Q1096dWeego
// SIG // 91PSsXpj4PWUl7fs2Uf4bD3zJYizvArFBKeOfIVIdhxh
// SIG // RqoZxHpii8HCNar7WG/FYwuTSTCBG3vff3xPtEdtX3gc
// SIG // r7b3lhNS77nRTTnlc95ITjwUqpcNOcyLUeFc0Tvwjmfq
// SIG // MGCpTVqdQ73bI7rAD9dLEJ2cTfBRooSq5JynPdaj7woY
// SIG // SKj6sU6lmA5Lv/AU8wDIsEjWW/4414kRLQW6QwJPIgCW
// SIG // Ja19NW6EaKsgGDgo/hyiELGlAgMBAAGjggFgMIIBXDAT
// SIG // BgNVHSUEDDAKBggrBgEFBQcDAzAdBgNVHQ4EFgQUif4K
// SIG // MeomzeZtx5GRuZSMohhhNzQwUQYDVR0RBEowSKRGMEQx
// SIG // DTALBgNVBAsTBE1PUFIxMzAxBgNVBAUTKjMxNTk1KzA0
// SIG // MDc5MzUwLTE2ZmEtNGM2MC1iNmJmLTlkMmIxY2QwNTk4
// SIG // NDAfBgNVHSMEGDAWgBTLEejK0rQWWAHJNy4zFha5TJoK
// SIG // HzBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3JsLm1p
// SIG // Y3Jvc29mdC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWND
// SIG // b2RTaWdQQ0FfMDgtMzEtMjAxMC5jcmwwWgYIKwYBBQUH
// SIG // AQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8vd3d3Lm1p
// SIG // Y3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY0NvZFNpZ1BD
// SIG // QV8wOC0zMS0yMDEwLmNydDANBgkqhkiG9w0BAQUFAAOC
// SIG // AQEApqhTkd87Af5hXQZa62bwDNj32YTTAFEOENGk0Rco
// SIG // 54wzOCvYQ8YDi3XrM5L0qeJn/QLbpR1OQ0VdG0nj4E8W
// SIG // 8H6P8IgRyoKtpPumqV/1l2DIe8S/fJtp7R+CwfHNjnhL
// SIG // YvXXDRzXUxLWllLvNb0ZjqBAk6EKpS0WnMJGdAjr2/TY
// SIG // pUk2VBIRVQOzexb7R/77aPzARVziPxJ5M6LvgsXeQBkH
// SIG // 7hXFCptZBUGp0JeegZ4DW/xK4xouBaxQRy+M+nnYHiD4
// SIG // BfspaxgU+nIEtwunmmTsEV1PRUmNKRot+9C2CVNfNJTg
// SIG // FsS56nM16Ffv4esWwxjHBrM7z2GE4rZEiZSjhjCCBbww
// SIG // ggOkoAMCAQICCmEzJhoAAAAAADEwDQYJKoZIhvcNAQEF
// SIG // BQAwXzETMBEGCgmSJomT8ixkARkWA2NvbTEZMBcGCgmS
// SIG // JomT8ixkARkWCW1pY3Jvc29mdDEtMCsGA1UEAxMkTWlj
// SIG // cm9zb2Z0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5
// SIG // MB4XDTEwMDgzMTIyMTkzMloXDTIwMDgzMTIyMjkzMlow
// SIG // eTELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0
// SIG // b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1p
// SIG // Y3Jvc29mdCBDb3Jwb3JhdGlvbjEjMCEGA1UEAxMaTWlj
// SIG // cm9zb2Z0IENvZGUgU2lnbmluZyBQQ0EwggEiMA0GCSqG
// SIG // SIb3DQEBAQUAA4IBDwAwggEKAoIBAQCycllcGTBkvx2a
// SIG // YCAgQpl2U2w+G9ZvzMvx6mv+lxYQ4N86dIMaty+gMuz/
// SIG // 3sJCTiPVcgDbNVcKicquIEn08GisTUuNpb15S3GbRwfa
// SIG // /SXfnXWIz6pzRH/XgdvzvfI2pMlcRdyvrT3gKGiXGqel
// SIG // cnNW8ReU5P01lHKg1nZfHndFg4U4FtBzWwW6Z1KNpbJp
// SIG // L9oZC/6SdCnidi9U3RQwWfjSjWL9y8lfRjFQuScT5EAw
// SIG // z3IpECgixzdOPaAyPZDNoTgGhVxOVoIoKgUyt0vXT2Pn
// SIG // 0i1i8UU956wIAPZGoZ7RW4wmU+h6qkryRs83PDietHdc
// SIG // pReejcsRj1Y8wawJXwPTAgMBAAGjggFeMIIBWjAPBgNV
// SIG // HRMBAf8EBTADAQH/MB0GA1UdDgQWBBTLEejK0rQWWAHJ
// SIG // Ny4zFha5TJoKHzALBgNVHQ8EBAMCAYYwEgYJKwYBBAGC
// SIG // NxUBBAUCAwEAATAjBgkrBgEEAYI3FQIEFgQU/dExTtMm
// SIG // ipXhmGA7qDFvpjy82C0wGQYJKwYBBAGCNxQCBAweCgBT
// SIG // AHUAYgBDAEEwHwYDVR0jBBgwFoAUDqyCYEBWJ5flJRP8
// SIG // KuEKU5VZ5KQwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDov
// SIG // L2NybC5taWNyb3NvZnQuY29tL3BraS9jcmwvcHJvZHVj
// SIG // dHMvbWljcm9zb2Z0cm9vdGNlcnQuY3JsMFQGCCsGAQUF
// SIG // BwEBBEgwRjBEBggrBgEFBQcwAoY4aHR0cDovL3d3dy5t
// SIG // aWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWNyb3NvZnRS
// SIG // b290Q2VydC5jcnQwDQYJKoZIhvcNAQEFBQADggIBAFk5
// SIG // Pn8mRq/rb0CxMrVq6w4vbqhJ9+tfde1MOy3XQ60L/svp
// SIG // LTGjI8x8UJiAIV2sPS9MuqKoVpzjcLu4tPh5tUly9z7q
// SIG // QX/K4QwXaculnCAt+gtQxFbNLeNK0rxw56gNogOlVuC4
// SIG // iktX8pVCnPHz7+7jhh80PLhWmvBTI4UqpIIck+KUBx3y
// SIG // 4k74jKHK6BOlkU7IG9KPcpUqcW2bGvgc8FPWZ8wi/1wd
// SIG // zaKMvSeyeWNWRKJRzfnpo1hW3ZsCRUQvX/TartSCMm78
// SIG // pJUT5Otp56miLL7IKxAOZY6Z2/Wi+hImCWU4lPF6H0q7
// SIG // 0eFW6NB4lhhcyTUWX92THUmOLb6tNEQc7hAVGgBd3TVb
// SIG // Ic6YxwnuhQ6MT20OE049fClInHLR82zKwexwo1eSV32U
// SIG // jaAbSANa98+jZwp0pTbtLS8XyOZyNxL0b7E8Z4L5UrKN
// SIG // MxZlHg6K3RDeZPRvzkbU0xfpecQEtNP7LN8fip6sCvsT
// SIG // J0Ct5PnhqX9GuwdgR2VgQE6wQuxO7bN2edgKNAltHIAx
// SIG // H+IOVN3lofvlRxCtZJj/UBYufL8FIXrilUEnacOTj5XJ
// SIG // jdibIa4NXJzwoq6GaIMMai27dmsAHZat8hZ79haDJLmI
// SIG // z2qoRzEvmtzjcT3XAH5iR9HOiMm4GPoOco3Boz2vAkBq
// SIG // /2mbluIQqBC0N1AI1sM9MIIGBzCCA++gAwIBAgIKYRZo
// SIG // NAAAAAAAHDANBgkqhkiG9w0BAQUFADBfMRMwEQYKCZIm
// SIG // iZPyLGQBGRYDY29tMRkwFwYKCZImiZPyLGQBGRYJbWlj
// SIG // cm9zb2Z0MS0wKwYDVQQDEyRNaWNyb3NvZnQgUm9vdCBD
// SIG // ZXJ0aWZpY2F0ZSBBdXRob3JpdHkwHhcNMDcwNDAzMTI1
// SIG // MzA5WhcNMjEwNDAzMTMwMzA5WjB3MQswCQYDVQQGEwJV
// SIG // UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
// SIG // UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
// SIG // cmF0aW9uMSEwHwYDVQQDExhNaWNyb3NvZnQgVGltZS1T
// SIG // dGFtcCBQQ0EwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw
// SIG // ggEKAoIBAQCfoWyx39tIkip8ay4Z4b3i48WZUSNQrc7d
// SIG // GE4kD+7Rp9FMrXQwIBHrB9VUlRVJlBtCkq6YXDAm2gBr
// SIG // 6Hu97IkHD/cOBJjwicwfyzMkh53y9GccLPx754gd6udO
// SIG // o6HBI1PKjfpFzwnQXq/QsEIEovmmbJNn1yjcRlOwhtDl
// SIG // KEYuJ6yGT1VSDOQDLPtqkJAwbofzWTCd+n7Wl7PoIZd+
// SIG // +NIT8wi3U21StEWQn0gASkdmEScpZqiX5NMGgUqi+YSn
// SIG // EUcUCYKfhO1VeP4Bmh1QCIUAEDBG7bfeI0a7xC1Un68e
// SIG // eEExd8yb3zuDk6FhArUdDbH895uyAc4iS1T/+QXDwiAL
// SIG // AgMBAAGjggGrMIIBpzAPBgNVHRMBAf8EBTADAQH/MB0G
// SIG // A1UdDgQWBBQjNPjZUkZwCu1A+3b7syuwwzWzDzALBgNV
// SIG // HQ8EBAMCAYYwEAYJKwYBBAGCNxUBBAMCAQAwgZgGA1Ud
// SIG // IwSBkDCBjYAUDqyCYEBWJ5flJRP8KuEKU5VZ5KShY6Rh
// SIG // MF8xEzARBgoJkiaJk/IsZAEZFgNjb20xGTAXBgoJkiaJ
// SIG // k/IsZAEZFgltaWNyb3NvZnQxLTArBgNVBAMTJE1pY3Jv
// SIG // c29mdCBSb290IENlcnRpZmljYXRlIEF1dGhvcml0eYIQ
// SIG // ea0WoUqgpa1Mc1j0BxMuZTBQBgNVHR8ESTBHMEWgQ6BB
// SIG // hj9odHRwOi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2Ny
// SIG // bC9wcm9kdWN0cy9taWNyb3NvZnRyb290Y2VydC5jcmww
// SIG // VAYIKwYBBQUHAQEESDBGMEQGCCsGAQUFBzAChjhodHRw
// SIG // Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRzL01p
// SIG // Y3Jvc29mdFJvb3RDZXJ0LmNydDATBgNVHSUEDDAKBggr
// SIG // BgEFBQcDCDANBgkqhkiG9w0BAQUFAAOCAgEAEJeKw1wD
// SIG // RDbd6bStd9vOeVFNAbEudHFbbQwTq86+e4+4LtQSooxt
// SIG // YrhXAstOIBNQmd16QOJXu69YmhzhHQGGrLt48ovQ7DsB
// SIG // 7uK+jwoFyI1I4vBTFd1Pq5Lk541q1YDB5pTyBi+FA+mR
// SIG // KiQicPv2/OR4mS4N9wficLwYTp2OawpylbihOZxnLcVR
// SIG // DupiXD8WmIsgP+IHGjL5zDFKdjE9K3ILyOpwPf+FChPf
// SIG // wgphjvDXuBfrTot/xTUrXqO/67x9C0J71FNyIe4wyrt4
// SIG // ZVxbARcKFA7S2hSY9Ty5ZlizLS/n+YWGzFFW6J1wlGys
// SIG // OUzU9nm/qhh6YinvopspNAZ3GmLJPR5tH4LwC8csu89D
// SIG // s+X57H2146SodDW4TsVxIxImdgs8UoxxWkZDFLyzs7BN
// SIG // Z8ifQv+AeSGAnhUwZuhCEl4ayJ4iIdBD6Svpu/RIzCzU
// SIG // 2DKATCYqSCRfWupW76bemZ3KOm+9gSd0BhHudiG/m4LB
// SIG // J1S2sWo9iaF2YbRuoROmv6pH8BJv/YoybLL+31HIjCPJ
// SIG // Zr2dHYcSZAI9La9Zj7jkIeW1sMpjtHhUBdRBLlCslLCl
// SIG // eKuzoJZ1GtmShxN1Ii8yqAhuoFuMJb+g74TKIdbrHk/J
// SIG // mu5J4PcBZW+JC33Iacjmbuqnl84xKf8OxVtc2E0bodj6
// SIG // L54/LlUWa8kTo/0xggTpMIIE5QIBATCBkDB5MQswCQYD
// SIG // VQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
// SIG // A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
// SIG // IENvcnBvcmF0aW9uMSMwIQYDVQQDExpNaWNyb3NvZnQg
// SIG // Q29kZSBTaWduaW5nIFBDQQITMwAAAQosea7XeXumrAAB
// SIG // AAABCjAJBgUrDgMCGgUAoIIBATAZBgkqhkiG9w0BCQMx
// SIG // DAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgELMQ4wDAYK
// SIG // KwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUGZomUr0y
// SIG // VU09LG9pzh5ryDAJby8wgaAGCisGAQQBgjcCAQwxgZEw
// SIG // gY6gdIByAE0AYQBuAGEAZwBlAGQASABlAGEAcABWAGkA
// SIG // ZQB3AGUAcgBfAGMAOAA5ADkAOQAwADIANQAtAGMAYgAy
// SIG // AGUALQA0AGMAYwA3AC0AYgBmAGYANAAtADkAZQAwADAA
// SIG // YgBiADkAMABhADcAOAA1AC4AagBzoRaAFGh0dHA6Ly9t
// SIG // aWNyb3NvZnQuY29tMA0GCSqGSIb3DQEBAQUABIIBAHEW
// SIG // ifFYMFwmkQ0u2McHm/+qHdZB0+sTpmeHfzALE9ixZMq+
// SIG // JgYreWkT8lxFJMiRnYFGVkkgwf9FSvHqetb9L5EnWqWP
// SIG // j9Gk5UKuPev1CWBHxqoetWIDtQPwJU0+AD6Xl8ZBh4TR
// SIG // BXfoIMp47ZJwFeDdjtMRBvI98FUhoQdg7NLLg12BRaqs
// SIG // W6XAMJSucjCqjHnCjqAbltrxE6c2KqS2g/DWbgBONw0c
// SIG // mvGNOxrqB7OTCECTsCB/xUQksfCxZAuzq+U1rQoNLoWn
// SIG // f92w0XYcARwOAV07MBkcie96AUEQGNhM7wYD8lJWWsVV
// SIG // TzBupMnSvRaJ4JygptLOKaHDyE6JJA6hggIoMIICJAYJ
// SIG // KoZIhvcNAQkGMYICFTCCAhECAQEwgY4wdzELMAkGA1UE
// SIG // BhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNV
// SIG // BAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBD
// SIG // b3Jwb3JhdGlvbjEhMB8GA1UEAxMYTWljcm9zb2Z0IFRp
// SIG // bWUtU3RhbXAgUENBAhMzAAAAcbMuimuCqh9OAAAAAABx
// SIG // MAkGBSsOAwIaBQCgXTAYBgkqhkiG9w0BCQMxCwYJKoZI
// SIG // hvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xNTA3MDcwNzM1
// SIG // MTRaMCMGCSqGSIb3DQEJBDEWBBRlYRgEduZW5Ry3CRW1
// SIG // ++Il0T1J3zANBgkqhkiG9w0BAQUFAASCAQC43ax+eWeF
// SIG // lZROFOonjaoqlS4rhlnkHXZ1F7/36EuFcaO8rhAsBamX
// SIG // c4AscadTYRMJhIM+tsIyq6mgmyx87N0DwwG0PHPxZkLf
// SIG // IrzPz+HCQXNWIj5h+0qRdir7bF0XxlEkXFQjibyVtj1Y
// SIG // hfWtgzBrsFLCbJbVfK4e1I0uCZOV4/t7Xcss+08HKgb9
// SIG // 9u4by08p+xvMmnkLn+v8yuDsyKXrAJKuAPt0tsLKQh1K
// SIG // jeOwAYSahika5DIeHmK+i1hM0ILGtL7HRorIj1lYroRD
// SIG // mek/Ylj/W/grtUVsYtIEqkdaejwep7yXibYKPhHN89Om
// SIG // NR7wQMkSbaHmwVnrhZ4BRuqt
// SIG // End signature block
