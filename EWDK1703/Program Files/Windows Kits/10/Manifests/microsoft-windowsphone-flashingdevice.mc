<?xml version="1.0" encoding="UTF-8"?>
<instrumentationManifest xsi:schemaLocation="http://schemas.microsoft.com/win/2004/08/events eventman.xsd" xmlns="http://schemas.microsoft.com/win/2004/08/events" xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:trace="http://schemas.microsoft.com/win/2004/08/events/trace">
    <instrumentation>
        <events>
            <provider name="Microsoft-WindowsPhone-FlashingDevice" guid="{3BBD891E-180F-4386-94B5-D71BA7AC25A9}" symbol="FlashingDevice" resourceFileName="FFUComponents.dll" messageFileName="FFUComponents.dll">
                <events>
                    <event symbol="FlashStart" value="0" version="0" level="win:Informational" task="Flash" opcode="win:Start" template="DeviceEvent" />
                    <event symbol="FlashStop" value="1" version="0" level="win:Informational" task="Flash" opcode="win:Stop" template="DeviceEvent" />
                    <event symbol="FlashError" value="2" version="0" level="win:Error" task="Flash" opcode="win:Stop" template="DeviceEvent" />
                    <event symbol="DiskWriteStart" value="4" version="0" level="win:Verbose" task="DiskWrite" opcode="win:Start" template="DeviceEvent" />
                    <event symbol="DiskWriteEnd" value="5" version="0" level="win:Verbose" task="DiskWrite" opcode="win:Stop" template="DeviceEvent" />
                    <event symbol="TransportReadStart" value="6" version="0" level="win:Verbose" task="TransportRead" opcode="win:Start" template="DeviceEvent" />
                    <event symbol="TransportReadEnd" value="7" version="0" level="win:Verbose" task="TransportRead" opcode="win:Stop" template="DeviceEvent" />
                    <event symbol="InvalidStoreHeader" value="8" version="0" level="win:Error" task="Flash" template="DeviceEvent" message="$(string.Microsoft-WindowsPhone-FlashingDevice.event.8.message)" />
                    <event symbol="DescriptorAllocationFailed" value="9" version="0" level="win:Error" template="DeviceEvent" message="$(string.Microsoft-WindowsPhone-FlashingDevice.event.9.message)" />
                    <event symbol="DescriptorReadFailed" value="11" version="0" level="win:Error" template="DeviceEvent" message="$(string.Microsoft-WindowsPhone-FlashingDevice.event.11.message)" />
                    <event symbol="BlockReadFailed" value="12" version="0" level="win:Error" template="DeviceEvent" message="$(string.Microsoft-WindowsPhone-FlashingDevice.event.12.message)" />
                    <event symbol="BlockWriteFailed" value="13" version="0" level="win:Error" template="DeviceEvent" message="$(string.Microsoft-WindowsPhone-FlashingDevice.event.13.message)" />
                    <event symbol="CrcError" value="14" version="0" level="win:Error" template="DeviceEvent" message="$(string.Microsoft-WindowsPhone-FlashingDevice.event.14.message)" />
                    <event symbol="SecureHeaderReadFailed" value="15" version="0" level="win:Error" template="DeviceEvent" message="$(string.Microsoft-WindowsPhone-FlashingDevice.event.15.message)" />
                    <event symbol="InvalidSecureHeader" value="16" version="0" level="win:Error" template="DeviceEvent" message="$(string.Microsoft-WindowsPhone-FlashingDevice.event.16.message)" />
                    <event symbol="InsufficientSecurityPadding" value="17" version="0" level="win:Error" template="DeviceEvent" message="$(string.Microsoft-WindowsPhone-FlashingDevice.event.17.message)" />
                    <event symbol="InvalidImageHeader" value="18" version="0" level="win:Error" template="DeviceEvent" message="$(string.Microsoft-WindowsPhone-FlashingDevice.event.18.message)" />
                    <event symbol="InsufficientImagePadding" value="19" version="0" level="win:Error" template="DeviceEvent" message="$(string.Microsoft-WindowsPhone-FlashingDevice.event.19.message)" />
                    <event symbol="BufferingFailed" value="20" version="0" level="win:Error" template="DeviceEvent" message="$(string.Microsoft-WindowsPhone-FlashingDevice.event.20.message)" />
                    <event symbol="ExcessBlocks" value="21" version="0" level="win:Error" template="DeviceEvent" message="$(string.Microsoft-WindowsPhone-FlashingDevice.event.21.message)" />
                    <event symbol="InvalidPlatformId" value="22" version="0" level="win:Error" task="PlatformCheck" opcode="Error" template="DeviceEvent" message="$(string.Microsoft-WindowsPhone-FlashingDevice.event.22.message)" />
                    <event symbol="HashCheckFailed" value="23" version="0" level="win:Error" task="HashCheck" opcode="Error" template="DeviceEvent" message="$(string.Microsoft-WindowsPhone-FlashingDevice.event.23.message)" />
                    <event symbol="SignatureCheckFailed" value="24" version="0" level="win:Error" task="HashCheck" opcode="Error" template="DeviceEvent" message="$(string.Microsoft-WindowsPhone-FlashingDevice.event.24.message)" />
                    <event symbol="SignatureCheckPassed" value="25" version="0" level="win:Informational" task="HashCheck" opcode="win:Stop" template="DeviceEvent" message="$(string.Microsoft-WindowsPhone-FlashingDevice.event.25.message)" />
                    <event symbol="DesyncFailed" value="26" version="0" level="win:Error" task="Flash" opcode="Error" template="DeviceEvent" message="$(string.Microsoft-WindowsPhone-FlashingDevice.event.26.message)" />
                    <event symbol="FailedBcdQuery" value="27" version="0" level="win:Error" task="Flash" opcode="Error" template="DeviceEvent" message="$(string.Microsoft-WindowsPhone-FlashingDevice.event.27.message)" />
                    <event symbol="InvalidWriteDescriptors" value="28" version="0" level="win:Error" task="Flash" opcode="Error" template="DeviceEvent" message="$(string.Microsoft-WindowsPhone-FlashingDevice.event.28.message)" />
                    <event symbol="AntiTheftCheckFailed" value="29" version="0" level="win:Error" task="PlatformCheck" opcode="Error" template="DeviceEvent" message="$(string.Microsoft-WindowsPhone-FlashingDevice.event.29.message)" />
                    <event symbol="AntiTheftCheckPassed" value="30" version="0" level="win:Informational" task="PlatformCheck" opcode="win:Stop" template="DeviceEvent" message="$(string.Microsoft-WindowsPhone-FlashingDevice.event.30.message)" />
                    <event symbol="BlockIo2WriteWait" value="31" version="0" level="win:Informational" task="Flash" template="DeviceEvent" />
                    <event symbol="RemovableMediaCheckFailed" value="32" version="0" level="win:Error" task="Flash" opcode="Error" template="DeviceEvent" message="$(string.Microsoft-WindowsPhone-FlashingDevice.event.32.message)" />
                    <event symbol="UseOptimizedSettingsFailed" value="33" version="0" level="win:Error" task="Flash" opcode="Error" template="DeviceEvent" />
                </events>
                <levels>
                </levels>
                <tasks>
                    <task name="Flash" symbol="Flash" value="1" eventGUID="{AFF12699-EC05-4025-9693-439F744D0679}" />
                    <task name="DiskWrite" symbol="DiskWrite" value="2" eventGUID="{5D99D47E-8275-4494-9631-8EEE764BF69C}" message="$(string.Microsoft-WindowsPhone-FlashingDevice.task.DiskWrite.message)" />
                    <task name="TransportRead" symbol="TransportRead" value="3" eventGUID="{96029790-7DDA-4724-B4B2-DE55511D112B}" message="$(string.Microsoft-WindowsPhone-FlashingDevice.task.TransportRead.message)" />
                    <task name="PlatformCheck" symbol="PlatformCheck" value="4" eventGUID="{3C07B6F3-69D0-42F7-9838-EBC40E43C6D2}" />
                    <task name="HashCheck" symbol="HashCheck" value="5" eventGUID="{845F2925-6F4A-4B0A-8141-DFE0E8B162C5}" />
                </tasks>
                <opcodes>
                    <opcode name="Error" symbol="Error" value="10" /> 
                </opcodes>
                <templates>
                    <template tid="DeviceEvent">
                        <data name="DeviceUniqueId" inType="win:GUID" outType="xs:GUID" />
                        <data name="DeviceFriendlyName" inType="win:UnicodeString" outType="xs:string" />
                        <data name="AdditionalInfoString" inType="win:UnicodeString" outType="xs:string" />
                    </template>
                </templates>
            </provider>
        </events>
    </instrumentation>
    <localization>
        <resources culture="en-US">
            <stringTable>
                <string id="opcode.Stop" value="Stop" />
                <string id="opcode.Start" value="Start" />
                <string id="level.Informational" value="Information" />
                <string id="level.Error" value="Error" />
                <string id="level.Warning" value="Warning" />
                <string id="Microsoft-WindowsPhone-FlashingDevice.task.TransportRead.message" value="SimpleIO transfer" />
                <string id="Microsoft-WindowsPhone-FlashingDevice.task.DiskWrite.message" value="Block IO write" />
                <string id="Microsoft-WindowsPhone-FlashingDevice.event.8.message" value="An invalid binary manifest header was read while preparing to flash the device." />
                <string id="Microsoft-WindowsPhone-FlashingDevice.event.9.message" value="The application failed to allocated enough memory to copy the disk write descriptor table." />
                <string id="Microsoft-WindowsPhone-FlashingDevice.event.11.message" value="Before writing data, the flashing application failed to read all the disk write descriptors." />
                <string id="Microsoft-WindowsPhone-FlashingDevice.event.12.message" value="While applying the image to disk, a read failed to return all of the blocks specified in the current data descriptor." />
                <string id="Microsoft-WindowsPhone-FlashingDevice.event.13.message" value="While applying the image to disk, a block write operation failed." />
                <string id="Microsoft-WindowsPhone-FlashingDevice.event.14.message" value="A packet read by the flashing application contained an invalid checksum." />
                <string id="Microsoft-WindowsPhone-FlashingDevice.event.15.message" value="While preparing to flash the image, the flashing application was unable to read the full security header." />
                <string id="Microsoft-WindowsPhone-FlashingDevice.event.16.message" value="While preparing to flash the image, the flashing application read an invalid security header." />
                <string id="Microsoft-WindowsPhone-FlashingDevice.event.17.message" value="While preparing to flash the image, the flashing application failed to read the expected amount of padding after the security header." />
                <string id="Microsoft-WindowsPhone-FlashingDevice.event.18.message" value="While preparing to flash the image, the flashing application read an invalid image header." />
                <string id="Microsoft-WindowsPhone-FlashingDevice.event.19.message" value="While preparing to flash the image, the flashing application failed to read the expected amount of padding after the image header." />
                <string id="Microsoft-WindowsPhone-FlashingDevice.event.20.message" value="While preparing to apply the image to disk, the block flasher failed to buffer enough bytes in the stream to flash safely." />
                <string id="Microsoft-WindowsPhone-FlashingDevice.event.21.message" value="While applying the image to disk, the block flasher reached the end of the data stream unexpectedly.  This indicates an image was built incorrectly." />
                <string id="Microsoft-WindowsPhone-FlashingDevice.event.22.message" value="The platform ID specified in the image does not match the ID of the device to be flashed." />
                <string id="Microsoft-WindowsPhone-FlashingDevice.event.23.message" value="While reading image data, a hash check failed." />
                <string id="Microsoft-WindowsPhone-FlashingDevice.event.24.message" value="While initializing hash checks, a catalog signature check failed." />
                <string id="Microsoft-WindowsPhone-FlashingDevice.event.25.message" value="Signature check succeeded on catalog data." />
                <string id="Microsoft-WindowsPhone-FlashingDevice.event.26.message" value="Failed to acquire a handle to the UEFI firmware desychronization event." />
                <string id="Microsoft-WindowsPhone-FlashingDevice.event.27.message" value="Failed to query the BCD for the platform ID check settings."/>
                <string id="Microsoft-WindowsPhone-FlashingDevice.event.28.message" value="One or more write descriptors refer to invalid disk locations." />
                <string id="Microsoft-WindowsPhone-FlashingDevice.event.29.message" value="Attempting to flash a non Anti-Theft image or an unsupported Anti-Theft image on an Anti-Theft device." />
                <string id="Microsoft-WindowsPhone-FlashingDevice.event.30.message" value="Anti-Theft check succeeded on manifest data." />
                <string id="Microsoft-WindowsPhone-FlashingDevice.event.32.message" value="This image cannot be applied to a removable media." />
            </stringTable>
        </resources>
    </localization>
</instrumentationManifest>
