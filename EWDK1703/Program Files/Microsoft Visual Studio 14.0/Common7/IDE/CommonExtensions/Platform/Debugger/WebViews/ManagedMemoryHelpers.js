var MemoryAnalyzer = {};

(function (MemoryAnalyzer) {
    var FormattingHelpers = (function () {
        function FormattingHelpers() {
        }
        FormattingHelpers.zeroPad = function zeroPad(stringToPad, newLength, padLeft) {
            for (var i = stringToPad.length; i < newLength; i++) {
                stringToPad = (padLeft ? ("0" + stringToPad) : (stringToPad + "0"));
            }
            return stringToPad;
        };

        FormattingHelpers.forceNonBreakingSpaces = function forceNonBreakingSpaces(stringToConvert) {
            var substitutedString = stringToConvert.replace(/\s/g, function ($0, $1, $2) {
                return "\u00a0";
            });
            return substitutedString;
        };

        FormattingHelpers.forceHtmlRendering = function forceHtmlRendering(stringToConvert) {
            return stringToConvert.replace(/[<>]/g, function ($0, $1, $2) {
                return ($0 === "<") ? "&lt;" : "&gt;";
            });
        };

        FormattingHelpers.trimLongString = function trimLongString(stringToConvert) {
            var substitutedString = stringToConvert;

            var maxStringLength = 38;

            if (stringToConvert.length > maxStringLength) {
                var substrLength = (maxStringLength / 2) - 2;

                substitutedString = stringToConvert.substr(0, substrLength) + "\u2026" + stringToConvert.substr(-(substrLength));
            }

            return substitutedString;
        };

        FormattingHelpers.getNativeDigitLocaleString = function getNativeDigitLocaleString(stringToConvert) {
            var nf = Microsoft.Plugin.Culture.NumberFormat;
            if (!nf) {
                nf = {
                    nativeDigits: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
                };
            }

            var substitutedString = stringToConvert.replace(/\d/g, function ($0, $1, $2) {
                return (nf.nativeDigits[parseInt($0)]);
            });

            return substitutedString;
        };

        FormattingHelpers.forceNumberSign = function forceNumberSign(numberToConvert, positive) {
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

        FormattingHelpers.getDecimalLocaleString = function getDecimalLocaleString(numberToConvert, includeGroupSeparators, includeSign) {
            var positive = true;

            if (numberToConvert == 0)
                includeSign = false;

            if (numberToConvert < 0) {
                positive = false;
                numberToConvert = numberToConvert * -1;
            }
            var numberString = numberToConvert.toString();

            var nf = Microsoft.Plugin.Culture.NumberFormat;
            if (!nf) {
                nf = {
                    numberDecimalSeparator: ".",
                    numberGroupSizes: [
                        3
                    ],
                    numberGroupSeparator: ","
                };
            }

            numberString = FormattingHelpers.getNativeDigitLocaleString(numberString);

            var split = numberString.split(/e/i);
            numberString = split[0];
            var exponent = (split.length > 1 ? parseInt(split[1], 10) : 0);
            split = numberString.split('.');
            numberString = split[0];
            var right = split.length > 1 ? split[1] : "";
            if (exponent > 0) {
                right = FormattingHelpers.zeroPad(right, exponent, false);
                numberString += right.slice(0, exponent);
                right = right.substr(exponent);
            } else {
                if (exponent < 0) {
                    exponent = -exponent;
                    numberString = FormattingHelpers.zeroPad(numberString, exponent + 1, true);
                    right = numberString.slice(-exponent, numberString.length) + right;
                    numberString = numberString.slice(0, -exponent);
                }
            }

            if (right.length > 0) {
                right = nf.numberDecimalSeparator + right;
            }
            if (includeGroupSeparators === true) {
                var groupSizes = nf.numberGroupSizes;
                var sep = nf.numberGroupSeparator;
                var curSize = groupSizes[0];
                var curGroupIndex = 1;
                var stringIndex = numberString.length - 1;
                var ret = "";

                while (stringIndex >= 0) {
                    if (curSize === 0 || curSize > stringIndex) {
                        if (ret.length > 0) {
                            numberString = numberString.slice(0, stringIndex + 1) + sep + ret + right;
                        } else {
                            numberString = numberString.slice(0, stringIndex + 1) + right;
                        }

                        if (includeSign === true)
                            return FormattingHelpers.forceNumberSign(numberString, positive);
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

                if (includeSign === true)
                    return FormattingHelpers.forceNumberSign(numberString.slice(0, stringIndex + 1) + sep + ret + right, positive);
                return numberString.slice(0, stringIndex + 1) + sep + ret + right;
            } else {
                if (includeSign === true)
                    return FormattingHelpers.forceNumberSign(numberString + right, positive);
                return numberString + right;
            }
        };
        return FormattingHelpers;
    })();
    MemoryAnalyzer.FormattingHelpers = FormattingHelpers;
})(MemoryAnalyzer);

// SIG // Begin signature block
// SIG // MIIatwYJKoZIhvcNAQcCoIIaqDCCGqQCAQExCzAJBgUr
// SIG // DgMCGgUAMGcGCisGAQQBgjcCAQSgWTBXMDIGCisGAQQB
// SIG // gjcCAR4wJAIBAQQQEODJBs441BGiowAQS9NQkAIBAAIB
// SIG // AAIBAAIBAAIBADAhMAkGBSsOAwIaBQAEFMFjdqFq7gN0
// SIG // gXm+n3aWQB50+gZhoIIVgjCCBMMwggOroAMCAQICEzMA
// SIG // AABvZS1YbQcRRigAAAAAAG8wDQYJKoZIhvcNAQEFBQAw
// SIG // dzELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0
// SIG // b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1p
// SIG // Y3Jvc29mdCBDb3Jwb3JhdGlvbjEhMB8GA1UEAxMYTWlj
// SIG // cm9zb2Z0IFRpbWUtU3RhbXAgUENBMB4XDTE1MDMyMDE3
// SIG // MzIwMloXDTE2MDYyMDE3MzIwMlowgbMxCzAJBgNVBAYT
// SIG // AlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQH
// SIG // EwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29y
// SIG // cG9yYXRpb24xDTALBgNVBAsTBE1PUFIxJzAlBgNVBAsT
// SIG // Hm5DaXBoZXIgRFNFIEVTTjpDMEY0LTMwODYtREVGODEl
// SIG // MCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2Vy
// SIG // dmljZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
// SIG // ggEBAM/mbc3BKs2uqF7YlU8tA0NHczu4QtLQV5rd9lM2
// SIG // d9WIRSRqyKvQZumLxaoPnvKDRrYqydg2xvSg/xFvZvBe
// SIG // FBmysWf48V6UhqqOJa/4NRP9gi/HOF5TwHYcxdN5O7Bj
// SIG // 60+TmgXwohdx3MYMltMABS5MbVizf7QsJHB7lmksbIp4
// SIG // CW1JmY46PmaVj09/eBtge1fJUfRLbVHDNLf4OgrWEd/D
// SIG // OqUeoDjc662q+EPEg5qNlzQDNAQa761UNqTUGiz9w27w
// SIG // eOcp8blEwHG0L8QQiwz3NmJ5/QdXfeoFfEyfTjA/J1A4
// SIG // Zga7Xag+xZDb3zx2Vq2VIDRTcu1pWW7wVB9A1TkCAwEA
// SIG // AaOCAQkwggEFMB0GA1UdDgQWBBTypkkpeHxXcFJiz+2s
// SIG // t3sgNEfc/TAfBgNVHSMEGDAWgBQjNPjZUkZwCu1A+3b7
// SIG // syuwwzWzDzBUBgNVHR8ETTBLMEmgR6BFhkNodHRwOi8v
// SIG // Y3JsLm1pY3Jvc29mdC5jb20vcGtpL2NybC9wcm9kdWN0
// SIG // cy9NaWNyb3NvZnRUaW1lU3RhbXBQQ0EuY3JsMFgGCCsG
// SIG // AQUFBwEBBEwwSjBIBggrBgEFBQcwAoY8aHR0cDovL3d3
// SIG // dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWNyb3Nv
// SIG // ZnRUaW1lU3RhbXBQQ0EuY3J0MBMGA1UdJQQMMAoGCCsG
// SIG // AQUFBwMIMA0GCSqGSIb3DQEBBQUAA4IBAQCNs0y22OwN
// SIG // h4YZXuQA55e41c9MCjy991XT9PCgr1VynCOXuYIqxxYK
// SIG // xScTWdDaMCuIQrpSA+ZeySVoJyeNZKdt+beaaqs+rELQ
// SIG // HiQmzFSv9pCBax6tQ58bexBXajI2MaJEaAGYWisStIkx
// SIG // 9kwMrhU8tyQkXbv/fFNMhMQNzUZ3finKn7JGYoK0NMf1
// SIG // EmlcrXnNMe7pR474/FPz5AKQUWvO+p3jhb9ZgFkQ1Wej
// SIG // TKby5KC02ME6oWpIpojOcPapnN7zU5M9cHEA/77rfPz/
// SIG // CGMPS1FZqxUZkHQe/7u9qjWbPZ7zEBTVevYf1uJ185J0
// SIG // Da0W2RLPoZut0hLqADsjFQzPMIIE7DCCA9SgAwIBAgIT
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
// SIG // BgEEAYI3AgEVMCMGCSqGSIb3DQEJBDEWBBTapB43eTSL
// SIG // FClbsraDNQldu+GndDBaBgorBgEEAYI3AgEMMUwwSqAw
// SIG // gC4ATQBhAG4AYQBnAGUAZABNAGUAbQBvAHIAeQBIAGUA
// SIG // bABwAGUAcgBzAC4AagBzoRaAFGh0dHA6Ly9taWNyb3Nv
// SIG // ZnQuY29tMA0GCSqGSIb3DQEBAQUABIIBAHSOivGHsUot
// SIG // KIv0mnxsar9yS0/Pn6SS30bTchBS/XV7llAF/C7sczmf
// SIG // YBioOcgyBT4g2ddOvw9qAiHrmyUJBkMAkD97PbigqZ4F
// SIG // RtnG1LGzbHyJ/nftH4tLa3A3XhPMaSNJRW6xL+UybTYh
// SIG // /B/h/ckWpPGBoWwK33oO2YYEtGf0dXOsQ4niTcOMN7w4
// SIG // ZsYRNROBA6C0WAH9pN+sZMa7cwA+eQZdMlMljs4F8coY
// SIG // QuXSvIRLNsmiVtXX3W+bf40HRMghOMh83tFFFgpJ2i9+
// SIG // dDagua8Lo3fGKxj+lCe026Z2Gq5L6nTbygz7pUENqqdQ
// SIG // lOinKOBZiT9wnYXDNIraGm2hggIoMIICJAYJKoZIhvcN
// SIG // AQkGMYICFTCCAhECAQEwgY4wdzELMAkGA1UEBhMCVVMx
// SIG // EzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1Jl
// SIG // ZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3Jh
// SIG // dGlvbjEhMB8GA1UEAxMYTWljcm9zb2Z0IFRpbWUtU3Rh
// SIG // bXAgUENBAhMzAAAAb2UtWG0HEUYoAAAAAABvMAkGBSsO
// SIG // AwIaBQCgXTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
// SIG // MBwGCSqGSIb3DQEJBTEPFw0xNTA3MDcwNzM1MTNaMCMG
// SIG // CSqGSIb3DQEJBDEWBBS6aj8S6x1+h8wsy+Qrd7FIZKd3
// SIG // HTANBgkqhkiG9w0BAQUFAASCAQAY1WLsZusyMu/MbZvM
// SIG // RTrOs81vxQdXtWYVpltucoYGJflPcL/6sAU4o00aKj/f
// SIG // beOhsba/ocG0Jwyzzpvx/5kX2ZkqRTqu0c7t+r96e1nz
// SIG // j4xtsPVyUjmCJSfpo7mif1HMmelXxR+UWXa8s6Cy157R
// SIG // PvWfQwsScnF0ubLEaoSCE5DA1BkQl+kVx4/NotsFNMOS
// SIG // cBmU8lB+3IwAwQMMkMU7oZe8OgNa9wlsyGpgA6W95ZYl
// SIG // b+3IxcamJpI3WpyPEPbcyj+YUQ3iEMsXAu4GVdHWn57S
// SIG // ze3coD3MvQGtdr0vHQcghNyhLtnSfz382I614BLTb+qr
// SIG // jiMl4T2EECQNNaX/
// SIG // End signature block
