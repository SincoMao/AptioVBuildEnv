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
        (function (SummaryViewer) {
            var ContextMenu = Microsoft.Plugin.ContextMenu;

            var SnapshotTileView = (function () {
                function SnapshotTileView(model, baseline, viewer, snapshots) {
                    var _this = this;
                    this._model = model;
                    this._baseline = baseline;
                    this._others = snapshots;
                    this._viewer = viewer;
                    this._infoViews = new Array();

                    var template = document.getElementById("SnapshotTileTemplate");
                    this.element = document.createElement("div");
                    this.element.innerHTML = template.innerHTML;
                    this._info = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getChildById("snapshotInfoDiv", this.element);
                    this._moreOptions = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getChildById("snapshotTileMoreOptions", this.element);
                    this._progress = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getChildById("snapshotTileProgress", this.element);
                    if (model.Heaps.length > 1) {
                        ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getChildById("snapshotTile", this.element).classList.add("mixedMode");
                        this._progress.classList.add("mixedMode");
                    }

                    ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getChildById("snapshotTileTitle", this.element).innerText = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getFormattedDigitLocaleString(this._model.Name);
                    ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getChildById("snapshotTakenDate", this.element).innerText = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("SummaryViewTimestamp", this._model.Time);
                    this.generateSummaryInfo();

                    this.element.onmousedown = this.onContextMenu.bind(this);
                    this._moreOptions.onmousedown = this.onMoreOptions.bind(this);
                    this._moreOptions.onkeydown = function (e) {
                        return _this.onContextKeyboard(e, false);
                    };
                    this._moreOptions.onkeyup = function (e) {
                        return _this.onContextKeyboard(e, true);
                    };
                }
                SnapshotTileView.prototype.generateSummaryInfo = function () {
                    var _this = this;
                    var useNames = this._model.Heaps.length > 1;
                    this._model.Heaps.forEach(function (heap, i) {
                        var baselineHeap = (_this._baseline !== null) ? _this._baseline.Heaps[i] : null;
                        var name = useNames ? ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("SummaryViewType" + SnapshotTileView.SnapshotTypeNames[heap.Type]) : null;
                        var infoView = new HeapDataSummaryView(name, _this, heap, baselineHeap);
                        _this._infoViews.push(infoView);
                        _this._info.appendChild(infoView.element);
                    });
                };

                SnapshotTileView.prototype.onContextDiff = function (id) {
                    this.showDiffViewAsync(this._model.Heaps[0].Id, id);
                };

                SnapshotTileView.prototype.onContextDelete = function () {
                    this._viewer.destroySnapshotAsync(this._model);
                };

                SnapshotTileView.prototype.onContextMenu = function (event) {
                    if (event.which === 3 /* RIGHT_BUTTON */) {
                        event.preventDefault();
                        this.showContextMenu(event.clientX, event.clientY);
                    }
                };

                SnapshotTileView.prototype.onContextKeyboard = function (event, launchMenu) {
                    if (event.which === 13 /* ENTER */ || event.which === 32 /* SPACE */ || event.which === 40 /* DOWNARROW */) {
                        event.preventDefault();

                        if (launchMenu) {
                            var position = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getPosition(this._moreOptions);
                            this.showContextMenu(position["x"], position["y"]);
                        } else {
                            event.stopImmediatePropagation();
                        }
                    }
                };

                SnapshotTileView.prototype.onMoreOptions = function (event) {
                    event.preventDefault();
                    event.stopPropagation();
                    var position = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getPosition(this._moreOptions);
                    this.showContextMenu(position["x"], position["y"]);
                };

                SnapshotTileView.prototype.isViewOf = function (snapshot) {
                    if (this._model.Name !== snapshot.Name)
                        return false;
                    if (this._infoViews.length !== snapshot.Heaps.length)
                        return false;
                    for (var i = 0; i < this._infoViews.length; i++) {
                        if (!this._infoViews[i].isViewOf(snapshot.Heaps[i]))
                            return false;
                    }
                    return true;
                };

                SnapshotTileView.prototype.showHeapViewAsync = function (id, sortColumn) {
                    this.updateTileState(true);
                    this._viewer.viewHeapAsync(id, sortColumn);
                };

                SnapshotTileView.prototype.showDiffViewAsync = function (id, baseline, sortColumn) {
                    this.updateTileState(true);
                    this._viewer.viewDiffAsync(id, baseline, sortColumn);
                };

                SnapshotTileView.prototype.updateTileState = function (showProgress) {
                    if (showProgress) {
                        this._info.classList.add("hidden");
                        this._progress.classList.remove("hidden");
                    } else {
                        this._info.classList.remove("hidden");
                        this._progress.classList.add("hidden");
                    }
                };

                SnapshotTileView.prototype.showContextMenu = function (x, y) {
                    if (!this._contextMenu) {
                        var contextMenuItems = this.generateContextMenuItems();
                        this._contextMenu = ContextMenu.create(contextMenuItems);
                    }

                    this._contextMenu.show(x, y);

                    this._viewer.ignoreNextScroll();
                };

                SnapshotTileView.prototype.generateContextMenuItems = function () {
                    var _this = this;
                    var menuDiff, menuDelete;
                    var snapshotItems = new Array();
                    var shouldShowMoreItem = this._others.length > SnapshotTileView.ContextMaxSnapshots + 1;
                    var diffCount = 0;
                    var max = shouldShowMoreItem ? SnapshotTileView.ContextMaxSnapshots - 1 : SnapshotTileView.ContextMaxSnapshots;
                    this._others.forEach(function (snapshot) {
                        if (snapshot.Heaps[0].Id === _this._model.Heaps[0].Id || diffCount >= max)
                            return;
                        diffCount++;

                        snapshotItems.push({
                            callback: _this.onContextDiff.bind(_this, snapshot.Heaps[0].Id),
                            label: ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getFormattedDigitLocaleString(snapshot.Name),
                            type: 1 /* command */
                        });
                    });

                    snapshotItems.reverse();

                    if (shouldShowMoreItem) {
                        snapshotItems.push({
                            callback: this.showHeapViewAsync.bind(this, this._model.Heaps[0].Id),
                            label: ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("ContextMenuMore"),
                            type: 1 /* command */
                        });
                    }

                    var hasDiffItems = this._others.length > 1;
                    menuDiff = {
                        callback: function () {
                        },
                        label: ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("CompareSnapshotContext"),
                        type: 1 /* command */,
                        submenu: hasDiffItems ? snapshotItems : null,
                        disabled: function () {
                            return !hasDiffItems;
                        }
                    };

                    menuDelete = {
                        callback: this.onContextDelete.bind(this),
                        label: ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("DeleteSnapshotContext"),
                        type: 1 /* command */,
                        iconEnabled: "vs-mma-delete",
                        iconDisabled: "vs-mma-delete"
                    };

                    return [
                        menuDiff,
                        menuDelete
                    ];
                };
                SnapshotTileView.ContextMaxSnapshots = 10;

                SnapshotTileView.SnapshotTypeNames = [
                    "",
                    "Dump",
                    "Managed",
                    "Native",
                    "Dump",
                    "Dump",
                    "DUMP"
                ];
                return SnapshotTileView;
            })();
            SummaryViewer.SnapshotTileView = SnapshotTileView;

            var HeapDataSummaryView = (function () {
                function HeapDataSummaryView(name, view, model, baselineModel) {
                    var _this = this;
                    this.BytesToKbRatio = 1024.0;
                    this.DecimalsIfSmall = 3;
                    this.DecimalsIfLarge = 0;
                    var template = document.getElementById("SnapshotSummaryTemplate");
                    this.element = document.createElement("div");
                    this.element.innerHTML = template.innerHTML;

                    this.model = model;
                    this._view = view;

                    if (name !== null) {
                        var type = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getChildById("snapshotSummaryType", this.element);
                        type.classList.remove("hidden");
                        type.innerText = name;
                    }

                    this._countDiffLink = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getChildById("countDiffLink", this.element);
                    this._countBaselineDiv = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getChildById("countBaselineDiv", this.element);
                    this._countDiffImage = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getChildById("countDiffImage", this.element);
                    this._sizeDiffImage = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getChildById("sizeDiffImage", this.element);
                    this._sizeDiffLink = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getChildById("sizeDiffLink", this.element);
                    this._sizeBaselineDiv = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getChildById("sizeBaselineDiv", this.element);

                    var summaryViewCount = model.Type === 2 /* LIVE_MANAGED */ ? "ManagedSummaryCount" : "NativeSummaryCount";
                    var snapshotCountElement = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getChildById("snapshotCount", this.element);
                    var snapshotSizeElement = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getChildById("snapshotSize", this.element);
                    snapshotCountElement.innerText = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource(summaryViewCount, ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getNumberString(this.model.Count));
                    var sizeInKb = this.model.Size / this.BytesToKbRatio;
                    var decimalPlaces = sizeInKb > 1 ? this.DecimalsIfLarge : this.DecimalsIfSmall;
                    snapshotSizeElement.innerText = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("SummaryViewSize", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getNumberString(sizeInKb, decimalPlaces));

                    snapshotCountElement.onclick = function (e) {
                        _this._view.showHeapViewAsync(_this.model.Id, "Count");
                    };
                    snapshotSizeElement.onclick = function (e) {
                        _this._view.showHeapViewAsync(_this.model.Id, "TotalSize");
                    };

                    this._countBaselineDiv.innerText = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("SummaryViewBaseline");
                    this._sizeBaselineDiv.innerText = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("SummaryViewBaseline");
                    this.updateBaseline(baselineModel);
                }
                HeapDataSummaryView.prototype.updateBaseline = function (newBaselineModel) {
                    var _this = this;
                    this.baselineModel = newBaselineModel;
                    if (this.baselineModel !== null) {
                        this._countBaselineDiv.classList.add("hidden");
                        this._countDiffLink.classList.remove("hidden");
                        this._sizeBaselineDiv.classList.add("hidden");
                        this._sizeDiffLink.classList.remove("hidden");

                        var count = this.model.Count - this.baselineModel.Count;
                        var summaryViewCount = newBaselineModel.Type === 2 /* LIVE_MANAGED */ ? "ManagedSummaryCount" : "NativeSummaryCount";
                        this._countDiffLink.innerText = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource(summaryViewCount, ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getSignedNumberString(count));

                        if (count > 0) {
                            this._countDiffImage.classList.add("HeapIncreaseIcon");
                        } else if (count < 0) {
                            this._countDiffImage.classList.add("HeapDecreaseIcon");
                        }

                        var size = this.model.Size - this.baselineModel.Size;
                        size = size / this.BytesToKbRatio;
                        var decimalPlaces = size > 1 ? this.DecimalsIfLarge : this.DecimalsIfSmall;
                        this._sizeDiffLink.innerText = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("SummaryViewSize", ManagedMemoryAnalyzer.MemoryAnalysisHelpers.getSignedNumberString(size, decimalPlaces));

                        if (size > 0) {
                            this._sizeDiffImage.classList.add("HeapIncreaseIcon");
                        } else if (size < 0) {
                            this._sizeDiffImage.classList.add("HeapDecreaseIcon");
                        }

                        this._sizeDiffLink.disabled = this._countDiffLink.disabled = false;
                        this._sizeDiffLink.onclick = function (e) {
                            _this._view.showDiffViewAsync(_this.model.Id, _this.baselineModel.Id, "TotalSizeDiff");
                        };
                        this._countDiffLink.onclick = function (e) {
                            _this._view.showDiffViewAsync(_this.model.Id, _this.baselineModel.Id, "CountDiff");
                        };
                    } else {
                        this._sizeBaselineDiv.classList.remove("hidden");
                        this._countBaselineDiv.classList.remove("hidden");
                        this._sizeDiffLink.classList.add("hidden");
                        this._countDiffLink.classList.add("hidden");
                        this._countDiffImage.classList.remove("HeapIncreaseIcon");
                        this._countDiffImage.classList.remove("HeapDecreaseIcon");
                        this._sizeDiffImage.classList.remove("HeapIncreaseIcon");
                        this._sizeDiffImage.classList.remove("HeapDecreaseIcon");
                    }
                };

                HeapDataSummaryView.prototype.isViewOf = function (snapshot) {
                    return this.model.Id === snapshot.Id && this.model.Type === snapshot.Type && this.model.Count === snapshot.Count && this.model.Size === snapshot.Size;
                };
                return HeapDataSummaryView;
            })();
        })(ManagedMemoryAnalyzer.SummaryViewer || (ManagedMemoryAnalyzer.SummaryViewer = {}));
        var SummaryViewer = ManagedMemoryAnalyzer.SummaryViewer;
    })(Debugger.ManagedMemoryAnalyzer || (Debugger.ManagedMemoryAnalyzer = {}));
    var ManagedMemoryAnalyzer = Debugger.ManagedMemoryAnalyzer;
})(Debugger || (Debugger = {}));
var Debugger;
(function (Debugger) {
    (function (ManagedMemoryAnalyzer) {
        (function (SummaryViewer) {
            var ManagedSummaryViewer = (function () {
                function ManagedSummaryViewer() {
                    var _this = this;
                    this.NativeMemoryCollectionAgentGuid = "3151D25D-A614-4E39-AE44-29DD3741791F";
                    this._adaptor = Microsoft.Plugin.Utilities.JSONMarshaler.attachToPublishedObject("Microsoft.VisualStudio.Debugger.LiveMemorySummaryViewModelMarshaler", {}, true);
                    Microsoft.Plugin.VS.Keyboard.setZoomState(false);

                    this._snapshotContainer = document.getElementById("snapshotContainer");
                    this._takeSnapshotTile = document.getElementById("takeSnapshotTile");
                    this._takeSnapshotButtonDiv = document.getElementById("takeSnapshotButtonDiv");
                    this._takeSnapshotButton = document.getElementById("takeSnapshotButton");
                    this._takeSnapshotCaption = document.getElementById("takeSnapshotCaption");
                    this._snapshotProgress = document.getElementById("takeSnapshotProgressDiv");
                    this._snapshotProgressCaption = document.getElementById("snapshotProgressCaption");
                    this._snapshotProgressCancel = document.getElementById("snapshotProgressCancelDiv");
                    this._viewDisabledMessageDiv = document.getElementById("viewDisabledMessageDiv");
                    this._enableSnapshotsDiv = document.getElementById("enableSnapshotsDiv");
                    this._enableSnapshotsCaption = document.getElementById("enableSnapshotsCaption");
                    this._enableSnapshotsCheckBox = document.getElementById("enableSnapshotsCheckBox");

                    document.getElementById("viewDisabledMessage").innerText = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("AlertNativeCollectionUnavailable");

                    this._takeSnapshotCaption.innerText = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("SummaryViewButton");
                    document.getElementById("snapshotProgressCancel").onclick = function (e) {
                        _this.cancelSnapshotAnalysisAsync();
                    };
                    document.getElementById("takeSnapshotButton").onclick = function (e) {
                        _this.TakeSnapshotAsync();
                    };
                    document.getElementById("snapshotProgressCancel").innerText = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("SnapshotProgressCancel");

                    this._adaptor.addEventListener("CanTakeSnapshotChangedEvent", function (eventArgs) {
                        _this.completeProgress(eventArgs.ResetView);
                        if (eventArgs.ResetView) {
                            _this.actionCompleted();
                        }
                    });

                    this._adaptor.addEventListener("SummaryViewUpdatedEvent", function (eventArgs) {
                        _this.updateSummaryViewAsync(eventArgs.ResetView, eventArgs.CanTakeSnapshot);
                    });

                    this._adaptor.addEventListener("SnapshotProgressUpdatedEvent", function (eventArgs) {
                        _this.updateProgressIndicator(eventArgs);
                    });

                    this._adaptor.addEventListener("ProgressCancelEnabledEvent", function (eventArgs) {
                        _this.enableProgressCancel();
                    });

                    this._adaptor.addEventListener("HeapViewReadyEvent", function (eventArgs) {
                        _this.updateAnalyzingTiles();
                        _this.actionCompleted();
                    });

                    this.resetState();

                    this._nativeMemoryToolEnabled = false;
                    this._adaptor._call("IsNativeLiveMemoryToolEnabled").then(function (result) {
                        _this._nativeMemoryToolEnabled = (result === true);
                        if (_this._nativeMemoryToolEnabled) {
                            _this._standardCollector = Microsoft.VisualStudio.DiagnosticsHub.Collectors.getStandardTransportService();
                            if (_this._standardCollector) {
                                _this._standardCollector.addMessageListener(new Microsoft.VisualStudio.DiagnosticsHub.Guid(_this.NativeMemoryCollectionAgentGuid), _this.onMessageReceivedFromAgent.bind(_this));
                            }
                        }
                    });

                    this._managedMemoryToolEnabled = false;
                    this._adaptor._call("IsManagedLiveMemoryToolEnabled").then(function (result) {
                        _this._managedMemoryToolEnabled = (result === true);
                    });

                    this._adaptor._call("IsNativeLiveMemoryToolSupported").then(function (result) {
                        _this._nativeMemoryToolSupported = (result === true);

                        if (_this._nativeMemoryToolSupported) {
                            _this._enableSnapshotsDiv.classList.remove("hidden");
                            _this._enableSnapshotsCaption.innerText = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("EnableSnapshotsCaption");
                            _this._enableSnapshotsCheckBox.checked = (_this._nativeMemoryToolEnabled === true);

                            _this._enableSnapshotsCheckBox.onchange = function (e) {
                                _this._adaptor._call("SetNativeMemoryCollectionState", _this._enableSnapshotsCheckBox.checked);
                            };
                        }

                        if (_this._nativeMemoryToolSupported && !_this._nativeMemoryToolEnabled) {
                            _this.showNativeErrorMessageAsync(ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("NativeCollectorDisabled"), "snapshotsDisabledMessage");
                        }
                    });

                    this._ignoreScroll = false;
                    document.onscroll = function (e) {
                        if (_this._ignoreScroll) {
                            _this._ignoreScroll = false;
                            scrollTo(0, _this._scrollOffset);
                            e.stopImmediatePropagation();
                            e.preventDefault();
                            return false;
                        }
                        return true;
                    };

                    this.updateTakeSnapshotTile(false);
                    this.updateSnapshotsAsync();
                }
                ManagedSummaryViewer.prototype.ignoreNextScroll = function () {
                    this._scrollOffset = document.documentElement.scrollTop - (document.documentElement.clientTop || 0);
                    this._ignoreScroll = true;
                };

                ManagedSummaryViewer.prototype.queueAction = function (action, dirtyIds) {
                    var _this = this;
                    if (dirtyIds) {
                        dirtyIds.forEach(function (id) {
                            return _this._dirtyIds.push(id);
                        });
                    }
                    if (!this._actionsInProgress) {
                        this._actionsInProgress = true;
                        action();
                    } else {
                        this._queuedActions.push(action);
                    }
                };

                ManagedSummaryViewer.prototype.resetActionQueue = function () {
                    this._actionsInProgress = false;
                    this._dirtyIds = new Array();
                    this._queuedActions = new Array();
                };

                ManagedSummaryViewer.prototype.isClean = function () {
                    var ids = [];
                    for (var _i = 0; _i < (arguments.length - 0); _i++) {
                        ids[_i] = arguments[_i + 0];
                    }
                    for (var i = 0; i < ids.length; i++) {
                        if (this._dirtyIds.some(function (dirty) {
                            return ids[i] == dirty;
                        })) {
                            return false;
                        }
                    }
                    return true;
                };

                ManagedSummaryViewer.prototype.resetState = function () {
                    this.resetActionQueue();
                    this._snapshotTiles = new Array();
                    this._snapshotProgressCancel.classList.add("hidden");
                    this._snapshotProgressCaption.innerText = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("SnapshotProgressCaptionDefault");
                    var container = document.getElementById("snapshotContainer");
                    while (container.hasChildNodes()) {
                        container.removeChild(container.firstChild);
                    }
                    container.appendChild(this._takeSnapshotTile);
                    this.updateTakeSnapshotTile(false);

                    this.updateSummaryViewEnabledState(true);
                    this._takeSnapshotButton.disabled = false;
                };

                ManagedSummaryViewer.prototype.TakeSnapshotAsync = function () {
                    var _this = this;
                    if (this._nativeMemoryToolEnabled) {
                        var message = "{ \"commandName\": \"takeSnapshot\", \"snapshotId\": \"" + ManagedSummaryViewer._nextNativeSnapshotIdentifier + "\", \"agentMask\": \"65535\" }";
                        this.sendMessageToAgent(message);
                    } else {
                        this.queueAction(function () {
                            _this._adaptor._call("TakeSnapshot", null).then(function (result) {
                                if (result) {
                                    _this.updateTakeSnapshotTile(true);
                                }
                            });
                        });
                    }
                };

                ManagedSummaryViewer.prototype.updateSummaryViewAsync = function (resetView, canTakeSnapshot) {
                    if (typeof canTakeSnapshot === "undefined") { canTakeSnapshot = true; }
                    if (resetView) {
                        this.resetState();
                    }

                    this._takeSnapshotButton.disabled = !canTakeSnapshot;
                    return this.updateSnapshotsAsync();
                };

                ManagedSummaryViewer.prototype.updateSummaryViewEnabledState = function (enable) {
                    if (enable) {
                        this._snapshotContainer.classList.remove("hidden");
                        this._viewDisabledMessageDiv.classList.add("hidden");
                    } else {
                        this._snapshotContainer.classList.add("hidden");
                        this._viewDisabledMessageDiv.classList.remove("hidden");
                    }
                };

                ManagedSummaryViewer.prototype.updateAnalyzingTiles = function () {
                    this._snapshotTiles.forEach(function (t) {
                        t.updateTileState(false);
                    });
                };

                ManagedSummaryViewer.prototype.updateTakeSnapshotTile = function (snapshotInProgress) {
                    if (snapshotInProgress) {
                        this._takeSnapshotButtonDiv.classList.add("hidden");
                        this._snapshotProgress.classList.remove("hidden");
                    } else {
                        this._takeSnapshotButtonDiv.classList.remove("hidden");
                        this._snapshotProgress.classList.add("hidden");
                        this._snapshotProgressCaption.innerText = ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("SnapshotProgressCaptionDefault");
                    }
                };

                ManagedSummaryViewer.prototype.updateProgressIndicator = function (eventArgs) {
                    this._snapshotProgressCaption.innerText = eventArgs.Caption;
                };

                ManagedSummaryViewer.prototype.enableProgressCancel = function () {
                    this._snapshotProgressCancel.classList.remove("hidden");
                };

                ManagedSummaryViewer.prototype.completeProgress = function (ready) {
                    if (ready) {
                        this.updateTakeSnapshotTile(false);
                    }
                    return this.updateSummaryViewAsync(false);
                };

                ManagedSummaryViewer.prototype.actionCompleted = function () {
                    if (this._queuedActions.length == 0) {
                        this.resetActionQueue();
                    } else {
                        var action = this._queuedActions.shift();
                        action();
                    }
                };

                ManagedSummaryViewer.prototype.updateSnapshotsAsync = function () {
                    var _this = this;
                    return this._adaptor._call("GetCurrentProcessSnapshots").then(function (result) {
                        if (result != null) {
                            var container = document.getElementById("snapshotContainer");
                            container.removeChild(_this._takeSnapshotTile);
                            _this._snapshotTiles = _this.mergeNewSnapshots(container, _this._snapshotTiles, result);

                            container.appendChild(_this._takeSnapshotTile);
                        }

                        if (result.length > 0 && result[0].Heaps.length > 1) {
                            _this._takeSnapshotTile.classList.add("mixedMode");
                        } else {
                            _this._takeSnapshotTile.classList.remove("mixedMode");
                        }
                    });
                };

                ManagedSummaryViewer.prototype.mergeNewSnapshots = function (elements, oldViews, newSnapshots) {
                    var same = oldViews.length === newSnapshots.length;
                    for (var i = 0; i < oldViews.length && same; i++) {
                        same = oldViews[i].isViewOf(newSnapshots[i]);
                    }
                    return same ? oldViews.slice(0, oldViews.length) : this.getNewViews(elements, newSnapshots);
                };

                ManagedSummaryViewer.prototype.getNewViews = function (elements, snapshots) {
                    while (elements.hasChildNodes()) {
                        elements.removeChild(elements.firstChild);
                    }
                    var views = new Array();
                    var menuSnapshots = snapshots.slice().reverse();
                    for (var i = 0; i < snapshots.length; i++) {
                        var view = new SummaryViewer.SnapshotTileView(snapshots[i], i == 0 ? null : snapshots[i - 1], this, menuSnapshots);
                        elements.appendChild(view.element);
                        views.push(view);
                    }
                    return views;
                };

                ManagedSummaryViewer.prototype.onMessageReceivedFromAgent = function (message) {
                    var _this = this;
                    if (message) {
                        var obj = JSON.parse(message);
                        if (obj.eventName) {
                            switch (obj.eventName) {
                                case "snapshotData":
                                    var snapshotData = obj;
                                    this.queueAction(function () {
                                        _this._adaptor._call("TakeSnapshot", snapshotData.data.data.FileName).then(function (result) {
                                            if (result) {
                                                ManagedSummaryViewer._nextNativeSnapshotIdentifier++;
                                                _this.updateTakeSnapshotTile(true);
                                            }
                                        });
                                    });
                                    break;
                                default:
                                    break;
                            }
                        } else if (obj.startupError) {
                            if (obj.errorMessage === "VSHUB_E_ETW_PROVIDER_OVERLOADED") {
                                this.showNativeErrorMessageAsync(ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("MultipleHeapSessionStartupError"));
                            } else {
                                this.showNativeErrorMessageAsync(ManagedMemoryAnalyzer.MemoryAnalysisHelpers.formatResource("UnableToStartNativeMemoryProfiling"));
                            }
                        }
                    }
                };

                ManagedSummaryViewer.prototype.showNativeErrorMessageAsync = function (message, cssClass) {
                    var divElement = document.getElementById("viewDisabledMessageDiv");
                    divElement.className = "";

                    if (cssClass) {
                        divElement.classList.add(cssClass);
                    } else {
                        divElement.classList.add("viewDisabledMessage");
                    }

                    document.getElementById("viewDisabledMessage").innerHTML = message;
                    this.updateSummaryViewEnabledState(false);
                };

                ManagedSummaryViewer.prototype.sendMessageToAgent = function (message) {
                    this._standardCollector.sendStringToCollectionAgent(this.NativeMemoryCollectionAgentGuid, message);
                };

                ManagedSummaryViewer.prototype.viewHeapAsync = function (id, sortColumn) {
                    var _this = this;
                    this.queueAction(function () {
                        if (_this.isClean(id)) {
                            _this._adaptor._call("LaunchAnalyzer", id, sortColumn);
                        }
                    });
                };

                ManagedSummaryViewer.prototype.viewDiffAsync = function (id, baselineId, sortColumn) {
                    var _this = this;
                    this.queueAction(function () {
                        if (_this.isClean(id, baselineId)) {
                            _this._adaptor._call("LaunchAnalyzerAndDiff", id, baselineId, sortColumn);
                        }
                    });
                };

                ManagedSummaryViewer.prototype.destroySnapshotAsync = function (snapshot) {
                    var _this = this;
                    var ids = snapshot.Heaps.map(function (heap) {
                        return heap.Id;
                    });
                    this.queueAction(function () {
                        _this._adaptor._call("DestroySnapshot", ids).then(function (result) {
                            _this.updateSnapshotsAsync();
                            _this.actionCompleted();
                        });
                    }, ids);
                };

                ManagedSummaryViewer.prototype.cancelSnapshotAnalysisAsync = function () {
                    this._snapshotProgressCancel.classList.add("hidden");
                    this.resetActionQueue();
                    return this._adaptor._call("CancelSnapshotAnalysis");
                };
                ManagedSummaryViewer._nextNativeSnapshotIdentifier = 1;
                return ManagedSummaryViewer;
            })();
            SummaryViewer.ManagedSummaryViewer = ManagedSummaryViewer;

            Microsoft.Plugin.addEventListener("pluginready", function () {
                ManagedSummaryViewer.Instance = new ManagedSummaryViewer();
            });
        })(ManagedMemoryAnalyzer.SummaryViewer || (ManagedMemoryAnalyzer.SummaryViewer = {}));
        var SummaryViewer = ManagedMemoryAnalyzer.SummaryViewer;
    })(Debugger.ManagedMemoryAnalyzer || (Debugger.ManagedMemoryAnalyzer = {}));
    var ManagedMemoryAnalyzer = Debugger.ManagedMemoryAnalyzer;
})(Debugger || (Debugger = {}));
var Debugger;
(function (Debugger) {
    (function (ManagedMemoryAnalyzer) {
        (function (Swimlanes) {
            "use strict";

            var DiagHub = Microsoft.VisualStudio.DiagnosticsHub;

            

            var GCDataSeries = (function () {
                function GCDataSeries(resources) {
                    var _this = this;
                    this._gcEvents = [];
                    this._newDataEvent = new DiagHub.AggregatedEvent();
                    this._dataWarehouseRequestHandle = 1;
                    this._droppedRequest = false;
                    this._currentTimespan = new DiagHub.JsonTimespan(DiagHub.BigNumber.zero, DiagHub.BigNumber.zero);
                    this._samples = 250;
                    this._gcMarker = document.createElement("img");
                    this._gcMarker.src = Microsoft.Plugin.Theme.getValue("vs-mma-gc-glyph");
                    this._gcMarker.style.width = GCDataSeries._gcMarkerSize + "px";
                    this._gcMarker.style.height = GCDataSeries._gcMarkerSize + "px";

                    this._title = resources["GcLegendText"];
                    this._tooltip = resources["GcLegendTooltipText"];

                    DiagHub.DataWarehouse.loadDataWarehouse().then(function (dw) {
                        var countersContextData = {
                            customDomain: {
                                CounterId: GCDataSeries.counterId
                            }
                        };

                        return dw.getFilteredData(countersContextData, GCDataSeries.analyzerId);
                    }).then(function (responseData) {
                        _this._countersResult = responseData;
                    }).done(function () {
                        _this._dataWarehouseRequestHandle = null;
                        _this._droppedRequest = false;
                        _this.requestUpdate();
                    });
                }
                Object.defineProperty(GCDataSeries, "counterId", {
                    get: function () {
                        return "ManagedMemoryAnalyzer.Counters.GC";
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(GCDataSeries, "analyzerId", {
                    get: function () {
                        return "66EDDDF1-2277-40F3-983A-6FF57A433ECB";
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(GCDataSeries.prototype, "minValue", {
                    get: function () {
                        return Number.NaN;
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(GCDataSeries.prototype, "maxValue", {
                    get: function () {
                        return Number.NaN;
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(GCDataSeries.prototype, "marker", {
                    get: function () {
                        return this._gcMarker;
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(GCDataSeries.prototype, "title", {
                    get: function () {
                        return this._title;
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(GCDataSeries.prototype, "tooltip", {
                    get: function () {
                        return this._tooltip;
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(GCDataSeries.prototype, "newDataEvent", {
                    get: function () {
                        return this._newDataEvent;
                    },
                    enumerable: true,
                    configurable: true
                });

                GCDataSeries.prototype.dispose = function () {
                    this._countersResult.dispose();
                    this._newDataEvent.dispose();
                };

                GCDataSeries.prototype.onViewportChanged = function (viewport) {
                    this._currentTimespan = viewport;
                    this.requestUpdate();
                };

                GCDataSeries.prototype.onDataUpdate = function (timestamp) {
                    if (this._currentTimespan.contains(timestamp)) {
                        this.requestUpdate();
                    }
                };

                GCDataSeries.prototype.draw = function (context, graphInformation) {
                    var _this = this;
                    if (this._gcEvents.length === 0) {
                        return;
                    }

                    this._gcEvents.forEach(function (point) {
                        var x = DiagHub.Utilities.convertToPixel(point.Timestamp, graphInformation.gridX, graphInformation.chartRect.width) - (GCDataSeries._gcMarkerSize / 2);
                        context.drawImage(_this._gcMarker, x, 0, GCDataSeries._gcMarkerSize, GCDataSeries._gcMarkerSize);
                    });
                };

                GCDataSeries.prototype.getPointAtTimestamp = function (timestamp, pointToFind) {
                    if (this._gcEvents.length === 0) {
                        return null;
                    }

                    var point = { Timestamp: timestamp, Value: 0 };
                    var pointCompare = function (left, right) {
                        return right.Timestamp.greater(left.Timestamp);
                    };

                    switch (pointToFind) {
                        case 0 /* LessThanOrEqual */:
                            var index = DiagHub.Utilities.findLessThan(this._gcEvents, point, pointCompare);
                            point = this._gcEvents[index];
                            break;
                        case 2 /* GreaterThanOrEqual */:
                            var index = DiagHub.Utilities.findGreaterThan(this._gcEvents, point, pointCompare);
                            point = this._gcEvents[index];
                            break;
                        case 1 /* Nearest */:
                        default:
                            var minIndex = DiagHub.Utilities.findLessThan(this._gcEvents, point, pointCompare);
                            var maxIndex = Math.min(minIndex + 1, this._gcEvents.length - 1);
                            var minDelta = DiagHub.BigNumber.subtract(timestamp, this._gcEvents[minIndex].Timestamp);
                            var maxDelta = DiagHub.BigNumber.subtract(this._gcEvents[maxIndex].Timestamp, timestamp);
                            index = minDelta.greater(maxDelta) ? maxIndex : minIndex;
                            point = this._gcEvents[index];
                            break;
                    }

                    return {
                        timestamp: point.Timestamp,
                        tooltip: point.ToolTip
                    };
                };

                GCDataSeries.prototype.requestUpdate = function () {
                    var _this = this;
                    if (this._dataWarehouseRequestHandle) {
                        this._droppedRequest = true;
                        return;
                    }

                    this._dataWarehouseRequestHandle = window.setTimeout(function () {
                        var requestData = {
                            type: "SamplePoints",
                            begin: _this._currentTimespan.begin.jsonValue,
                            end: _this._currentTimespan.end.jsonValue,
                            samples: Math.max(_this._samples, 2)
                        };

                        _this._countersResult.getResult(requestData).then(function (result) {
                            return _this.cachePoints(result);
                        }).done(function () {
                            _this._dataWarehouseRequestHandle = null;
                            if (_this._droppedRequest) {
                                window.setTimeout(_this.requestUpdate.bind(_this), DiagHub.Constants.TimeoutImmediate);
                                _this._droppedRequest = false;
                            }
                        });
                    }, DiagHub.Constants.TimeoutImmediate);
                };

                GCDataSeries.prototype.cachePoints = function (result) {
                    if (result.p.length === 0) {
                        this._gcEvents = [];
                        return;
                    }

                    this._gcEvents = result.p.map(function (point) {
                        var customData = JSON.parse(point.d);
                        var duration = DiagHub.RulerUtilities.formatTime(new DiagHub.BigNumber(customData.duration.h, customData.duration.l));
                        var forcedTooltipString = customData.forced ? "GcTooltipForced" : "GcTooltipUnforced";

                        var tooltipSegments = [];
                        tooltipSegments.push(Microsoft.Plugin.Resources.getString("GcTooltipGenerationNumber", customData.generation));
                        tooltipSegments.push(Microsoft.Plugin.Resources.getString("GcTooltipDuration", duration));
                        tooltipSegments.push(Microsoft.Plugin.Resources.getString(forcedTooltipString));

                        return {
                            Timestamp: new DiagHub.BigNumber(point.t.h, point.t.l),
                            CustomData: point.d,
                            ToolTip: tooltipSegments.join('\n')
                        };
                    });

                    this._newDataEvent.invokeEvent(this);
                };
                GCDataSeries._gcMarkerSize = 10;
                return GCDataSeries;
            })();
            Swimlanes.GCDataSeries = GCDataSeries;
        })(ManagedMemoryAnalyzer.Swimlanes || (ManagedMemoryAnalyzer.Swimlanes = {}));
        var Swimlanes = ManagedMemoryAnalyzer.Swimlanes;
    })(Debugger.ManagedMemoryAnalyzer || (Debugger.ManagedMemoryAnalyzer = {}));
    var ManagedMemoryAnalyzer = Debugger.ManagedMemoryAnalyzer;
})(Debugger || (Debugger = {}));
var Debugger;
(function (Debugger) {
    (function (ManagedMemoryAnalyzer) {
        (function (Swimlanes) {
            "use strict";

            var DiagHub = Microsoft.VisualStudio.DiagnosticsHub;

            var SnapshotDataSeriesElement = (function () {
                function SnapshotDataSeriesElement(data, unitConverter) {
                    this._timestamp = new DiagHub.BigNumber(data.TimeInNs.h, data.TimeInNs.l);
                    var tooltipList = [data.Name];
                    data.Heaps.forEach(function (heap) {
                        if (heap.Type === 2 /* LIVE_MANAGED */) {
                            tooltipList.push(Microsoft.Plugin.Resources.getString("SnapshotTooltipManagedCount", heap.Count));
                            tooltipList.push(Microsoft.Plugin.Resources.getString("SnapshotTooltipManagedSize", unitConverter.formatNumber(heap.Size)));
                        } else if (heap.Type === 3 /* LIVE_NATIVE */) {
                            tooltipList.push(Microsoft.Plugin.Resources.getString("SnapshotTooltipNativeCount", heap.Count));
                            tooltipList.push(Microsoft.Plugin.Resources.getString("SnapshotTooltipNativeSize", unitConverter.formatNumber(heap.Size)));
                        }
                    });

                    this._tooltip = tooltipList.join("\n");
                }
                Object.defineProperty(SnapshotDataSeriesElement.prototype, "timestamp", {
                    get: function () {
                        return this._timestamp;
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(SnapshotDataSeriesElement.prototype, "tooltip", {
                    get: function () {
                        return this._tooltip;
                    },
                    enumerable: true,
                    configurable: true
                });
                return SnapshotDataSeriesElement;
            })();
            Swimlanes.SnapshotDataSeriesElement = SnapshotDataSeriesElement;

            var SnapshotDataSeries = (function () {
                function SnapshotDataSeries(unitConverter, resources) {
                    this._snapshots = [];
                    this._newDataEvent = new DiagHub.AggregatedEvent();
                    this._unitConverter = unitConverter;
                    this._snapshotMarker = document.createElement("img");
                    this._snapshotMarker.src = Microsoft.Plugin.Theme.getValue("vs-mma-snapshot-glyph");
                    this._snapshotMarker.style.width = SnapshotDataSeries._snapshotMarkerSize + "px";
                    this._snapshotMarker.style.height = SnapshotDataSeries._snapshotMarkerSize + "px";

                    this._title = resources["SnapshotLegendText"];
                    this._tooltip = resources["SnapshotLegendTooltipText"];

                    this._onNewSnapshotDataBoundFunction = this.onNewSnapshotData.bind(this);
                    this._summaryViewModelMarshaler = Microsoft.Plugin.Utilities.JSONMarshaler.attachToPublishedObject("Microsoft.VisualStudio.Debugger.LiveMemorySummaryViewModelMarshaler", {}, false);
                    this._summaryViewModelMarshaler.addEventListener("SummaryViewUpdatedEvent", this._onNewSnapshotDataBoundFunction);

                    this.onNewSnapshotData();
                }
                Object.defineProperty(SnapshotDataSeries.prototype, "minValue", {
                    get: function () {
                        return Number.NaN;
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(SnapshotDataSeries.prototype, "maxValue", {
                    get: function () {
                        return Number.NaN;
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(SnapshotDataSeries.prototype, "marker", {
                    get: function () {
                        return this._snapshotMarker;
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(SnapshotDataSeries.prototype, "title", {
                    get: function () {
                        return this._title;
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(SnapshotDataSeries.prototype, "tooltip", {
                    get: function () {
                        return this._tooltip;
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(SnapshotDataSeries.prototype, "newDataEvent", {
                    get: function () {
                        return this._newDataEvent;
                    },
                    enumerable: true,
                    configurable: true
                });

                SnapshotDataSeries.prototype.dispose = function () {
                    this._summaryViewModelMarshaler.removeEventListener("SummaryViewUpdatedEvent", this._onNewSnapshotDataBoundFunction);
                    this._newDataEvent.dispose();
                };

                SnapshotDataSeries.prototype.onViewportChanged = function (viewport) {
                };

                SnapshotDataSeries.prototype.getPointAtTimestamp = function (timestamp, pointToFind) {
                    if (this._snapshots.length === 0) {
                        return null;
                    }

                    var point = { timestamp: timestamp };
                    var snapshotDataSeriesElementLessThan = function (left, right) {
                        return right.timestamp.greater(left.timestamp);
                    };

                    switch (pointToFind) {
                        case 0 /* LessThanOrEqual */:
                            var index = DiagHub.Utilities.findLessThan(this._snapshots, point, snapshotDataSeriesElementLessThan);
                            return this._snapshots[index];
                        case 2 /* GreaterThanOrEqual */:
                            var index = DiagHub.Utilities.findGreaterThan(this._snapshots, point, snapshotDataSeriesElementLessThan);
                            return this._snapshots[index];
                        case 1 /* Nearest */:
                        default:
                            var minIndex = DiagHub.Utilities.findLessThan(this._snapshots, point, snapshotDataSeriesElementLessThan);
                            var maxIndex = Math.min(minIndex + 1, this._snapshots.length - 1);
                            var minDelta = DiagHub.BigNumber.subtract(timestamp, this._snapshots[minIndex].timestamp);
                            var maxDelta = DiagHub.BigNumber.subtract(this._snapshots[maxIndex].timestamp, timestamp);
                            index = minDelta.greater(maxDelta) ? maxIndex : minIndex;
                            return this._snapshots[index];
                    }
                };

                SnapshotDataSeries.prototype.draw = function (context, graphInformation) {
                    var _this = this;
                    if (this._snapshots.length === 0) {
                        return;
                    }

                    var markerHalfWidth = (SnapshotDataSeries._snapshotMarkerSize / 2);

                    this._snapshots.forEach(function (snapshot) {
                        var x = DiagHub.Utilities.convertToPixel(snapshot.timestamp, graphInformation.gridX, graphInformation.chartRect.width) - markerHalfWidth;

                        if (x >= -markerHalfWidth && x < (graphInformation.chartRect.width + markerHalfWidth)) {
                            context.drawImage(_this._snapshotMarker, x, 0, SnapshotDataSeries._snapshotMarkerSize, SnapshotDataSeries._snapshotMarkerSize);
                        }
                    });
                };

                SnapshotDataSeries.prototype.onNewSnapshotData = function () {
                    var _this = this;
                    this._summaryViewModelMarshaler._call("GetCurrentProcessSnapshots").done(function (snapshots) {
                        _this._snapshots = snapshots.map(function (snapshot) {
                            return new SnapshotDataSeriesElement(snapshot, _this._unitConverter);
                        });
                        _this._newDataEvent.invokeEvent(_this);
                    });
                };
                SnapshotDataSeries._snapshotMarkerSize = 10;
                return SnapshotDataSeries;
            })();
            Swimlanes.SnapshotDataSeries = SnapshotDataSeries;
        })(ManagedMemoryAnalyzer.Swimlanes || (ManagedMemoryAnalyzer.Swimlanes = {}));
        var Swimlanes = ManagedMemoryAnalyzer.Swimlanes;
    })(Debugger.ManagedMemoryAnalyzer || (Debugger.ManagedMemoryAnalyzer = {}));
    var ManagedMemoryAnalyzer = Debugger.ManagedMemoryAnalyzer;
})(Debugger || (Debugger = {}));
var Debugger;
(function (Debugger) {
    (function (ManagedMemoryAnalyzer) {
        (function (Swimlanes) {
            "use strict";

            var DiagHub = Microsoft.VisualStudio.DiagnosticsHub;

            function ManagedMemorySwimlaneFactory(componentConfig, isVisible, selectionEnabled, graphBehaviour, currentTimespan, selectionTimespan) {
                var swimlaneConfig = new DiagHub.SwimlaneConfiguration(componentConfig, currentTimespan, graphBehaviour);
                var unitConverter = new DiagHub.LocalizedUnitConverter(swimlaneConfig.graph.jsonConfig.Units, swimlaneConfig.graph.resources);

                var additionalSeries = [];
                if (componentConfig.JsonObject.ShowGcData) {
                    var gcSeries = new Swimlanes.GCDataSeries(swimlaneConfig.graph.resources);
                    additionalSeries.push(gcSeries);
                    swimlaneConfig.graph.legend.push({
                        legendText: gcSeries.title,
                        legendTooltip: gcSeries.tooltip,
                        marker: gcSeries.marker
                    });
                }

                var snapshotSeries = new Swimlanes.SnapshotDataSeries(unitConverter, swimlaneConfig.graph.resources);
                additionalSeries.push(snapshotSeries);
                swimlaneConfig.graph.legend.push({
                    legendText: snapshotSeries.title,
                    legendTooltip: snapshotSeries.tooltip,
                    marker: snapshotSeries.marker
                });

                var graph = new DiagHub.MultiSeriesGraph(swimlaneConfig.graph, additionalSeries);

                var leftScale = new DiagHub.Scale(swimlaneConfig.graph.scale, 0 /* Left */, unitConverter);
                var rightScale = new DiagHub.Scale(swimlaneConfig.graph.scale, 1 /* Right */, unitConverter);
                graph.scaleChangedEvent.addEventListener(leftScale.onScaleChanged.bind(leftScale));
                graph.scaleChangedEvent.addEventListener(rightScale.onScaleChanged.bind(rightScale));

                var swimlane = new DiagHub.SwimlaneBase(swimlaneConfig.header, swimlaneConfig.graph.height, currentTimespan, selectionTimespan);
                graph.scaleChangedEvent.addEventListener(swimlane.onScaleChanged.bind(swimlane));

                swimlane.addTitleControl(new DiagHub.Legend(swimlaneConfig.graph.legend));
                swimlane.addMainRegionControl(new DiagHub.SelectionOverlay(graph, currentTimespan, selectionTimespan));
                swimlane.addMainRegionControl(new DiagHub.GridLineRenderer(currentTimespan));
                swimlane.addLeftRegionControl(leftScale);
                swimlane.addRightRegionControl(rightScale);

                return swimlane;
            }
            Swimlanes.ManagedMemorySwimlaneFactory = ManagedMemorySwimlaneFactory;
        })(ManagedMemoryAnalyzer.Swimlanes || (ManagedMemoryAnalyzer.Swimlanes = {}));
        var Swimlanes = ManagedMemoryAnalyzer.Swimlanes;
    })(Debugger.ManagedMemoryAnalyzer || (Debugger.ManagedMemoryAnalyzer = {}));
    var ManagedMemoryAnalyzer = Debugger.ManagedMemoryAnalyzer;
})(Debugger || (Debugger = {}));

// SIG // Begin signature block
// SIG // MIIatwYJKoZIhvcNAQcCoIIaqDCCGqQCAQExCzAJBgUr
// SIG // DgMCGgUAMGcGCisGAQQBgjcCAQSgWTBXMDIGCisGAQQB
// SIG // gjcCAR4wJAIBAQQQEODJBs441BGiowAQS9NQkAIBAAIB
// SIG // AAIBAAIBAAIBADAhMAkGBSsOAwIaBQAEFBgCrthgpBUg
// SIG // HuxRXpiqdIM7Ws1OoIIVgjCCBMMwggOroAMCAQICEzMA
// SIG // AABw9Bi/IyH8UJ0AAAAAAHAwDQYJKoZIhvcNAQEFBQAw
// SIG // dzELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0
// SIG // b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1p
// SIG // Y3Jvc29mdCBDb3Jwb3JhdGlvbjEhMB8GA1UEAxMYTWlj
// SIG // cm9zb2Z0IFRpbWUtU3RhbXAgUENBMB4XDTE1MDMyMDE3
// SIG // MzIwMloXDTE2MDYyMDE3MzIwMlowgbMxCzAJBgNVBAYT
// SIG // AlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQH
// SIG // EwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29y
// SIG // cG9yYXRpb24xDTALBgNVBAsTBE1PUFIxJzAlBgNVBAsT
// SIG // Hm5DaXBoZXIgRFNFIEVTTjpGNTI4LTM3NzctOEE3NjEl
// SIG // MCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2Vy
// SIG // dmljZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
// SIG // ggEBAKMU2e8coHkRvS2aBJ0jNIKlQh0rANHSGzEpyCor
// SIG // 8y30bovd4hv4E/TAX3BTr+czD3RKBxRs3CgDuCoKeMRu
// SIG // II4LgG9We5P0cU/C06vG7C2uldBjZ7BkpjQDDOOKrihS
// SIG // Apk1+Txk2ysyd8I07lIeX5cGdAl/8KL31ZHq3GLbU4ZH
// SIG // bowBW+Ile3j8PXKDIntZk6Kvk8kYLuf2ClQOmA1lBld3
// SIG // k5GvlK+EvrhvrYT0+xXik+LYSDZ1WTIBDXF2AJVJaWzU
// SIG // xjY6WjDQwMpzieaU9iMeEmBRAAjB3to/SITtta/U05o4
// SIG // lam6o1i1eGhGvw+MY3G+OkNDWRDwSrp71uUGE90CAwEA
// SIG // AaOCAQkwggEFMB0GA1UdDgQWBBRtz/O4hK73zHa9uHus
// SIG // PZdhgXQrJzAfBgNVHSMEGDAWgBQjNPjZUkZwCu1A+3b7
// SIG // syuwwzWzDzBUBgNVHR8ETTBLMEmgR6BFhkNodHRwOi8v
// SIG // Y3JsLm1pY3Jvc29mdC5jb20vcGtpL2NybC9wcm9kdWN0
// SIG // cy9NaWNyb3NvZnRUaW1lU3RhbXBQQ0EuY3JsMFgGCCsG
// SIG // AQUFBwEBBEwwSjBIBggrBgEFBQcwAoY8aHR0cDovL3d3
// SIG // dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWNyb3Nv
// SIG // ZnRUaW1lU3RhbXBQQ0EuY3J0MBMGA1UdJQQMMAoGCCsG
// SIG // AQUFBwMIMA0GCSqGSIb3DQEBBQUAA4IBAQBeOir1Z/QF
// SIG // MCre4bnvZ/wq/25yKZ+efMcTw6PljjwE6SYVTffCZ4Jc
// SIG // ClvFCu5V8KMtjqIdorMsLdAR4poqAdEwJmehpm6JMRxu
// SIG // 3cRxVPAJot3B1jZzwAz/VQhr/KGU/V0sJyHs0SMG3AQs
// SIG // 77kC2wO7R3MYCut9mc1fBuCI94qTxRIRG/NSlaNyoNJY
// SIG // 2cMs4mt/d9RjU+qCuC9HZCiYx4M78WsoYfgKiIJFUpLp
// SIG // gyZJXLfOPJp/r6BRk8W8usvRK7W7kBkKpqdqfvj9FX5G
// SIG // RIelBtT8SnA4xui1SvTbri/sQ8mJoijFVdnBuluqYLul
// SIG // u/nVAo4OD23CNXDAqOwNobK4MIIE7DCCA9SgAwIBAgIT
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
// SIG // L54/LlUWa8kTo/0xggShMIIEnQIBATCBkDB5MQswCQYD
// SIG // VQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
// SIG // A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
// SIG // IENvcnBvcmF0aW9uMSMwIQYDVQQDExpNaWNyb3NvZnQg
// SIG // Q29kZSBTaWduaW5nIFBDQQITMwAAAQosea7XeXumrAAB
// SIG // AAABCjAJBgUrDgMCGgUAoIG6MBkGCSqGSIb3DQEJAzEM
// SIG // BgorBgEEAYI3AgEEMBwGCisGAQQBgjcCAQsxDjAMBgor
// SIG // BgEEAYI3AgEVMCMGCSqGSIb3DQEJBDEWBBTn43Qm68bx
// SIG // wlMKF87aUJjQnPxtsjBaBgorBgEEAYI3AgEMMUwwSqAw
// SIG // gC4ATQBhAG4AYQBnAGUAZABTAHUAbQBtAGEAcgB5AFYA
// SIG // aQBlAHcAZQByAC4AagBzoRaAFGh0dHA6Ly9taWNyb3Nv
// SIG // ZnQuY29tMA0GCSqGSIb3DQEBAQUABIIBAHOSGXAGLVRP
// SIG // USv+AAZ//VaU3zAt6KJKLJkNmdCGhzcFj4ltbmtPbigJ
// SIG // YUa0mYIadVZbm6gspgJbrHnilA9aN27NgqwWNchS6Kkg
// SIG // mFKymMEuVvMh3rdrHHcNYZ7hUVqRSRV3FKwGRMp+EjDl
// SIG // 9+u4HyHAXSMEw3zt/PWSarNiFzpMYD56o3BYxnRGJqW5
// SIG // lr4eg5w1atRs70V2Ah2z9Bwp2VWdP/90TfGYMfZ3MJu9
// SIG // cxyIBmYPlN0wAyUdwTqzE6VtDbIwMpGs8DxrnzCi0gKa
// SIG // qUvb3/CdvKevdYrkwlYZzMxkd90azKlRO1OLsey1rCWT
// SIG // UyobwzijWiZP+OnjPGUw58qhggIoMIICJAYJKoZIhvcN
// SIG // AQkGMYICFTCCAhECAQEwgY4wdzELMAkGA1UEBhMCVVMx
// SIG // EzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1Jl
// SIG // ZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3Jh
// SIG // dGlvbjEhMB8GA1UEAxMYTWljcm9zb2Z0IFRpbWUtU3Rh
// SIG // bXAgUENBAhMzAAAAcPQYvyMh/FCdAAAAAABwMAkGBSsO
// SIG // AwIaBQCgXTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
// SIG // MBwGCSqGSIb3DQEJBTEPFw0xNTA3MDcwNzM1MTNaMCMG
// SIG // CSqGSIb3DQEJBDEWBBTp2onvWEqiigRnd3B8YKQogao2
// SIG // PzANBgkqhkiG9w0BAQUFAASCAQAIgDB4RFIi3iVqVw0J
// SIG // iY8czEPeeBh4pa5ri5hqO81eux/g6WG7xi33szq+g2oP
// SIG // eEl9pWIUACnUJZ7I56xYhfMxSgoPKsqakB+MUtZfWYvj
// SIG // 7AgMzbdX7Ut6hIxcv6Pu4nuOwmOKkIpFGk5gCkhItcyP
// SIG // NOpP+/qAbmQXKKVhdDZfj66pk1tXGE9LKUz91safItm2
// SIG // Lax3g4Z/VSewNslYT8wuh4k4hJzHKufmS29X7DwXTxNi
// SIG // qE6wHdnTxiUDiLrrGpuZp6/QB+8jovF0HVgWN53oQBRE
// SIG // QBN0KjDZXiebQES0jXbie7xbPGGvlG0c0uT+/I5z0wL1
// SIG // VV0Mn10sp94YNEyY
// SIG // End signature block
