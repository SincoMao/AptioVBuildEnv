//
// Copyright (c) Microsoft Corporation.  All rights reserved.
//
var Microsoft;
(function (Microsoft) {
    (function (VsHub) {
        (function (Utility) {
            "use strict";

            function xhr(options, apiVersion) {
                if (!options) {
                    throw new Error("Cannot give a null 'options' argument to Microsoft.VsHub.Utility.xhr");
                }

                // The apiVersion sanity checks are due to the fact we publish the generated JavaScript and thus people could call us
                // with no parameter enforcement done. TypeScript won't allow someone to omit or pass a non-number for apiVersion, but
                // a direct JavaScript caller could, so guard ourselves against that.
                if (!apiVersion) {
                    throw new Error("Cannot omit the 'apiVersion' argument");
                }

                if (typeof apiVersion !== "number") {
                    throw new Error("Cannot pass a non-number for the 'apiVersion' argument");
                }

                options.headers = options.headers || {};

                if (!options.headers["Accept"]) {
                    throw new Error("Must include an Accept header in your XHR options to use Microsoft.VsHub.Utility.xhr");
                }

                var newAcceptHeader = options.headers["Accept"].replace(/[^,]+/g, function (match) {
                    return match + ";api-version=" + apiVersion.toFixed(1);
                });
                options.headers["Accept"] = newAcceptHeader;

                return Microsoft.Plugin.Utilities.xhr(options);
            }
            Utility.xhr = xhr;
        })(VsHub.Utility || (VsHub.Utility = {}));
        var Utility = VsHub.Utility;
    })(Microsoft.VsHub || (Microsoft.VsHub = {}));
    var VsHub = Microsoft.VsHub;
})(Microsoft || (Microsoft = {}));
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        (function (DiagnosticsHub) {
            "use strict";

            /**
            * Observable event that can be invoked by the event owner. This
            * event is not sent to the runtime and as such should only be used
            * for swimlane area specific events
            */
            var AggregatedEvent = (function () {
                function AggregatedEvent() {
                    /// <disable code="SA1301" justification="TSStylecop doesn't properly recognize generics" />
                    /// <disable code="SA9001" justification="TSStylecop doesn't properly recognize generics" />
                    this._eventListeners = [];
                }
                /// <enable code="SA9001" />
                /// <enable code="SA1301" />
                /**
                * Invokes the aggregated event. If there are no event listeners this
                * does nothing.
                * @param {T} args Event arguments to pass to each subscribed listener
                */
                AggregatedEvent.prototype.invokeEvent = function (args) {
                    this._eventListeners.forEach(function (func) {
                        return func(args);
                    });
                };

                /** @inheritdoc */
                AggregatedEvent.prototype.addEventListener = function (func) {
                    this._eventListeners.push(func);
                };

                /** @inheritdoc */
                AggregatedEvent.prototype.removeEventListener = function (func) {
                    var location = this._eventListeners.indexOf(func);

                    if (location > -1) {
                        this._eventListeners.splice(location, 1);
                    }
                };

                /**
                * Disposes the aggregated event, removing all event listeners
                */
                AggregatedEvent.prototype.dispose = function () {
                    this._eventListeners = null;
                };
                return AggregatedEvent;
            })();
            DiagnosticsHub.AggregatedEvent = AggregatedEvent;
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
//
// Copyright (c) Microsoft Corporation.  All rights reserved.
//
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        (function (DiagnosticsHub) {
            "use strict";

            var Automation = (function () {
                function Automation(logger) {
                    this._postFilters = {};
                    this._preFilters = {};
                    this._alertFilters = {};
                    this._confirmationFilters = {};
                    this._logger = logger;
                }
                Automation.prototype.getAutomationPromise = function (key, promiseFunc, oncancel, args) {
                    var _this = this;
                    var postFilter = this._postFilters[key];
                    var preFilter = this._preFilters[key];
                    this._logger.debug("getting automation promise for key '" + key + "'");
                    var currentPromise = null;

                    if (preFilter) {
                        currentPromise = this.getPreFilterPromise(preFilter, args);
                        if (postFilter) {
                            currentPromise = currentPromise.then(function () {
                                return _this.getPostFilterPromise(postFilter, promiseFunc, oncancel, args);
                            }, function (error) {
                                _this._logger.debug("Error '" + JSON.stringify(error) + "' while executing prefiler'");
                            });
                        } else {
                            currentPromise = currentPromise.then(function () {
                                return new Microsoft.Plugin.Promise(function (comp, err, prog) {
                                    promiseFunc(comp, err, prog, args);
                                }, oncancel);
                            }, function (error) {
                                _this._logger.debug("Error '" + JSON.stringify(error) + "' while executing prefiler'");
                            });
                        }
                    } else {
                        if (postFilter) {
                            this._logger.debug("only injecting postFilter");
                            currentPromise = this.getPostFilterPromise(postFilter, promiseFunc, oncancel, args);
                        } else {
                            this._logger.debug("not injecting any filters");
                            currentPromise = new Microsoft.Plugin.Promise(function (comp, err, prog) {
                                promiseFunc(comp, err, prog, args);
                            }, oncancel);
                        }
                    }

                    return currentPromise;
                };

                Automation.prototype.getAlertPromise = function (key, message) {
                    var alertFilter = this._alertFilters[key];
                    if (!alertFilter) {
                        return new Microsoft.Plugin.Promise(function (comp, err, prog) {
                            window.alert(message);
                            comp(true);
                        });
                    } else {
                        return alertFilter.bypass(message);
                    }
                };

                Automation.prototype.getConfirmationPromise = function (key, message) {
                    var confirmationFilter = this._confirmationFilters[key];
                    if (!confirmationFilter) {
                        return new Microsoft.Plugin.Promise(function (comp, err, prog) {
                            comp(window.confirm(message));
                        });
                    } else {
                        return confirmationFilter.bypass(message);
                    }
                };

                Automation.prototype.addAutomationPostFilter = function (key, filter) {
                    this.addAutomationFilter(this._postFilters, key, "IAutomationPostFilter", filter);
                };

                Automation.prototype.removeAutomationPostFilter = function (key) {
                    this.removeAutomationFilter(this._postFilters, key, "IAutomationPostFilter");
                };

                Automation.prototype.addAutomationPreFilter = function (key, filter) {
                    this.addAutomationFilter(this._preFilters, key, "IAutomationPreFilter", filter);
                };

                Automation.prototype.removeAutomationPreFilter = function (key) {
                    this.removeAutomationFilter(this._preFilters, key, "IAutomationPreFilter");
                };

                Automation.prototype.addAutomationAlertBypassFilter = function (key, filter) {
                    this.addAutomationFilter(this._alertFilters, key, "IAutomationAlertBypassFilter", filter);
                };

                Automation.prototype.removeIAutomationAlertBypassFilter = function (key) {
                    this.removeAutomationFilter(this._alertFilters, key, "IAutomationAlertBypassFilter");
                };

                Automation.prototype.addAutomationConfirmationBypassFilter = function (key, filter) {
                    this.addAutomationFilter(this._confirmationFilters, key, "IAutomationConfirmationBypassFilter", filter);
                };

                Automation.prototype.removeAutomationConfirmationBypassFilter = function (key) {
                    this.removeAutomationFilter(this._confirmationFilters, key, "IAutomationConfirmationBypassFilter");
                };

                Automation.prototype.getPreFilterPromise = function (preFilter, args) {
                    if (preFilter) {
                        return preFilter.onFilter(args);
                    }

                    throw "preFilter is null or undefined";
                };

                Automation.prototype.removeAutomationFilter = function (filterStore, key, automationFilterType) {
                    if (!key) {
                        throw new Error("key is null, undefined or evaluates to false");
                    }

                    if (!filterStore) {
                        throw new Error("key is null, undefined or evaluates to false");
                    }

                    if (!automationFilterType) {
                        throw new Error("automationFilterType is null, undefined or evaluates to false");
                    }

                    delete filterStore[key];
                    this._logger.debug(automationFilterType + " with key '" + key + "' has been removed");
                };

                Automation.prototype.addAutomationFilter = function (filterStore, key, automationFilterType, filter) {
                    if (!filterStore) {
                        throw new Error("filterStore is null or undefined");
                    }

                    if (!filter) {
                        throw new Error("filter is null or undefined");
                    }

                    if (!key) {
                        throw new Error("key is null, undefined or evaluates to false");
                    }

                    if (!automationFilterType) {
                        throw new Error("automationFilterType is null, undefined or evaluates to false");
                    }

                    if (filterStore[key]) {
                        this._logger.debug("Replacing existing " + automationFilterType + " with key '" + key + "'");
                    }

                    filterStore[key] = filter;
                    this._logger.debug(automationFilterType + " with key '" + key + "' has been added");
                };

                Automation.prototype.getPostFilterPromise = function (filter, promiseFunc, oncancel, args) {
                    var _this = this;
                    return new Microsoft.Plugin.Promise(function (complete, err, prog) {
                        var filterComplete = function (value) {
                            _this._logger.debug("filterComplete called");
                            return filter.onComplete(value, args).then(function () {
                                complete(value);
                            }, function () {
                                _this._logger.error("Error occured during execution of postfilter onComplete handler");
                            });
                        };

                        var filterError = function (value) {
                            return filter.onError(value, args).then(function () {
                                err(value);
                            }, function () {
                                _this._logger.error("Error occured during execution of postfilter onError handler");
                            });
                        };

                        var filterProgress = function (value) {
                            return filter.onProgress(value, args).then(function () {
                                prog(value);
                            }, function () {
                                _this._logger.error("Error occured during execution of postfilter onProgess handler");
                            });
                        };

                        promiseFunc(filterComplete, filterError, filterProgress, args);
                    }, oncancel);
                };
                return Automation;
            })();

            var AutomationConstants = (function () {
                function AutomationConstants() {
                }
                AutomationConstants.SearchNoResultsAlertKey = "Microsoft.VisualStudio.DiagnosticsHub.CpuUsageTreeGrid.Search";

                AutomationConstants.SearchNoResultsConfirmationKey = "Microsoft.VisualStudio.DiagnosticsHub.CpuUsageTreeGrid.Search";

                AutomationConstants.DataWarehouseRequestKey = "Microsoft.VisualStudio.DiagnosticsHub.DatawarehouseRequest";
                return AutomationConstants;
            })();
            DiagnosticsHub.AutomationConstants = AutomationConstants;

            var automationManager = null;

            /**
            * @private Internal Use Only
            */
            function getAutomationManager(logger) {
                if (automationManager === null) {
                    automationManager = new Automation(logger);
                }

                return automationManager;
            }
            DiagnosticsHub.getAutomationManager = getAutomationManager;
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        (function (DiagnosticsHub) {
            "use strict";

            /**
            * Used to throttle DOM events to reasonable limits. This is done by dropping events
            * if they occur too frequently, but guarantees a last event will be fired.
            * @param {(...args: any[]) => any} callback Callback that should be invoked when throttler timeout has finished
            * @param {number} timeout Number of milliseconds between successive callback calls
            */
            function eventThrottler(callback, timeout) {
                var shouldDrop = false;
                var droppedEvent = false;
                var latestArgs = null;

                var throttle = function () {
                    var args = [];
                    for (var _i = 0; _i < (arguments.length - 0); _i++) {
                        args[_i] = arguments[_i + 0];
                    }
                    latestArgs = args;
                    if (!shouldDrop) {
                        callback.apply(null, args);
                        shouldDrop = true;

                        window.setTimeout(function () {
                            shouldDrop = false;
                            if (droppedEvent) {
                                // Need to queue another with the latest arguments we have
                                window.setTimeout(throttle, 0, latestArgs);
                            }

                            droppedEvent = false;
                        }, timeout);
                    } else {
                        droppedEvent = true;
                    }
                };

                // We return the wrapped function so it can be added to an event listener
                return throttle;
            }
            DiagnosticsHub.eventThrottler = eventThrottler;
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
/// <reference path="DiagnosticsHub.Interfaces.ts" />
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        //
        // Copyright (c) Microsoft Corporation.  All rights reserved.
        //
        (function (DiagnosticsHub) {
            "use strict";

            var BigNumber = (function () {
                function BigNumber(high, low) {
                    this._isHighNegative = false;
                    this._isLowNegative = false;
                    // Verify the supplied numbers are representable in a 32-bit memory space.
                    if (!(typeof high === "number" && high < 0x100000000 && high >= -1 * 0x80000000) || !(typeof low === "number" && low < 0x100000000 && low >= -1 * 0x80000000)) {
                        throw new Error(Microsoft.Plugin.Resources.getErrorString("JSProfiler.1000"));
                    }

                    if (high < 0) {
                        high = (high >>> 0);
                        this._isHighNegative = true;
                    }

                    if (low < 0) {
                        low = (low >>> 0);
                        this._isLowNegative = true;
                    }

                    this._value = {
                        h: high,
                        l: low
                    };
                }
                Object.defineProperty(BigNumber, "oldest", {
                    /** minimum value for timestamp. */
                    get: function () {
                        return BigNumber.OldestTimestampFormat;
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(BigNumber, "latest", {
                    /** maximum value for timestamp. */
                    get: function () {
                        return BigNumber.LatestTimestampFormat;
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(BigNumber, "zero", {
                    /** zero timestamp. */
                    get: function () {
                        if (!BigNumber.Zero) {
                            BigNumber.Zero = new BigNumber(0, 0);
                        }

                        return BigNumber.Zero;
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(BigNumber, "one", {
                    /** one timestamp. */
                    get: function () {
                        if (!BigNumber.One) {
                            BigNumber.One = new BigNumber(0, 1);
                        }

                        return BigNumber.One;
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(BigNumber.prototype, "jsonValue", {
                    /** contains value of timestamp in high and low format. */
                    get: function () {
                        if (!this._jsonValue) {
                            var high = this._value.h;
                            if (this._isHighNegative || high > 0x7fffffff) {
                                high = high << 0;
                            }

                            var low = this._value.l;
                            if (this._isLowNegative || low > 0x7fffffff) {
                                low = low << 0;
                            }

                            this._jsonValue = {
                                h: high,
                                l: low
                            };
                        }

                        return this._jsonValue;
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(BigNumber.prototype, "value", {
                    /** hex string value. */
                    get: function () {
                        if (!this._stringValue) {
                            if (this._value.h > 0) {
                                this._stringValue = "0x" + this._value.h.toString(16) + BigNumber.padLeadingZeros(this._value.l.toString(16), 8);
                            } else {
                                this._stringValue = "0x" + this._value.l.toString(16);
                            }
                        }

                        return this._stringValue;
                    },
                    enumerable: true,
                    configurable: true
                });

                /** gets the max of two timestamps. */
                BigNumber.max = function (first, second) {
                    return first.greaterOrEqual(second) ? first : second;
                };

                /** gets the min of two timestamps. */
                BigNumber.min = function (first, second) {
                    return first.greaterOrEqual(second) ? second : first;
                };

                /**
                * adds two timestamps and returns their sum.
                * if the sum is greater then Math.pow(2, 64), it will saturate and will have
                * max value equal to Math.pow(2, 64).
                */
                BigNumber.add = function (first, second) {
                    return BigNumber.addition(first, second);
                };

                /** subtracts two timestamps and returns their difference as a timestamp. */
                BigNumber.subtract = function (first, second) {
                    if (second.greater(first)) {
                        return BigNumber.zero;
                    }

                    // Convert 2nd number to 2's complement and add it to first number.
                    var otherTime = BigNumber.convertToManagedTimeFormat(second.jsonValue);
                    var negateHigh = ~(otherTime.h);
                    var negateLow = ~(otherTime.l);
                    var twosComplement = BigNumber.addition(new BigNumber(negateHigh, negateLow), BigNumber.one, true);

                    return BigNumber.addition(first, twosComplement, true);
                };

                /** multiplies two timestamps and returns their product as a timestamp. */
                BigNumber.multiply = function (first, second) {
                    return BigNumber.multiplication(first, second);
                };

                /** divides a timestamp by another timestamp and returns their quotient as a timestamp. */
                BigNumber.divide = function (first, second) {
                    return BigNumber.division(first, second, false);
                };

                /** finds the remainder of division of two timestamps and returns it as a new timestamp. */
                BigNumber.modulo = function (first, second) {
                    return BigNumber.division(first, second, true);
                };

                /** adds a number to a timestamp and returns their sum as a timestamp. */
                BigNumber.addNumber = function (first, second) {
                    if (second < 0) {
                        return BigNumber.subtract(first, BigNumber.convertFromNumber(-second));
                    } else {
                        return BigNumber.addition(first, BigNumber.convertFromNumber(second));
                    }

                    return null;
                };

                /** subtracts a number from a timestamp and returns their difference as a timestamp. */
                BigNumber.subtractNumber = function (first, second) {
                    if (second < 0) {
                        return BigNumber.addition(first, BigNumber.convertFromNumber(-second));
                    } else {
                        return BigNumber.subtract(first, BigNumber.convertFromNumber(second));
                    }

                    return null;
                };

                /** multiplies a number and a timestamp and returns their product as a timestamp. */
                BigNumber.multiplyNumber = function (first, second) {
                    if (second < 0) {
                        throw new Error(Microsoft.Plugin.Resources.getErrorString("JSProfiler.1000"));
                    }

                    return BigNumber.multiply(first, BigNumber.convertFromNumber(second));
                };

                /** divides a timestamp by a number and returns their quotient as a timestamp. */
                BigNumber.divideNumber = function (first, second) {
                    if (second < 0) {
                        throw new Error(Microsoft.Plugin.Resources.getErrorString("JSProfiler.1000"));
                    }

                    return BigNumber.divide(first, BigNumber.convertFromNumber(second));
                };

                /** finds the remainder of division of a timestamp and a number and returns it as a new timestamp. */
                BigNumber.moduloNumber = function (first, second) {
                    if (second < 0) {
                        throw new Error(Microsoft.Plugin.Resources.getErrorString("JSProfiler.1000"));
                    }

                    return BigNumber.modulo(first, BigNumber.convertFromNumber(second));
                };

                /**
                * Convert a number to the BigNumber format. Numbers are rounded down to the nearest
                * integer. The number cannot exceed 2^53 - 1.
                */
                BigNumber.convertFromNumber = function (num) {
                    if ((num < 0) || !(num < 0x20000000000000)) {
                        throw new Error(Microsoft.Plugin.Resources.getErrorString("JSProfiler.1000"));
                    }

                    num = Math.floor(num);
                    var low = num & 0xFFFFFFFF;
                    if (num <= 0xFFFFFFFF) {
                        return new BigNumber(0, low);
                    }

                    var highStr = num.toString(16);
                    highStr = highStr.substring(0, highStr.length - 8);
                    var high = parseInt(highStr, 16);

                    return new BigNumber(high, low);
                };

                /**
                * Convert a binary string (up to 64 bits) to the BigNumber format.
                */
                BigNumber.convertFromBinaryString = function (bits) {
                    // Validate string
                    if (!bits || bits.match("[^10]") || bits.length > 64) {
                        throw new Error(Microsoft.Plugin.Resources.getErrorString("JSProfiler.1000" + " " + bits));
                    }

                    var high = 0;
                    var low = 0;

                    if (bits.length <= 32) {
                        low = parseInt(bits, 2);
                    } else {
                        low = parseInt(bits.slice(bits.length - 32), 2);
                        high = parseInt(bits.slice(0, bits.length - 32), 2);
                    }

                    return new BigNumber(high, low);
                };

                /** Convert a timestamp to a string of bits */
                BigNumber.getBinaryString = function (timestamp) {
                    var lowPart = timestamp._value.l.toString(2);
                    if (timestamp._value.h > 0) {
                        return timestamp._value.h.toString(2) + Microsoft.VisualStudio.DiagnosticsHub.BigNumber.padLeadingZeros(lowPart, 32);
                    } else {
                        return lowPart;
                    }
                };

                /** Pads the specified string with the specified number of leading zeros */
                BigNumber.padLeadingZeros = function (value, totalLength) {
                    var padded = value;
                    var zeros = "00000000";

                    if (padded && totalLength && totalLength > 0) {
                        while (totalLength - padded.length >= 8) {
                            padded = zeros + padded;
                        }

                        padded = zeros.substr(0, totalLength - padded.length) + padded;
                    }

                    return padded;
                };

                /** checks for equality. */
                BigNumber.prototype.equals = function (other) {
                    var isEqual = false;
                    var otherTime = BigNumber.convertToManagedTimeFormat(other.jsonValue);
                    isEqual = (this._value.h === otherTime.h && this._value.l === otherTime.l);

                    return isEqual;
                };

                /** checks if timestamp is greater than other timestamp. */
                BigNumber.prototype.greater = function (other) {
                    var isGreater = false;
                    var otherTime = BigNumber.convertToManagedTimeFormat(other.jsonValue);
                    if (this._value.h > otherTime.h) {
                        isGreater = true;
                    } else if (this._value.h === otherTime.h) {
                        if (this._value.l > otherTime.l) {
                            isGreater = true;
                        }
                    }

                    return isGreater;
                };

                /** checks if timestamp is greater than or equal to other timestamp. */
                BigNumber.prototype.greaterOrEqual = function (other) {
                    var isGreaterOrEqual = false;
                    var otherTime = BigNumber.convertToManagedTimeFormat(other.jsonValue);
                    if (this._value.h > otherTime.h) {
                        isGreaterOrEqual = true;
                    } else if (this._value.h === otherTime.h) {
                        if (this._value.l >= otherTime.l) {
                            isGreaterOrEqual = true;
                        }
                    }

                    return isGreaterOrEqual;
                };

                /** checks if timestamp is greater than, equal, or less than and returns 1, 0, -1 respectively */
                BigNumber.prototype.compareTo = function (other) {
                    if (this.greater(other)) {
                        return 1;
                    } else if (this.equals(other)) {
                        return 0;
                    } else {
                        return -1;
                    }
                };

                BigNumber.convertToManagedTimeFormat = function (time) {
                    var high = time.h < 0 ? time.h >>> 0 : time.h;
                    var low = time.l < 0 ? time.l >>> 0 : time.l;
                    return {
                        h: high,
                        l: low
                    };
                };

                BigNumber.addition = function (first, second, ignoreOverflow) {
                    if (typeof ignoreOverflow === "undefined") { ignoreOverflow = false; }
                    var firstTime = BigNumber.convertToManagedTimeFormat(first.jsonValue);
                    var secondTime = BigNumber.convertToManagedTimeFormat(second.jsonValue);

                    // Split each high and low into 8-bits and perform addition. this is done for adding
                    // 2 unsigned numbers.
                    var low = 0;
                    var high = 0;
                    var low0 = (firstTime.l & 0xff) + (secondTime.l & 0xff);
                    var low8 = (low0 >>> 8) + ((firstTime.l >>> 8) & 0xff) + ((secondTime.l >>> 8) & 0xff);
                    low0 = low0 & 0xff;
                    var low16 = (low8 >>> 8) + ((firstTime.l >>> 16) & 0xff) + ((secondTime.l >>> 16) & 0xff);
                    low8 = low8 & 0xff;
                    var low24 = (low16 >>> 8) + ((firstTime.l >>> 24) & 0xff) + ((secondTime.l >>> 24) & 0xff);
                    low16 = low16 & 0xff;

                    var high0 = (low24 >>> 8) + (firstTime.h & 0xff) + (secondTime.h & 0xff);
                    low24 = low24 & 0xff;
                    var high8 = (high0 >>> 8) + ((firstTime.h >>> 8) & 0xff) + ((secondTime.h >>> 8) & 0xff);
                    high0 = high0 & 0xff;
                    var high16 = (high8 >>> 8) + ((firstTime.h >>> 16) & 0xff) + ((secondTime.h >>> 16) & 0xff);
                    high8 = high8 & 0xff;
                    var high24 = (high16 >>> 8) + ((firstTime.h >>> 24) & 0xff) + ((secondTime.h >>> 24) & 0xff);
                    high16 = high16 & 0xff;

                    if (!ignoreOverflow && (high24 >>> 8) > 0) {
                        Microsoft.VisualStudio.DiagnosticsHub.getLogger().error("Addition overflow. Lost upper bits from: 0x" + high24.toString(16));
                        return new BigNumber(0xffffffff, 0xffffffff);
                    }

                    high24 = high24 & 0xff;

                    var finalLow16 = low24 << 8 | low16;
                    var finalLow0 = low8 << 8 | low0;
                    var finalHigh16 = high24 << 8 | high16;
                    var finalHigh0 = high8 << 8 | high0;

                    low = (finalLow16 << 16) | finalLow0;
                    high = (finalHigh16 << 16) | finalHigh0;

                    return new BigNumber(high, low);
                };

                BigNumber.multiplication = function (first, second) {
                    var firstTime = BigNumber.convertToManagedTimeFormat(first.jsonValue);
                    var secondTime = BigNumber.convertToManagedTimeFormat(second.jsonValue);

                    // If both numbers are <= 2^26 (0x4000000) we know that the product will be strictly below the max value
                    // representable by the JavaScript Number type.
                    if (firstTime.h === 0 && secondTime.h === 0 && 0 < firstTime.l && firstTime.l <= 0x4000000 && 0 < secondTime.l && secondTime.l <= 0x4000000) {
                        var product = firstTime.l * secondTime.l;
                        return BigNumber.convertFromNumber(product);
                    }

                    // Split timestamps into four 16-bit chunks
                    var a1 = firstTime.l & 0xFFFF;
                    var a2 = firstTime.l >>> 0x10;
                    var a3 = firstTime.h & 0xFFFF;
                    var a4 = firstTime.h >>> 0x10;

                    var b1 = secondTime.l & 0xFFFF;
                    var b2 = secondTime.l >>> 0x10;
                    var b3 = secondTime.h & 0xFFFF;
                    var b4 = secondTime.h >>> 0x10;

                    // c1: a1b1
                    var c1 = a1 * b1;
                    var c2 = c1 >>> 0x10;
                    c1 &= 0xFFFF;

                    // c2: a2b1 + a1b2
                    c2 += a2 * b1;
                    var c3 = c2 >>> 0x10;
                    c2 &= 0xFFFF;

                    c2 += a1 * b2;
                    c3 += c2 >>> 0x10;
                    c2 &= 0xFFFF;

                    // c3: a3b1 + a2b2 + a1b3
                    c3 += a3 * b1;
                    var c4 = c3 >>> 0x10;
                    c3 &= 0xFFFF;

                    c3 += a2 * b2;
                    c4 += c3 >>> 0x10;
                    c3 &= 0xFFFF;

                    c3 += a1 * b3;
                    c4 += c3 >>> 0x10;
                    c3 &= 0xFFFF;

                    // c4: a4b1 + a3b2 + a2b3 + a1b4
                    // No carry for c4. Anything beyond 16 bits is lost.
                    c4 += a4 * b1 + a3 * b2 + a2 * b3 + a1 * b4;
                    if (c4 > 0xFFFF) {
                        Microsoft.VisualStudio.DiagnosticsHub.getLogger().error("Multiplication overflow. Lost upper 16-bits from: 0x" + c4.toString(16));
                    }

                    c4 &= 0xFFFF;

                    var productHigh = (c4 << 0x10) | c3;
                    var productLow = (c2 << 0x10) | c1;
                    return new BigNumber(productHigh, productLow);
                };

                // Divide timestamps. If wantRemainder is true, returns the remainder instead of the quotient.
                BigNumber.division = function (dividend, divisor, wantRemainder) {
                    if (divisor.greater(dividend)) {
                        return wantRemainder ? dividend : BigNumber.zero;
                    }

                    if (divisor.equals(BigNumber.zero)) {
                        if (wantRemainder) {
                            return dividend;
                        }

                        throw new Error(Microsoft.Plugin.Resources.getErrorString("JSProfiler.1000"));
                    }

                    var dividendBits = BigNumber.getBinaryString(dividend);
                    var divisorBits = BigNumber.getBinaryString(divisor);

                    var divisorLength = divisorBits.length;
                    var dividendLength = dividendBits.length;

                    // If dividend < 2^53 (0x20000000000000) we know that the product will be strictly below the max value
                    // representable by the JavaScript Number type.
                    var timeStamp2toThe53 = new BigNumber(0x200000, 0);
                    if (timeStamp2toThe53.greater(dividend)) {
                        var dividendNum = parseInt(dividend.value);
                        var divisorNum = parseInt(divisor.value);
                        return wantRemainder ? BigNumber.convertFromNumber(dividendNum % divisorNum) : BigNumber.convertFromNumber(dividendNum / divisorNum);
                    }

                    var quotientString = "";
                    var nextIndex = divisorLength;
                    var currDividend = BigNumber.convertFromBinaryString(dividendBits.substr(0, divisorLength));

                    while (nextIndex <= dividendLength) {
                        if (currDividend.greater(divisor) || currDividend.equals(divisor)) {
                            quotientString += "1";
                            currDividend = BigNumber.subtract(currDividend, divisor);
                        } else {
                            quotientString += "0";
                        }

                        if (nextIndex !== dividendLength) {
                            currDividend = BigNumber.convertFromBinaryString(BigNumber.getBinaryString(currDividend) + dividendBits[nextIndex]);
                        }

                        nextIndex++;
                    }

                    return wantRemainder ? currDividend : BigNumber.convertFromBinaryString(quotientString);
                };
                BigNumber.OldestTimestampFormat = {
                    h: 0,
                    l: 0
                };

                BigNumber.LatestTimestampFormat = {
                    h: 0xffffffff,
                    l: 0xffffffff
                };
                return BigNumber;
            })();
            DiagnosticsHub.BigNumber = BigNumber;

            /**
            *  Timespan containing two 64 bit unsigned numbers.
            */
            var JsonTimespan = (function () {
                function JsonTimespan(begin, end) {
                    if (begin.greater(end)) {
                        throw new Error(Microsoft.Plugin.Resources.getErrorString("JSProfiler.1000"));
                    }

                    this._begin = begin;
                    this._end = end;
                }
                Object.defineProperty(JsonTimespan.prototype, "begin", {
                    /** beginning of timespan. */
                    get: function () {
                        return this._begin;
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(JsonTimespan.prototype, "end", {
                    /** end of timespan */
                    get: function () {
                        return this._end;
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(JsonTimespan.prototype, "elapsed", {
                    /** difference of end and begin */
                    get: function () {
                        if (!this._elapsed) {
                            this._elapsed = BigNumber.subtract(this.end, this.begin);
                        }

                        return this._elapsed;
                    },
                    enumerable: true,
                    configurable: true
                });

                /** timespan equality */
                JsonTimespan.prototype.equals = function (other) {
                    return this.begin.equals(other.begin) && this.end.equals(other.end);
                };

                /** is timestamp in timespan */
                JsonTimespan.prototype.contains = function (time) {
                    return time.greaterOrEqual(this.begin) && this.end.greaterOrEqual(time);
                };
                return JsonTimespan;
            })();
            DiagnosticsHub.JsonTimespan = JsonTimespan;
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
/// <reference path="JsonTimespan.ts" />
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        (function (DiagnosticsHub) {
            // -----------------------------------------------------------------------------
            // Copyright (c) Microsoft Corporation.  All rights reserved.
            // -----------------------------------------------------------------------------
            (function (DataWarehouse) {
                "use strict";

                /**
                * Data Warehouse context data
                */
                var DhContextData = (function () {
                    function DhContextData() {
                    }
                    return DhContextData;
                })();
                DataWarehouse.DhContextData = DhContextData;
            })(DiagnosticsHub.DataWarehouse || (DiagnosticsHub.DataWarehouse = {}));
            var DataWarehouse = DiagnosticsHub.DataWarehouse;
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
/// <reference path="DhContextData.ts" />
//
// Copyright (c) Microsoft Corporation.  All rights reserved.
//
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        (function (DiagnosticsHub) {
            "use strict";

            var Logger = (function () {
                function Logger() {
                    var _this = this;
                    // These default to true so that while we are waiting on promises through the
                    // port marshaler we don't drop any log events
                    this._isInfoOn = true;
                    this._isDebugOn = true;
                    this._isWarningOn = true;
                    this._isErrorOn = true;
                    this._loggerProxy = Microsoft.Plugin.Utilities.JSONMarshaler.attachToPublishedObject("Microsoft.DiagnosticsHub.VisualStudio.Presentation.JavaScriptModels.LoggerPortMarshaler", {}, true);

                    // We cache all the values so that we don't have to go through the port marshalers
                    // in the event a log level is disabled
                    this._loggerProxy._call("isInfoOn").done(function (infoOn) {
                        _this._isInfoOn = infoOn;
                    });
                    this._loggerProxy._call("isDebugOn").done(function (debugOn) {
                        _this._isDebugOn = debugOn;
                    });
                    this._loggerProxy._call("isWarningOn").done(function (warningOn) {
                        _this._isWarningOn = warningOn;
                    });
                    this._loggerProxy._call("isErrorOn").done(function (errorOn) {
                        _this._isErrorOn = errorOn;
                    });

                    try  {
                        var apex = Microsoft.Plugin.Utilities.JSONMarshaler.attachToPublishedObject("Microsoft.Test.Apex.DiagnosticsHub.ApexJSExtension", {}, true);
                        if (apex !== null) {
                            apex._call("getApexJavaScript").done(function (result) {
                                if (result) {
                                    _this.debug("got apex javascript files");
                                    var scriptObj = document.createElement("script");
                                    scriptObj.setAttribute("type", "text/javascript");
                                    scriptObj.setAttribute("src", result);
                                    var head = document.getElementsByTagName("head");
                                    if (!head) {
                                        _this.debug("Unable to add apex script to document");
                                    } else {
                                        head[0].appendChild(scriptObj);
                                        _this.debug("Added ApexJSExtension '" + result + "' to document");
                                    }
                                } else {
                                    _this.debug("no file was returned by getApexJavaScript, cannot inject TestExtension.ts for ApexJS framework");
                                }
                            }, function (error) {
                                _this.debug("Error when calling getApexJavaScript function:" + String(error));
                            });
                        } else {
                            this.debug("Unable to connect to port marshaler 'Microsoft.Test.Apex.DiagnosticsHub.ApexJSExtension'");
                        }
                    } catch (e) {
                        this.error(e.toString());
                    }
                }
                Logger.prototype.info = function (message) {
                    if (this._isInfoOn) {
                        this._loggerProxy._call("logInfo", message);
                    }
                };

                Logger.prototype.debug = function (message) {
                    if (this._isDebugOn) {
                        this._loggerProxy._call("logDebug", message);
                    }
                };

                Logger.prototype.warning = function (message) {
                    if (this._isWarningOn) {
                        this._loggerProxy._call("logWarning", message);
                    }
                };

                Logger.prototype.error = function (message) {
                    if (this._isErrorOn) {
                        this._loggerProxy._call("logError", message);
                    }
                };
                return Logger;
            })();

            var _logger = null;

            /** Get diagnostics hub logger */
            function getLogger() {
                if (_logger === null) {
                    _logger = new Logger();
                }

                return _logger;
            }
            DiagnosticsHub.getLogger = getLogger;

            // Initialization step
            Microsoft.Plugin.addEventListener("pluginready", function () {
                getLogger();
            });
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
/// <reference path="DiagnosticsHub.Interfaces.ts" />
/// <reference path="Logger.ts" />
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        //
        // Copyright (c) Microsoft Corporation.  All rights reserved.
        //
        (function (DiagnosticsHub) {
            "use strict";

            var DiagnosticsHubNativeHost = (function () {
                function DiagnosticsHubNativeHost(logger) {
                    this._externalObject = null;
                    this._logger = logger;

                    // Determine where the scriptedsandbox is being hosted (F12 or VS).
                    var hostObj = Microsoft.Plugin.F12 || Microsoft.Plugin.VS;
                    if (!hostObj) {
                        this._logger.error("External object creator does not exist");
                        throw "Unable to determine the ScriptedSandbox host";
                    }

                    this._externalObject = hostObj.Utilities.createExternalObject("DiagnosticsHub.DataWarehouseHost", "{339B3787-FC17-4BF5-A0DC-CBEF24DB2EDE}");
                    this._automationManager = DiagnosticsHub.getAutomationManager(this._logger);
                }
                DiagnosticsHubNativeHost.prototype.requestSync = function (controllerId, actionId, sessionId, request) {
                    if (this._externalObject) {
                        this._externalObject.requestSync(controllerId, actionId, sessionId, (typeof request === "string") ? request : (request !== null && (typeof request !== "undefined")) ? JSON.stringify(request) : "");
                    } else {
                        this._logger.warning("External object is null. Verify that DiagnosticsHub.ScriptedSandboxPlugin.dll was loaded into ScriptedSandbox.");
                    }
                };

                DiagnosticsHubNativeHost.prototype.request = function (controllerId, actionId, sessionId, request) {
                    var _this = this;
                    // this object contains information so our automation can parse the various requests going into the datawarehouse
                    var requestArgs = {
                        controllerId: controllerId,
                        actionId: actionId,
                        sessionId: sessionId,
                        request: request
                    };

                    var safeInvoke = function (callback, response) {
                        try  {
                            callback(response);
                        } catch (e) {
                            _this._logger.error(JSON.stringify(e));
                        }
                    };

                    var result = null;
                    var response = null;
                    var oncancel = function () {
                        if (_this._externalObject && _this._externalObject.cancel && response && response.requestId) {
                            _this._externalObject.cancel(response.requestId);
                        }
                    };

                    var dispatchCallback = function (promiseHandler, jsonResponse, promiseType) {
                        if (promiseHandler !== null) {
                            var result = null;

                            if (jsonResponse !== null) {
                                try  {
                                    result = (jsonResponse === null || jsonResponse === "" || (typeof jsonResponse !== "string")) ? jsonResponse : JSON.parse(jsonResponse);
                                } catch (e) {
                                    _this._logger.error("Could not parse " + promiseType + " response: " + jsonResponse);
                                    _this._logger.error(e.Message);
                                }
                            }

                            safeInvoke(promiseHandler, result);
                        } else {
                            _this._logger.warning("DiagnosticsHubNativeHost: " + promiseType + " callback is null.");
                        }
                    };

                    var promiseInitialization = function (completePromise, errorPromise, progressPromise) {
                        if (_this._externalObject) {
                            result = _this._externalObject.request(controllerId, actionId, sessionId, (typeof request === "string") ? request : (request !== null && (typeof request !== "undefined")) ? JSON.stringify(request) : "", function (jsonResponse) {
                                dispatchCallback(completePromise, jsonResponse, "completePromise");
                            }, function (jsonResponse) {
                                dispatchCallback(errorPromise, jsonResponse, "errorPromise");
                            }, function (jsonResponse) {
                                dispatchCallback(progressPromise, jsonResponse, "progressPromise");
                            });
                        } else {
                            _this._logger.warning("External object is null. Verify that DiagnosticsHub.ScriptedSandboxPlugin.dll was loaded into ScriptedSandbox.");
                        }

                        if (result === null || typeof result !== "string") {
                            response = { hresult: 1 }; /* S_FALSE */
                        } else {
                            response = JSON.parse(result);
                        }

                        if (response.hresult !== 0) {
                            _this._logger.error("Could not invoke request method of native host: " + result);

                            var error = new Error();
                            error.message = error.name = response.hresult.toString(16);
                            errorPromise(error);
                        }
                    };

                    var resultPromise = this._automationManager.getAutomationPromise(DiagnosticsHub.AutomationConstants.DataWarehouseRequestKey, promiseInitialization, oncancel, requestArgs);
                    return resultPromise;
                };
                return DiagnosticsHubNativeHost;
            })();
            DiagnosticsHub.DiagnosticsHubNativeHost = DiagnosticsHubNativeHost;
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
/// <reference path="DiagnosticsHub.Interfaces.ts" />
/// <reference path="Logger.ts" />
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        //
        // Copyright (c) Microsoft Corporation.  All rights reserved.
        //
        (function (DiagnosticsHub) {
            "use strict";

            var EventDeferral = (function () {
                function EventDeferral(onHandlerCompleted) {
                    this._onHandlerCompleted = onHandlerCompleted;
                }
                EventDeferral.prototype.complete = function () {
                    this._onHandlerCompleted();
                };
                return EventDeferral;
            })();

            var StateChangedEventArgs = (function () {
                function StateChangedEventArgs(eventArgs /* from managed code */ , onHandlerCompleted) {
                    this._eventArgs = eventArgs;
                    this._waitHandler = false;
                    this._onHandlerCompleted = onHandlerCompleted;
                    this._eventDeferral = null;
                }
                Object.defineProperty(StateChangedEventArgs.prototype, "currentState", {
                    get: function () {
                        return this._eventArgs.CurrentState;
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(StateChangedEventArgs.prototype, "previousState", {
                    get: function () {
                        return this._eventArgs.PreviousState;
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(StateChangedEventArgs.prototype, "waitHandler", {
                    get: function () {
                        return this._eventDeferral !== null;
                    },
                    enumerable: true,
                    configurable: true
                });

                StateChangedEventArgs.prototype.getDeferral = function () {
                    if (this._eventDeferral === null) {
                        this._eventDeferral = new EventDeferral(this._onHandlerCompleted);
                    }

                    return this._eventDeferral;
                };
                return StateChangedEventArgs;
            })();

            var Session = (function () {
                function Session(logger) {
                    var _this = this;
                    this._eventsListeners = new Array();
                    this._logger = logger;
                    this._isInitialized = false;
                    this._sessionProxy = Microsoft.Plugin.Utilities.JSONMarshaler.attachToPublishedObject("Microsoft.DiagnosticsHub.VisualStudio.Presentation.JavaScriptModels.SessionPortMarshaler", {}, true);

                    this._initializationPromise = this._sessionProxy._call("initialize");

                    this._initializationPromise.done(function () {
                        _this._logger.debug("JavaScript session object connected to host. Ready to get session state notification events.");
                        _this._isInitialized = true;
                    }, function (error) {
                        _this._logger.error("Cannot initialize session, error name: '" + error.name + "', error message: '" + error.message + "'");
                    });

                    this._sessionProxy.addEventListener("sessionStateChanged", this.stateChangedHandler.bind(this));
                }
                Session.prototype.stopCollection = function () {
                    return this._sessionProxy._call("stopCollection");
                };

                Session.prototype.canStopCollection = function () {
                    return this._sessionProxy._call("canStopCollection");
                };

                Session.prototype.getPerformanceDebuggerSessionTargetProcessInformation = function () {
                    return this._sessionProxy._call("getPerformanceDebuggerSessionTargetProcessInformation");
                };

                Session.prototype.getState = function () {
                    return this._sessionProxy._call("getState");
                };

                Session.prototype.addStateChangedEventListener = function (listener) {
                    this._eventsListeners.push(listener);
                    this._logger.debug("State changed event handler added.");
                };

                Session.prototype.isInitialized = function () {
                    return this._isInitialized;
                };

                Session.prototype.waitForInitialization = function () {
                    // Wait for up to five seconds for the initialization to occur.
                    return Microsoft.VisualStudio.DiagnosticsHub.PromiseEx.waitForPromise(this._initializationPromise, 5000);
                };

                Session.prototype.removeStateChangedEventListener = function (listener) {
                    for (var i = 0; i < this._eventsListeners.length; i++) {
                        if (this._eventsListeners[i] === listener) {
                            this._logger.debug("State changed event handler removed.");
                            this._eventsListeners.splice(i, 1);
                            break;
                        }
                    }
                };

                Session.prototype.stateChangedHandler = function (eventArgs) {
                    var _this = this;
                    this._logger.debug("Invoking JavaScript handlers for State Change Event.");

                    var handlersCount = 0;
                    var onCompleted = function () {
                        handlersCount--;
                        if (handlersCount <= 0) {
                            _this._sessionProxy._call("sessionStateChangedCompleted", eventArgs.Token);
                        } else {
                            _this._logger.debug("Still waiting when all event state change handlers will complete their work. Handlers count: " + handlersCount);
                        }
                    };

                    for (var propertyName in this._eventsListeners) {
                        var handler = this._eventsListeners[propertyName];

                        if (this._eventsListeners.hasOwnProperty(propertyName)) {
                            if (typeof handler === "function") {
                                try  {
                                    var jsEventArgs = new StateChangedEventArgs(eventArgs, onCompleted);
                                    handler(jsEventArgs);
                                    if (jsEventArgs.waitHandler) {
                                        handlersCount++;
                                        this._logger.debug("JavaScipt handlers for event state changed asked to wait while they will finish. Handlers count: " + handlersCount);
                                    }
                                } catch (e) {
                                    this._logger.error(e.toString());
                                }
                            } else {
                                this._logger.warning("One of the listeners not a 'function', it has type " + (typeof handler));
                            }
                        }
                    }

                    if (handlersCount === 0) {
                        onCompleted();
                    }
                };
                return Session;
            })();

            var _currentSession = null;

            /** Get current diagnostics hub session */
            function getCurrentSession() {
                if (_currentSession === null) {
                    _currentSession = new Session(DiagnosticsHub.getLogger());
                }

                return _currentSession;
            }
            DiagnosticsHub.getCurrentSession = getCurrentSession;

            // Initialization step. To start get notifications from the managed code we need to be sure
            // that the session instance will be created and it will initialize communication between JS code
            // and managed marhsaler.
            Microsoft.Plugin.addEventListener("pluginready", function () {
                getCurrentSession();
            });
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
/// <reference path="DiagnosticsHub.Interfaces.ts" />
/// <reference path="Logger.ts" />
/// <reference path="DiagnosticsHubNativeHost.ts" />
/// <reference path="Session.ts" />
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        (function (DiagnosticsHub) {
            //
            // Copyright (c) Microsoft Corporation.  All rights reserved.
            //
            (function (DataWarehouse) {
                "use strict";

                var DataWarehouseService = (function () {
                    function DataWarehouseService() {
                        this._serviceProxy = Microsoft.Plugin.Utilities.JSONMarshaler.attachToPublishedObject("Microsoft.DiagnosticsHub.VisualStudio.Presentation.JavaScriptModels.DataWarehouseServiceMarshaler", {}, true);
                        this._logger = DiagnosticsHub.getLogger();
                    }
                    DataWarehouseService.prototype.getAllDataSourceInfos = function (callback) {
                        var _this = this;
                        this._serviceProxy._call("getAllDataSourceInfos").done(function (result) {
                            var infos = [];

                            for (var i = 0; i < result.length; i++) {
                                var dataSource = result[i];
                                if (dataSource.type === 1 /* File */ || dataSource.type === 2 /* Directory */ || dataSource.type === 4 /* Package */) {
                                    infos.push(dataSource);
                                } else {
                                    _this._logger.error("Unknown data source info type: " + dataSource.type);
                                }
                            }

                            callback(infos);
                        });
                    };
                    return DataWarehouseService;
                })();

                var _service = null;

                function getDataWarehouseService() {
                    if (_service === null) {
                        _service = new DataWarehouseService();
                    }

                    return _service;
                }
                DataWarehouse.getDataWarehouseService = getDataWarehouseService;

                // Initialization step
                Microsoft.Plugin.addEventListener("pluginready", function () {
                    getDataWarehouseService();
                });
            })(DiagnosticsHub.DataWarehouse || (DiagnosticsHub.DataWarehouse = {}));
            var DataWarehouse = DiagnosticsHub.DataWarehouse;
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        // -----------------------------------------------------------------------------
        // Copyright (c) Microsoft Corporation.  All rights reserved.
        // -----------------------------------------------------------------------------
        (function (DiagnosticsHub) {
            "use strict";

            /**
            * Basic implementation of a GUID in TypeScript
            */
            var Guid = (function () {
                /**
                * Creates a new GUID from the specified string value
                * @param {string} value GUID string in the format of
                * "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" or "{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}"
                * @throws {Error} Will throw JSProfiler.1010 if the GUID is an invalid format
                */
                function Guid(value) {
                    if (value.length === 38 && value[0] === "{" && value[37] === "}") {
                        value = value.substr(1, 36);
                    }

                    if (value.length !== 36) {
                        throw new Error(Microsoft.Plugin.Resources.getErrorString("JSProfiler.1010"));
                    }

                    this._value = value.toLowerCase();
                    if (!Guid.GuidRegEx.test(this._value)) {
                        throw new Error(Microsoft.Plugin.Resources.getErrorString("JSProfiler.1010"));
                    }
                }
                /**
                * Returns a new GUID object
                */
                Guid.newGuid = function () {
                    return new Guid(Guid.createRandomToken());
                };

                /**
                * Returns true if guid values are equal.
                */
                Guid.prototype.equals = function (other) {
                    return this._value.toLowerCase() === other._value.toLowerCase();
                };

                /**
                * Returns this GUID as a string in the format of "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                * @returns {string} This GUID as a string in the format of "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                */
                Guid.prototype.toString = function () {
                    return this._value;
                };

                Guid.createRandomToken = function () {
                    return "rrrrrrrr-rrrr-4rrr-srrr-rrrrrrrrrrrr".replace(/[rs]/g, function (character) {
                        var randomNumber = Math.random() * 16 | 0;
                        if (character !== "r") {
                            randomNumber = (randomNumber & 0x3 | 0x8);
                        }

                        return randomNumber.toString(16);
                    });
                };
                Guid.GuidRegEx = new RegExp("^[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}$");
                return Guid;
            })();
            DiagnosticsHub.Guid = Guid;
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
/// <reference path="Guid.ts" />
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        // -----------------------------------------------------------------------------
        // Copyright (c) Microsoft Corporation.  All rights reserved.
        // -----------------------------------------------------------------------------
        (function (DiagnosticsHub) {
            "use strict";

            var _documentToolsServiceProxy = null;

            /**
            * Service proxy to interact with the DocumentToolsService in the Diagnostics Hub runtime
            */
            var DocumentToolsService = (function () {
                /**
                * Creates a new instance of the DocumentToolsService. All instances in the session
                * interact with the same service within the Diagnostics Hub runtime
                */
                function DocumentToolsService() {
                    if (_documentToolsServiceProxy === null) {
                        _documentToolsServiceProxy = Microsoft.Plugin.Utilities.JSONMarshaler.attachToPublishedObject("Microsoft.DiagnosticsHub.VisualStudio.Presentation.JavaScriptModels.DocumentToolsServiceMarshaler", {}, true);
                    }
                }
                /**
                * Adds the specified tool to the selected tools for this session
                * @param {Guid} toolId GUID ID of the tool to add
                * @returns {Microsoft.Plugin.IPromise<void>}
                */
                DocumentToolsService.prototype.addTool = function (toolId) {
                    return _documentToolsServiceProxy._call("addTool", toolId.toString());
                };

                /**
                * Removes the specified tool from the selected tools for this session
                * @param {Guid} toolId GUID ID of the tool to remove
                * @returns {Microsoft.Plugin.IPromise<void>}
                */
                DocumentToolsService.prototype.removeTool = function (toolId) {
                    return _documentToolsServiceProxy._call("removeTool", toolId.toString());
                };

                /**
                * Gets the available tools to choose from for this session
                * @returns {Microsoft.Plugin.IPromise<IToolInformationDTO[]>}
                */
                DocumentToolsService.prototype.getAvailableTools = function () {
                    return _documentToolsServiceProxy._call("getAvailableTools");
                };
                return DocumentToolsService;
            })();
            DiagnosticsHub.DocumentToolsService = DocumentToolsService;
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        (function (DiagnosticsHub) {
            "use strict";

            /**
            * @private Internal Use Only
            */
            var Publisher = (function () {
                /**
                * @constructor
                * @param {string[]} events - List of supported events.
                */
                function Publisher(events) {
                    if (typeof events === "undefined") { events = null; }
                    /** Event publisher */
                    // List of supported events.
                    this._events = {};
                    // List of all registered events.
                    this._listeners = {};
                    if (events && events.length > 0) {
                        for (var i = 0; i < events.length; i++) {
                            var type = events[i];
                            if (type) {
                                this._events[type] = type;
                            }
                        }
                    } else {
                        // We do not restrict event types in this case
                        this._events = null;
                    }
                }
                /**
                * Dispose method that will remove all events and listeners
                * this publisher is holding a reference to
                */
                Publisher.prototype.dispose = function () {
                    delete this._events;
                    delete this._listeners;
                };

                /**
                * Add event listener.
                * @param {string} eventType - Event type.
                * @param {(any) => void} func - Callback function.
                */
                Publisher.prototype.addEventListener = function (eventType, func) {
                    if (eventType && func) {
                        if (this._events === null || this._events[eventType]) {
                            var callbacks = this._listeners[eventType] ? this._listeners[eventType] : this._listeners[eventType] = [];
                            callbacks.push(func);
                        }
                    }
                };

                /**
                * Remove event listener.
                * @param {string} eventType - Event type.
                * @param {(any) => void} func - Callback function.
                */
                Publisher.prototype.removeEventListener = function (eventType, func) {
                    if (eventType && func) {
                        if (this._events === null || this._events[eventType]) {
                            var callbacks = this._listeners[eventType];
                            if (callbacks) {
                                for (var i = 0; i < callbacks.length; i++) {
                                    if (func === callbacks[i]) {
                                        callbacks.splice(i, 1);
                                        break;
                                    }
                                }

                                if (callbacks.length === 0) {
                                    delete this._listeners[eventType];
                                }
                            }
                        }
                    }
                };

                /**
                * Invoke event listener.
                * @param {string} eventType - Event type.
                * @param {any} args - Event argument.
                */
                Publisher.prototype.invokeListener = function (eventType, args) {
                    if (eventType) {
                        if (this._events === null || this._events[eventType]) {
                            var callbacks = this._listeners[eventType];
                            if (callbacks) {
                                for (var i = 0; i < callbacks.length; i++) {
                                    var func = callbacks[i];
                                    if (func) {
                                        func(args);
                                    }
                                }
                            }
                        }
                    }
                };
                return Publisher;
            })();
            DiagnosticsHub.Publisher = Publisher;
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
/// <reference path="DiagnosticsHub.Interfaces.ts" />
/// <reference path="Logger.ts" />
/// <reference path="Publisher.ts" />
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        //
        // Copyright (c) Microsoft Corporation.  All rights reserved.
        //
        (function (DiagnosticsHub) {
            "use strict";

            var EventAggregator = (function () {
                function EventAggregator(logger) {
                    var _this = this;
                    this._eventsListeners = {};
                    this._publisher = new DiagnosticsHub.Publisher();

                    this._logger = logger;
                    this._eventAggregatorProxy = Microsoft.Plugin.Utilities.JSONMarshaler.attachToPublishedObject("Microsoft.DiagnosticsHub.VisualStudio.Presentation.JavaScriptModels.EventAggregatorMarshaler", {}, true);
                    this._eventAggregatorProxy.addEventListener("globalEventHandler", function (eventArgs) {
                        _this.globalEventHandler(eventArgs);
                    });
                }
                EventAggregator.prototype.addEventListener = function (eventType, listener) {
                    this._publisher.addEventListener(eventType, listener);
                    this._logger.debug("EventAggregator:: Event listener added for event type '" + eventType + "'");
                };

                EventAggregator.prototype.removeEventListener = function (eventType, listener) {
                    this._publisher.removeEventListener(eventType, listener);
                    this._logger.debug("EventAggregator:: Event listener removed for event type '" + eventType + "'");
                };

                EventAggregator.prototype.globalEventHandler = function (eventArgs /* : Microsoft.DiagnosticsHub.GlobalHubEventArgs */ ) {
                    var eventType = eventArgs.EventType;

                    this._logger.debug("EventAggregator:: Handling event type " + eventType + ".");

                    var dataString = eventArgs.HubEventArgs.Data;
                    this._logger.debug("EventAggregator:: Raise handler for event type " + eventType + " with data " + dataString + ".");

                    try  {
                        var data = null;
                        if (dataString !== null && typeof dataString === "string") {
                            data = JSON.parse(dataString);
                        }

                        this._publisher.invokeListener(eventType, data);
                    } catch (e) {
                        this._logger.error(e.toString());
                    }
                };

                EventAggregator.prototype.raiseEvent = function (eventType, data) {
                    var dataString = null;
                    if (data !== null && typeof data !== "undefined") {
                        dataString = JSON.stringify(data);
                    }

                    this._logger.debug("EventAggregator:: Raising event type " + eventType + " with data " + dataString + ".");
                    this._eventAggregatorProxy._call("raiseEvent", eventType, dataString);
                };
                return EventAggregator;
            })();

            var LocalEventAggregator = (function () {
                function LocalEventAggregator() {
                    this._publisher = new DiagnosticsHub.Publisher();
                }
                LocalEventAggregator.prototype.addEventListener = function (eventType, listener) {
                    this._publisher.addEventListener(eventType, listener);
                };

                LocalEventAggregator.prototype.removeEventListener = function (eventType, listener) {
                    this._publisher.removeEventListener(eventType, listener);
                };

                LocalEventAggregator.prototype.raiseEvent = function (eventType, data) {
                    this._publisher.invokeListener(eventType, data);
                };
                return LocalEventAggregator;
            })();
            DiagnosticsHub.LocalEventAggregator = LocalEventAggregator;

            var _eventAggregator = null;

            /** Get event aggregator */
            function getEventAggregator() {
                if (_eventAggregator === null) {
                    // For F12, use a local event aggregator
                    if (Microsoft.Plugin.F12) {
                        _eventAggregator = new LocalEventAggregator();
                    } else {
                        _eventAggregator = new EventAggregator(DiagnosticsHub.getLogger());
                    }
                }

                return _eventAggregator;
            }
            DiagnosticsHub.getEventAggregator = getEventAggregator;

            // Initialization step
            Microsoft.Plugin.addEventListener("pluginready", function () {
                getEventAggregator();
            });
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
//
// Copyright (c) Microsoft Corporation.  All rights reserved.
//
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        (function (DiagnosticsHub) {
            "use strict";

            var OutputWindowsService = (function () {
                function OutputWindowsService() {
                    this._loggerProxy = Microsoft.Plugin.Utilities.JSONMarshaler.attachToPublishedObject("Microsoft.DiagnosticsHub.VisualStudio.Presentation.JavaScriptModels.OutputWindowServiceMarshaler", {}, true);
                }
                OutputWindowsService.prototype.outputLine = function (message) {
                    this._loggerProxy._call("outputLine", message);
                };

                OutputWindowsService.prototype.outputLineAndShow = function (message) {
                    this._loggerProxy._call("outputLineAndShow", message);
                };

                OutputWindowsService.prototype.outputString = function (message) {
                    this._loggerProxy._call("outputString", message);
                };

                OutputWindowsService.prototype.outputStringAndShow = function (message) {
                    this._loggerProxy._call("outputStringAndShow", message);
                };
                return OutputWindowsService;
            })();

            var _outputWindowService = null;

            /** Get output window service */
            function getOutputWindowsService() {
                if (_outputWindowService === null) {
                    _outputWindowService = new OutputWindowsService();
                }

                return _outputWindowService;
            }
            DiagnosticsHub.getOutputWindowsService = getOutputWindowsService;

            // Initialization step
            Microsoft.Plugin.addEventListener("pluginready", function () {
                getOutputWindowsService();
            });
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        // -----------------------------------------------------------------------------
        // Copyright (c) Microsoft Corporation.  All rights reserved.
        // -----------------------------------------------------------------------------
        (function (DiagnosticsHub) {
            "use strict";

            var PerformanceDebuggerToolsService = (function () {
                function PerformanceDebuggerToolsService() {
                    this._proxy = Microsoft.Plugin.Utilities.JSONMarshaler.attachToPublishedObject("Microsoft.DiagnosticsHub.VisualStudio.Presentation.JavaScriptModels.PerformanceDebuggerToolsServiceMarshaler", {}, true);

                    this._toolStateChangedEvent = new DiagnosticsHub.ObservableEvent(this._proxy, "DiagnosticsHub.ToolStateChangedEvent");
                }
                Object.defineProperty(PerformanceDebuggerToolsService.prototype, "toolStateChangedEvent", {
                    /** @inheritdoc */
                    get: function () {
                        return this._toolStateChangedEvent;
                    },
                    enumerable: true,
                    configurable: true
                });

                /** @inheritdoc */
                PerformanceDebuggerToolsService.prototype.getAvailableToolsInformationAndState = function () {
                    return this._proxy._call("getAvailableToolsInformation");
                };

                /** @inheritdoc */
                PerformanceDebuggerToolsService.prototype.setToolEnabled = function (toolId, active) {
                    this._proxy._call("setToolEnabled", toolId, active);
                };
                return PerformanceDebuggerToolsService;
            })();
            DiagnosticsHub.PerformanceDebuggerToolsService = PerformanceDebuggerToolsService;

            var _performanceDebuggerToolsService;

            function getPerformanceDebuggerToolsService() {
                if (!_performanceDebuggerToolsService) {
                    _performanceDebuggerToolsService = new PerformanceDebuggerToolsService();
                }

                return _performanceDebuggerToolsService;
            }
            DiagnosticsHub.getPerformanceDebuggerToolsService = getPerformanceDebuggerToolsService;
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
/// <reference path="EventAggregator.ts" />
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        //
        // Copyright (c) Microsoft Corporation.  All rights reserved.
        //
        (function (DiagnosticsHub) {
            "use strict";

            var ObservableEvent = (function () {
                function ObservableEvent(eventSource, eventName) {
                    this._eventName = eventName;
                    this._eventSource = eventSource;
                }
                /** @inheritdoc */
                ObservableEvent.prototype.addEventListener = function (func) {
                    // TS can't parse the template correctly, so we pass any as the arguments,
                    // but enforce the template argument on the function signature.
                    this._eventSource.addEventListener(this._eventName, func);
                };

                /** @inheritdoc */
                ObservableEvent.prototype.removeEventListener = function (func) {
                    // TS can't parse the template correctly, so we pass any as the arguments,
                    // but enforce the template argument on the function signature.
                    this._eventSource.removeEventListener(this._eventName, func);
                };
                return ObservableEvent;
            })();
            DiagnosticsHub.ObservableEvent = ObservableEvent;

            var PerformanceDebuggerEventManager = (function () {
                function PerformanceDebuggerEventManager() {
                    this._proxy = getPerformanceDebuggerStateMarshaler();

                    this._debugModeBreak = new ObservableEvent(this._proxy, "DebugModeBreakEvent");
                    this._debugModeRun = new ObservableEvent(this._proxy, "DebugModeRunEvent");
                }
                Object.defineProperty(PerformanceDebuggerEventManager.prototype, "debugModeRunEvent", {
                    /** @inheritdoc */
                    get: function () {
                        return this._debugModeRun;
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(PerformanceDebuggerEventManager.prototype, "debugModeBreakEvent", {
                    /** @inheritdoc */
                    get: function () {
                        return this._debugModeBreak;
                    },
                    enumerable: true,
                    configurable: true
                });

                /** @inheritdoc */
                PerformanceDebuggerEventManager.prototype.isDebuggerInBreakMode = function () {
                    return this._proxy._call("isDebuggerInBreakMode");
                };
                return PerformanceDebuggerEventManager;
            })();

            var PerformanceDebuggerStateService = (function () {
                function PerformanceDebuggerStateService() {
                    this._proxy = getPerformanceDebuggerStateMarshaler();
                    this._statusMessageChanged = new ObservableEvent(this._proxy, "StatusMessageChangedEvent");
                }
                Object.defineProperty(PerformanceDebuggerStateService.prototype, "statusMessageChangedEvent", {
                    /** @inheritdoc */
                    get: function () {
                        return this._statusMessageChanged;
                    },
                    enumerable: true,
                    configurable: true
                });

                /** @inheritdoc */
                PerformanceDebuggerStateService.prototype.getLastNonActiveStatusMessage = function () {
                    return this._proxy._call("getLastNonActiveStatusMessage");
                };

                /** @inheritdoc */
                PerformanceDebuggerStateService.prototype.isDocumentActiveSession = function () {
                    return this._proxy._call("isDocumentActiveSession");
                };
                return PerformanceDebuggerStateService;
            })();

            var _performanceDebuggerEventManager = null;

            /** Get Performance Debugger event manager */
            function getPerformanceDebuggerEventManager() {
                if (_performanceDebuggerEventManager === null) {
                    _performanceDebuggerEventManager = new PerformanceDebuggerEventManager();
                }

                return _performanceDebuggerEventManager;
            }
            DiagnosticsHub.getPerformanceDebuggerEventManager = getPerformanceDebuggerEventManager;

            var _performanceDebuggerStateService = null;

            /**
            * Get Performance Debugger state service
            * @private Internal Use Only
            */
            function getPerformanceDebuggerStateService() {
                if (_performanceDebuggerStateService === null) {
                    _performanceDebuggerStateService = new PerformanceDebuggerStateService();
                }

                return _performanceDebuggerStateService;
            }
            DiagnosticsHub.getPerformanceDebuggerStateService = getPerformanceDebuggerStateService;

            var _performanceDebuggerStateMarshaler = null;
            function getPerformanceDebuggerStateMarshaler() {
                if (_performanceDebuggerStateMarshaler === null) {
                    _performanceDebuggerStateMarshaler = Microsoft.Plugin.Utilities.JSONMarshaler.attachToPublishedObject("Microsoft.DiagnosticsHub.VisualStudio.Presentation.JavaScriptModels.PerformanceDebuggerStateMarshaler", {}, true);
                }

                return _performanceDebuggerStateMarshaler;
            }
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
//
// Copyright (c) Microsoft Corporation.  All rights reserved.
//
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        (function (DiagnosticsHub) {
            "use strict";

            // Extensions for promises.
            var PromiseEx = (function () {
                function PromiseEx() {
                }
                // Creates a new promise that will run to completion when the given promise is completed, or will
                // cancel after the given msTimeout.
                PromiseEx.waitForPromise = function (promise, msTimeout) {
                    var executed;
                    var timedOut;

                    var result = promise.then(function (arg) {
                        if (!timedOut) {
                            executed = true;
                        }

                        return arg;
                    }, function (e) {
                        return e;
                    }, function (p) {
                        return p;
                    });

                    setTimeout(function () {
                        timedOut = true;
                        if (!executed) {
                            result.cancel();
                        }
                    }, msTimeout);

                    return result;
                };
                return PromiseEx;
            })();
            DiagnosticsHub.PromiseEx = PromiseEx;
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
/// <reference path="DiagnosticsHub.Interfaces.ts" />
/// <reference path="Logger.ts" />
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        (function (DiagnosticsHub) {
            //
            // Copyright (c) Microsoft Corporation.  All rights reserved.
            //
            (function (Collectors) {
                "use strict";

                var StandardTransportService = (function () {
                    function StandardTransportService(logger) {
                        var _this = this;
                        this._messageListeners = {};
                        this._logger = logger;
                        this._proxy = Microsoft.Plugin.Utilities.JSONMarshaler.attachToPublishedObject("Microsoft.DiagnosticsHub.VisualStudio.Presentation.JavaScriptModels.StandardTransportServicePortMarshaller", {}, true);

                        this._proxy.addEventListener("stringMessageReceived", function (eventArgs) {
                            _this._logger.debug("StandardTransportService.stringMessageReceived");
                            _this.onStringMessageReceived(eventArgs);
                        });
                    }
                    StandardTransportService.prototype.getIsRemoteConnection = function () {
                        return this._proxy._call("getIsRemoteConnection");
                    };

                    StandardTransportService.prototype.sendStringToCollectionAgent = function (agentClassId, request) {
                        this._logger.debug("StandardTransportService.sendStringToCollectionAgent");
                        return this._proxy._call("sendStringToCollectionAgent", agentClassId, request);
                    };

                    StandardTransportService.prototype.downloadFile = function (targetFilePath, localFilePath) {
                        this._logger.debug("StandardTransportService.downloadFile");
                        return this._proxy._call("downloadFile", targetFilePath, localFilePath);
                    };

                    StandardTransportService.prototype.addMessageListener = function (listenerGuid, listener) {
                        var _this = this;
                        var guidAsString = listenerGuid.toString();

                        this._logger.debug("StandardTransportService.addMessageListener(" + listenerGuid + ")");

                        if (this._messageListeners[guidAsString]) {
                            this._logger.error("Listener already exists with guid = " + guidAsString);
                            throw new Error("Listener already exists with guid = " + guidAsString);
                        }

                        this._messageListeners[guidAsString] = listener;

                        return this._proxy._call("enableEventsForListenerId", guidAsString).then(null, function (value) {
                            _this._messageListeners[guidAsString] = null;
                        });
                    };

                    StandardTransportService.prototype.flushCurrentResult = function () {
                        this._logger.debug("StandardTransportService.flushCurrentResult");
                        return this._proxy._call("flushCurrentResult");
                    };

                    StandardTransportService.prototype.onStringMessageReceived = function (eventArgs) {
                        this._logger.debug("StandardTransportService.onStringMessageReceived");

                        var listenerGuid = eventArgs.ListenerId;
                        var message = eventArgs.Message;

                        if (this._messageListeners[listenerGuid]) {
                            var listener = this._messageListeners[listenerGuid];
                            listener(message);
                        } else {
                            this._logger.warning("Unexpected message received without a message listener. listenerGuid=" + listenerGuid);
                        }
                    };
                    return StandardTransportService;
                })();

                var _standardTransportService = null;

                function getStandardTransportService() {
                    if (_standardTransportService === null) {
                        _standardTransportService = new StandardTransportService(DiagnosticsHub.getLogger());
                    }

                    return _standardTransportService;
                }
                Collectors.getStandardTransportService = getStandardTransportService;
            })(DiagnosticsHub.Collectors || (DiagnosticsHub.Collectors = {}));
            var Collectors = DiagnosticsHub.Collectors;
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
/// <reference path="DiagnosticsHub.Interfaces.ts" />
/// <reference path="Logger.ts" />
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        (function (DiagnosticsHub) {
            //
            // Copyright (c) Microsoft Corporation.  All rights reserved.
            //
            (function (Collectors) {
                "use strict";

                var CollectorTransportServiceController = (function () {
                    function CollectorTransportServiceController(logger) {
                        var _this = this;
                        this._messageListeners = {};
                        this._logger = logger;
                        this._proxy = Microsoft.Plugin.Utilities.JSONMarshaler.attachToPublishedObject("Microsoft.DiagnosticsHub.VisualStudio.Presentation.JavaScriptModels.CollectorTransportServiceControllerMarshaler", {}, true);

                        this._proxy.addEventListener("stringMessageReceived", function (eventArgs) {
                            _this._logger.debug("CollectorTransportServiceController.stringMessageReceived");
                            _this.onStringMessageReceived(eventArgs);
                        });
                    }
                    CollectorTransportServiceController.prototype.getIsRemoteConnection = function (collectorId) {
                        return this._proxy._call("getIsRemoteConnection", collectorId || "");
                    };

                    CollectorTransportServiceController.prototype.sendStringToCollectionAgent = function (agentClassId, request, collectorId) {
                        this._logger.debug("CollectorTransportServiceController.sendStringToCollectionAgent");
                        return this._proxy._call("sendStringToCollectionAgent", agentClassId, request, collectorId || "");
                    };

                    CollectorTransportServiceController.prototype.downloadFile = function (targetFilePath, localFilePath, collectorId) {
                        this._logger.debug("CollectorTransportServiceController.downloadFile");
                        return this._proxy._call("downloadFile", targetFilePath, localFilePath, collectorId || "");
                    };

                    CollectorTransportServiceController.prototype.addMessageListener = function (listenerGuid, listener, collectorId) {
                        var _this = this;
                        var guidAsString = listenerGuid.toString();

                        this._logger.debug("CollectorTransportServiceController.addMessageListener(" + guidAsString + ")");

                        if (this._messageListeners[guidAsString]) {
                            this._logger.error("Listener already exists with guid = " + guidAsString);
                            throw new Error("Listener already exists with guid = " + guidAsString);
                        }

                        this._messageListeners[guidAsString] = listener;

                        return this._proxy._call("enableEventsForListenerId", guidAsString, collectorId || "").then(null, function (value) {
                            _this._messageListeners[guidAsString] = null;
                            _this._logger.error(JSON.stringify(value));
                        });
                    };

                    CollectorTransportServiceController.prototype.onStringMessageReceived = function (eventArgs) {
                        this._logger.debug("CollectorTransportServiceController.onStringMessageReceived");

                        var listenerGuid = eventArgs.ListenerId;
                        var message = eventArgs.Message;

                        if (this._messageListeners[listenerGuid]) {
                            var listener = this._messageListeners[listenerGuid];
                            listener(eventArgs);
                        } else {
                            this._logger.warning("Unexpected message received without a message listener. listenerGuid=" + listenerGuid);
                        }
                    };
                    return CollectorTransportServiceController;
                })();

                var _collectorTransportServiceController = null;

                function getICollectorTransportServiceController() {
                    if (_collectorTransportServiceController === null) {
                        _collectorTransportServiceController = new CollectorTransportServiceController(DiagnosticsHub.getLogger());
                    }

                    return _collectorTransportServiceController;
                }
                Collectors.getICollectorTransportServiceController = getICollectorTransportServiceController;
            })(DiagnosticsHub.Collectors || (DiagnosticsHub.Collectors = {}));
            var Collectors = DiagnosticsHub.Collectors;
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
/// <reference path="Logger.ts" />
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        //
        // Copyright (c) Microsoft Corporation.  All rights reserved.
        //
        (function (DiagnosticsHub) {
            "use strict";

            var DiagnosticsHubWebHost = (function () {
                function DiagnosticsHubWebHost(logger) {
                    this._apiVersion = 1.0;
                    this._requests = {};
                    this._isVsHubDisconnected = false;
                    this._logger = logger;
                    this._scriptedControlId = DiagnosticsHub.Guid.newGuid();
                    this._completeTopic = "complete/" + this._scriptedControlId.toString();
                    this._errorTopic = "error/" + this._scriptedControlId.toString();
                    this._progressTopic = "progress/" + this._scriptedControlId.toString();
                    this._disconnectEventName = "disconnect/" + this._scriptedControlId.toString();
                    this._vsHubService = Microsoft.Plugin.Utilities.JSONMarshaler.attachToPublishedObject("Microsoft.DiagnosticsHub.VisualStudio.Presentation.JavaScriptModels.VsHubServiceMarshaler", {}, true);
                    this._automationManager = DiagnosticsHub.getAutomationManager(this._logger);
                    this._vsHubService.addEventListener(this._completeTopic, this.onComplete.bind(this));
                    this._vsHubService.addEventListener(this._errorTopic, this.onError.bind(this));
                    this._vsHubService.addEventListener(this._progressTopic, this.onProgress.bind(this));
                    this._vsHubService.addEventListener(this._disconnectEventName, this.onVsHubDisconnect.bind(this));
                }
                DiagnosticsHubWebHost.prototype.requestSync = function (controllerId, actionId, sessionId, request) {
                    throw new Error("Not Implemented.");
                };

                DiagnosticsHubWebHost.prototype.request = function (controllerId, actionId, sessionId, request) {
                    return this.requestAsync(controllerId, actionId, sessionId, request);
                };

                DiagnosticsHubWebHost.prototype.requestAsync = function (controllerId, actionId, sessionId, request) {
                    var _this = this;
                    var requestId = DiagnosticsHub.Guid.newGuid();

                    // It is called when request needs to be aborted/cancel.
                    var onCancel = function () {
                        if (_this._vsHubService && requestId) {
                            _this._logger.debug("DataWarehouseWebHost Cancel: " + requestId.toString());
                            _this._vsHubService._call("publish", "cancel/" + requestId.toString(), requestId.toString());
                        }
                    };

                    var dispatchCallback = function (promiseHandler, jsonResponse, promiseType) {
                        if (promiseHandler !== null) {
                            var result = null;

                            if (jsonResponse !== null) {
                                try  {
                                    if (jsonResponse === null || jsonResponse === "" || (typeof jsonResponse !== "string")) {
                                        result = jsonResponse;
                                        _this._logger.debug(result);
                                    } else {
                                        result = JSON.parse(jsonResponse);
                                        _this._logger.debug(JSON.stringify(result));
                                    }
                                } catch (e) {
                                    _this._logger.error("Could not parse " + promiseType + " response: " + jsonResponse);
                                    _this._logger.error(e.message);
                                }
                            }

                            try  {
                                promiseHandler(result);
                            } catch (e) {
                                _this._logger.error(JSON.stringify(e));
                            }
                        } else {
                            _this._logger.warning("DiagnosticsHubNativeHost: " + promiseType + " callback is null.");
                        }
                    };

                    var promiseInitialization;
                    if (this._isVsHubDisconnected) {
                        promiseInitialization = function (completePromise, errorPromise, progressPromise) {
                            dispatchCallback(errorPromise, null, "VsHubDisconnectAlreadyOccurred");
                        };
                    } else {
                        promiseInitialization = function (completePromise, errorPromise, progressPromise) {
                            // handler listening to complete from data warehouse.
                            var complete = function (result) {
                                _this._logger.debug("DataWarehouseWebHost Success: " + requestId.toString());
                                dispatchCallback(completePromise, result, "completePromise");
                            };

                            // handler listening to error from data warehouse.
                            var error = function (result) {
                                _this._logger.error("DataWarehouseWebHost Failed: " + requestId.toString());
                                dispatchCallback(errorPromise, result, "errorPromise");
                            };

                            // handler listening to progress from data warehouse.
                            var progress = function (result) {
                                _this._logger.debug("DataWarehouseWebHost Progress: " + requestId.toString());
                                dispatchCallback(progressPromise, result, "progressPromise");
                            };

                            // Error handler for ajax request
                            var errorHandler = function (result) {
                                _this._logger.error("DataWarehouseWebHost Ajax Request Failed: " + requestId.toString());
                                var errorMsg = new Error();
                                if (result) {
                                    errorMsg.message = errorMsg.name = result.ReasonPhrase;
                                }

                                errorPromise(errorMsg);
                            };

                            // Success handler for ajax request
                            var successHandler = function (result) {
                                if (!result || !result.IsSuccessStatusCode) {
                                    errorHandler(result);
                                }
                            };

                            _this._requests[requestId.toString()] = {
                                complete: complete,
                                error: error,
                                progress: progress
                            };

                            _this.ensureSubscribed().then(function (isSubscribed) {
                                if (!isSubscribed) {
                                    _this._logger.error("DataWarehouseWebHost: VSHub Connection Failed.");
                                    return Microsoft.Plugin.Promise.wrapError(new Error("DataWarehouseWebHost: VsHubService subscription failed."));
                                }

                                if (!request) {
                                    request = {};
                                }

                                request["dwSessionId"] = sessionId;
                                request["dwTopics"] = {
                                    complete: _this._completeTopic,
                                    error: _this._errorTopic,
                                    progress: _this._progressTopic
                                };
                                request["dwRequestId"] = requestId.toString();
                                var data = JSON.stringify(request);
                                _this._logger.debug("DataWarehouseWebHost Request: " + data);
                                return _this._vsHubService._call("requestAsync", controllerId, actionId, data);
                            }).then(successHandler, errorHandler);
                        };
                    }
                    ;

                    // this object contains information so our automation can parse the various requests going into the datawarehouse
                    var requestArgs = {
                        controllerId: controllerId,
                        actionId: actionId,
                        sessionId: sessionId,
                        request: request
                    };

                    var resultPromise = this._automationManager.getAutomationPromise(DiagnosticsHub.AutomationConstants.DataWarehouseRequestKey, promiseInitialization, onCancel.bind(this), requestArgs);
                    return resultPromise;
                };

                DiagnosticsHubWebHost.prototype.onComplete = function (result) {
                    if (this._requests[result.requestId]) {
                        var handlers = this._requests[result.requestId];
                        handlers.complete(result.data);
                        delete this._requests[result.requestId];
                    } else {
                        this._logger.debug(JSON.stringify("Skipped " + this._scriptedControlId.toString() + " :" + result));
                    }
                };

                DiagnosticsHubWebHost.prototype.onError = function (result) {
                    if (this._requests[result.requestId]) {
                        var handlers = this._requests[result.requestId];
                        handlers.error(result.data);
                        delete this._requests[result.requestId];
                    } else {
                        this._logger.debug(JSON.stringify("Skipped " + this._scriptedControlId.toString() + " :" + result));
                    }
                };

                DiagnosticsHubWebHost.prototype.onProgress = function (result) {
                    if (this._requests[result.requestId]) {
                        var handlers = this._requests[result.requestId];
                        handlers.progress(result.data);
                    } else {
                        this._logger.debug(JSON.stringify("Skipped " + this._scriptedControlId.toString() + " :" + result));
                    }
                };

                DiagnosticsHubWebHost.prototype.onVsHubDisconnect = function (result) {
                    if (this._isVsHubDisconnected) {
                        return;
                    }

                    this._isVsHubDisconnected = true;
                    this._logger.error("DataWarehouseWebHost Failed: VSHub Disconnected.");
                    for (var requestId in this._requests) {
                        var handlers = this._requests[requestId];
                        handlers.error(result);
                    }

                    this._requests = {};
                };

                DiagnosticsHubWebHost.prototype.ensureSubscribed = function () {
                    var _this = this;
                    if (this._isSubscribed) {
                        return Microsoft.Plugin.Promise.wrap(this._isSubscribed);
                    }

                    return this._vsHubService._call("subscribe", this._completeTopic, this._errorTopic, this._progressTopic, this._disconnectEventName).then(function (isSubscribed) {
                        return _this._isSubscribed = isSubscribed;
                    });
                };
                return DiagnosticsHubWebHost;
            })();
            DiagnosticsHub.DiagnosticsHubWebHost = DiagnosticsHubWebHost;
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
//
// Copyright (c) Microsoft Corporation.  All rights reserved.
//
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        (function (DiagnosticsHub) {
            // ******************************************************************************
            // NOTE: This file should be kept in sync with its managed and native copies
            // ******************************************************************************
            (function (DataWarehouse) {
                "use strict";

                /// <disable code="SA1301" justification="Keeping in sync with non-TypeScript code" />
                /**
                * Resource Identity (Part of Data Warehouse)
                */
                var ResourceIdentity = (function () {
                    function ResourceIdentity() {
                    }
                    ResourceIdentity.DiagnosticsPackage = "DiagnosticsHub.Resource.DiagnosticsPackage";

                    ResourceIdentity.EtlFile = "DiagnosticsHub.Resource.EtlFile";

                    ResourceIdentity.JavaScriptSource = "DiagnosticsHub.Resource.JavaScript.SourceDirectory";

                    ResourceIdentity.SymbolCache = "DiagnosticsHub.Resource.SymbolCache";

                    ResourceIdentity.UserNativeImageDirectory = "DiagnosticsHub.Resource.UserNativeImageDirectory";

                    ResourceIdentity.PlatformNativeImage = "DiagnosticsHub.Resource.PlatformNativeImage";

                    ResourceIdentity.PlatformWinmd = "DiagnosticsHub.Resource.PlatformWinmd";

                    ResourceIdentity.DWJsonFile = "DiagnosticsHub.Resource.DWJsonFile";

                    ResourceIdentity.UnknownFile = "DiagnosticsHub.Resource.File";

                    ResourceIdentity.UnknownDirectory = "DiagnosticsHub.Resource.Directory";
                    return ResourceIdentity;
                })();
                DataWarehouse.ResourceIdentity = ResourceIdentity;
            })(DiagnosticsHub.DataWarehouse || (DiagnosticsHub.DataWarehouse = {}));
            var DataWarehouse = DiagnosticsHub.DataWarehouse;
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
/// <reference path="Logger.ts" />
/// <reference path="JsonTimespan.ts" />
/// <reference path="DhContextData.ts" />
/// <reference path="DiagnosticsHubNativeHost.ts" />
/// <reference path="DataWarehouseService.ts" />
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        (function (DiagnosticsHub) {
            // -----------------------------------------------------------------------------
            // Copyright (c) Microsoft Corporation.  All rights reserved.
            // -----------------------------------------------------------------------------
            (function (DataWarehouse) {
                "use strict";

                var Constants = (function () {
                    function Constants() {
                    }
                    Constants.CONTROLLER_ID_DATAWAREHOUSE = 1;
                    Constants.CONTROLLER_ID_DATAWAREHOUSECONTEXTSERVICE = 2;
                    Constants.CONTROLLER_ID_DATAWAREHOUSECONTEXT = 3;
                    Constants.CONTROLLER_ID_DATAWAREHOUSEJMCSERVICE = 4;

                    Constants.ACTION_DATAWAREHOUSE_BEGININITIALIZATION = 1;
                    Constants.ACTION_DATAWAREHOUSE_ENDINITIALIZATION = 2;
                    Constants.ACTION_DATAWAREHOUSE_GETDATA = 3;
                    Constants.ACTION_DATAWAREHOUSE_GETRESULT = 4;
                    Constants.ACTION_DATAWAREHOUSE_DISPOSERESULT = 5;
                    Constants.ACTION_DATAWAREHOUSE_PUSHDATASOURCES = 6;
                    Constants.ACTION_DATAWAREHOUSE_INITIALIZATION_DEPRECATED = 100;
                    Constants.ACTION_DATAWAREHOUSE_CLOSE = 400;
                    Constants.ACTION_DATAWAREHOUSE_GETPRIVATEDATA = 401;
                    Constants.ACTION_DATAWAREHOUSE_SETPRIVATEDATA = 402;

                    Constants.ACTION_DATAWAREHOUSECONTEXTSERVICE_CREATECONTEXT = 1;
                    Constants.ACTION_DATAWAREHOUSECONTEXTSERVICE_DELETECONTEXT = 2;
                    Constants.ACTION_DATAWAREHOUSECONTEXTSERVICE_COPYCONTEXT = 3;
                    Constants.ACTION_DATAWAREHOUSECONTEXTSERVICE_GETCONTEXT = 4;
                    Constants.ACTION_DATAWAREHOUSECONTEXTSERVICE_GETGLOBALCONTEXT = 5;

                    Constants.ACTION_DATAWAREHOUSECONTEXT_GETTIMEDOMAIN = 1;
                    Constants.ACTION_DATAWAREHOUSECONTEXT_SETTIMEDOMAIN = 2;
                    Constants.ACTION_DATAWAREHOUSECONTEXT_GETMACHINEDOMAIN = 3;
                    Constants.ACTION_DATAWAREHOUSECONTEXT_ADDTOMACHINEDOMAIN = 4;
                    Constants.ACTION_DATAWAREHOUSECONTEXT_CLEARMACHINEDOMAIN = 5;
                    Constants.ACTION_DATAWAREHOUSECONTEXT_GETPROCESSDOMAIN = 6;
                    Constants.ACTION_DATAWAREHOUSECONTEXT_ADDTOPROCESSDOMAIN = 7;
                    Constants.ACTION_DATAWAREHOUSECONTEXT_CLEARPROCESSDOMAIN = 8;
                    Constants.ACTION_DATAWAREHOUSECONTEXT_GETTHREADDOMAIN = 9;
                    Constants.ACTION_DATAWAREHOUSECONTEXT_ADDTOTHREADDOMAIN = 10;
                    Constants.ACTION_DATAWAREHOUSECONTEXT_CLEARTHREADDOMAIN = 11;
                    Constants.ACTION_DATAWAREHOUSECONTEXT_GETCUSTOMDOMAIN = 12;
                    Constants.ACTION_DATAWAREHOUSECONTEXT_SETCUSTOMDOMAIN = 13;
                    Constants.ACTION_DATAWAREHOUSECONTEXT_SETDATA = 14;
                    Constants.ACTION_DATAWAREHOUSECONTEXT_GETDATA = 15;

                    Constants.ACTION_DATAWAREHOUSEJMCSERVICE_GETJMCENABLED = 1;
                    Constants.ACTION_DATAWAREHOUSEJMCSERVICE_SETJMCENABLED = 2;
                    return Constants;
                })();

                var DhJsonResult = (function () {
                    function DhJsonResult(resultId, sessionId, controller) {
                        this._resultId = resultId;
                        this._sessionId = sessionId;
                        this._controller = controller;
                    }
                    DhJsonResult.prototype.getResult = function (customData) {
                        var requestObject = null;

                        if (customData !== null) {
                            requestObject = { resultId: this._resultId, customData: JSON.stringify(customData) };
                        } else {
                            requestObject = { resultId: this._resultId };
                        }

                        return this._controller.request(Constants.ACTION_DATAWAREHOUSE_GETRESULT, requestObject);
                    };

                    DhJsonResult.prototype.dispose = function () {
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSE_DISPOSERESULT, { resultId: this._resultId });
                    };
                    return DhJsonResult;
                })();

                var DataWarehouseFactory = (function () {
                    function DataWarehouseFactory() {
                        this._getConfigurationPromise = null;
                        this._serviceProxy = Microsoft.Plugin.Utilities.JSONMarshaler.attachToPublishedObject("Microsoft.DiagnosticsHub.VisualStudio.Presentation.JavaScriptModels.DataWarehouseServiceMarshaler", {}, true);
                        this._logger = DiagnosticsHub.getLogger();
                    }
                    DataWarehouseFactory.prototype.getDataWarehouse = function (configuration) {
                        var _this = this;
                        if (typeof configuration === "undefined") { configuration = null; }
                        // If somebody gives us new configuration - we always create new datawarehouse for this configuration
                        // In other case we use previous configuration.
                        if (this._getConfigurationPromise === null || configuration) {
                            if (configuration === null) {
                                this._getConfigurationPromise = this._serviceProxy._call("getDataWarehouseConfiguration");
                            } else {
                                this._getConfigurationPromise = Microsoft.Plugin.Promise.wrap(configuration);
                            }
                        }

                        return this._getConfigurationPromise.then(function (configuration) {
                            _this._logger.debug("Got the sessionId '" + configuration.sessionId + "'. Creating datawarehouse...");
                            return new DataWarehouseInstance(configuration);
                        });
                    };
                    return DataWarehouseFactory;
                })();
                DataWarehouse.DataWarehouseFactory = DataWarehouseFactory;

                var DataWarehouseInstance = (function () {
                    function DataWarehouseInstance(dwConfiguration) {
                        this._logger = null;
                        this._dwConfiguration = null;
                        this._controller = null;
                        this._contextService = null;
                        this._jmcService = null;
                        this._logger = DiagnosticsHub.getLogger();
                        this._dwConfiguration = dwConfiguration;
                        this._controller = new DiagnosticsHub.HostController(this._dwConfiguration.sessionId, Constants.CONTROLLER_ID_DATAWAREHOUSE);
                    }
                    DataWarehouseInstance.prototype.getConfiguration = function () {
                        return this._dwConfiguration;
                    };

                    DataWarehouseInstance.prototype.getData = function (contextId, analyzerId) {
                        var jsonRequest = null;

                        if (!contextId) {
                            jsonRequest = { analyzerId: analyzerId };
                        } else {
                            jsonRequest = { contextId: contextId, analyzerId: analyzerId };
                        }

                        return this.getDataFromAnalyzer(jsonRequest);
                    };

                    DataWarehouseInstance.prototype.getFilteredData = function (filter, analyzerId) {
                        return this.getDataFromAnalyzer({ filter: serializeDhContextData(null, filter), analyzerId: analyzerId });
                    };

                    DataWarehouseInstance.prototype.getContextService = function () {
                        if (!this._contextService) {
                            this._contextService = new DhContextService(this._dwConfiguration.sessionId);
                        }

                        return this._contextService;
                    };

                    DataWarehouseInstance.prototype.getJmcService = function () {
                        if (!this._jmcService) {
                            this._jmcService = new JmcService(this._dwConfiguration.sessionId);
                        }

                        return this._jmcService;
                    };

                    DataWarehouseInstance.prototype.close = function () {
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSE_CLOSE);
                    };

                    DataWarehouseInstance.prototype.closeSynchronous = function () {
                        if (Microsoft.Plugin.F12) {
                            this._controller.requestSync(Constants.ACTION_DATAWAREHOUSE_CLOSE);
                        } else {
                            throw new Error(Microsoft.Plugin.Resources.getErrorString("JSProfiler.1009"));
                        }
                    };

                    DataWarehouseInstance.prototype.initialize = function () {
                        this._logger.debug("Initializing DataWarehouse...");
                        var jsonConfiguration = {
                            analyzers: this._dwConfiguration.analyzers,
                            dataSources: this._dwConfiguration.dataSources,
                            symbolStorePath: this._dwConfiguration.symbolStorePath || "",
                            symbolCachePath: this._dwConfiguration.symbolCachePath || "",
                            isJmcEnabled: (typeof this._dwConfiguration.isJmcEnabled === "undefined") ? true : this._dwConfiguration.isJmcEnabled
                        };

                        this._logger.debug("DataWarehouse configuration: " + JSON.stringify(jsonConfiguration));
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSE_INITIALIZATION_DEPRECATED, jsonConfiguration);
                    };

                    DataWarehouseInstance.prototype.beginInitialization = function () {
                        this._logger.debug("Begin initializing DataWarehouse");
                        var jsonConfiguration = {
                            analyzers: this._dwConfiguration.analyzers,
                            dataSources: this._dwConfiguration.dataSources,
                            symbolStorePath: this._dwConfiguration.symbolStorePath || "",
                            symbolCachePath: this._dwConfiguration.symbolCachePath || "",
                            isJmcEnabled: (typeof this._dwConfiguration.isJmcEnabled === "undefined") ? true : this._dwConfiguration.isJmcEnabled
                        };

                        this._logger.debug("DataWarehouse configuration: " + JSON.stringify(jsonConfiguration));
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSE_BEGININITIALIZATION, jsonConfiguration);
                    };

                    DataWarehouseInstance.prototype.pushDataSources = function (dataSources) {
                        this._logger.debug("Begin pushing data source(s) to DataWarehouse");
                        var payload = {
                            dataSources: dataSources
                        };

                        this._logger.debug("PushDataSources payload: " + JSON.stringify(payload));
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSE_PUSHDATASOURCES, payload);
                    };

                    DataWarehouseInstance.prototype.endInitialization = function () {
                        this._logger.debug("End initializing DataWarehouse");
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSE_ENDINITIALIZATION);
                    };

                    DataWarehouseInstance.prototype.getPrivateData = function (dataId, privateDataArg) {
                        this._logger.debug("Getting private data from DataWarehouse...");
                        var privateDataRequest = { id: dataId, dataArg: privateDataArg };
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSE_GETPRIVATEDATA, privateDataRequest);
                    };

                    DataWarehouseInstance.prototype.setPrivateData = function (dataId, privateData) {
                        this._logger.debug("Setting private data in DataWarehouse...");
                        var privateDataRequest = { id: dataId, data: privateData };
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSE_SETPRIVATEDATA, privateDataRequest);
                    };

                    DataWarehouseInstance.prototype.getDataFromAnalyzer = function (jsonRequest) {
                        var _this = this;
                        // In case if we use .then(...) for Promises we break progress notifications, so we want to handle callback
                        // and also propagate progress notifications, this is why we keep our own wrapper.
                        var completePromise;
                        var errorPromise;
                        var progressPromise;

                        var promiseInitialization = function (completed, error, progress) {
                            completePromise = completed;
                            errorPromise = error;
                            progressPromise = progress;
                        };

                        var requestPromise = this._controller.request(Constants.ACTION_DATAWAREHOUSE_GETDATA, jsonRequest).then(function (result) {
                            if (completePromise) {
                                var val = null;

                                if (result !== null && typeof result !== "undefined" && typeof result.dh_r_id === "string" && result.dh_r_id.length === 36) {
                                    // If this is GUID this is our result ID (see DataWarehouseController.cpp file, where we construct it)
                                    val = new DhJsonResult(result.dh_r_id, _this._dwConfiguration.sessionId, _this._controller);
                                } else {
                                    val = result;
                                }

                                completePromise(val);
                            }
                        }, function (error) {
                            if (errorPromise) {
                                errorPromise(error);
                            }
                        }, function (progress) {
                            if (progress) {
                                progressPromise(progress);
                            }
                        });

                        var oncancel = function () {
                            requestPromise.cancel();
                        };

                        return new Microsoft.Plugin.Promise(promiseInitialization, oncancel);
                    };
                    return DataWarehouseInstance;
                })();

                function serializeDhContextData(contextId, data) {
                    var result = {};

                    if (contextId) {
                        result["contextId"] = contextId;
                    }

                    if (data.timeDomain) {
                        result["timeDomain"] = {
                            begin: data.timeDomain.begin.jsonValue,
                            end: data.timeDomain.end.jsonValue
                        };
                    }

                    if (data.machineDomain) {
                        result["machineDomain"] = data.machineDomain;
                    }

                    if (data.processDomain) {
                        result["processDomain"] = data.processDomain;
                    }

                    if (data.threadDomain) {
                        result["threadDomain"] = data.threadDomain;
                    }

                    if (data.customDomain) {
                        result["customDomain"] = data.customDomain;
                    }

                    return result;
                }

                var DhContextService = (function () {
                    function DhContextService(sessionId) {
                        this._controller = new DiagnosticsHub.HostController(sessionId, Constants.CONTROLLER_ID_DATAWAREHOUSECONTEXTSERVICE);
                        this._sessionId = sessionId;
                    }
                    DhContextService.prototype.createContext = function (data) {
                        var _this = this;
                        var request = {};

                        if (data !== null && typeof data !== "undefined") {
                            request["data"] = serializeDhContextData(null, data);
                        }

                        return this._controller.request(Constants.ACTION_DATAWAREHOUSECONTEXTSERVICE_CREATECONTEXT, request).then(function (contextInfo) {
                            return new DhContext(contextInfo, _this._sessionId);
                        });
                    };

                    DhContextService.prototype.deleteContext = function (contextId) {
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSECONTEXTSERVICE_DELETECONTEXT, { contextId: contextId });
                    };

                    DhContextService.prototype.copyContext = function (contextId) {
                        var _this = this;
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSECONTEXTSERVICE_COPYCONTEXT, { contextId: contextId }).then(function (contextInfo) {
                            return new DhContext(contextInfo, _this._sessionId);
                        });
                    };

                    DhContextService.prototype.getContext = function (contextId) {
                        var _this = this;
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSECONTEXTSERVICE_GETCONTEXT, { contextId: contextId }).then(function (contextInfo) {
                            return new DhContext(contextInfo, _this._sessionId);
                        });
                    };

                    DhContextService.prototype.getGlobalContext = function () {
                        var _this = this;
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSECONTEXTSERVICE_GETGLOBALCONTEXT).then(function (contextInfo) {
                            return new DhContext(contextInfo, _this._sessionId);
                        });
                    };
                    return DhContextService;
                })();

                var DhContext = (function () {
                    function DhContext(contextInfo, sessionId) {
                        this._info = contextInfo;
                        this._sessionId = sessionId;
                        this._controller = new DiagnosticsHub.HostController(this._sessionId, Constants.CONTROLLER_ID_DATAWAREHOUSECONTEXT);
                    }
                    DhContext.prototype.getContextId = function () {
                        return this._info.contextId;
                    };

                    DhContext.prototype.getParentContextId = function () {
                        return this._info.parentContextId;
                    };

                    DhContext.prototype.setData = function (data) {
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSECONTEXT_SETDATA, serializeDhContextData(this._info.contextId, data));
                    };

                    DhContext.prototype.getData = function () {
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSECONTEXT_GETDATA, { contextId: this._info.contextId }).then(function (result) {
                            return {
                                timeDomain: new DiagnosticsHub.JsonTimespan(new DiagnosticsHub.BigNumber(result.timeDomain.begin.h, result.timeDomain.begin.l), new DiagnosticsHub.BigNumber(result.timeDomain.end.h, result.timeDomain.end.l)),
                                machineDomain: result.machineDomain,
                                processDomain: result.processDomain,
                                threadDomain: result.threadDomain,
                                customDomain: result.customDomain
                            };
                        });
                    };

                    DhContext.prototype.getTimeDomain = function () {
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSECONTEXT_GETTIMEDOMAIN, { contextId: this._info.contextId }).then(function (result) {
                            return new DiagnosticsHub.JsonTimespan(new DiagnosticsHub.BigNumber(result.begin.h, result.begin.l), new DiagnosticsHub.BigNumber(result.end.h, result.end.l));
                        });
                    };

                    DhContext.prototype.setTimeDomain = function (timeDomain) {
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSECONTEXT_SETTIMEDOMAIN, {
                            contextId: this._info.contextId,
                            timeDomain: {
                                begin: timeDomain.begin.jsonValue,
                                end: timeDomain.end.jsonValue
                            }
                        });
                    };

                    DhContext.prototype.getMachineDomain = function () {
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSECONTEXT_GETMACHINEDOMAIN, { contextId: this._info.contextId });
                    };

                    DhContext.prototype.addToMachineDomain = function (machineName) {
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSECONTEXT_ADDTOMACHINEDOMAIN, { contextId: this._info.contextId, machineName: machineName });
                    };

                    DhContext.prototype.clearMachineDomain = function () {
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSECONTEXT_CLEARMACHINEDOMAIN, { contextId: this._info.contextId });
                    };

                    DhContext.prototype.getProcessDomain = function () {
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSECONTEXT_GETPROCESSDOMAIN, { contextId: this._info.contextId });
                    };

                    DhContext.prototype.addToProcessDomain = function (processId) {
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSECONTEXT_ADDTOPROCESSDOMAIN, { contextId: this._info.contextId, processId: processId });
                    };

                    DhContext.prototype.clearProcessDomain = function () {
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSECONTEXT_CLEARPROCESSDOMAIN, { contextId: this._info.contextId });
                    };

                    DhContext.prototype.getThreadDomain = function () {
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSECONTEXT_GETTHREADDOMAIN, { contextId: this._info.contextId });
                    };

                    DhContext.prototype.addToThreadDomain = function (threadId) {
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSECONTEXT_ADDTOTHREADDOMAIN, { contextId: this._info.contextId, threadId: threadId });
                    };

                    DhContext.prototype.clearThreadDomain = function () {
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSECONTEXT_CLEARTHREADDOMAIN, { contextId: this._info.contextId });
                    };

                    DhContext.prototype.getCustomDomain = function (name) {
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSECONTEXT_GETCUSTOMDOMAIN, { contextId: this._info.contextId, name: name }).then(function (result) {
                            return result.value;
                        });
                    };

                    DhContext.prototype.setCustomDomain = function (name, value) {
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSECONTEXT_SETCUSTOMDOMAIN, { contextId: this._info.contextId, name: name, value: value });
                    };
                    return DhContext;
                })();

                var JmcService = (function () {
                    function JmcService(sessionId) {
                        this._controller = new DiagnosticsHub.HostController(sessionId, Constants.CONTROLLER_ID_DATAWAREHOUSEJMCSERVICE);
                        this._logger = DiagnosticsHub.getLogger();
                        this._viewEventManager = Microsoft.VisualStudio.DiagnosticsHub.getViewEventManager();
                    }
                    JmcService.prototype.getJmcEnabledState = function () {
                        var _this = this;
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSEJMCSERVICE_GETJMCENABLED).then(function (result) {
                            if (typeof result.jmcOn === "undefined") {
                                _this._logger.error("getJmcEnabledState() result is ill-formed");
                                throw new Error(Microsoft.Plugin.Resources.getErrorString("JSProfiler.9999"));
                            }

                            return result.jmcOn;
                        });
                    };

                    JmcService.prototype.setJmcEnabledState = function (enabledState) {
                        var _this = this;
                        return this._controller.request(Constants.ACTION_DATAWAREHOUSEJMCSERVICE_SETJMCENABLED, { jmcOn: enabledState }).then(function (result) {
                            if (typeof result.prevEnabledState === "undefined" || typeof result.currEnabledState === "undefined") {
                                _this._logger.error("setJmcEnabledState() result is ill-formed");
                                throw new Error(Microsoft.Plugin.Resources.getErrorString("JSProfiler.9999"));
                            }

                            // Check if the value changed and if it has fire the event
                            if (result.prevEnabledState !== result.currEnabledState) {
                                _this._viewEventManager.jmcEnabledStateChanged.raiseEvent(result);
                            }
                        });
                    };
                    return JmcService;
                })();

                var _dwFactory = null;

                /**
                * Get the datawarehouse
                * @param {IDataWarehouseConfiguration} configuration Exposed only for testing and F12 scenarios
                * @returns {Microsoft.Plugin.Promise<IDataWarehouseInstance>}
                */
                function loadDataWarehouse(configuration) {
                    if (typeof configuration === "undefined") { configuration = null; }
                    if (_dwFactory === null) {
                        _dwFactory = new DataWarehouseFactory();
                    }

                    return _dwFactory.getDataWarehouse(configuration);
                }
                DataWarehouse.loadDataWarehouse = loadDataWarehouse;
            })(DiagnosticsHub.DataWarehouse || (DiagnosticsHub.DataWarehouse = {}));
            var DataWarehouse = DiagnosticsHub.DataWarehouse;
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
/// <reference path="Logger.ts" />
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        (function (DiagnosticsHub) {
            // -----------------------------------------------------------------------------
            // Copyright (c) Microsoft Corporation.  All rights reserved.
            // -----------------------------------------------------------------------------
            (function (Controllers) {
                "use strict";

                // Private definition of the F12 JMC types
                // taken from bpt\diagnostics\PluginHost\plugin.f12.d.ts
                var F12_JMCType;
                (function (F12_JMCType) {
                    F12_JMCType[F12_JMCType["UserCode"] = 0] = "UserCode";
                    F12_JMCType[F12_JMCType["Library"] = 1] = "Library";
                    F12_JMCType[F12_JMCType["Unrelated"] = 2] = "Unrelated";
                    F12_JMCType[F12_JMCType["Unsure"] = 3] = "Unsure";
                })(F12_JMCType || (F12_JMCType = {}));

                /**
                * Class used to handle the JavaScript Just-My-Code logic
                * @private Internal Use Only
                */
                var JavaScriptJmc = (function () {
                    function JavaScriptJmc() {
                        this._serviceProxy = getVisualStudioService();
                    }
                    /**
                    * Gets each current JMC type for the specified urls
                    * @urls the array of fully qualified url to get the types for
                    * @returns an array of ints that correspond to the type for each requested url (in the same order)
                    */
                    JavaScriptJmc.prototype.getJmcTypeForUrls = function (urls) {
                        // For F12, use a the local JMC service
                        if (Microsoft.Plugin.F12) {
                            return Microsoft.Plugin.F12.JMC.getJMCTypeForUrls(urls).then(function (jmcTypes) {
                                if (!jmcTypes) {
                                    return [];
                                }

                                for (var i = 0; i < jmcTypes.length; ++i) {
                                    switch (jmcTypes[i]) {
                                        case 0 /* UserCode */:
                                            jmcTypes[i] = 0;
                                            break;
                                        case 1 /* Library */:
                                            jmcTypes[i] = 1;
                                            break;
                                        case 2 /* Unrelated */:
                                            jmcTypes[i] = 2;
                                            break;
                                        case 3 /* Unsure */:
                                        default:
                                            jmcTypes[i] = -1;
                                    }
                                }

                                return jmcTypes;
                            });
                        } else {
                            return this._serviceProxy._call("getJMCTypeForUrls", urls);
                        }
                    };
                    return JavaScriptJmc;
                })();
                Controllers.JavaScriptJmc = JavaScriptJmc;

                /**
                * Class used to handle interacting with the Visual Studio Project system
                * @private Internal Use Only
                */
                var SolutionService = (function () {
                    function SolutionService() {
                        this._serviceProxy = getVisualStudioService();
                    }
                    /**
                    * Gets all executable code Project outputs in the Solution.
                    * @param {boolean} includeFilenameExtensions Whether to include extensions on the filenames returned
                    * @returns {Microsoft.Plugin.IPromise<string[]>} An array of strings representing the names of the outputs
                    */
                    SolutionService.prototype.getAllExecutableCodeOutputs = function (includeFilenameExtensions) {
                        return this._serviceProxy._call("getSolutionExecutableCodeOutputs", includeFilenameExtensions);
                    };
                    return SolutionService;
                })();
                Controllers.SolutionService = SolutionService;

                /**
                * Class used to handle locating and viewing sources
                * @private Internal Use Only
                */
                var SourceService = (function () {
                    function SourceService() {
                        this._serviceProxy = getVisualStudioService();
                    }
                    /**
                    * Shows a source file at the specified line.
                    * @param {string} filename
                    * @param {number} linenumber
                    */
                    SourceService.prototype.showDocument = function (filename, linenumber) {
                        return this._serviceProxy._call("showDocument", filename, linenumber);
                    };

                    /**
                    * Gets an accessible path to the specified file
                    * @param {string} filename
                    * @returns Openable path to the specified file or null if it cannot be opened
                    */
                    SourceService.prototype.getAccessiblePathToFile = function (filename) {
                        return this._serviceProxy._call("getAccessiblePathToFile", filename);
                    };
                    return SourceService;
                })();
                Controllers.SourceService = SourceService;

                /**
                * @private Internal Use Only
                * Class used to determine if registry key is set for data warehouse.
                */
                var DataWarehouseRegistryService = (function () {
                    function DataWarehouseRegistryService() {
                        this._serviceProxy = getVisualStudioService();
                    }
                    /**
                    * Returns true if data warehouse is in VsHub.
                    */
                    DataWarehouseRegistryService.prototype.isDataWarehouseInVsHub = function () {
                        return this._serviceProxy._call("isDataWarehouseInVsHub");
                    };
                    return DataWarehouseRegistryService;
                })();
                Controllers.DataWarehouseRegistryService = DataWarehouseRegistryService;

                var _visualStudioServiceProxy = null;

                /**
                * @TODO TEMPORARY - This should no longer be exported once live profiling comes online.
                *  It's only being exported so that our HTML file for collection swimlanes can check isCollectionTimeDetailsViewEnabled
                * @private Internal Use Only
                * Gets the Visual Studio Service from the diagnostics hub.
                * @returns The Visual Studio service from the diagnostics hub
                * @deprecated
                */
                function getVisualStudioService() {
                    if (_visualStudioServiceProxy === null) {
                        _visualStudioServiceProxy = Microsoft.Plugin.Utilities.JSONMarshaler.attachToPublishedObject("Microsoft.DiagnosticsHub.VisualStudio.Presentation.JavaScriptModels.VisualStudioServiceMarshaler", {}, true);
                    }

                    return _visualStudioServiceProxy;
                }
                Controllers.getVisualStudioService = getVisualStudioService;
            })(DiagnosticsHub.Controllers || (DiagnosticsHub.Controllers = {}));
            var Controllers = DiagnosticsHub.Controllers;
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
/// <reference path="DiagnosticsHub.Interfaces.ts" />
/// <reference path="Logger.ts" />
/// <reference path="DataWarehouse.ts" />
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        //
        // Copyright (c) Microsoft Corporation.  All rights reserved.
        //
        (function (DiagnosticsHub) {
            "use strict";

            var DocumentClosingEventDeferral = (function () {
                function DocumentClosingEventDeferral(onHandlerCompleted) {
                    this._onHandlerCompleted = onHandlerCompleted;
                }
                DocumentClosingEventDeferral.prototype.complete = function (result) {
                    this._onHandlerCompleted(result);
                };
                return DocumentClosingEventDeferral;
            })();
            DiagnosticsHub.DocumentClosingEventDeferral = DocumentClosingEventDeferral;

            var DocumentClosingEventArgs = (function () {
                function DocumentClosingEventArgs(onHandlerCompleted) {
                    this._onHandlerCompleted = onHandlerCompleted;
                    this._eventDeferral = null;
                }
                Object.defineProperty(DocumentClosingEventArgs.prototype, "waitHandler", {
                    get: function () {
                        return this._eventDeferral !== null;
                    },
                    enumerable: true,
                    configurable: true
                });

                DocumentClosingEventArgs.prototype.getDeferral = function () {
                    if (this._eventDeferral === null) {
                        this._eventDeferral = new DocumentClosingEventDeferral(this._onHandlerCompleted);
                    }

                    return this._eventDeferral;
                };
                return DocumentClosingEventArgs;
            })();
            DiagnosticsHub.DocumentClosingEventArgs = DocumentClosingEventArgs;

            var Document = (function () {
                function Document() {
                    this._documentProxy = Microsoft.Plugin.Utilities.JSONMarshaler.attachToPublishedObject("Microsoft.DiagnosticsHub.VisualStudio.Presentation.JavaScriptModels.DocumentPortMarshaler", {}, true);
                    this._logger = DiagnosticsHub.getLogger();
                }
                Document.prototype.getTools = function () {
                    return this._documentProxy._call("getTools");
                };

                Document.prototype.openInAlternateFormat = function (format) {
                    if (format === 1 /* Vspx */) {
                        this._logger.debug("Opening current document as a Vspx");
                        return this._documentProxy._call("openAsVspx");
                    }

                    throw new Error(Microsoft.Plugin.Resources.getErrorString("JSProfiler.1000"));
                };

                Document.prototype.isPerformanceDebuggerDocument = function () {
                    return this._documentProxy._call("isPerformanceDebuggerDocument");
                };
                return Document;
            })();

            var _currentDocument = null;

            /** Get current diagnostics hub document */
            function getCurrentDocument() {
                if (_currentDocument === null) {
                    _currentDocument = new Document();
                }

                return _currentDocument;
            }
            DiagnosticsHub.getCurrentDocument = getCurrentDocument;
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        (function (DiagnosticsHub) {
            // -----------------------------------------------------------------------------
            // Copyright (c) Microsoft Corporation.  All rights reserved.
            // -----------------------------------------------------------------------------
            (function (Sqm) {
                "use strict";

                /**
                * Source of selection change
                * @private Internal Use Only
                * This enumerator is synchronised with
                * - SelectionChangeSource in Sqm.ts
                * - SelectionChangeSource in IVisualStudioSqmAnalysisService.cs
                */
                (function (SelectionChangeSource) {
                    SelectionChangeSource[SelectionChangeSource["SwimLane"] = 0] = "SwimLane";
                    SelectionChangeSource[SelectionChangeSource["DoubleSlider"] = 1] = "DoubleSlider";
                    SelectionChangeSource[SelectionChangeSource["DoubleSliderHandles"] = 2] = "DoubleSliderHandles";
                })(Sqm.SelectionChangeSource || (Sqm.SelectionChangeSource = {}));
                var SelectionChangeSource = Sqm.SelectionChangeSource;

                /**
                * Class used to handle the SQM reports for CPU Usage tool
                * @private Internal Use Only
                */
                var CpuUsage = (function () {
                    /**
                    * Set SQM data for various actions in CPU Usage tool views.
                    * @constructor
                    */
                    function CpuUsage() {
                        this._isSetCreateDetailedReport = false;
                        this._isSetSearchIsUsed = false;
                        this._isSetSearchOptionsChanged = false;
                        this._serviceProxy = getSqmAnalysisService();
                    }
                    /** SQM report : Filter View was open */
                    CpuUsage.prototype.filterViewOpen = function () {
                        this._serviceProxy._call("cpuUsageCountFilterViewOpen");
                    };

                    /** SQM report : Detailed Report was created */
                    CpuUsage.prototype.createDetailedReport = function () {
                        if (!this._isSetCreateDetailedReport) {
                            this._isSetCreateDetailedReport = true;
                            this._serviceProxy._call("cpuUsageSetCreateDetailedReport");
                        }
                    };

                    /** SQM report : Search was used */
                    CpuUsage.prototype.searchIsUsed = function () {
                        if (!this._isSetSearchIsUsed) {
                            this._isSetSearchIsUsed = true;
                            this._serviceProxy._call("cpuUsageSetSearchIsUsed");
                        }
                    };

                    /** SQM report : Search Options were changed */
                    CpuUsage.prototype.searchOptionsChanged = function () {
                        if (!this._isSetSearchOptionsChanged) {
                            this._isSetSearchOptionsChanged = true;
                            this._serviceProxy._call("cpuUsageSetSearchOptionsChanged");
                        }
                    };

                    /**
                    * SQM report : JMC was toggled.
                    * @param {boolean} state New JMC state
                    */
                    CpuUsage.prototype.jmcToggle = function (state) {
                        this._serviceProxy._call("countJmcToggle", state);
                    };

                    CpuUsage.prototype.failOpenSourceFile = function () {
                        this._serviceProxy._call("cpuUsageCountFailOpenSourceFile");
                    };
                    return CpuUsage;
                })();
                Sqm.CpuUsage = CpuUsage;

                /**
                * Class used to handle the Telemetry reports for Performance Debugger
                * @private Internal Use Only
                */
                var PerformanceDebugger = (function () {
                    /**
                    * Set Telemetry data for various actions in Performance Debugger.
                    * @constructor
                    */
                    function PerformanceDebugger() {
                        this._serviceProxy = getSqmGlobalService();
                    }
                    /** SQM report : Select Tools dropdown was invoked */
                    PerformanceDebugger.prototype.selectToolsDropdown = function () {
                        this._serviceProxy._call("reportSelectToolsDropdown");
                    };
                    return PerformanceDebugger;
                })();
                Sqm.PerformanceDebugger = PerformanceDebugger;

                /**
                * @private Internal Use Only
                */
                var ViewportController = (function () {
                    /**
                    * Set SQM data for various actions in the ViewportController.
                    * @constructor
                    */
                    function ViewportController() {
                        this._serviceProxy = getSqmAnalysisService();
                    }
                    /** SQM report: Zoom In was clicked */
                    ViewportController.prototype.zoomIn = function () {
                        this._serviceProxy._call("countZoomIn");
                    };

                    /** SQM report: Zoom Out was clicked */
                    ViewportController.prototype.zoomOut = function () {
                        this._serviceProxy._call("countZoomOut");
                    };

                    /** SQM report: Reset Zoom was clicked */
                    ViewportController.prototype.resetZoom = function () {
                        this._serviceProxy._call("countResetZoom");
                    };

                    /** SQM report: Clear Selection was clicked */
                    ViewportController.prototype.clearSelection = function () {
                        this._serviceProxy._call("countClearSelection");
                    };

                    /**
                    * SQM report: Selection was changed
                    * @param {SelectionChangeSource} source Source that fired the selection changed
                    * @param {boolean} isMinSize True if selection is set to minimal allowed size
                    */
                    ViewportController.prototype.selectionChanged = function (source, isMinSize) {
                        this._serviceProxy._call("countSelectionChanged", source, isMinSize);
                    };

                    /**
                    * Telemetry report: Tooltip was shown
                    * @param {swimlaneId} Swimlane ID
                    */
                    ViewportController.prototype.showGraphTooltip = function (swimlaneId) {
                        this._serviceProxy._call("reportGraphTooltip", swimlaneId);
                    };
                    return ViewportController;
                })();
                Sqm.ViewportController = ViewportController;

                /**
                * @private Internal Use Only
                */
                var CollectedData = (function () {
                    /**
                    * Set SQM data for interesting information about collected data.
                    * @constructor
                    */
                    function CollectedData() {
                        this._serviceProxy = getSqmAnalysisService();
                    }
                    /**
                    * SQM report: Events were lost during collection
                    * @param {number} counter Number of lost events
                    */
                    CollectedData.prototype.lostEvents = function (counter) {
                        this._serviceProxy._call("countLostEvents", counter);
                    };
                    return CollectedData;
                })();
                Sqm.CollectedData = CollectedData;

                var _sqmAnalysisServiceProxy = null;
                var _sqmGlobalServiceProxy = null;

                /**
                * @private Internal Use Only
                */
                function getSqmAnalysisService() {
                    if (_sqmAnalysisServiceProxy === null) {
                        _sqmAnalysisServiceProxy = Microsoft.Plugin.Utilities.JSONMarshaler.attachToPublishedObject("Microsoft.DiagnosticsHub.VisualStudio.Presentation.JavaScriptModels.SqmAnalysisServiceMarshaler", {}, true);
                    }

                    return _sqmAnalysisServiceProxy;
                }
                Sqm.getSqmAnalysisService = getSqmAnalysisService;

                /**
                * @private Internal Use Only
                */
                function getSqmGlobalService() {
                    if (_sqmGlobalServiceProxy === null) {
                        _sqmGlobalServiceProxy = Microsoft.Plugin.Utilities.JSONMarshaler.attachToPublishedObject("Microsoft.DiagnosticsHub.VisualStudio.Presentation.JavaScriptModels.SqmGlobalServiceMarshaler", {}, true);
                    }

                    return _sqmGlobalServiceProxy;
                }
                Sqm.getSqmGlobalService = getSqmGlobalService;
            })(DiagnosticsHub.Sqm || (DiagnosticsHub.Sqm = {}));
            var Sqm = DiagnosticsHub.Sqm;
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
/// <reference path="EventAggregator.ts" />
/// <reference path="Publisher.ts" />
/// <reference path="JsonTimespan.ts" />
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        //
        // Copyright (c) Microsoft Corporation.  All rights reserved.
        //
        (function (DiagnosticsHub) {
            "use strict";

            

            var SelectionTimeRangeChangedEvent = (function () {
                function SelectionTimeRangeChangedEvent() {
                    this._publisher = new DiagnosticsHub.Publisher([SelectionTimeRangeChangedEvent.EventName]);
                    this._eventAggregator = Microsoft.VisualStudio.DiagnosticsHub.getEventAggregator();
                    this._eventAggregator.addEventListener(SelectionTimeRangeChangedEvent.EventGlobalName, this.forwardSelectionTimeRangeEvent.bind(this));
                    this._timeRangeMarshaler = Microsoft.Plugin.Utilities.JSONMarshaler.attachToPublishedObject("Microsoft.DiagnosticsHub.VisualStudio.Presentation.JavaScriptModels.SwimlaneDataServiceMarshaler", {}, true);
                    if (!this._timeRangeMarshaler) {
                        throw new Error(Microsoft.Plugin.Resources.getErrorString("JSProfiler.1007"));
                    }
                }
                SelectionTimeRangeChangedEvent.prototype.addEventListener = function (listener) {
                    this._publisher.addEventListener(SelectionTimeRangeChangedEvent.EventName, listener);
                };

                SelectionTimeRangeChangedEvent.prototype.removeEventListener = function (listener) {
                    this._publisher.removeEventListener(SelectionTimeRangeChangedEvent.EventName, listener);
                };

                SelectionTimeRangeChangedEvent.prototype.raiseEvent = function (eventArgs) {
                    this.setTimeRange(eventArgs.position);
                    var dto = {
                        isIntermittent: eventArgs.isIntermittent
                    };

                    if (eventArgs.position) {
                        dto.beginH = eventArgs.position.begin.jsonValue.h;
                        dto.beginL = eventArgs.position.begin.jsonValue.l;
                        dto.endH = eventArgs.position.end.jsonValue.h;
                        dto.endL = eventArgs.position.end.jsonValue.l;
                    }

                    this._eventAggregator.raiseEvent(SelectionTimeRangeChangedEvent.EventGlobalName, dto);
                };

                SelectionTimeRangeChangedEvent.prototype.getTimeRange = function () {
                    return this._timeRangeMarshaler._call("getCurrentTimeRange").then(function (time) {
                        if (time && time.begin && time.end) {
                            return new DiagnosticsHub.JsonTimespan(new DiagnosticsHub.BigNumber(time.begin.h, time.begin.l), new DiagnosticsHub.BigNumber(time.end.h, time.end.l));
                        }

                        return null;
                    });
                };

                SelectionTimeRangeChangedEvent.prototype.setTimeRange = function (time) {
                    var dto = null;

                    if (time) {
                        dto = {
                            begin: time.begin.jsonValue,
                            end: time.end.jsonValue
                        };
                    }

                    this._timeRangeMarshaler._call("setCurrentTimeRange", dto);
                };

                SelectionTimeRangeChangedEvent.prototype.forwardSelectionTimeRangeEvent = function (dto) {
                    // the event is raised from the aggregator using marshaled JSON objects and we need to add the type information back
                    var selectionTimeRange;

                    if (typeof dto.beginH !== "undefined" && typeof dto.beginL !== "undefined" && typeof dto.endH !== "undefined" && typeof dto.endL !== "undefined") {
                        selectionTimeRange = new DiagnosticsHub.JsonTimespan(new DiagnosticsHub.BigNumber(dto.beginH, dto.beginL), new DiagnosticsHub.BigNumber(dto.endH, dto.endL));
                    }

                    var args = {
                        position: selectionTimeRange,
                        isIntermittent: dto.isIntermittent
                    };

                    this._publisher.invokeListener(SelectionTimeRangeChangedEvent.EventName, args);
                };
                SelectionTimeRangeChangedEvent.EventGlobalName = "DiagnosticsHub.EventAggregator.SelectionTimeRangeChanged";
                SelectionTimeRangeChangedEvent.EventName = "DiagnosticsHub.SelectionTimeRangeChanged";
                return SelectionTimeRangeChangedEvent;
            })();

            

            

            var ChangeViewportEvent = (function () {
                function ChangeViewportEvent() {
                    this._publisher = new DiagnosticsHub.Publisher([ChangeViewportEvent.EventName]);
                    this._eventAggregator = Microsoft.VisualStudio.DiagnosticsHub.getEventAggregator();
                    this._eventAggregator.addEventListener(ChangeViewportEvent.EventGlobalName, this.forwardChangeViewportEvent.bind(this));
                }
                ChangeViewportEvent.prototype.addEventListener = function (listener) {
                    this._publisher.addEventListener(ChangeViewportEvent.EventName, listener);
                };

                ChangeViewportEvent.prototype.removeEventListener = function (listener) {
                    this._publisher.removeEventListener(ChangeViewportEvent.EventName, listener);
                };

                ChangeViewportEvent.prototype.raiseEvent = function (eventArgs) {
                    var dto = null;

                    if (eventArgs) {
                        dto = {
                            beginH: eventArgs.begin.jsonValue.h,
                            beginL: eventArgs.begin.jsonValue.l,
                            endH: eventArgs.end.jsonValue.h,
                            endL: eventArgs.end.jsonValue.l
                        };
                    }

                    this._eventAggregator.raiseEvent(ChangeViewportEvent.EventGlobalName, dto);
                };

                ChangeViewportEvent.prototype.forwardChangeViewportEvent = function (args) {
                    var eventArgs = null;

                    if (typeof args.beginH !== "undefined" && typeof args.beginL !== "undefined" && typeof args.endH !== "undefined" && typeof args.endL !== "undefined") {
                        eventArgs = new DiagnosticsHub.JsonTimespan(new DiagnosticsHub.BigNumber(args.beginH, args.beginL), new DiagnosticsHub.BigNumber(args.endH, args.endL));
                    }

                    this._publisher.invokeListener(ChangeViewportEvent.EventName, eventArgs);
                };
                ChangeViewportEvent.EventGlobalName = "DiagnosticsHub.EventAggregator.ChangeViewport";
                ChangeViewportEvent.EventName = "DiagnosticsHub.ChangeViewport";
                return ChangeViewportEvent;
            })();

            var JmcEnabledStateChangedEvent = (function () {
                function JmcEnabledStateChangedEvent() {
                    this._publisher = new DiagnosticsHub.Publisher([JmcEnabledStateChangedEvent.EventName]);
                    this._eventAggregator = Microsoft.VisualStudio.DiagnosticsHub.getEventAggregator();
                    this._eventAggregator.addEventListener(JmcEnabledStateChangedEvent.EventGlobalName, this.forwardJmcEnabledStateChangedEvent.bind(this));
                }
                JmcEnabledStateChangedEvent.prototype.addEventListener = function (listener) {
                    this._publisher.addEventListener(JmcEnabledStateChangedEvent.EventName, listener);
                };

                JmcEnabledStateChangedEvent.prototype.removeEventListener = function (listener) {
                    this._publisher.removeEventListener(JmcEnabledStateChangedEvent.EventName, listener);
                };

                JmcEnabledStateChangedEvent.prototype.raiseEvent = function (args) {
                    this._eventAggregator.raiseEvent(JmcEnabledStateChangedEvent.EventGlobalName, args);
                };

                JmcEnabledStateChangedEvent.prototype.forwardJmcEnabledStateChangedEvent = function (args) {
                    // the event is raised from the aggregator using marshaled JSON objects
                    this._publisher.invokeListener(JmcEnabledStateChangedEvent.EventName, args);
                };
                JmcEnabledStateChangedEvent.EventGlobalName = "DiagnosticsHub.EventAggregator.JmcEnabledStateChanged";
                JmcEnabledStateChangedEvent.EventName = "DiagnosticsHub.JmcEnabledStateChanged";
                return JmcEnabledStateChangedEvent;
            })();

            var DetailsViewSelectionChangedEvent = (function () {
                function DetailsViewSelectionChangedEvent() {
                    this._publisher = new DiagnosticsHub.Publisher([DetailsViewSelectionChangedEvent.EventName]);
                    this._eventAggregator = Microsoft.VisualStudio.DiagnosticsHub.getEventAggregator();
                    this._eventAggregator.addEventListener(DetailsViewSelectionChangedEvent.EventGlobalName, this.forwardDetailsViewSelectionChangedEvent.bind(this));
                }
                DetailsViewSelectionChangedEvent.prototype.addEventListener = function (listener) {
                    this._publisher.addEventListener(DetailsViewSelectionChangedEvent.EventName, listener);
                };

                DetailsViewSelectionChangedEvent.prototype.removeEventListener = function (listener) {
                    this._publisher.removeEventListener(DetailsViewSelectionChangedEvent.EventName, listener);
                };

                DetailsViewSelectionChangedEvent.prototype.raiseEvent = function (args) {
                    this._eventAggregator.raiseEvent(DetailsViewSelectionChangedEvent.EventGlobalName, args);
                };

                DetailsViewSelectionChangedEvent.prototype.forwardDetailsViewSelectionChangedEvent = function (args) {
                    // the event is raised from the aggregator using marshaled JSON objects
                    this._publisher.invokeListener(DetailsViewSelectionChangedEvent.EventName, args);
                };
                DetailsViewSelectionChangedEvent.EventGlobalName = "DiagnosticsHub.EventAggregator.DetailsViewSelectionChangedEvent";
                DetailsViewSelectionChangedEvent.EventName = "DiagnosticsHub.DetailsViewSelectionChangedEvent";
                return DetailsViewSelectionChangedEvent;
            })();

            var DetailsViewReadyEvent = (function () {
                function DetailsViewReadyEvent() {
                    this._publisher = new DiagnosticsHub.Publisher([DetailsViewReadyEvent.EventName]);
                    this._eventAggregator = Microsoft.VisualStudio.DiagnosticsHub.getEventAggregator();
                    this._eventAggregator.addEventListener(DetailsViewReadyEvent.EventGlobalName, this.forwardDetailsViewSelectionChangedEvent.bind(this));
                }
                DetailsViewReadyEvent.prototype.addEventListener = function (listener) {
                    this._publisher.addEventListener(DetailsViewReadyEvent.EventName, listener);
                };

                DetailsViewReadyEvent.prototype.removeEventListener = function (listener) {
                    this._publisher.removeEventListener(DetailsViewReadyEvent.EventName, listener);
                };

                DetailsViewReadyEvent.prototype.raiseEvent = function (args) {
                    this._eventAggregator.raiseEvent(DetailsViewReadyEvent.EventGlobalName, args);
                };

                DetailsViewReadyEvent.prototype.forwardDetailsViewSelectionChangedEvent = function (args) {
                    // the event is raised from the aggregator using marshaled JSON objects
                    this._publisher.invokeListener(DetailsViewReadyEvent.EventName, args);
                };
                DetailsViewReadyEvent.EventGlobalName = "DiagnosticsHub.EventAggregator.DetailsViewReadyEvent";
                DetailsViewReadyEvent.EventName = "DiagnosticsHub.DetailsViewReadyEvent";
                return DetailsViewReadyEvent;
            })();

            var ViewEventManager = (function () {
                function ViewEventManager() {
                    this._selectionChanged = new SelectionTimeRangeChangedEvent();
                    this._changeViewport = new ChangeViewportEvent();
                    this._jmcEnabledStateChanged = new JmcEnabledStateChangedEvent();
                    this._detailsViewSelectionChangedEvent = new DetailsViewSelectionChangedEvent();
                    this._detailsViewReady = new DetailsViewReadyEvent();
                }
                Object.defineProperty(ViewEventManager.prototype, "selectionChanged", {
                    get: function () {
                        return this._selectionChanged;
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(ViewEventManager.prototype, "changeViewport", {
                    get: function () {
                        return this._changeViewport;
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(ViewEventManager.prototype, "jmcEnabledStateChanged", {
                    get: function () {
                        return this._jmcEnabledStateChanged;
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(ViewEventManager.prototype, "detailsViewSelectionChanged", {
                    get: function () {
                        return this._detailsViewSelectionChangedEvent;
                    },
                    enumerable: true,
                    configurable: true
                });

                Object.defineProperty(ViewEventManager.prototype, "detailsViewReady", {
                    get: function () {
                        return this._detailsViewReady;
                    },
                    enumerable: true,
                    configurable: true
                });
                return ViewEventManager;
            })();

            var _viewEventManager = null;

            /** Get view event manager */
            function getViewEventManager() {
                if (_viewEventManager === null) {
                    _viewEventManager = new ViewEventManager();
                }

                return _viewEventManager;
            }
            DiagnosticsHub.getViewEventManager = getViewEventManager;
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
//
// Copyright (c) Microsoft Corporation.  All rights reserved.
//
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        (function (DiagnosticsHub) {
            "use strict";

            /**
            * Diagnostics Hub error codes
            * These values should be kept in sync with those from 'edev\DiagnosticsHub\sources\Core\DiagnosticsHub.Message\DiagnosticsHub.Messages.mc'
            */
            var ErrorCodes = (function () {
                function ErrorCodes() {
                }
                ErrorCodes.VSHUB_E_INVALID_REGEX = 0xE111E001;
                return ErrorCodes;
            })();
            DiagnosticsHub.ErrorCodes = ErrorCodes;
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
/// <reference path="DiagnosticsHub.Interfaces.ts" />
/// <reference path="Logger.ts" />
var Microsoft;
(function (Microsoft) {
    (function (VisualStudio) {
        //
        // Copyright (c) Microsoft Corporation.  All rights reserved.
        //
        (function (DiagnosticsHub) {
            "use strict";

            var HostController = (function () {
                function HostController(sessionId, controllerId) {
                    this._sessionId = sessionId;
                    this._controllerId = controllerId;
                    this._dataWarehouseRegistryService = new Microsoft.VisualStudio.DiagnosticsHub.Controllers.DataWarehouseRegistryService();
                }
                HostController.prototype.request = function (actionId, requestData) {
                    var _this = this;
                    if (this._host) {
                        return this._host.request(this._controllerId, actionId, this._sessionId, requestData);
                    } else {
                        var isPerfDebugger = this.ensureIsPerformanceDebuggerDocument();
                        var isDataWarehouseInVsHub = this.ensureDataWarehouseInVsHub();
                        return Microsoft.Plugin.Promise.join([isPerfDebugger, isDataWarehouseInVsHub]).then(function (results) {
                            if (results) {
                                var isWebHost = false;
                                results.forEach(function (result) {
                                    isWebHost = isWebHost || result;
                                });

                                _this._host = getHost(isWebHost);
                                return _this._host.request(_this._controllerId, actionId, _this._sessionId, requestData);
                            }
                        });
                    }
                };

                HostController.prototype.requestSync = function (actionId, requestData) {
                    if (!this._host) {
                        this._host = getHost(false);
                    }

                    return this._host.requestSync(this._controllerId, actionId, this._sessionId, requestData);
                };

                HostController.prototype.ensureIsPerformanceDebuggerDocument = function () {
                    if (Microsoft.Plugin.F12) {
                        return Microsoft.Plugin.Promise.wrap(false);
                    } else {
                        return DiagnosticsHub.getCurrentDocument().isPerformanceDebuggerDocument();
                    }
                };

                HostController.prototype.ensureDataWarehouseInVsHub = function () {
                    if (Microsoft.Plugin.F12) {
                        return Microsoft.Plugin.Promise.wrap(false);
                    } else {
                        return this._dataWarehouseRegistryService.isDataWarehouseInVsHub();
                    }
                };
                return HostController;
            })();
            DiagnosticsHub.HostController = HostController;

            var _host = null;

            function getHost(isWebHost) {
                if (!_host) {
                    if (isWebHost) {
                        _host = new DiagnosticsHub.DiagnosticsHubWebHost(DiagnosticsHub.getLogger());
                    } else {
                        _host = new DiagnosticsHub.DiagnosticsHubNativeHost(DiagnosticsHub.getLogger());
                    }
                }

                return _host;
            }
        })(VisualStudio.DiagnosticsHub || (VisualStudio.DiagnosticsHub = {}));
        var DiagnosticsHub = VisualStudio.DiagnosticsHub;
    })(Microsoft.VisualStudio || (Microsoft.VisualStudio = {}));
    var VisualStudio = Microsoft.VisualStudio;
})(Microsoft || (Microsoft = {}));
//# sourceMappingURL=DiagnosticsHub.js.map

// SIG // Begin signature block
// SIG // MIIa+AYJKoZIhvcNAQcCoIIa6TCCGuUCAQExCzAJBgUr
// SIG // DgMCGgUAMGcGCisGAQQBgjcCAQSgWTBXMDIGCisGAQQB
// SIG // gjcCAR4wJAIBAQQQEODJBs441BGiowAQS9NQkAIBAAIB
// SIG // AAIBAAIBAAIBADAhMAkGBSsOAwIaBQAEFD6wgWHTZ1xz
// SIG // oP7j+IypfJMSTTaeoIIVgjCCBMMwggOroAMCAQICEzMA
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
// SIG // L54/LlUWa8kTo/0xggTiMIIE3gIBATCBkDB5MQswCQYD
// SIG // VQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
// SIG // A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
// SIG // IENvcnBvcmF0aW9uMSMwIQYDVQQDExpNaWNyb3NvZnQg
// SIG // Q29kZSBTaWduaW5nIFBDQQITMwAAAQosea7XeXumrAAB
// SIG // AAABCjAJBgUrDgMCGgUAoIH7MBkGCSqGSIb3DQEJAzEM
// SIG // BgorBgEEAYI3AgEEMBwGCisGAQQBgjcCAQsxDjAMBgor
// SIG // BgEEAYI3AgEVMCMGCSqGSIb3DQEJBDEWBBQReG5/rpmk
// SIG // K+cCQTW0O42ZvQZfLDCBmgYKKwYBBAGCNwIBDDGBizCB
// SIG // iKBugGwARABpAGEAZwBuAG8AcwB0AGkAYwBzAEgAdQBi
// SIG // AF8AMgBlAGQAYwA1ADMAYQA1AC0ANwA2AGUAYQAtADQA
// SIG // NQBkADUALQA5ADUAMAA5AC0ANwAyAGEAYgBlAGQAYQBk
// SIG // AGYAMQBiAGIALgBqAHOhFoAUaHR0cDovL21pY3Jvc29m
// SIG // dC5jb20wDQYJKoZIhvcNAQEBBQAEggEAg1rclw4SbHo3
// SIG // l2wFdKp2T22YJ5reYVIgmhM7CZMUM6xIjcxKBlohUANI
// SIG // r+iivA1sNyPNAEW/qULBzCVT+4Ovch9MHtPtnns/IGxq
// SIG // VGaqD/TEljXHlYimRmw9TYM7SxxEKDTKdKRQCxIRlIYV
// SIG // kqG81jqzFy/PhH8kYnCx/86YzZFE7jsX6HzP0ZZ92mOX
// SIG // Zk1Ezm2isQtLx3GkxLJxlOyRVzmOO0aJ/Z4BlNfumYJ2
// SIG // 5LXJbmZ8MZv77s2o5QErcEEsaUs5x4hSJey9SowbO2r9
// SIG // y5A1rJbsBX/pusDitwGZycy+XTT+3hFSshc16Y2bVM+m
// SIG // FZixEOTbSZBY5dDT9E0x+aGCAigwggIkBgkqhkiG9w0B
// SIG // CQYxggIVMIICEQIBATCBjjB3MQswCQYDVQQGEwJVUzET
// SIG // MBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVk
// SIG // bW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0
// SIG // aW9uMSEwHwYDVQQDExhNaWNyb3NvZnQgVGltZS1TdGFt
// SIG // cCBQQ0ECEzMAAABw9Bi/IyH8UJ0AAAAAAHAwCQYFKw4D
// SIG // AhoFAKBdMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
// SIG // HAYJKoZIhvcNAQkFMQ8XDTE1MDcwNzA3MzQ1OVowIwYJ
// SIG // KoZIhvcNAQkEMRYEFOIdjhuxbWoyP9GKIE5HSYaCxYH+
// SIG // MA0GCSqGSIb3DQEBBQUABIIBAEj70wnsWTmQ1CcEdrmu
// SIG // DW5CpVr1DAMqFLWSM8rigdchRVahmMZ76bcOPCRcCC9n
// SIG // fRHRnND6rNCb+gfempthg4+2EJIkdef9ZeXGWLZtio+m
// SIG // QltjiNBURymmOT4iR+8pLcq1i8OmV279W1Zk8BWv9Xqa
// SIG // T8gVortiO9Pn7nlPwVqXNJFt/94Zv50Z+JkwGv6c5Hmd
// SIG // dxid9OhuL6mSu0e1Zc2Gf8KVOxttlcDiJdluMv6sis8A
// SIG // RG1kDiQ/uM3X8AxmSPxKwz+1ekNDBTojGYed3mTsHkZp
// SIG // ynNSELHK53Lyj4aQYMVOHWdJStvoLjfZ3HPqpS1HimYq
// SIG // 8dmCKWl93gOephc=
// SIG // End signature block
