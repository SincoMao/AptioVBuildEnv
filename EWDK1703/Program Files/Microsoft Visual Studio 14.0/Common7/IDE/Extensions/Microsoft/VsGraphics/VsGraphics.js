// Reference paths for scriptedhost and diag hub. Make sure you also change the plugin.js and diagnosticshub.js referenced
// in the VsGraphicsDebuggerPkg.csproj if you change these below.
/// <reference path="../../../../../InternalApis/bptoob/inc/1.00/plugin.d.ts" />
/// <reference path="../../../../../InternalApis/DiagnosticsHub/inc/TS-1.0.1/DiagnosticsHub.d.ts" />
//
// Copyright (C) Microsoft. All rights reserved.
//
var VsGraphics;
(function (VsGraphics) {
    (function (Common) {
        (function (Controls) {
            "use strict";

            var ObservableViewModel = (function () {
                function ObservableViewModel() {
                    this._propertyChangedObservers = [];
                }
                ObservableViewModel.prototype.registerPropertyChanged = function (observer) {
                    this._propertyChangedObservers.push(observer);
                };

                ObservableViewModel.prototype.removePropertyChanged = function (observer) {
                    var index = this._propertyChangedObservers.indexOf(observer);
                    if (index >= 0) {
                        this._propertyChangedObservers = this._propertyChangedObservers.splice(index, 1);
                    }
                };

                ObservableViewModel.prototype.raisePropertyChanged = function (propertyName) {
                    for (var i = 0; i < this._propertyChangedObservers.length; i++) {
                        this._propertyChangedObservers[i].onPropertyChanged(propertyName);
                    }
                };
                return ObservableViewModel;
            })();
            Controls.ObservableViewModel = ObservableViewModel;

            (function (NotifyCollectionChangedAction) {
                NotifyCollectionChangedAction[NotifyCollectionChangedAction["Add"] = 0] = "Add";
                NotifyCollectionChangedAction[NotifyCollectionChangedAction["Reset"] = 1] = "Reset";
                NotifyCollectionChangedAction[NotifyCollectionChangedAction["Replace"] = 2] = "Replace";
            })(Controls.NotifyCollectionChangedAction || (Controls.NotifyCollectionChangedAction = {}));
            var NotifyCollectionChangedAction = Controls.NotifyCollectionChangedAction;

            var NotifyCollectionChangedEventArgs = (function () {
                function NotifyCollectionChangedEventArgs(action, newItems, newStartingIndex, oldItems, oldStartingIndex) {
                    this._action = action;
                    this._newItems = newItems;
                    this._newStartingIndex = newStartingIndex;
                    this._oldItems = oldItems;
                    this._oldStartingIndex = oldStartingIndex;
                }
                Object.defineProperty(NotifyCollectionChangedEventArgs.prototype, "action", {
                    get: function () {
                        return this._action;
                    },
                    enumerable: true,
                    configurable: true
                });
                Object.defineProperty(NotifyCollectionChangedEventArgs.prototype, "newItems", {
                    get: function () {
                        return this._newItems;
                    },
                    enumerable: true,
                    configurable: true
                });
                Object.defineProperty(NotifyCollectionChangedEventArgs.prototype, "newStartingIndex", {
                    get: function () {
                        return this._newStartingIndex;
                    },
                    enumerable: true,
                    configurable: true
                });
                Object.defineProperty(NotifyCollectionChangedEventArgs.prototype, "oldItems", {
                    get: function () {
                        return this._oldItems;
                    },
                    enumerable: true,
                    configurable: true
                });
                Object.defineProperty(NotifyCollectionChangedEventArgs.prototype, "oldStartingIndex", {
                    get: function () {
                        return this._oldStartingIndex;
                    },
                    enumerable: true,
                    configurable: true
                });
                return NotifyCollectionChangedEventArgs;
            })();
            Controls.NotifyCollectionChangedEventArgs = NotifyCollectionChangedEventArgs;

            var ObservableCollection = (function () {
                function ObservableCollection() {
                    this._items = [];
                    this._collectionChangedObservers = [];
                }
                ObservableCollection.prototype.registerCollectionChanged = function (observer) {
                    this._collectionChangedObservers.push(observer);
                };

                ObservableCollection.prototype.removeCollectionChanged = function (observer) {
                    var index = this._collectionChangedObservers.indexOf(observer);
                    if (index >= 0) {
                        this._collectionChangedObservers = this._collectionChangedObservers.splice(index, 1);
                    }
                };

                ObservableCollection.prototype.add = function (item) {
                    this._items.push(item);

                    var args = new NotifyCollectionChangedEventArgs(0 /* Add */, [item], this._items.length - 1, [], 0);
                    this.onCollectionChanged(args);
                };

                ObservableCollection.prototype.replace = function (index, newItem) {
                    if (index >= 0 && index < this._items.length) {
                        var oldItem = this._items[index];
                        this._items[index] = newItem;
                        var args = new NotifyCollectionChangedEventArgs(2 /* Replace */, [newItem], index, [oldItem], index);
                        this.onCollectionChanged(args);
                    }
                };

                ObservableCollection.prototype.clear = function () {
                    var oldItems = this._items;
                    this._items = [];
                    var args = new NotifyCollectionChangedEventArgs(1 /* Reset */, [], 0, oldItems, oldItems.length - 1);
                    this.onCollectionChanged(args);
                };

                ObservableCollection.prototype.getItem = function (index) {
                    return this._items[index];
                };

                Object.defineProperty(ObservableCollection.prototype, "length", {
                    get: function () {
                        return this._items.length;
                    },
                    enumerable: true,
                    configurable: true
                });

                ObservableCollection.prototype.onCollectionChanged = function (eventArgs) {
                    for (var i = 0; i < this._collectionChangedObservers.length; i++) {
                        this._collectionChangedObservers[i].onCollectionChanged(eventArgs);
                    }
                };
                return ObservableCollection;
            })();
            Controls.ObservableCollection = ObservableCollection;
        })(Common.Controls || (Common.Controls = {}));
        var Controls = Common.Controls;
    })(VsGraphics.Common || (VsGraphics.Common = {}));
    var Common = VsGraphics.Common;
})(VsGraphics || (VsGraphics = {}));
//
// Copyright (C) Microsoft. All rights reserved.
//
var VsGraphics;
(function (VsGraphics) {
    (function (Common) {
        /// <reference path="..\Includes.ts" />
        (function (Controls) {
            "use strict";

            // Create a new control with the given root HTMLElement. If the root is not
            // provided, a default <div> root is used.
            var Control = (function () {
                function Control(root) {
                    this._rootElement = root;

                    if (typeof this._rootElement === "undefined") {
                        // We must have a root element to start with, default to a div.
                        // This can change at any time by setting the property rootElement.
                        this._rootElement = document.createElement("div");
                        this._rootElement.style.width = this._rootElement.style.height = "100%";
                    } else if (this._rootElement === null) {
                        throw new Error(Microsoft.Plugin.Resources.getErrorString("JSPerf.1017"));
                    }
                }
                Control.prototype.appendChild = function (child) {
                    this._rootElement.appendChild(child.rootElement);
                    child.parent = this;
                };

                Control.prototype.removeChild = function (child) {
                    this._rootElement.removeChild(child.rootElement);
                    child.parent = null;
                };

                Object.defineProperty(Control.prototype, "rootElement", {
                    get: function () {
                        return this._rootElement;
                    },
                    set: function (newRoot) {
                        if (!newRoot) {
                            throw new Error(Microsoft.Plugin.Resources.getErrorString("JSPerf.1018"));
                        }

                        var oldRoot = this._rootElement;
                        this._rootElement = newRoot;

                        if (oldRoot && oldRoot.parentNode) {
                            oldRoot.parentNode.replaceChild(newRoot, oldRoot);
                        }
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(Control.prototype, "parent", {
                    get: function () {
                        return this._parent;
                    },
                    set: function (newParent) {
                        if (this._parent !== newParent) {
                            this._parent = newParent;
                            if (this._parent && !this._parent.rootElement.contains(this._rootElement)) {
                                this._parent.appendChild(this);
                            }

                            this.onParentChanged();
                        }
                    },
                    enumerable: true,
                    configurable: true
                });

                // overridable
                Control.prototype.onParentChanged = function () {
                };
                return Control;
            })();
            Controls.Control = Control;
        })(Common.Controls || (Common.Controls = {}));
        var Controls = Common.Controls;
    })(VsGraphics.Common || (VsGraphics.Common = {}));
    var Common = VsGraphics.Common;
})(VsGraphics || (VsGraphics = {}));
//
// Copyright (C) Microsoft. All rights reserved.
//
var __extends = this.__extends || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    __.prototype = b.prototype;
    d.prototype = new __();
};
var VsGraphics;
(function (VsGraphics) {
    (function (Common) {
        /// <reference path="control.ts" />
        (function (Controls) {
            "use strict";

            // This TemplateControl initializes the control from a template.
            var TemplateControl = (function (_super) {
                __extends(TemplateControl, _super);
                function TemplateControl(templateName) {
                    _super.call(this);

                    // Assign the id postfix to use when fixing id's in the template
                    this._idPostfix = TemplateControl._globalIdPostfix++;

                    if (templateName) {
                        this.setTemplateFromName(templateName);
                    }
                }
                TemplateControl.prototype.setTemplateFromName = function (templateName) {
                    var root = this.getTemplateElementCopy(templateName);
                    this.adjustElementIds(root);
                    this.rootElement = root;
                };

                TemplateControl.prototype.setTemplateFromHTML = function (htmlContent) {
                    var root = this.getTemplateElementFromHTML(htmlContent);
                    this.adjustElementIds(root);
                    this.rootElement = root;
                };

                TemplateControl.prototype.findElement = function (id) {
                    var fullId = id + this._idPostfix;
                    return this.forAllSelfAndDescendants(this.rootElement, function (elem) {
                        if (elem.id && elem.id === fullId) {
                            return false;
                        }
                        return true;
                    });
                };

                TemplateControl.prototype.findElementsByClassName = function (className) {
                    var elements = [];

                    this.forAllSelfAndDescendants(this.rootElement, function (elem) {
                        if (elem.classList && elem.classList.contains(className)) {
                            elements.push(elem);
                        }

                        return true;
                    });

                    return elements;
                };

                TemplateControl.prototype.getTemplateElementCopy = function (templateName) {
                    var templateElement = document.getElementById(templateName);
                    if (!templateElement) {
                        throw new Error(Microsoft.Plugin.Resources.getErrorString("JSPerf.1023"));
                    }

                    if (templateElement.tagName.toLowerCase() !== "script") {
                        throw new Error(Microsoft.Plugin.Resources.getErrorString("JSPerf.1024"));
                    }

                    return this.getTemplateElementFromHTML(templateElement.innerHTML);
                };

                TemplateControl.prototype.getTemplateElementFromHTML = function (htmlContent) {
                    var root = this.getTemplateRootElement();
                    root.innerHTML = htmlContent;

                    // If the template contains one child, use that as the root instead
                    if (root.childElementCount === 1) {
                        root = root.firstElementChild;
                    }

                    return root;
                };

                TemplateControl.prototype.getTemplateRootElement = function () {
                    var div = document.createElement("div");
                    div.style.width = div.style.height = "100%";
                    return div;
                };

                TemplateControl.prototype.adjustElementIds = function (root) {
                    // Postfix all id's with the new id
                    var idPostfix = this._idPostfix;
                    this.forAllSelfAndDescendants(root, function (elem) {
                        if (elem.id) {
                            elem.id = elem.id + idPostfix;
                        }
                        return true;
                    });
                };

                TemplateControl.prototype.forAllSelfAndDescendants = function (root, func) {
                    // <summary>Executes the given delegate on all the node and all its decendant elements. The callback function needs to return false to break the loop.</summary>
                    // <returns>The element at which the loop exit at, or null otherwise.</returns>
                    var brokeAtElement = null;

                    if (!func(root)) {
                        brokeAtElement = root;
                    } else {
                        if (root.children) {
                            var children = root.children;
                            var childrenLength = children.length;
                            for (var i = 0; i < childrenLength; i++) {
                                brokeAtElement = this.forAllSelfAndDescendants(children[i], func);
                                if (brokeAtElement) {
                                    break;
                                }
                            }
                        }
                    }

                    return brokeAtElement;
                };
                TemplateControl._globalIdPostfix = 1;
                return TemplateControl;
            })(Controls.Control);
            Controls.TemplateControl = TemplateControl;
        })(Common.Controls || (Common.Controls = {}));
        var Controls = Common.Controls;
    })(VsGraphics.Common || (VsGraphics.Common = {}));
    var Common = VsGraphics.Common;
})(VsGraphics || (VsGraphics = {}));
//
// Copyright (C) Microsoft. All rights reserved.
//
var VsGraphics;
(function (VsGraphics) {
    (function (Common) {
        "use strict";

        var Enum = (function () {
            function Enum() {
            }
            Enum.GetName = function (enumType, value) {
                var result;

                if (enumType) {
                    for (var enumKey in enumType) {
                        if (enumType.hasOwnProperty(enumKey)) {
                            var enumValue = enumType[enumKey];
                            if (enumValue === value) {
                                result = enumKey;
                                break;
                            }
                        }
                    }
                }

                if (!result) {
                    result = value.toString();
                }

                return result;
            };

            Enum.Parse = function (enumType, name, ignoreCase) {
                if (typeof ignoreCase === "undefined") { ignoreCase = true; }
                var result;

                if (enumType) {
                    if (ignoreCase) {
                        name = name.toLowerCase();
                    }

                    for (var enumKey in enumType) {
                        if (enumType.hasOwnProperty(enumKey)) {
                            var compareAginst = enumKey.toString();
                            if (ignoreCase) {
                                compareAginst = compareAginst.toLowerCase();
                            }
                            if (name === compareAginst) {
                                result = enumType[enumKey];
                                break;
                            }
                        }
                    }
                }

                return result;
            };

            Enum.GetValues = function (enumType) {
                var result = [];

                if (enumType) {
                    for (var enumKey in enumType) {
                        if (enumType.hasOwnProperty(enumKey)) {
                            var enumValue = enumType[enumKey];
                            if (typeof enumValue === "number") {
                                result.push(enumValue);
                            }
                        }
                    }
                }

                return result;
            };
            return Enum;
        })();
        Common.Enum = Enum;
    })(VsGraphics.Common || (VsGraphics.Common = {}));
    var Common = VsGraphics.Common;
})(VsGraphics || (VsGraphics = {}));
//
// Copyright (C) Microsoft. All rights reserved.
//
var VsGraphics;
(function (VsGraphics) {
    (function (Common) {
        "use strict";

        var ErrorFormatter = (function () {
            function ErrorFormatter() {
            }
            ErrorFormatter.format = function (error) {
                // Depending on the source, the error object will be different
                return (error.message || error.description);
            };
            return ErrorFormatter;
        })();
        Common.ErrorFormatter = ErrorFormatter;
    })(VsGraphics.Common || (VsGraphics.Common = {}));
    var Common = VsGraphics.Common;
})(VsGraphics || (VsGraphics = {}));
//
// Copyright (C) Microsoft. All rights reserved.
//
var VsGraphics;
(function (VsGraphics) {
    /// <reference path="../Includes.ts" />
    (function (Common) {
        "use strict";

        var FormattingHelpers = (function () {
            function FormattingHelpers() {
            }
            FormattingHelpers.getPrettyPrintSize = function (bytes, includeSign) {
                if (typeof includeSign === "undefined") { includeSign = false; }
                var size = 0;
                var unitAbbreviation;

                if (Math.abs(bytes) > (1024 * 1024 * 1024)) {
                    size = bytes / (1024 * 1024 * 1024);
                    unitAbbreviation = Microsoft.Plugin.Resources.getString("GigabyteUnits");
                } else if (Math.abs(bytes) > (1024 * 1024)) {
                    size = bytes / (1024 * 1024);
                    unitAbbreviation = Microsoft.Plugin.Resources.getString("MegabyteUnits");
                } else if (Math.abs(bytes) > 1024) {
                    size = bytes / 1024;
                    unitAbbreviation = Microsoft.Plugin.Resources.getString("KilobyteUnits");
                } else {
                    size = bytes;
                    unitAbbreviation = Microsoft.Plugin.Resources.getString("ByteUnits");
                }

                return FormattingHelpers.getDecimalLocaleString(parseFloat(size.toFixed(2)), true, includeSign) + " " + unitAbbreviation;
            };

            FormattingHelpers.zeroPad = function (stringToPad, newLength, padLeft) {
                for (var i = stringToPad.length; i < newLength; i++) {
                    stringToPad = (padLeft ? ("0" + stringToPad) : (stringToPad + "0"));
                }
                return stringToPad;
            };

            FormattingHelpers.forceNumberSign = function (numberToConvert, positive) {
                var nf = Microsoft.Plugin.Culture.NumberFormat;
                if (!nf) {
                    nf = {
                        positiveSign: "+",
                        negativeSign: "-"
                    };
                }

                if (positive === true) {
                    return nf.positiveSign + numberToConvert;
                }
                return nf.negativeSign + numberToConvert;
            };

            // Trims a long string to the format {1-17}...{last 17} characters - mimicking Visual Studio tabs.
            FormattingHelpers.trimLongString = function (stringToConvert) {
                var substitutedString = stringToConvert;

                var maxStringLength = 38;

                if (stringToConvert.length > maxStringLength) {
                    var substrLength = (maxStringLength / 2) - 2;

                    substitutedString = stringToConvert.substr(0, substrLength) + "\u2026" + stringToConvert.substr(-(substrLength));
                }

                return substitutedString;
            };

            FormattingHelpers.getDecimalLocaleString = function (numberToConvert, includeGroupSeparators, includeSign) {
                if (typeof includeSign === "undefined") { includeSign = false; }
                var wasPositive = true;

                if (numberToConvert < 0) {
                    wasPositive = false;
                    numberToConvert = numberToConvert * -1;
                }
                var numberString = numberToConvert.toString();

                // Get any exponent
                var split = numberString.split(/e/i);
                numberString = split[0];
                var exponent = (split.length > 1 ? parseInt(split[1], 10) : 0);

                // Get any decimal place
                split = numberString.split('.');
                numberString = split[0];

                // Get whole value
                var right = split.length > 1 ? split[1] : "";

                if (exponent > 0) {
                    right = FormattingHelpers.zeroPad(right, exponent, false);
                    numberString += right.slice(0, exponent);
                    right = right.substr(exponent);
                } else if (exponent < 0) {
                    exponent = -exponent;
                    numberString = FormattingHelpers.zeroPad(numberString, exponent + 1, true);
                    right = numberString.slice(-exponent, numberString.length) + right;
                    numberString = numberString.slice(0, -exponent);
                }

                // Number format
                var nf = Microsoft.Plugin.Culture.NumberFormat;
                if (!nf) {
                    nf = { numberDecimalSeparator: ".", numberGroupSizes: [3], numberGroupSeparator: "," };
                }
                if (right.length > 0) {
                    right = nf.numberDecimalSeparator + right;
                }

                // Grouping (e.g. 10,000)
                if (includeGroupSeparators === true) {
                    var groupSizes = nf.numberGroupSizes, sep = nf.numberGroupSeparator, curSize = groupSizes[0], curGroupIndex = 1, stringIndex = numberString.length - 1, ret = "";

                    while (stringIndex >= 0) {
                        if (curSize === 0 || curSize > stringIndex) {
                            if (ret.length > 0) {
                                numberString = numberString.slice(0, stringIndex + 1) + sep + ret + right;
                            } else {
                                numberString = numberString.slice(0, stringIndex + 1) + right;
                            }

                            if (includeSign) {
                                numberString = FormattingHelpers.forceNumberSign(numberString, wasPositive);
                            }

                            return numberString;
                        }
                        if (ret.length > 0) {
                            ret = numberString.slice(stringIndex - curSize + 1, stringIndex + 1) + sep + ret;
                        } else {
                            ret = numberString.slice(stringIndex - curSize + 1, stringIndex + 1);
                        }
                        stringIndex -= curSize;
                        if (curGroupIndex < groupSizes.length) {
                            curSize = groupSizes[curGroupIndex];
                            curGroupIndex++;
                        }
                    }

                    numberString = numberString.slice(0, stringIndex + 1) + sep + ret + right;

                    if (includeSign) {
                        numberString = FormattingHelpers.forceNumberSign(numberString, wasPositive);
                    }

                    return numberString;
                } else {
                    numberString = numberString + right;

                    if (includeSign) {
                        numberString = FormattingHelpers.forceNumberSign(numberString, wasPositive);
                    }

                    return numberString;
                }
            };

            FormattingHelpers.forceNonBreakingSpaces = function (stringToConvert) {
                var substitutedString = stringToConvert.replace(/\s/g, function (match, pos, originalText) {
                    return "\u00a0";
                });
                return substitutedString;
            };

            FormattingHelpers.getNativeDigitLocaleString = function (stringToConvert) {
                var nf = Microsoft.Plugin.Culture.NumberFormat;
                if (!nf) {
                    nf = {
                        nativeDigits: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
                    };
                }

                var substitutedString = stringToConvert.replace(/\d/g, function (match, pos, originalText) {
                    return (nf.nativeDigits[parseInt(match)]);
                });

                return substitutedString;
            };

            // Simple string formatter, replacing {0},{1}... tokens with passed strings
            FormattingHelpers.stringFormat = function (formatString, values) {
                var formattedString = formatString;

                for (var i = 0; i < values.length; i++) {
                    var formatToken = "{" + i + '}';
                    formattedString = formattedString.replace(formatToken, values[i]);
                }

                return formattedString;
            };
            return FormattingHelpers;
        })();
        Common.FormattingHelpers = FormattingHelpers;
    })(VsGraphics.Common || (VsGraphics.Common = {}));
    var Common = VsGraphics.Common;
})(VsGraphics || (VsGraphics = {}));
//
// Copyright (C) Microsoft. All rights reserved.
//
var VsGraphics;
(function (VsGraphics) {
    /// <reference path="IFrame.d.ts" />
    (function (Capture) {
        "use strict";

        var Frame = (function () {
            function Frame(id) {
                this._id = id;
            }
            Object.defineProperty(Frame.prototype, "id", {
                get: function () {
                    return this._id;
                },
                enumerable: true,
                configurable: true
            });

            Object.defineProperty(Frame.prototype, "timestamp", {
                get: function () {
                    return this._timestamp;
                },
                set: function (time) {
                    this._timestamp = time;
                },
                enumerable: true,
                configurable: true
            });


            Object.defineProperty(Frame.prototype, "startTime", {
                get: function () {
                    return this._startTime;
                },
                set: function (time) {
                    this._startTime = time;
                    if (time > this._endTime) {
                        this._endTime = time;
                    }
                },
                enumerable: true,
                configurable: true
            });


            Object.defineProperty(Frame.prototype, "endTime", {
                get: function () {
                    return this._endTime;
                },
                set: function (time) {
                    this._endTime = time;
                },
                enumerable: true,
                configurable: true
            });


            Object.defineProperty(Frame.prototype, "screenshotFile", {
                get: function () {
                    return this._screenshotFile;
                },
                set: function (filename) {
                    this._screenshotFile = filename;
                },
                enumerable: true,
                configurable: true
            });

            return Frame;
        })();
        Capture.Frame = Frame;
    })(VsGraphics.Capture || (VsGraphics.Capture = {}));
    var Capture = VsGraphics.Capture;
})(VsGraphics || (VsGraphics = {}));
//
// Copyright (C) Microsoft. All rights reserved.
//
var VsGraphics;
(function (VsGraphics) {
    /// <reference path="../../Common/Includes.ts" />
    /// <reference path="../../Common/Controls/templateControl.ts" />
    /// <reference path="../../Common/Util/formattingHelpers.ts" />
    /// <reference path="../../Common/controls/componentModel.ts" />
    /// <reference path="Frame.ts" />
    (function (Capture) {
        "use strict";

        var FrameTileViewModel = (function (_super) {
            __extends(FrameTileViewModel, _super);
            function FrameTileViewModel(summary) {
                _super.call(this);
                this._summary = summary;
            }
            Object.defineProperty(FrameTileViewModel.prototype, "summaryData", {
                get: function () {
                    return this._summary;
                },
                enumerable: true,
                configurable: true
            });

            Object.defineProperty(FrameTileViewModel.prototype, "timeTaken", {
                get: function () {
                    var date = new Date(this._summary.timestamp);
                    return "(" + date.toLocaleTimeString() + ")";
                },
                enumerable: true,
                configurable: true
            });

            Object.defineProperty(FrameTileViewModel.prototype, "enabled", {
                get: function () {
                    return this._enabled;
                },
                set: function (v) {
                    this._enabled = v;
                    this.raisePropertyChanged("enabled");
                },
                enumerable: true,
                configurable: true
            });
            return FrameTileViewModel;
        })(VsGraphics.Common.Controls.ObservableViewModel);
        Capture.FrameTileViewModel = FrameTileViewModel;

        var FrameTileView = (function (_super) {
            __extends(FrameTileView, _super);
            function FrameTileView(controller, model) {
                _super.call(this, "FrameTileTemplate");
                this._controller = controller;
                this._model = model;
                this._frameTile = this.findElement("frameTile");
                this._onDetailsClickHandler = this.onDetailsClick.bind(this);
                this._model.registerPropertyChanged(this);

                this._tileHeader = this.findElement("frameTileHeader");
                this.findElement("seeFrameDetailsButton").innerText = Microsoft.Plugin.Resources.getString("FrameNumberFormat", this._model.summaryData.id);

                if (this._model.summaryData.screenshotFile) {
                    var imgHolder = this.findElement("frameTileImage");
                    imgHolder.addEventListener("dblclick", this._onDetailsClickHandler);
                    imgHolder.src = this._model.summaryData.screenshotFile;
                }

                this.findElement("frameTakenDate").innerText = this._model.timeTaken;
                this._detailsButton = this.findElement("seeFrameDetailsButton");
                this._detailsButton.addEventListener("click", this._onDetailsClickHandler);
                this._detailsButton.addEventListener("keypress", this._onDetailsClickHandler);
                this._detailsDisabled = this.findElement("frameTileTitleDisabled");
                if (this._detailsDisabled != null)
                    this._detailsDisabled.innerText = this._detailsButton.innerText;
            }
            FrameTileView.prototype.onPropertyChanged = function (propertyName) {
                switch (propertyName) {
                    case "enabled":
                        this.updateLinkState();
                        break;
                }
            };

            FrameTileView.prototype.setFocus = function () {
                this._tileHeader.focus();
            };

            FrameTileView.prototype.onDetailsClick = function (e) {
                this._controller.selectFrame(this._model.summaryData.id);
            };

            FrameTileView.prototype.updateLinkState = function () {
                this._detailsButton.disabled = !this._model.enabled;
                var remove;
                var add;

                remove = this._detailsButton.disabled ? this._detailsDisabled : this._detailsButton;
                add = this._detailsButton.disabled ? this._detailsButton : this._detailsDisabled;

                // Show/Hide the plain text instead of the html link
                if (remove != null) {
                    remove.classList.remove("frameTileHidden");
                }
                if (add != null) {
                    add.classList.add("frameTileHidden");
                }
            };
            return FrameTileView;
        })(VsGraphics.Common.Controls.TemplateControl);
        Capture.FrameTileView = FrameTileView;
    })(VsGraphics.Capture || (VsGraphics.Capture = {}));
    var Capture = VsGraphics.Capture;
})(VsGraphics || (VsGraphics = {}));
//
// Copyright (C) Microsoft. All rights reserved.
//
var VsGraphics;
(function (VsGraphics) {
    /// <reference path="../../common/controls/componentModel.ts" />
    /// <reference path="../../common/controls/templateControl.ts" />
    /// <reference path="IView.d.ts" />
    (function (Capture) {
        "use strict";

        var CaptureFrameTask = (function () {
            function CaptureFrameTask(controller, session) {
                this._controller = controller;
                this._session = session;
                this._startedCapture = false;
                this._canCapture = false;
                this._session.addFrameProcessingEventListener(this.onFrameResult.bind(this));
            }
            CaptureFrameTask.prototype.start = function () {
                var _this = this;
                return new Microsoft.Plugin.Promise(function (completed, error) {
                    if (_this._canCapture) {
                        if (!_this.captureFrameInternal()) {
                            if (error) {
                                error(new Error("Frame Not Currently Enabled"));
                            }
                        } else {
                            _this._frameCompleted = completed;
                            _this._frameError = error;
                        }
                    }
                });
            };

            CaptureFrameTask.prototype.setReady = function () {
                this._canCapture = true;
            };

            CaptureFrameTask.prototype.isCompleted = function (message) {
                if (message) {
                    var obj = JSON.parse(message);
                    if (obj.eventName) {
                        if (obj.eventName === "frameData") {
                            if (this._controller.isViewBusy) {
                            }
                        }
                    } else {
                        if (this._controller.isViewBusy) {
                            if (obj.frameResults) {
                                this.onFrameResult(obj);
                            } else {
                                var response = obj;
                            }
                            return true;
                        }
                    }
                }

                return false;
            };

            CaptureFrameTask.prototype.captureFrameInternal = function () {
                if (this._controller.isViewBusy) {
                    return false;
                }

                this._startedCapture = true;
                this._controller.isCapturingFrame = true;
                this._session.startCapture();
                return true;
            };

            CaptureFrameTask.prototype.onFrameResult = function (result) {
                var _this = this;
                if (!result) {
                    throw new Error("<move to resources>: frameAsync ended with no response");
                }

                if (result.succeeded) {
                    result.frames.forEach(function (frame) {
                        _this._controller.addFrame(frame);
                        _this._controller.pendingCaptureCount = _this._controller.pendingCaptureCount == 0 ? 0 : _this._controller.pendingCaptureCount - 1;
                    });
                }

                // Turn off the progress bar
                if (this._controller.pendingCaptureCount == 0) {
                    this._controller.isCapturingFrame = false;

                    if (this._startedCapture) {
                        this._startedCapture = false;
                        this._controller.completedTask(this);
                    }
                }
            };
            return CaptureFrameTask;
        })();
        Capture.CaptureFrameTask = CaptureFrameTask;

        var GetFramesTask = (function () {
            function GetFramesTask(controller, session) {
                this._controller = controller;
                this._session = session;
                this._session.addFrameProcessingEventListener(this.onFrameResult.bind(this));
            }
            GetFramesTask.prototype.start = function () {
                var _this = this;
                return new Microsoft.Plugin.Promise(function (completed, error) {
                    if (!_this.getFramesInternal()) {
                        if (error) {
                            error(new Error("Frame Not Currently Enabled"));
                        }
                    } else {
                        _this._frameCompleted = completed;
                        _this._frameError = error;
                    }
                });
            };

            GetFramesTask.prototype.isCompleted = function (message) {
                if (message) {
                    var obj = JSON.parse(message);
                    if (obj.eventName) {
                        if (obj.eventName === "frameData") {
                            if (this._controller.isViewBusy) {
                            }
                        }
                    } else {
                        if (this._controller.isViewBusy) {
                            if (obj.frameResults) {
                                this.onFrameResult(obj);
                            } else {
                                var response = obj;
                            }
                            return true;
                        }
                    }
                }

                return false;
            };

            GetFramesTask.prototype.getFramesInternal = function () {
                if (this._controller.isViewBusy) {
                    return false;
                }

                this._session.getFrames();
                return true;
            };

            GetFramesTask.prototype.onFrameResult = function (result) {
                var _this = this;
                if (!result) {
                    throw new Error("<move to resources>: frameAsync ended with no response");
                }

                if (result.succeeded) {
                    result.frames.forEach(function (frame) {
                        _this._controller.addFrame(frame);
                    });
                }
            };
            return GetFramesTask;
        })();
        Capture.GetFramesTask = GetFramesTask;

        var SelectFrameTask = (function () {
            function SelectFrameTask(controller, session) {
                this._frame = 0;
                this._controller = controller;
                this._session = session;
            }
            Object.defineProperty(SelectFrameTask.prototype, "frame", {
                get: function () {
                    return this._frame;
                },
                set: function (theFrame) {
                    this._frame = theFrame;
                },
                enumerable: true,
                configurable: true
            });

            SelectFrameTask.prototype.start = function () {
                var _this = this;
                return new Microsoft.Plugin.Promise(function (completed, error) {
                    _this.selectFrameInternal();
                    _this._controller.completedTask(_this);
                });
            };

            SelectFrameTask.prototype.isCompleted = function (message) {
                if (message) {
                    var obj = JSON.parse(message);
                    if (obj.eventName) {
                        if (obj.eventName === "frameData") {
                            if (this._controller.isViewBusy) {
                            }
                        }
                    } else {
                        if (this._controller.isViewBusy) {
                            return true;
                        }
                    }
                }

                return false;
            };

            SelectFrameTask.prototype.selectFrameInternal = function () {
                if (this._controller.isViewBusy) {
                    return false;
                }

                this._session.selectFrame(this._frame);
                return true;
            };
            return SelectFrameTask;
        })();
        Capture.SelectFrameTask = SelectFrameTask;
    })(VsGraphics.Capture || (VsGraphics.Capture = {}));
    var Capture = VsGraphics.Capture;
})(VsGraphics || (VsGraphics = {}));
//
// Copyright (C) Microsoft. All rights reserved.
//
var VsGraphics;
(function (VsGraphics) {
    /// <reference path="../../Common/Includes.ts" />
    /// <reference path="../../common/controls/componentModel.ts" />
    /// <reference path="../../common/controls/templateControl.ts" />
    /// <reference path="../../common/util/EnumHelper.ts" />
    /// <reference path="../../common/util/errorFormatter.ts" />
    /// <reference path="frameTileView.ts" />
    /// <reference path="ViewTasks.ts" />
    (function (Capture) {
        "use strict";

        var ViewBaseController = (function () {
            function ViewBaseController(session, initializeView) {
                if (typeof initializeView === "undefined") { initializeView = true; }
                var _this = this;
                this._screenshotHeight = 150;
                this._screenshotKeepAspectRatio = true;
                this._screenshotWidth = 200;
                // This is the guid of GpuProfilingAgent
                this._agentGuid = new Microsoft.VisualStudio.DiagnosticsHub.Guid("9e5de5fb-d655-401a-86a8-5764c252744d");
                this._activeCollectionAgentTasks = [];
                this.model = new ViewModel();

                // Note: it's up to derived classes to initialize the view.
                var receiver = function (args) {
                    _this.onMessageReceived(args);
                };
                this._standardCollector = Microsoft.VisualStudio.DiagnosticsHub.Collectors.getStandardTransportService();
                if (this._standardCollector) {
                    this._standardCollector.addMessageListener(this._agentGuid, receiver);
                }

                this._selectFrameTask = new Capture.SelectFrameTask(this, session);
            }
            Object.defineProperty(ViewBaseController.prototype, "isCollectionAgentTaskActive", {
                get: function () {
                    return this._activeCollectionAgentTasks.length > 0;
                },
                enumerable: true,
                configurable: true
            });

            Object.defineProperty(ViewBaseController.prototype, "isViewBusy", {
                get: function () {
                    return this.model.isViewBusy;
                },
                enumerable: true,
                configurable: true
            });

            Object.defineProperty(ViewBaseController.prototype, "isCapturingFrame", {
                get: function () {
                    return this.model.isCapturingFrame;
                },
                set: function (val) {
                    this.model.isCapturingFrame = val;
                },
                enumerable: true,
                configurable: true
            });

            Object.defineProperty(ViewBaseController.prototype, "pendingCaptureCount", {
                get: function () {
                    return this.model.pendingCaptureCount;
                },
                set: function (val) {
                    this.model.pendingCaptureCount = val;
                },
                enumerable: true,
                configurable: true
            });



            ViewBaseController.prototype.addTask = function (task) {
                this._activeCollectionAgentTasks.push(task);
            };

            ViewBaseController.prototype.selectFrame = function (frame) {
                this._activeCollectionAgentTasks.push(this._selectFrameTask);
                this._selectFrameTask.frame = frame;
                return this._selectFrameTask.start();
            };

            ViewBaseController.prototype.addFrame = function (frame) {
                ViewBaseController._nextIdentifier++;
                this.model.frameSummaryCollection.add(frame);
            };

            ViewBaseController.prototype.reset = function () {
                ViewBaseController._nextIdentifier = 1;
                this.model.frameSummaryCollection.clear();

                Capture.s_ViewHost.onIdle();
            };
            ViewBaseController.prototype.sendStringToCollectionAgent = function (request) {
                return this._standardCollector.sendStringToCollectionAgent(this._agentGuid.toString(), request);
            };

            ViewBaseController.prototype.downloadFile = function (targetFilePath, localFilePath) {
                var transportService = Microsoft.VisualStudio.DiagnosticsHub.Collectors.getStandardTransportService();
                return transportService.downloadFile(targetFilePath, localFilePath);
            };

            ViewBaseController.prototype.onMessageReceived = function (message) {
                if (message) {
                    try  {
                        var obj = JSON.parse(message);
                    } catch (e) {
                        // If we get a non-JSON message here just ignore it
                        return;
                    }
                    if (obj.eventName) {
                        switch (obj.eventName) {
                            default:
                                break;
                        }
                    }
                }

                for (var i = this._activeCollectionAgentTasks.length - 1; i >= 0; i--) {
                    if (this._activeCollectionAgentTasks[i].isCompleted(message)) {
                        this._activeCollectionAgentTasks.splice(i, 1);
                    }
                }
            };

            ViewBaseController.prototype.completedTask = function (task) {
                var i = this._activeCollectionAgentTasks.indexOf(task);
                if (i >= 0)
                    this._activeCollectionAgentTasks.splice(i, 1);
            };

            ViewBaseController.prototype.sendMessage = function (message) {
                this._standardCollector.sendStringToCollectionAgent(this._agentGuid.toString(), message).done(function (response) {
                    if (response) {
                        var obj = JSON.parse(response);
                        if (!obj.succeeded) {
                            throw new Error(obj.errorMessage);
                        }
                    }
                });
            };
            ViewBaseController._frameChunkSize = 32768;
            ViewBaseController._nextIdentifier = 1;
            return ViewBaseController;
        })();
        Capture.ViewBaseController = ViewBaseController;

        var ViewModel = (function (_super) {
            __extends(ViewModel, _super);
            function ViewModel() {
                _super.call(this);
                this._warningMessage = "";
                this._latestFrameError = null;
                this._isCapturingFrame = false;
                this._pendingCaptureCount = 0;
                this._frameSummaryCollection = new VsGraphics.Common.Controls.ObservableCollection();
            }
            Object.defineProperty(ViewModel.prototype, "frameSummaryCollection", {
                get: function () {
                    return this._frameSummaryCollection;
                },
                enumerable: true,
                configurable: true
            });

            Object.defineProperty(ViewModel.prototype, "warningMessage", {
                get: function () {
                    return this._warningMessage;
                },
                set: function (v) {
                    if (this._warningMessage !== v) {
                        this._warningMessage = v;
                        this.raisePropertyChanged("warningMessage");
                    }
                },
                enumerable: true,
                configurable: true
            });

            Object.defineProperty(ViewModel.prototype, "latestFrameError", {
                get: function () {
                    return this._latestFrameError;
                },
                set: function (v) {
                    if (this._latestFrameError !== v) {
                        this._latestFrameError = v;
                        this.raisePropertyChanged("latestFrameError");

                        // Create the WER
                        Capture.s_ViewHost.reportError(v, "FrameCapturingFailure");
                    }
                },
                enumerable: true,
                configurable: true
            });

            Object.defineProperty(ViewModel.prototype, "isCapturingFrame", {
                get: function () {
                    return this._isCapturingFrame;
                },
                set: function (v) {
                    if (this._isCapturingFrame !== v) {
                        this._isCapturingFrame = v;
                        this.raisePropertyChanged("isCapturingFrame");
                        this.raisePropertyChanged("isViewBusy");
                    }
                },
                enumerable: true,
                configurable: true
            });

            Object.defineProperty(ViewModel.prototype, "pendingCaptureCount", {
                get: function () {
                    return this._pendingCaptureCount;
                },
                set: function (val) {
                    if (this._pendingCaptureCount !== val) {
                        this._pendingCaptureCount = val;
                        this.raisePropertyChanged("pendingCaptureCount");
                    }
                },
                enumerable: true,
                configurable: true
            });


            Object.defineProperty(ViewModel.prototype, "isViewBusy", {
                get: function () {
                    return this._isCapturingFrame;
                },
                enumerable: true,
                configurable: true
            });
            return ViewModel;
        })(VsGraphics.Common.Controls.ObservableViewModel);
        Capture.ViewModel = ViewModel;
        var View = (function (_super) {
            __extends(View, _super);
            function View(controller, model, template) {
                _super.call(this, template);

                this.controller = controller;
                this.model = model;

                this.model.registerPropertyChanged(this);
                this.model.frameSummaryCollection.registerCollectionChanged(this);

                this._frameTileViewModelCollection = [];

                this.tilesContainer = this.findElement("tilesContainer");
                this._warningSection = this.findElement("warningSection");
            }
            Object.defineProperty(View.prototype, "frameTileViewModelCollection", {
                get: function () {
                    return this._frameTileViewModelCollection;
                },
                enumerable: true,
                configurable: true
            });

            View.prototype.onPropertyChanged = function (propertyName) {
                switch (propertyName) {
                    case "warningMessage":
                        this.showWarningMessage(this.model.warningMessage);
                        break;
                }
            };

            View.prototype.onCollectionChanged = function (eventArgs) {
                switch (eventArgs.action) {
                    case 0 /* Add */:
                        this.createTile(eventArgs.newItems[0]);
                        break;
                    case 1 /* Reset */:
                        this.removeFrameTiles();
                        break;
                }
            };

            View.prototype.removeFrameTiles = function () {
                this._frameTileViewModelCollection = [];
            };

            View.prototype.insertFrameTile = function (tile) {
                // Default is to just append
                this.tilesContainer.appendChild(tile.rootElement);
            };

            View.prototype.createTile = function (frameSummary) {
                // Create the model and the view
                var model = new Capture.FrameTileViewModel(frameSummary);
                var newTile = new Capture.FrameTileView(this.controller, model);
                this._frameTileViewModelCollection.push(model);

                // Turn off links if we are busy right now
                model.enabled = !this.model.isViewBusy;

                // Call our overload to insert the tile
                this.insertFrameTile(newTile);
            };

            View.prototype.showWarningMessage = function (warning) {
                if (!this._warningSection) {
                    return;
                }

                if (warning) {
                    this._warningSection.innerHTML = warning;
                    this._warningSection.style.display = "inline";
                } else {
                    this._warningSection.innerHTML = "";
                    this._warningSection.style.display = "none";
                }
            };
            return View;
        })(VsGraphics.Common.Controls.TemplateControl);
        Capture.View = View;
    })(VsGraphics.Capture || (VsGraphics.Capture = {}));
    var Capture = VsGraphics.Capture;
})(VsGraphics || (VsGraphics = {}));
//
// Copyright (C) Microsoft. All rights reserved.
//
var VsGraphics;
(function (VsGraphics) {
    /// <reference path="../../Common/Includes.ts" />
    /// <reference path="IFrame.d.ts" />
    (function (Capture) {
        "use strict";

        //
        // HostSessionProxy provides access to the Session which is implemented in the host
        //
        var HostSessionProxy = (function () {
            function HostSessionProxy() {
                this._sessionProxy = Microsoft.Plugin.Utilities.JSONMarshaler.attachToPublishedObject("GpuCapture.GpuCaptureSession", {}, true);
            }
            HostSessionProxy.prototype.addViewTypeEventListener = function (callback) {
                this._sessionProxy.addEventListener("viewtypechange", callback);
            };

            HostSessionProxy.prototype.getSessionInfo = function () {
                return this._sessionProxy._call("getSessionInfo");
            };

            HostSessionProxy.prototype.openFrameDetails = function (frameIndex, targetView) {
                return this._sessionProxy._call("openFrameDetails", frameIndex, targetView);
            };

            HostSessionProxy.prototype.getTempFilename = function (baseName) {
                return this._sessionProxy._call("getTempFilename", baseName);
            };

            HostSessionProxy.prototype.save = function () {
                return this._sessionProxy._call("save");
            };

            HostSessionProxy.prototype.addFrameProcessingEventListener = function (callback) {
                this._sessionProxy.addEventListener("frameProcessingComplete", callback);
            };

            HostSessionProxy.prototype.getFrameProcessingResults = function () {
                return this._sessionProxy._call("getFrameProcessingResults");
            };

            HostSessionProxy.prototype.getSessionStartupTime = function () {
                return this._sessionProxy._call("getSessionStartupTime");
            };

            HostSessionProxy.prototype.logCommandUsage = function (commandName, invokeMethod, source) {
                return this._sessionProxy._call("logCommandUsage", commandName, invokeMethod, source);
            };

            HostSessionProxy.prototype.logBeginLoadFrames = function () {
                return this._sessionProxy._call("logBeginLoadFrames");
            };

            HostSessionProxy.prototype.logEndLoadFrames = function () {
                return this._sessionProxy._call("logEndLoadFrames");
            };

            HostSessionProxy.prototype.setScriptedContextId = function (scriptedContextId) {
                return this._sessionProxy._call("setScriptedContextId", scriptedContextId);
            };

            HostSessionProxy.prototype.updateDetailsViewSetting = function (settingName, newValue) {
                return this._sessionProxy._call("updateDetailsViewSetting", settingName, newValue);
            };

            HostSessionProxy.prototype.startCapture = function () {
                return this._sessionProxy._call("startCapture");
            };

            HostSessionProxy.prototype.selectFrame = function (frame) {
                return this._sessionProxy._call("selectFrame", frame);
            };

            HostSessionProxy.prototype.getFrames = function () {
                return this._sessionProxy._call("getFrames");
            };

            HostSessionProxy.prototype.addFrameCaptureBeginEventListener = function (callback) {
                this._sessionProxy.addEventListener("frameCaptureBegin", callback);
            };

            HostSessionProxy.prototype.addReadyToCaptureEventListener = function (callback) {
                this._sessionProxy.addEventListener("readyToCapture", callback);
            };
            return HostSessionProxy;
        })();
        Capture.HostSessionProxy = HostSessionProxy;
    })(VsGraphics.Capture || (VsGraphics.Capture = {}));
    var Capture = VsGraphics.Capture;
})(VsGraphics || (VsGraphics = {}));
//
// Copyright (C) Microsoft. All rights reserved.
//
var VsGraphics;
(function (VsGraphics) {
    /// <reference path="../../Common/Includes.ts" />
    /// <reference path="Session.ts" />
    /// <reference path="../../Common/controls/control.ts" />
    (function (Capture) {
        "use strict";

        var ViewHostBase = (function () {
            function ViewHostBase() {
                this._openCodeMarkers = {};
                Capture.s_ViewHost = this;
            }
            Object.defineProperty(ViewHostBase.prototype, "session", {
                get: function () {
                    return this._session;
                },
                enumerable: true,
                configurable: true
            });

            ViewHostBase.prototype.loadView = function () {
                var _this = this;
                Microsoft.Plugin.addEventListener("pluginready", function () {
                    var session;

                    Microsoft.Plugin.Tooltip.defaultTooltipContentToHTML = false;

                    session = new Capture.HostSessionProxy();

                    _this._session = session;

                    _this.initializeErrorReporting();

                    Microsoft.Plugin.addEventListener("close", _this.onClose);

                    session.getSessionInfo().done(function (sessionInfo) {
                        _this.initializeView(sessionInfo);
                        _this.onIdle();
                    });
                });
            };

            ViewHostBase.prototype.initializeErrorReporting = function () {
                var _this = this;
                // Stop reporting errors to the WER service
                window.onerror = function (e, url, line) {
                    // There is actually a 4th argument, for column - but the Typescript stubs aren't updated
                    var column;
                    if (arguments && arguments[3] && typeof arguments[3] === 'number') {
                        column = arguments[3];
                    }

                    _this.reportError(new Error(e), "Unhandled Error", url, line, column);
                    return true;
                };
            };

            ViewHostBase.prototype.onIdle = function () {
                //Plugin.VS.Internal.CodeMarkers.fire(CodeMarkerValues.perfBrowserTools_MemoryProfilerIdle);
            };

            ViewHostBase.prototype.reportError = function (error, additionalInfo, source, line, column) {
                // Depending on the source, the error object will be different
                var message = (error.message || error.description);
                var url = source || "VsGraphics.Capture";
                var lineNumber = line || 0;
                var columnNumber = column || 0;

                var errorInfo = "Error description:  " + message;

                if (error.number) {
                    errorInfo += "\r\nError number:  " + error.number;
                }

                if (source) {
                    errorInfo += "\r\nSource:  " + source;
                }

                if (error.stack) {
                    var stack = error.stack;
                    errorInfo += "\r\nError stack:  " + stack;

                    // Find message if we dont have one already
                    if (!message) {
                        var index = stack.indexOf("\n");
                        if (index > 0) {
                            index = Math.min(index, 50);
                            message = stack.substring(0, index);
                        }
                    }

                    // Find url
                    if (typeof source === "undefined") {
                        var matchInfo = stack.match(/(file|res):?([^)]+)\)/);
                        if (matchInfo && matchInfo.length > 2) {
                            url = matchInfo[2];
                        }
                    }

                    // Find line number
                    if (typeof line === "undefined") {
                        matchInfo = stack.match(/line ?(\d+)/);
                        if (!matchInfo || matchInfo.length <= 1) {
                            matchInfo = stack.match(/js:?(\d+):/);
                        }
                        if (matchInfo && matchInfo.length > 1) {
                            lineNumber = parseInt(matchInfo[1]);
                        }
                    }
                }

                if (additionalInfo) {
                    errorInfo += "\r\nAdditional Info:  " + additionalInfo;
                }

                Microsoft.Plugin.Diagnostics.reportError(message, url, lineNumber, errorInfo, columnNumber);
            };

            ViewHostBase.prototype.onClose = function () {
                //Plugin.VS.Internal.CodeMarkers.fire(CodeMarkerValues.perfBrowserTools_MemoryProfilerWindowClose);
            };

            ViewHostBase.prototype.initializeView = function (sessionInfo) {
                // Nothing here. The subclasses override it.
            };
            return ViewHostBase;
        })();
        Capture.ViewHostBase = ViewHostBase;
        Capture.s_ViewHost;
    })(VsGraphics.Capture || (VsGraphics.Capture = {}));
    var Capture = VsGraphics.Capture;
})(VsGraphics || (VsGraphics = {}));
//
// Copyright (C) Microsoft. All rights reserved.
//
var VsGraphics;
(function (VsGraphics) {
    /// <reference path="../../Common/Includes.ts" />
    /// <reference path="../../common/controls/componentModel.ts" />
    /// <reference path="../../common/controls/templateControl.ts" />
    /// <reference path="../../common/util/EnumHelper.ts" />
    /// <reference path="../../common/util/errorFormatter.ts" />
    /// <reference path="frameTileView.ts" />
    /// <reference path="ViewHostBase.ts" />
    /// <reference path="ViewTasks.ts" />
    /// <reference path="IView.d.ts" />
    /// <reference path="ViewBase.ts" />
    (function (Capture) {
        "use strict";

        var AnalysisViewController = (function (_super) {
            __extends(AnalysisViewController, _super);
            function AnalysisViewController(session, initializeView) {
                if (typeof initializeView === "undefined") { initializeView = true; }
                _super.call(this, session, initializeView);

                if (initializeView) {
                    this.view = new AnalysisView(this, this.model);
                }

                // Kick off a task to gather the current list of frames
                var task = new Capture.GetFramesTask(this, session);
                _super.prototype.addTask.call(this, task);
                task.start();
            }
            return AnalysisViewController;
        })(Capture.ViewBaseController);
        Capture.AnalysisViewController = AnalysisViewController;

        var AnalysisView = (function (_super) {
            __extends(AnalysisView, _super);
            function AnalysisView(controller, model) {
                _super.call(this, controller, model, "AnalysisViewTemplate");
            }
            return AnalysisView;
        })(Capture.View);
        Capture.AnalysisView = AnalysisView;
    })(VsGraphics.Capture || (VsGraphics.Capture = {}));
    var Capture = VsGraphics.Capture;
})(VsGraphics || (VsGraphics = {}));
//
// Copyright (C) Microsoft. All rights reserved.
//
var VsGraphics;
(function (VsGraphics) {
    /// <reference path="../../Common/Includes.ts" />
    /// <reference path="../../common/controls/componentModel.ts" />
    /// <reference path="../../common/controls/templateControl.ts" />
    /// <reference path="../../common/util/EnumHelper.ts" />
    /// <reference path="../../common/util/errorFormatter.ts" />
    /// <reference path="frameTileView.ts" />
    /// <reference path="ViewHostBase.ts" />
    /// <reference path="ViewTasks.ts" />
    /// <reference path="IView.d.ts" />
    /// <reference path="ViewBase.ts" />
    (function (Capture) {
        "use strict";

        var CollectionViewController = (function (_super) {
            __extends(CollectionViewController, _super);
            function CollectionViewController(session, initializeView) {
                if (typeof initializeView === "undefined") { initializeView = true; }
                _super.call(this, session, initializeView);

                if (initializeView) {
                    this.view = new CollectionView(this, this.model);
                }

                this._captureFrameTask = new Capture.CaptureFrameTask(this, session);
            }
            CollectionViewController.prototype.captureFrame = function () {
                _super.prototype.addTask.call(this, this._captureFrameTask);
                return this._captureFrameTask.start();
            };

            CollectionViewController.prototype.readyToCapture = function () {
                this._captureFrameTask.setReady();
            };
            return CollectionViewController;
        })(Capture.ViewBaseController);
        Capture.CollectionViewController = CollectionViewController;

        var CollectionView = (function (_super) {
            __extends(CollectionView, _super);
            function CollectionView(controller, model) {
                _super.call(this, controller, model, "CollectionViewTemplate");

                this._controller = controller;
                this._onFrameClickHandler = this.onFrameClick.bind(this);

                this._captureFrameTile = this.findElement("captureFrameTile");

                this._frameProgress = this.findElement("captureFrameProgress");
                this._frameButton = this.findElement("captureFrameButton");
                this._frameLabel = this.findElement("captureFrameLabel");
                this._frameIcon = this.findElement("captureFrameIcon");

                this._frameLabel.innerText = Microsoft.Plugin.Resources.getString("CaptureFrame");
                this._frameProgress.innerText = Microsoft.Plugin.Resources.getString("Loading");
                this.toggleProgress(controller.isViewBusy);
                this.updateCaptureFrameButton();
                this._captureFrameTile.addEventListener("click", this._onFrameClickHandler);
                this._captureFrameTile.addEventListener("keypress", this._onFrameClickHandler);

                // Support the "active" state. We can't use the :active pseudostate because it only works
                // on buttons
                this._captureFrameTile.onmousedown = function () {
                    this._captureFrameTile.classList.add("active");
                }.bind(this);
                this._captureFrameTile.onmouseup = function () {
                    this._captureFrameTile.classList.remove("active");
                }.bind(this);
                this._captureFrameTile.onmouseleave = function () {
                    this._captureFrameTile.classList.remove("active");
                }.bind(this);
            }
            CollectionView.prototype.onPropertyChanged = function (propertyName) {
                _super.prototype.onPropertyChanged.call(this, propertyName);

                switch (propertyName) {
                    case "isCapturingFrame":
                        this.toggleProgress(this.controller.isViewBusy);
                        this.updateCaptureFrameButton();
                        this.updateFrameAnalyzeButtons();
                        break;
                }
            };

            CollectionView.prototype.removeFrameTiles = function () {
                while (this.tilesContainer.hasChildNodes()) {
                    this.tilesContainer.removeChild(this.tilesContainer.firstChild);
                }

                this.tilesContainer.appendChild(this._captureFrameTile);

                _super.prototype.removeFrameTiles.call(this);
            };

            CollectionView.prototype.insertFrameTile = function (tile) {
                // For collection, we want to insert tiles before the capture frame tile
                this.tilesContainer.insertBefore(tile.rootElement, this._captureFrameTile);

                // Then make sure the capture frame tile stays visible
                this._captureFrameTile.scrollIntoView(true);

                // Give focus to the new tile so it leaves the capture frame tile
                tile.setFocus();
            };

            CollectionView.prototype.toggleProgress = function (show) {
                if (this._frameProgress) {
                    if (show) {
                        this._frameLabel.style.display = "none";
                        this._frameIcon.style.display = "none";
                        this._frameProgress.style.display = "block";
                        this._frameButton.style.display = "none";
                        this._frameButton.setAttribute("aria-label", Microsoft.Plugin.Resources.getString("Loading"));
                    } else {
                        this._frameLabel.style.display = "";
                        this._frameIcon.style.display = "";
                        this._frameProgress.style.display = "none";
                        this._frameButton.style.display = "block";
                        this._frameButton.setAttribute("aria-label", Microsoft.Plugin.Resources.getString("CaptureFrame"));
                    }
                }
            };

            CollectionView.prototype.onFrameClick = function (e) {
                this._controller.captureFrame();
            };

            CollectionView.prototype.updateCaptureFrameButton = function () {
                if (this._frameButton) {
                    if (!this.model.isViewBusy) {
                        this._frameButton.classList.remove("disabled");
                        this._frameButton.disabled = false;
                    } else {
                        this._frameButton.disabled = true;
                    }
                }
            };

            CollectionView.prototype.updateFrameAnalyzeButtons = function () {
                var _this = this;
                this.frameTileViewModelCollection.forEach(function (m) {
                    m.enabled = !_this.model.isViewBusy; // Should fire a property changed event that will cause the link to disable itself
                });
            };
            return CollectionView;
        })(Capture.View);
        Capture.CollectionView = CollectionView;
    })(VsGraphics.Capture || (VsGraphics.Capture = {}));
    var Capture = VsGraphics.Capture;
})(VsGraphics || (VsGraphics = {}));
//
// Copyright (C) Microsoft. All rights reserved.
//
var VsGraphics;
(function (VsGraphics) {
    /// <reference path="../../Common/Includes.ts" />
    /// <reference path="Session.ts" />
    /// <reference path="../../Common/controls/control.ts" />
    /// <reference path="../../Common/controls/componentModel.ts" />
    /// <reference path="ViewHostBase.ts" />
    /// <reference path="AnalysisView.ts" />
    (function (Capture) {
        "use strict";

        var AnalysisViewHost = (function (_super) {
            __extends(AnalysisViewHost, _super);
            function AnalysisViewHost() {
                _super.call(this);
            }
            AnalysisViewHost.prototype.onPropertyChanged = function (propertyName) {
            };

            AnalysisViewHost.prototype.initializeView = function (sessionInfo) {
                this.viewController = new Capture.AnalysisViewController(this.session);
                var mainContainer = document.getElementById('mainContainer');
                mainContainer.appendChild(this.viewController.view.rootElement);

                this.viewController.model.registerPropertyChanged(this);
                this.initCommands();
            };

            AnalysisViewHost.prototype.initCommands = function () {
            };
            return AnalysisViewHost;
        })(Capture.ViewHostBase);
        Capture.AnalysisViewHost = AnalysisViewHost;

        Capture.AnalysisViewHostInstance = new AnalysisViewHost();
    })(VsGraphics.Capture || (VsGraphics.Capture = {}));
    var Capture = VsGraphics.Capture;
})(VsGraphics || (VsGraphics = {}));
//
// Copyright (C) Microsoft. All rights reserved.
//
var VsGraphics;
(function (VsGraphics) {
    /// <reference path="../../Common/Includes.ts" />
    /// <reference path="../../Common/controls/componentModel.ts" />
    /// <reference path="CollectionViewHost.ts" />
    (function (Capture) {
        "use strict";

        var DynamicVsPluginCommandBase = (function () {
            function DynamicVsPluginCommandBase(host, commandBinding) {
                this._commandBinding = commandBinding;
                this._host = host;
            }
            DynamicVsPluginCommandBase.prototype.setNext = function (nextCommand) {
                this._nextCommand = nextCommand;
            };

            DynamicVsPluginCommandBase.prototype.onCollectionFinishing = function () {
                this.updateCommandButton(false, this._commandBinding._visible);

                if (this._nextCommand) {
                    this._nextCommand.onCollectionFinishing();
                }
            };

            DynamicVsPluginCommandBase.prototype.onTargetIsManaged = function () {
                if (this._nextCommand) {
                    this._nextCommand.onTargetIsManaged();
                }
            };

            DynamicVsPluginCommandBase.prototype.onPropertyChanged = function (propertyName) {
                if (propertyName === "isViewBusy") {
                    this.updateCommandButton(!this._host.collectionViewController.model.isViewBusy, this._commandBinding._visible);
                }

                if (this._nextCommand) {
                    this._nextCommand.onPropertyChanged(propertyName);
                }
            };

            DynamicVsPluginCommandBase.prototype.onClose = function () {
                this.updateCommandButton(false, false);

                if (this._nextCommand) {
                    this._nextCommand.onClose();
                }
            };

            /* protected */ DynamicVsPluginCommandBase.prototype.updateCommandButton = function (shouldEnable, shouldDisplay) {
                if (Microsoft.Plugin.VS && Microsoft.Plugin.VS.Commands) {
                    Microsoft.Plugin.VS.Commands.setStates({
                        command: this._commandBinding,
                        enabled: shouldEnable,
                        visible: shouldDisplay
                    });
                }
            };
            return DynamicVsPluginCommandBase;
        })();
        Capture.DynamicVsPluginCommandBase = DynamicVsPluginCommandBase;

        var CaptureFrameVsCommand = (function (_super) {
            __extends(CaptureFrameVsCommand, _super);
            function CaptureFrameVsCommand(host) {
                this._host = host;
                var captureFrameCommand = Microsoft.Plugin.VS.Commands.bindCommand({
                    name: "captureframecommand",
                    onexecute: this.execute.bind(this),
                    enabled: !host.collectionViewController.model.isViewBusy,
                    visible: true
                });

                _super.call(this, host, captureFrameCommand);
            }
            CaptureFrameVsCommand.prototype.execute = function () {
                this._host.collectionViewController.captureFrame();
            };
            return CaptureFrameVsCommand;
        })(DynamicVsPluginCommandBase);
        Capture.CaptureFrameVsCommand = CaptureFrameVsCommand;

        var CaptureNumberFramesVsCommand = (function (_super) {
            __extends(CaptureNumberFramesVsCommand, _super);
            function CaptureNumberFramesVsCommand(host) {
                this._host = host;
                var captureNumberFramesCommand = Microsoft.Plugin.VS.Commands.bindCommand({
                    name: "capturenumberframescommand",
                    onexecute: this.execute.bind(this),
                    enabled: true,
                    visible: true
                });

                _super.call(this, host, captureNumberFramesCommand);
            }
            CaptureNumberFramesVsCommand.prototype.execute = function () {
                this._host.collectionViewController.captureFrame();
            };
            return CaptureNumberFramesVsCommand;
        })(DynamicVsPluginCommandBase);
        Capture.CaptureNumberFramesVsCommand = CaptureNumberFramesVsCommand;
    })(VsGraphics.Capture || (VsGraphics.Capture = {}));
    var Capture = VsGraphics.Capture;
})(VsGraphics || (VsGraphics = {}));
//
// Copyright (C) Microsoft. All rights reserved.
//
var VsGraphics;
(function (VsGraphics) {
    /// <reference path="../../Common/Includes.ts" />
    /// <reference path="Session.ts" />
    /// <reference path="../../Common/controls/control.ts" />
    /// <reference path="../../Common/controls/componentModel.ts" />
    /// <reference path="ViewHostBase.ts" />
    /// <reference path="CollectionView.ts" />
    /// <reference path="VsPluginCommandHelper.ts" />
    (function (Capture) {
        "use strict";

        var CollectionViewHost = (function (_super) {
            __extends(CollectionViewHost, _super);
            function CollectionViewHost() {
                _super.call(this);
            }
            CollectionViewHost.prototype.sessionStateChanged = function (eventArgs) {
                var currentState = eventArgs.currentState;
                switch (currentState) {
                    case 400 /* CollectionFinishing */:
                        CollectionViewHost.VsCommandChain.onCollectionFinishing();
                        break;
                    case 500 /* CollectionFinished */:
                        Microsoft.VisualStudio.DiagnosticsHub.getCurrentSession().removeStateChangedEventListener(this.sessionStateChanged);

                        // Have session persist our session metadata now
                        var eventCompleteDeferral = eventArgs.getDeferral();

                        var onSaveCompleted = function (value) {
                            eventCompleteDeferral.complete();
                        };

                        this.session.save().done(onSaveCompleted);
                        break;
                }
            };

            CollectionViewHost.prototype.onPropertyChanged = function (propertyName) {
                CollectionViewHost.VsCommandChain.onPropertyChanged(propertyName);
            };

            CollectionViewHost.prototype.initializeView = function (sessionInfo) {
                this.collectionViewController = new Capture.CollectionViewController(this.session);
                var mainContainer = document.getElementById('mainContainer');
                mainContainer.appendChild(this.collectionViewController.view.rootElement);

                this.collectionViewController.model.registerPropertyChanged(this);
                Microsoft.VisualStudio.DiagnosticsHub.getCurrentSession().addStateChangedEventListener(this.sessionStateChanged.bind(this));
                Microsoft.Plugin.addEventListener("close", function () {
                    CollectionViewHost.VsCommandChain.onClose();
                });

                this.session.addFrameCaptureBeginEventListener(this.onCaptureBegin.bind(this));
                this.session.addReadyToCaptureEventListener(this.onReadyToCapture.bind(this));

                this.initCommands();
            };

            CollectionViewHost.prototype.initCommands = function () {
                if (Microsoft.Plugin.VS && Microsoft.Plugin.VS.Commands) {
                    var captureFrameCommand = new Capture.CaptureFrameVsCommand(this);
                    var captureNumberFramesCommand = new Capture.CaptureNumberFramesVsCommand(this);
                    captureFrameCommand.setNext(captureNumberFramesCommand);
                    CollectionViewHost.VsCommandChain = captureFrameCommand;
                }
            };

            CollectionViewHost.prototype.onCaptureBegin = function (result) {
                if (!result) {
                    throw new Error("<move to resources>: frameAsync ended with no response");
                }

                // Indicate we are capturing
                this.collectionViewController.isCapturingFrame = true;
                this.collectionViewController.pendingCaptureCount = result.numberOfFrames;
            };

            CollectionViewHost.prototype.onReadyToCapture = function (result) {
                if (!result) {
                    throw new Error("<move to resources>: frameAsync ended with no response");
                }

                // Indicate we are ready to capture
                this.collectionViewController.readyToCapture();
            };
            return CollectionViewHost;
        })(Capture.ViewHostBase);
        Capture.CollectionViewHost = CollectionViewHost;

        Capture.CollectionViewHostInstance = new CollectionViewHost();
    })(VsGraphics.Capture || (VsGraphics.Capture = {}));
    var Capture = VsGraphics.Capture;
})(VsGraphics || (VsGraphics = {}));
/// <reference path="..\Common\Includes.ts" />
var Microsoft;
(function (Microsoft) {
    (function (GpuProfiling) {
        var GpuProfilingDetailsControl = (function () {
            function GpuProfilingDetailsControl(config) {
                // View activation
                this._isActive = false;
                // Data warehouse
                this._dataWarehouse = null;
                // Local fields
                this._loadingDetails = false;
                this._E_ACCESSDENIED = 0x80070005;
                this._E_OUTOFMEMORY = 0x8007000E;
                if (config && config.viewId) {
                    this._config = config;
                    this._viewId = config.viewId;
                } else {
                    throw new Error("Invalid Config.");
                }

                this.setInitialControls();

                // Load the DataWarehouse
                Microsoft.VisualStudio.DiagnosticsHub.DataWarehouse.loadDataWarehouse().then(function (dw) {
                    this._dataWarehouse = dw;

                    // When we first load up, query the analyzer to see if there were any errors during analysis
                    this.checkAnalysisErrors();
                }.bind(this));

                this._vsSession = Microsoft.Plugin.Utilities.JSONMarshaler.attachToPublishedObject("GpuProfiler.GpuProfilingSession", {}, true);

                // Register our callback function for when VS has finished loading details data
                this._vsSession.addEventListener("gpudetailsloaded", this.onGpuDetailsLoaded.bind(this));

                this._viewEventManager = Microsoft.VisualStudio.DiagnosticsHub.getViewEventManager();
                this._viewEventManager.selectionChanged.addEventListener(this.onRulerSelectionChanged.bind(this));

                // Set our timespan to zero to begin with
                this._timeSpan = new Microsoft.VisualStudio.DiagnosticsHub.JsonTimespan(new Microsoft.VisualStudio.DiagnosticsHub.BigNumber(0, 0), new Microsoft.VisualStudio.DiagnosticsHub.BigNumber(0, 0));

                // Notify the hub that we have loaded our view
                this._viewEventManager.detailsViewReady.raiseEvent({
                    Id: this._viewId
                });
            }
            GpuProfilingDetailsControl.prototype.onGpuDetailsLoaded = function (args) {
                this._loadingDetails = false;
                this.showLink();
            };

            GpuProfilingDetailsControl.prototype.checkAnalysisErrors = function () {
                // Request Error check data from our analyzer
                var customData = {
                    task: "ERRORCHECK"
                };
                var contextData = {
                    customDomain: customData
                };

                var dataPromise = this._dataWarehouse.getFilteredData(contextData, "9187AE0A-6018-4ADA-BA36-43D4E9BE0834");
                dataPromise.then(function (result) {
                    var myResult = result.getResult("");
                    myResult.then(function (realResult) {
                        // Since JS Number values are unsigned do a quick convert here if needed
                        if (realResult.HRESULT < 0) {
                            this._analysisHResult = 0x100000000 + realResult.HRESULT;
                        } else {
                            this._analysisHResult = realResult.HRESULT;
                        }

                        // Hide / Show the main controls or warnings based on analysis results from the infosource
                        // Good Result
                        if (this._analysisHResult == 0x0) {
                            var linkDiv = document.getElementById("Gpu-Details-Main");
                            linkDiv.style.visibility = "visible";
                        } else if ((this._analysisHResult == this._E_ACCESSDENIED) || (this._analysisHResult == this._E_OUTOFMEMORY)) {
                            var warningDiv = document.getElementById("Analysis-Warnings-Container");
                            warningDiv.style.visibility = "visible";

                            var warningSpan = document.getElementById("Analysis-Warnings-Span");
                            warningSpan.innerText = Microsoft.Plugin.Resources.getString("ProfilingAnalysisMemoryError");
                        } else {
                            var warningDiv = document.getElementById("Analysis-Warnings-Container");
                            warningDiv.style.visibility = "visible";

                            var warningSpan = document.getElementById("Analysis-Warnings-Span");
                            warningSpan.innerText = Microsoft.Plugin.Resources.getString("ProfilingAnalysisOtherError", this._analysisHResult.toString(16));
                            //warningSpan.innerText = Plugin.Resources.getString("ProfilingAnalysisOtherError");
                            //this.findElement("seeFrameDetailsButton").innerText = Microsoft.Plugin.Resources.getString("FrameNumberFormat", this._model.summaryData.id);
                        }
                    }.bind(this));
                }.bind(this));
            };

            // Grab data from our infosource and load it into shared memory
            // pass back to VS the location and details of that memory
            GpuProfilingDetailsControl.prototype.loadGpuDetailsData = function () {
                // Prevent the user from loading another chunk until the first is loaded
                if (!this._loadingDetails) {
                    this._loadingDetails = true;
                    this.hideLink();

                    this._dataWarehouse.getContextService().getGlobalContext().then(function (context) {
                        this._context = context;

                        // After we have grabbed the global context, call into the data warehouse to get data
                        var dataPromise = this._dataWarehouse.getData(context.getContextId(), "9187AE0A-6018-4ADA-BA36-43D4E9BE0834");
                        dataPromise.then(function (result) {
                            var startString = this._timeSpan.begin.value;
                            var endString = this._timeSpan.end.value;
                            var timespanString = startString + ":" + endString;
                            var myResult = result.getResult(timespanString);
                            myResult.then(function (realResult) {
                                this._vsSession._call("asyncOpenGpuDetails", realResult);
                            }.bind(this));
                        }.bind(this));
                    }.bind(this));
                }
            };

            GpuProfilingDetailsControl.prototype.setInitialControls = function () {
                var prefix1 = document.getElementById("detailsPrefix1");
                prefix1.innerText = Microsoft.Plugin.Resources.getString("ProfilingSelectMessagePrefix1");
                var prefix2 = document.getElementById("detailsPrefix2");
                prefix2.innerText = Microsoft.Plugin.Resources.getString("ProfilingSelectMessagePrefix2");
                var suffix = document.getElementById("detailsSuffix");
                suffix.innerText = Microsoft.Plugin.Resources.getString("ProfilingSelectMessageSuffix");
                this._detailsLink = document.getElementById("detailsLink");
                this._detailsLink.href = "javascript:void(null);";
                this._detailsLink.innerText = Microsoft.Plugin.Resources.getString("ProfilingSelectMessageLink");
                this._detailsLink.addEventListener("click", this.openDetailsPage.bind(this));

                var progressSpan = document.getElementById("inProgressSpan");
                progressSpan.innerText = Microsoft.Plugin.Resources.getString("ProfilingInProgressMessage");

                // Initially hide all controls (don't enable until we know our analysis was correct)
                var linkDiv = document.getElementById("Gpu-Details-Main");
                linkDiv.style.visibility = "hidden";
                var progressDiv = document.getElementById("Gpu-Details-Progress");
                progressDiv.style.visibility = "hidden";
                var warningDiv = document.getElementById("Analysis-Warnings-Container");
                warningDiv.style.visibility = "hidden";
            };

            // Show the open document link and hide the in progress link
            GpuProfilingDetailsControl.prototype.showLink = function () {
                var open = document.getElementById("Gpu-Details-Main");
                open.style.visibility = "visible";

                var progress = document.getElementById("Gpu-Details-Progress");
                progress.style.visibility = "hidden";
            };

            // Hide the open document link and show the in progress link
            GpuProfilingDetailsControl.prototype.hideLink = function () {
                var open = document.getElementById("Gpu-Details-Main");
                open.style.visibility = "hidden";

                var progress = document.getElementById("Gpu-Details-Progress");
                progress.style.visibility = "visible";
            };

            GpuProfilingDetailsControl.prototype.onRulerSelectionChanged = function (args) {
                // Only update when selection is complete, not during the selection event
                if (!args.isIntermittent) {
                    this._timeSpan = args.position;
                }
            };

            GpuProfilingDetailsControl.prototype.openDetailsPage = function () {
                this.loadGpuDetailsData();
            };
            return GpuProfilingDetailsControl;
        })();
        GpuProfiling.GpuProfilingDetailsControl = GpuProfilingDetailsControl;
    })(Microsoft.GpuProfiling || (Microsoft.GpuProfiling = {}));
    var GpuProfiling = Microsoft.GpuProfiling;
})(Microsoft || (Microsoft = {}));
var Microsoft;
(function (Microsoft) {
    (function (GpuProfiling) {
        var GpuProfilingRuntimeControl = (function () {
            // Pass in a view configuration block from the control
            function GpuProfilingRuntimeControl(config) {
                this._agentGuid = new Microsoft.VisualStudio.DiagnosticsHub.Guid("9e5de5fb-d655-401a-86a8-5764c252744d");
                if (config && config.viewId) {
                    this._config = config;
                    this._viewId = config.viewId;
                } else {
                    throw new Error("Invalid Config.");
                }

                this.setInitialControls();

                this._vsSession = Microsoft.Plugin.Utilities.JSONMarshaler.attachToPublishedObject("GpuProfiler.GpuProfilingSession", {}, true);

                this._standardCollector = Microsoft.VisualStudio.DiagnosticsHub.Collectors.getStandardTransportService();
                this._standardCollector.addMessageListener(this._agentGuid, this.onMessageReceived.bind(this));
            }
            // Messaged from the collector come in here to be handled
            GpuProfilingRuntimeControl.prototype.onMessageReceived = function (message) {
                if (message) {
                    if (message == "Started") {
                        this.setControls(true);
                    } else if (message == "NotStarted") {
                        this.setControls(false);
                    } else {
                        this._vsSession._call("sendStringMessage", message);
                    }
                }
            };

            // The initial set of controls will be all hidden until the collector tells us if we need the "start profiling" link or not
            GpuProfilingRuntimeControl.prototype.setInitialControls = function () {
                this._startLink = document.getElementById("startLink");
                this._startSpan = document.getElementById("startSpan");
                this._stopLink = document.getElementById("stopLink");
                this._stopSpan = document.getElementById("stopSpan");
                this._stopLink.style.visibility = "hidden";
                this._stopSpan.style.visibility = "hidden";
                this._startLink.style.visibility = "hidden";
                this._startSpan.style.visibility = "hidden";
            };

            // Set up our various HTML controls
            GpuProfilingRuntimeControl.prototype.setControls = function (started) {
                this._startLink.innerText = Microsoft.Plugin.Resources.getString("ProfilingStartProfilingLink");
                this._startLink.href = "javascript:void(null);";
                this._startLink.addEventListener("click", this.startProfiling.bind(this));
                this._startLink.style.visibility = "visible";

                this._startSpan.innerText = Microsoft.Plugin.Resources.getString("ProfilingStartProfilingSpan");
                this._startSpan.style.visibility = "visible";

                this._stopLink.innerText = Microsoft.Plugin.Resources.getString("ProfilingStopProfilingLink");
                this._stopLink.href = "javascript:void(null);";
                this._stopLink.addEventListener("click", this.stopProfiling.bind(this));
                this._stopLink.style.visibility = "visible";

                this._stopSpan.innerText = Microsoft.Plugin.Resources.getString("ProfilingStopProfilingSpan");
                this._stopSpan.style.visibility = "visible";

                if (started) {
                    this._startLink.style.visibility = "hidden";
                    this._startSpan.style.visibility = "hidden";
                }
            };

            GpuProfilingRuntimeControl.prototype.stopProfiling = function () {
                // Hide the links to prevent an accidental second press
                // were closing down now, so we don't want a command to start or
                // a second stop command
                this._stopLink.style.visibility = "hidden";
                this._stopSpan.style.visibility = "hidden";
                this._startLink.style.visibility = "hidden";
                this._startSpan.style.visibility = "hidden";

                this._vsSession._call("closeSession");
            };

            GpuProfilingRuntimeControl.prototype.startProfiling = function () {
                // Hide the start link when we begin
                this._startLink.style.visibility = "hidden";
                this._startSpan.style.visibility = "hidden";

                // Send our message to start profiling to the collection agent
                this._standardCollector.sendStringToCollectionAgent(this._agentGuid.toString(), "StartProfiling").done(function (response) {
                    if (response) {
                        var str = response;
                    }
                });
            };
            return GpuProfilingRuntimeControl;
        })();
        GpuProfiling.GpuProfilingRuntimeControl = GpuProfilingRuntimeControl;
    })(Microsoft.GpuProfiling || (Microsoft.GpuProfiling = {}));
    var GpuProfiling = Microsoft.GpuProfiling;
})(Microsoft || (Microsoft = {}));
//
// Copyright (C) Microsoft. All rights reserved.
//
var VsGraphics;
(function (VsGraphics) {
    (function (Common) {
        /// <reference path="control.ts" />
        (function (Controls) {
            "use strict";

            // This ContentControl is  a control that only allows a single child (content).
            var ContentControl = (function (_super) {
                __extends(ContentControl, _super);
                function ContentControl() {
                    _super.call(this);
                }
                Object.defineProperty(ContentControl.prototype, "content", {
                    get: function () {
                        return this._content;
                    },
                    set: function (newContent) {
                        if (this._content !== newContent) {
                            if (this._content) {
                                this.removeChild(this._content);
                            }

                            this._content = newContent;
                            this.appendChild(this._content);

                            this.onContentChanged();
                        }
                    },
                    enumerable: true,
                    configurable: true
                });

                ContentControl.prototype.appendChild = function (child) {
                    if (this.rootElement.children.length != 0) {
                        throw new Error(Microsoft.Plugin.Resources.getErrorString("MemProf.1016"));
                    }
                    _super.prototype.appendChild.call(this, child);
                };

                // overridable
                ContentControl.prototype.onContentChanged = function () {
                };
                return ContentControl;
            })(Controls.Control);
            Controls.ContentControl = ContentControl;
        })(Common.Controls || (Common.Controls = {}));
        var Controls = Common.Controls;
    })(VsGraphics.Common || (VsGraphics.Common = {}));
    var Common = VsGraphics.Common;
})(VsGraphics || (VsGraphics = {}));
//
// Copyright (C) Microsoft. All rights reserved.
//
var VsGraphics;
(function (VsGraphics) {
    (function (Common) {
        "use strict";

        /**
        Use the Keys members to test against KeyboardEvent.key.
        This is preferred over testing KeyboardEvent.keyCode, which is deprecated.
        */
        var Keys = (function () {
            function Keys() {
            }
            Keys.c = "c";
            Keys.DEL = "Del";
            Keys.DOWN = "Down";
            Keys.END = "End";
            Keys.ENTER = "Enter";
            Keys.F10 = "F10";
            Keys.HOME = "Home";
            Keys.LEFT = "Left";
            Keys.RIGHT = "Right";
            Keys.SPACEBAR = "Spacebar";
            Keys.UP = "Up";
            return Keys;
        })();
        Common.Keys = Keys;

        /**
        Use the KeyCodes enumeration to test against KeyboardEvent.keyCode.
        This is deprecated in favor of testing KeyboardEvent.key.
        */
        (function (KeyCodes) {
            KeyCodes[KeyCodes["BACKSPACE"] = 8] = "BACKSPACE";
            KeyCodes[KeyCodes["TAB"] = 9] = "TAB";
            KeyCodes[KeyCodes["ENTER"] = 13] = "ENTER";
            KeyCodes[KeyCodes["SHIFT"] = 16] = "SHIFT";
            KeyCodes[KeyCodes["CONTROL"] = 17] = "CONTROL";
            KeyCodes[KeyCodes["ALT"] = 18] = "ALT";
            KeyCodes[KeyCodes["CAPS_LOCK"] = 20] = "CAPS_LOCK";
            KeyCodes[KeyCodes["ESCAPE"] = 27] = "ESCAPE";
            KeyCodes[KeyCodes["SPACE"] = 32] = "SPACE";
            KeyCodes[KeyCodes["PAGE_UP"] = 33] = "PAGE_UP";
            KeyCodes[KeyCodes["PAGE_DOWN"] = 34] = "PAGE_DOWN";
            KeyCodes[KeyCodes["END"] = 35] = "END";
            KeyCodes[KeyCodes["HOME"] = 36] = "HOME";
            KeyCodes[KeyCodes["ARROW_LEFT"] = 37] = "ARROW_LEFT";
            KeyCodes[KeyCodes["ARROW_FIRST"] = 37] = "ARROW_FIRST";
            KeyCodes[KeyCodes["ARROW_UP"] = 38] = "ARROW_UP";
            KeyCodes[KeyCodes["ARROW_RIGHT"] = 39] = "ARROW_RIGHT";
            KeyCodes[KeyCodes["ARROW_DOWN"] = 40] = "ARROW_DOWN";
            KeyCodes[KeyCodes["ARROW_LAST"] = 40] = "ARROW_LAST";
            KeyCodes[KeyCodes["INSERT"] = 45] = "INSERT";
            KeyCodes[KeyCodes["DELETE"] = 46] = "DELETE";
            KeyCodes[KeyCodes["A"] = 65] = "A";
            KeyCodes[KeyCodes["B"] = 66] = "B";
            KeyCodes[KeyCodes["C"] = 67] = "C";
            KeyCodes[KeyCodes["D"] = 68] = "D";
            KeyCodes[KeyCodes["E"] = 69] = "E";
            KeyCodes[KeyCodes["F"] = 70] = "F";
            KeyCodes[KeyCodes["G"] = 71] = "G";
            KeyCodes[KeyCodes["H"] = 72] = "H";
            KeyCodes[KeyCodes["I"] = 73] = "I";
            KeyCodes[KeyCodes["J"] = 74] = "J";
            KeyCodes[KeyCodes["K"] = 75] = "K";
            KeyCodes[KeyCodes["L"] = 76] = "L";
            KeyCodes[KeyCodes["M"] = 77] = "M";
            KeyCodes[KeyCodes["N"] = 78] = "N";
            KeyCodes[KeyCodes["O"] = 79] = "O";
            KeyCodes[KeyCodes["P"] = 80] = "P";
            KeyCodes[KeyCodes["Q"] = 81] = "Q";
            KeyCodes[KeyCodes["R"] = 82] = "R";
            KeyCodes[KeyCodes["S"] = 83] = "S";
            KeyCodes[KeyCodes["T"] = 84] = "T";
            KeyCodes[KeyCodes["U"] = 85] = "U";
            KeyCodes[KeyCodes["V"] = 86] = "V";
            KeyCodes[KeyCodes["W"] = 87] = "W";
            KeyCodes[KeyCodes["X"] = 88] = "X";
            KeyCodes[KeyCodes["Y"] = 89] = "Y";
            KeyCodes[KeyCodes["Z"] = 90] = "Z";
            KeyCodes[KeyCodes["CONTEXTMENU"] = 93] = "CONTEXTMENU";
            KeyCodes[KeyCodes["MULTIPLY"] = 106] = "MULTIPLY";
            KeyCodes[KeyCodes["PLUS"] = 107] = "PLUS";
            KeyCodes[KeyCodes["MINUS"] = 109] = "MINUS";
            KeyCodes[KeyCodes["F1"] = 112] = "F1";
            KeyCodes[KeyCodes["F2"] = 113] = "F2";
            KeyCodes[KeyCodes["F3"] = 114] = "F3";
            KeyCodes[KeyCodes["F4"] = 115] = "F4";
            KeyCodes[KeyCodes["F5"] = 116] = "F5";
            KeyCodes[KeyCodes["F6"] = 117] = "F6";
            KeyCodes[KeyCodes["F7"] = 118] = "F7";
            KeyCodes[KeyCodes["F8"] = 119] = "F8";
            KeyCodes[KeyCodes["F9"] = 120] = "F9";
            KeyCodes[KeyCodes["F10"] = 121] = "F10";
            KeyCodes[KeyCodes["F11"] = 122] = "F11";
            KeyCodes[KeyCodes["F12"] = 123] = "F12";
            KeyCodes[KeyCodes["COMMA"] = 188] = "COMMA";
            KeyCodes[KeyCodes["PERIOD"] = 190] = "PERIOD";
        })(Common.KeyCodes || (Common.KeyCodes = {}));
        var KeyCodes = Common.KeyCodes;

        (function (MouseButtons) {
            MouseButtons[MouseButtons["LEFT_BUTTON"] = 0] = "LEFT_BUTTON";
            MouseButtons[MouseButtons["MIDDLE_BUTTON"] = 1] = "MIDDLE_BUTTON";
            MouseButtons[MouseButtons["RIGHT_BUTTON"] = 2] = "RIGHT_BUTTON";
        })(Common.MouseButtons || (Common.MouseButtons = {}));
        var MouseButtons = Common.MouseButtons;

        // This maps to KeyFlags enum defined in
        // $/devdiv/feature/VSClient_1/src/bpt/diagnostics/Host/Common/common.h
        (function (KeyFlags) {
            KeyFlags[KeyFlags["KeyFlags_None"] = 0x0] = "KeyFlags_None";
            KeyFlags[KeyFlags["KeyFlags_Shift"] = 0x1] = "KeyFlags_Shift";
            KeyFlags[KeyFlags["KeyFlags_Ctrl"] = 0x2] = "KeyFlags_Ctrl";
            KeyFlags[KeyFlags["KeyFlags_Alt"] = 0x4] = "KeyFlags_Alt";
        })(Common.KeyFlags || (Common.KeyFlags = {}));
        var KeyFlags = Common.KeyFlags;

        /**
        Add listeners to the document to prevent certain IE browser accelerator keys from
        triggering their default action in IE
        */
        function blockBrowserAccelerators() {
            // Prevent the default F5 refresh, default F6 address bar focus, and default SHIFT + F10 context menu
            document.addEventListener("keydown", function (e) {
                return preventIEKeys(e);
            });

            // Prevent the default context menu
            document.addEventListener("contextmenu", function (e) {
                e.preventDefault();
                e.stopPropagation();
                return false;
            });

            // Prevent mouse wheel zoom
            window.addEventListener("mousewheel", function (e) {
                if (e.ctrlKey) {
                    e.preventDefault();
                    e.stopPropagation();
                    return false;
                }
            });
        }
        Common.blockBrowserAccelerators = blockBrowserAccelerators;

        /**
        Checks to see if any of the ALT, SHIFT, or CTRL keys are pressed
        @param e The keyboard event to check
        @returns true if the event has any of the key flags toggled on
        */
        function HasAnyOfAltCtrlShiftKeyFlags(e) {
            return e.shiftKey || e.ctrlKey || e.altKey;
        }
        Common.HasAnyOfAltCtrlShiftKeyFlags = HasAnyOfAltCtrlShiftKeyFlags;

        /**
        Prevents IE from executing default behavior for certain shortcut keys
        This should be called from keydown handlers that do not already call preventDefault().
        Some shortcuts cannot be blocked via javascript (such as CTRL + P print dialog) so these
        are already blocked by the native hosting code and will not get sent to the key event handlers.
        @param e The keyboard event to check and prevent the action on
        @returns false to stop the default action- which matches the keydown/keyup handlers
        */
        function preventIEKeys(e) {
            // Check if a known key combo is pressed
            if (e.keyCode === 116 /* F5 */ || e.keyCode === 117 /* F6 */ || (e.keyCode === 121 /* F10 */ && e.shiftKey) || (e.keyCode === 70 /* F */ && e.ctrlKey)) {
                e.preventDefault();
                e.stopPropagation();
                return false;
            }

            return true;
        }
        Common.preventIEKeys = preventIEKeys;
    })(VsGraphics.Common || (VsGraphics.Common = {}));
    var Common = VsGraphics.Common;
})(VsGraphics || (VsGraphics = {}));
//
// Copyright (C) Microsoft. All rights reserved.
//
var VsGraphics;
(function (VsGraphics) {
    (function (Common) {
        /// <reference path="../Includes.ts" />
        /// <reference path="../Util/KeyCodes.ts" />
        /// <reference path="control.ts" />
        /// <reference path="templateControl.ts" />
        (function (Controls) {
            "use strict";

            var MenuItem = (function () {
                function MenuItem(itemText, ownerControl, canToggle, initialState) {
                    if (typeof canToggle === "undefined") { canToggle = false; }
                    if (typeof initialState === "undefined") { initialState = false; }
                    this.element = document.createElement("li");

                    if (canToggle) {
                        this._toggleIcon = document.createElement("img");
                        this.element.appendChild(this._toggleIcon);
                        this._toggleIcon.className = "menuToggleIcon";
                        this._toggleIcon.src = Microsoft.Plugin.Theme.getValue("image-checkmark");
                        this.toggled = initialState;
                        this.element.addEventListener("DOMAttrModified", this.onAriaCheckedModified.bind(this));
                    }

                    var span = document.createElement("span");
                    this.element.appendChild(span);
                    span.innerText = itemText;
                }
                Object.defineProperty(MenuItem.prototype, "toggled", {
                    get: function () {
                        return this._toggled;
                    },
                    set: function (v) {
                        this._toggled = v;
                        if (this._toggled) {
                            this._toggleIcon.classList.remove("hiddenCheckMark");
                            this.element.setAttribute("aria-checked", "true");
                        } else {
                            this._toggleIcon.classList.add("hiddenCheckMark");
                            this.element.setAttribute("aria-checked", "false");
                        }
                    },
                    enumerable: true,
                    configurable: true
                });

                MenuItem.prototype.onAriaCheckedModified = function (event) {
                    if (event.attrName === "aria-checked") {
                        var checked = event.newValue === "true";
                        if (this.toggled !== checked)
                            this.toggled = checked;
                    }
                };
                return MenuItem;
            })();
            Controls.MenuItem = MenuItem;

            var MenuControl = (function (_super) {
                __extends(MenuControl, _super);
                function MenuControl(target) {
                    var _this = this;
                    _super.call(this);

                    this._target = target;
                    this._isVisible = false;

                    this.setTemplateFromHTML("<ul id=\"menuControl\" class=\"menuControl\" role=\"menu\"></ul>");

                    this._listElement = this.findElement("menuControl");
                    this._listElement.setAttribute("aria-hidden", "true");

                    this._closeMenuFunction = this.closeMenu.bind(this);
                    document.body.addEventListener("keydown", function (e) {
                        if (e.keyCode === 27 /* ESCAPE */) {
                            _this.closeMenu();
                        }
                    });

                    target.onclick = this.showMenu.bind(this);
                    target.onkeydown = function (e) {
                        if (e.keyCode === 13 /* ENTER */ || e.keyCode === 32 /* SPACE */) {
                            if (!_this._isVisible)
                                _this.showMenu();
                            else
                                _this.closeMenu();
                        }
                    };
                    target.appendChild(this._listElement);
                    target.setAttribute("role", "button");
                    target.setAttribute("aria-haspopup", "true");
                    target.setAttribute("aria-owns", this._listElement.id.toString());
                    target.addEventListener("keydown", function (e) {
                        if ((e.keyCode === 40 /* ARROW_DOWN */) && (_this._isVisible)) {
                            _this._listElement.firstElementChild.focus();
                        }
                    });
                }
                MenuControl.prototype.getMenuItem = function (index) {
                    if (index >= 0 && index < this._listElement.children.length) {
                        return this._listElement.children[index];
                    }

                    return null;
                };

                MenuControl.prototype.addToggleItem = function (itemText, itemCallback, initialState, tabIndex) {
                    if (typeof initialState === "undefined") { initialState = false; }
                    if (typeof tabIndex === "undefined") { tabIndex = 0; }
                    var menuItem = new MenuItem(itemText, this, true, initialState);
                    this._listElement.appendChild(menuItem.element);

                    menuItem.element.tabIndex = tabIndex;
                    menuItem.element.setAttribute("role", "menuitemcheckbox");

                    menuItem.element.onclick = (function (e) {
                        menuItem.toggled = itemCallback(e);
                        e.stopImmediatePropagation();
                    });

                    menuItem.element.onkeydown = function (e) {
                        if (e.keyCode === 13 /* ENTER */ || e.keyCode === 32 /* SPACE */) {
                            menuItem.toggled = itemCallback(e);
                            e.stopImmediatePropagation();
                        } else if (e.keyCode === 38 /* ARROW_UP */) {
                            if (menuItem.element.previousElementSibling) {
                                menuItem.element.previousElementSibling.focus();
                            }
                            e.stopImmediatePropagation();
                        } else if (e.keyCode === 40 /* ARROW_DOWN */) {
                            if (menuItem.element.nextElementSibling) {
                                menuItem.element.nextElementSibling.focus();
                            }
                            e.stopImmediatePropagation();
                        }
                    };

                    this._target.disabled = false;
                };

                MenuControl.totalOffsetLeft = function (elem) {
                    var offsetLeft = 0;
                    do {
                        if (!isNaN(elem.offsetLeft)) {
                            offsetLeft += elem.offsetLeft;
                        }
                    } while(elem = elem.offsetParent);
                    return offsetLeft;
                };

                MenuControl.totalOffsetTop = function (elem) {
                    var offsetTop = 0;
                    do {
                        if (!isNaN(elem.offsetTop)) {
                            offsetTop += elem.offsetTop;
                        }
                    } while(elem = elem.offsetParent);
                    return offsetTop;
                };

                MenuControl.prototype.showMenu = function (e) {
                    var _this = this;
                    if (!this._isVisible) {
                        this._listElement.style.display = "block";
                        this._listElement.setAttribute("aria-hidden", "false");

                        this.setMenuPosition();

                        this._target.classList.add("menuControlActive");
                        window.setImmediate(function () {
                            document.body.addEventListener("click", _this._closeMenuFunction);
                            window.addEventListener("resize", _this._closeMenuFunction);
                        });
                        this._isVisible = true;
                    }
                };

                MenuControl.prototype.closeMenu = function () {
                    if (this._isVisible) {
                        this._listElement.style.display = "none";
                        this._listElement.setAttribute("aria-hidden", "true");
                        this._target.classList.remove("menuControlActive");
                        document.body.removeEventListener("click", this._closeMenuFunction);
                        window.removeEventListener("resize", this._closeMenuFunction);
                        this._isVisible = false;
                    }
                };

                MenuControl.prototype.setMenuPosition = function () {
                    this._listElement.style.left = "0px";
                    this._listElement.style.top = "0px";

                    // Get the coordinates of target based on the document
                    var targetTotalOffsetLeft = MenuControl.totalOffsetLeft(this._target);
                    var targetTotalOffsetTop = MenuControl.totalOffsetTop(this._target);

                    // Gets the offset position when listElement is at 0,0 to adjust later on this value.
                    // because 0,0 doesn't necessarly land on document 0,0 if there is a parent with absolute position.
                    var listElementZeroOffsetLeft = MenuControl.totalOffsetLeft(this._listElement);
                    var listElementZeroOffsetTop = MenuControl.totalOffsetTop(this._listElement);

                    // Calculate the left position
                    var left = targetTotalOffsetLeft;
                    var right = left + this._listElement.offsetWidth;
                    if (right > window.innerWidth) {
                        var newRight = targetTotalOffsetLeft + this._target.offsetWidth;
                        var newLeft = newRight - this._listElement.offsetWidth;
                        if (newLeft >= 0) {
                            left = newLeft;
                            right = newRight;
                        }
                    }

                    this._listElement.style.left = left - listElementZeroOffsetLeft + "px";

                    // Calculate the top position
                    var top = targetTotalOffsetTop + this._target.offsetHeight;
                    var bottom = top + this._listElement.offsetHeight;
                    if (bottom > window.innerHeight) {
                        var newBottom = targetTotalOffsetTop;
                        var newTop = bottom - this._listElement.offsetHeight;
                        if (newTop >= 0) {
                            top = newTop;
                            bottom = newBottom;
                        }
                    }

                    this._listElement.style.top = top - listElementZeroOffsetTop + "px";
                };
                return MenuControl;
            })(Controls.TemplateControl);
            Controls.MenuControl = MenuControl;
        })(Common.Controls || (Common.Controls = {}));
        var Controls = Common.Controls;
    })(VsGraphics.Common || (VsGraphics.Common = {}));
    var Common = VsGraphics.Common;
})(VsGraphics || (VsGraphics = {}));
//
// Copyright (C) Microsoft. All rights reserved.
//
var VsGraphics;
(function (VsGraphics) {
    (function (Common) {
        /// <reference path="../Util/keyCodes.ts" />
        /// <reference path="Control.ts" />
        /// <reference path="contentControl.ts" />
        /// <reference path="tabControl.ts" />
        (function (Controls) {
            "use strict";

            var TabItem = (function (_super) {
                __extends(TabItem, _super);
                function TabItem() {
                    _super.call(this);

                    var elem = document.createElement("li");
                    elem.setAttribute("role", "tab");
                    elem.setAttribute("aria-selected", "false");

                    this.header = new Controls.Control(elem);
                    this.header.rootElement.onclick = this.onHeaderClicked.bind(this);
                    this.header.rootElement.setAttribute("tabindex", "2");
                    this.header.rootElement.addEventListener("keydown", this.onKeyDown.bind(this));
                    this.rootElement.className = "tabItemContent";
                }
                Object.defineProperty(TabItem.prototype, "ownerTabControl", {
                    get: function () {
                        return this._ownerTabControl;
                    },
                    set: function (v) {
                        if (this._ownerTabControl !== v) {
                            if (this._ownerTabControl && v) {
                                throw new Error(Microsoft.Plugin.Resources.getErrorString("MemProf.1022"));
                            }
                            this._ownerTabControl = v;
                        }
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(TabItem.prototype, "active", {
                    get: function () {
                        return this._active;
                    },
                    set: function (v) {
                        if (this._active !== v) {
                            this._active = v;
                            this.header.rootElement.classList.toggle("active");
                            this.rootElement.classList.toggle("active");
                            this.header.rootElement.setAttribute("aria-selected", this._active ? "true" : "false");
                            this.onActiveChanged();
                        }
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(TabItem.prototype, "title", {
                    get: function () {
                        return this.header.rootElement.innerText;
                    },
                    set: function (v) {
                        this.header.rootElement.innerText = v;
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(TabItem.prototype, "tooltipString", {
                    get: function () {
                        return this.header.rootElement.getAttribute("data-plugin-vs-tooltip");
                    },
                    set: function (v) {
                        var tooltip = { content: v };
                        this.header.rootElement.setAttribute("data-plugin-vs-tooltip", JSON.stringify(tooltip));
                    },
                    enumerable: true,
                    configurable: true
                });

                /* overridable */
                TabItem.prototype.onActiveChanged = function () {
                };

                TabItem.prototype.onHeaderClicked = function () {
                    if (this.ownerTabControl) {
                        this.ownerTabControl.selectedItem = this;
                    }
                    // MemoryProfilerViewHost.onIdle();
                };

                TabItem.prototype.onKeyDown = function (e) {
                    if (e.keyCode === 13 /* ENTER */ || e.keyCode === 32 /* SPACE */) {
                        this.onHeaderClicked();
                    }
                };
                return TabItem;
            })(Controls.ContentControl);
            Controls.TabItem = TabItem;
        })(Common.Controls || (Common.Controls = {}));
        var Controls = Common.Controls;
    })(VsGraphics.Common || (VsGraphics.Common = {}));
    var Common = VsGraphics.Common;
})(VsGraphics || (VsGraphics = {}));
//
// Copyright (C) Microsoft. All rights reserved.
//
var VsGraphics;
(function (VsGraphics) {
    (function (Common) {
        /// <reference path="control.ts" />
        /// <reference path="templateControl.ts" />
        /// <reference path="tabItem.ts" />
        (function (Controls) {
            "use strict";

            var TabControl = (function (_super) {
                __extends(TabControl, _super);
                function TabControl() {
                    _super.call(this);
                    this._items = [];

                    this.setTemplateFromHTML('<div class="tabControl">' + '   <div class="tabHeader">' + '       <div id="beforeBarContainer" class="beforeBarContainer"></div>' + '       <nav id="tabBarContainer" class="tabBarContainer">' + '        <ul class="tabBar" role="tablist"></ul>' + '       </nav>' + '       <div id="afterBarContainer" class="afterBarContainer"></div>' + '   </div>' + '   <div class="tabContentPane"></div>' + '</div>');

                    this._barPanel = new Controls.Control(this.rootElement.getElementsByClassName("tabBar")[0]);
                    this._contentPane = new Controls.Control(this.rootElement.getElementsByClassName("tabContentPane")[0]);

                    this.beforeBarContainer = new Controls.Control(this.rootElement.getElementsByClassName("beforeBarContainer")[0]);
                    this.afterBarContainer = new Controls.Control(this.rootElement.getElementsByClassName("afterBarContainer")[0]);

                    this._tabBarContainer = this.findElement("tabBarContainer");
                }
                Object.defineProperty(TabControl.prototype, "tabsLeftAligned", {
                    get: function () {
                        return this._tabBarContainer.classList.contains("tabBarContainerLeftAlign");
                    },
                    set: function (v) {
                        if (v) {
                            this._tabBarContainer.classList.add("tabBarContainerLeftAlign");
                        } else {
                            this._tabBarContainer.classList.remove("tabBarContainerLeftAlign");
                        }
                    },
                    enumerable: true,
                    configurable: true
                });

                TabControl.prototype.addTab = function (tabItem) {
                    this._items.push(tabItem);

                    tabItem.ownerTabControl = this;

                    this._barPanel.appendChild(tabItem.header);
                    this._contentPane.appendChild(tabItem);

                    if (!this._selectedItem) {
                        this.selectedItem = tabItem;
                    }
                };

                TabControl.prototype.removeTab = function (tabItem) {
                    var indexOfItem = this._items.indexOf(tabItem);
                    if (indexOfItem < 0) {
                        return;
                    }

                    if (this.selectedItem === tabItem) {
                        this.selectedItem = null;
                    }

                    this._items.splice(indexOfItem, 1);

                    var newSelectedItemIndex = Math.min(this._items.length - 1, indexOfItem);
                    if (newSelectedItemIndex >= 0) {
                        this.selectedItem = this._items[newSelectedItemIndex];
                    }

                    this._barPanel.removeChild(tabItem.header);
                    this._contentPane.removeChild(tabItem);
                    tabItem.ownerTabControl = null;
                };

                TabControl.prototype.containsTab = function (tabItem) {
                    return this._items.indexOf(tabItem) >= 0;
                };

                TabControl.prototype.getTab = function (index) {
                    return this._items[index];
                };

                TabControl.prototype.length = function () {
                    return this._items.length;
                };

                Object.defineProperty(TabControl.prototype, "selectedItem", {
                    get: function () {
                        return this._selectedItem;
                    },
                    set: function (tabItem) {
                        if (this._selectedItem !== tabItem) {
                            if (!this.containsTab(tabItem)) {
                                return;
                            }

                            if (this._selectedItem) {
                                this._selectedItem.active = false;
                            }

                            this._selectedItem = tabItem;
                            if (this._selectedItem) {
                                this._selectedItem.active = true;
                            }

                            if (this.selectedItemChanged) {
                                this.selectedItemChanged();
                            }
                        }
                    },
                    enumerable: true,
                    configurable: true
                });

                TabControl.prototype.onTabItemSelected = function (item) {
                    this.selectedItem = item;
                };
                return TabControl;
            })(Controls.TemplateControl);
            Controls.TabControl = TabControl;
        })(Common.Controls || (Common.Controls = {}));
        var Controls = Common.Controls;
    })(VsGraphics.Common || (VsGraphics.Common = {}));
    var Common = VsGraphics.Common;
})(VsGraphics || (VsGraphics = {}));
var VsGraphics;
(function (VsGraphics) {
    (function (Common) {
        ///<reference path="TemplateControl.ts"/>
        (function (Controls) {
            var View = (function (_super) {
                __extends(View, _super);
                function View(containerId) {
                    _super.call(this, containerId);
                }
                /*overridable*/
                View.prototype.render = function () {
                };

                /*overridable*/
                View.prototype.onResize = function () {
                };
                return View;
            })(Controls.TemplateControl);
            Controls.View = View;
        })(Common.Controls || (Common.Controls = {}));
        var Controls = Common.Controls;
    })(VsGraphics.Common || (VsGraphics.Common = {}));
    var Common = VsGraphics.Common;
})(VsGraphics || (VsGraphics = {}));
//
// Copyright (C) Microsoft. All rights reserved.
//
var VsGraphics;
(function (VsGraphics) {
    var Constants = (function () {
        function Constants() {
        }
        Constants.MinGranularitySupportedInNs = 1;
        Constants.MEMORY_ANALYZER_CLASS_ID = "B821D548-5BA4-4C0E-8D23-CD46CE0C8E23";
        return Constants;
    })();
    VsGraphics.Constants = Constants;
})(VsGraphics || (VsGraphics = {}));
//
// Copyright (C) Microsoft. All rights reserved.
//
var VsGraphics;
(function (VsGraphics) {
    (function (Common) {
        "use strict";

        var Publisher = (function () {
            function Publisher(events) {
                /// <summary>
                /// Event publisher.
                /// </summary>
                /// <summary>
                /// List of supported events.
                /// </summary>
                this._events = {};
                /// <summary>
                /// List of all registered events.
                /// </summary>
                this._listeners = {};
                /// <summary>
                ///     constructor
                /// </summary>
                /// <param name="events">List of supported events.</param>
                if (events && events.length > 0) {
                    for (var i = 0; i < events.length; i++) {
                        var type = events[i];
                        if (type) {
                            this._events[type] = type;
                        }
                    }
                } else {
                    throw Error("Events are null or empty.");
                }
            }
            Publisher.prototype.addEventListener = function (eventType, func) {
                /// <summary>
                ///     Add event Listener
                /// </summary>
                /// <param name="eventType">Event type.</param>
                /// <param name="func">Callback function.</param>
                if (eventType && func) {
                    var type = this._events[eventType];
                    if (type) {
                        var callbacks = this._listeners[type] ? this._listeners[type] : this._listeners[type] = [];
                        callbacks.push(func);
                    }
                }
            };

            Publisher.prototype.removeEventListener = function (eventType, func) {
                /// <summary>
                ///     Remove event Listener
                /// </summary>
                /// <param name="eventType">Event type.</param>
                /// <param name="func">Callback function.</param>
                if (eventType && func) {
                    var callbacks = this._listeners[eventType];
                    if (callbacks) {
                        for (var i = 0; i < callbacks.length; i++) {
                            if (func === callbacks[i]) {
                                callbacks.splice(i, 1);
                                break;
                            }
                        }
                    }
                }
            };

            Publisher.prototype.invokeListener = function (args) {
                /// <summary>
                ///     Invoke event Listener
                /// </summary>
                /// <param name="args">Event argument.</param>
                if (args.type) {
                    var callbacks = this._listeners[args.type];
                    if (callbacks) {
                        for (var i = 0; i < callbacks.length; i++) {
                            var func = callbacks[i];
                            if (func) {
                                func(args);
                            }
                        }
                    }
                }
            };
            return Publisher;
        })();
        Common.Publisher = Publisher;
    })(VsGraphics.Common || (VsGraphics.Common = {}));
    var Common = VsGraphics.Common;
})(VsGraphics || (VsGraphics = {}));
//
// Copyright (C) Microsoft. All rights reserved.
//
var VsGraphics;
(function (VsGraphics) {
    (function (Common) {
        "use strict";

        var Utilities = (function () {
            function Utilities() {
            }
            Utilities.htmlEncode = function (value) {
                Utilities.HtmlEncodeDiv.innerText = value;
                return Utilities.HtmlEncodeDiv.innerHTML;
            };
            Utilities.HtmlEncodeDiv = document.createElement("div");
            return Utilities;
        })();
        Common.Utilities = Utilities;
    })(VsGraphics.Common || (VsGraphics.Common = {}));
    var Common = VsGraphics.Common;
})(VsGraphics || (VsGraphics = {}));
//# sourceMappingURL=VsGraphics.js.map

// SIG // Begin signature block
// SIG // MIIaowYJKoZIhvcNAQcCoIIalDCCGpACAQExCzAJBgUr
// SIG // DgMCGgUAMGcGCisGAQQBgjcCAQSgWTBXMDIGCisGAQQB
// SIG // gjcCAR4wJAIBAQQQEODJBs441BGiowAQS9NQkAIBAAIB
// SIG // AAIBAAIBAAIBADAhMAkGBSsOAwIaBQAEFHZ+WzW0d3Gw
// SIG // l3Rin0z7JFvmuOY2oIIVgjCCBMMwggOroAMCAQICEzMA
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
// SIG // L54/LlUWa8kTo/0xggSNMIIEiQIBATCBkDB5MQswCQYD
// SIG // VQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
// SIG // A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
// SIG // IENvcnBvcmF0aW9uMSMwIQYDVQQDExpNaWNyb3NvZnQg
// SIG // Q29kZSBTaWduaW5nIFBDQQITMwAAAQosea7XeXumrAAB
// SIG // AAABCjAJBgUrDgMCGgUAoIGmMBkGCSqGSIb3DQEJAzEM
// SIG // BgorBgEEAYI3AgEEMBwGCisGAQQBgjcCAQsxDjAMBgor
// SIG // BgEEAYI3AgEVMCMGCSqGSIb3DQEJBDEWBBR22Fe/s83U
// SIG // zlX0D/aPR5gE8jbUKDBGBgorBgEEAYI3AgEMMTgwNqAc
// SIG // gBoAVgBzAEcAcgBhAHAAaABpAGMAcwAuAGoAc6EWgBRo
// SIG // dHRwOi8vbWljcm9zb2Z0LmNvbTANBgkqhkiG9w0BAQEF
// SIG // AASCAQBuWMDTKShag0KU3tPp3q7ZgXVb8SjLK3IeY0i+
// SIG // 8yd/e3oqz3jwRYWP0uIiOJO3Cz++osZYK/P2v/bWsbB4
// SIG // b59uVG8qC0F0P63fdOCh0zVUzSIcCcACSE6OIpLx8y0h
// SIG // aLf6Jeii+FeUXy0BLj4bz6TucdjfuMsm7CES5fUIUGjX
// SIG // 6NDI4IVxZU5BBEe2ktVLGHurIaNnq9e19Gm+VQtRZW3n
// SIG // H7imdMV8u7YTrLs6kByVO1wkCDXAlNjOJzUGdVoyze9z
// SIG // p5X3FEB+Uxp3DsHE+dEKjfZCOSXRKJFTW+X6JPTE5S+b
// SIG // /QNU4Z6YUMmpRkSROZ8uR63p+NxSLVahgzV4IUBvoYIC
// SIG // KDCCAiQGCSqGSIb3DQEJBjGCAhUwggIRAgEBMIGOMHcx
// SIG // CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
// SIG // MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
// SIG // b3NvZnQgQ29ycG9yYXRpb24xITAfBgNVBAMTGE1pY3Jv
// SIG // c29mdCBUaW1lLVN0YW1wIFBDQQITMwAAAHGzLoprgqof
// SIG // TgAAAAAAcTAJBgUrDgMCGgUAoF0wGAYJKoZIhvcNAQkD
// SIG // MQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTUw
// SIG // NzA3MDczNDU5WjAjBgkqhkiG9w0BCQQxFgQUmGadQURe
// SIG // DALYGQT4tQVjdbvxtdIwDQYJKoZIhvcNAQEFBQAEggEA
// SIG // 1mC6XGzqC9PGlbdbkk04zymGlI+MaODHocaYWIvgMVym
// SIG // DP3LcmqqzRroRgCr3JTO0BuLkBg44G/8GYYeqbM6TE9Q
// SIG // ffxXh3Pbs7wnm7Q+tEdu7JBFMrKFXdXqKjguO/uNzIG1
// SIG // svn0+NTMdEGXOPFNXlo4TJbtnNqoT/2GgXVKiumXtRwC
// SIG // 0pAOeKIU+VCiV6auwlTWNPGPSX7cdz4epLO1MSxGAHkA
// SIG // 72VNEgVdif/1Y5n/yflDlRmDLR7RxlI73/nm6+gh6P8V
// SIG // Wfog8NQIalSvHqyIFYHpKJxb3Re4xhUdMUJYKHH3hnja
// SIG // 4KMGgfyH4UGFMQWTnOeWlwTPzGzwptjwBw==
// SIG // End signature block
