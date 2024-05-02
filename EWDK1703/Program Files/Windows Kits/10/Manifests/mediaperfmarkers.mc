<?xml version='1.0' encoding='utf-8' standalone='yes'?>
<!--
Copyright (c) Microsoft Corporation.  All rights reserved.
-->
<!--
Use of this source code is subject to the terms of the Microsoft
premium shared source license agreement under which you licensed
this source code. If you did not accept the terms of the license
agreement, you are not authorized to use this source code.
For the terms of the license, please see the license agreement
signed by you and Microsoft.
THE SOURCE CODE IS PROVIDED "AS IS", WITH NO WARRANTIES OR INDEMNITIES.
-->

<instrumentationManifest
  xmlns="http://schemas.microsoft.com/win/2004/08/events"
  xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <instrumentation>
    <events>

      <!-- Here we describe the provider that uses this manifest.
           Each provider will have its own manifest. -->
      <!-- Note: messageFileName and resourceFileName are unused on Windows Mobile, but
           it is recommended that you set them to the name of the provider's DLL/EXE. -->

      <!-- PhotoEntCapture provider. -->

      <provider name="Microsoft-WindowsMobile-PhotoEntCapture"
          guid="{3A606BB9-DE84-4fc5-87B2-7436F148E827}"
          symbol="MICROSOFT_WINDOWSMOBILE_PHOTOENTCAPTURE"
          messageFileName="PhotoEntCapture.exe"
          resourceFileName="PhotoEntCapture.exe">

        <!-- Here we list the Channels to which this Provider writes data. -->
        <!-- Note: You can customize the "chid" values here, but they must match the "channel" values
             you declare in your events. -->
        <channels>
          <importChannel chid="MEChannel" name="Microsoft-WindowsMobile-Entertainment-Channel"/>
        </channels>


        <!-- Keywords for Microsoft-WindowsMobile-MyChannel -->
        <keywords>
          <!-- Keywords 1 and 2 are defined by WM best practices.  Every event on this channel
               should be tagged with at least one of these keywords. -->
          <keyword mask="0x0000000000000001" name="Debug" />
          <keyword mask="0x0000000000000002" name="Performance" />
        </keywords>


        <!-- Tasks are used with opcodes win:Start and win:Stop to link start and stop events from
             the same task together. -->
        <tasks>
          <task name="PHOTOENTCAPTURE_Operation" value="1"/>
        </tasks>


        <!-- Event Templates -->
        <!-- Here we define the data payloads that may be written with events.
               If multiple events share the same data payload, they can use the same template.
               See the Remarks section in http://msdn.microsoft.com/en-us/library/aa382774(VS.85).aspx
               for valid inType / outType combinations.
               The "%" values noted here are for user convenience, when referencing the stringTable below. -->

        <templates>

          <template tid="PHOTOENTCAPTURE_Operation_Info">
            <data name="Id" inType="win:UInt64"/>
            <data name="Event" inType="win:UnicodeString"/>
            <data name="Time" inType="win:Int64"/>
          </template>

        </templates>


        <events>

          <!-- CAMERA_CAPTURE Events -->

          <event value="1"
              channel="MEChannel"
              level="win:Informational"
              keywords="Performance"
              opcode="win:Start"
              symbol="PHOTOENTCAPTURE_Operation_Start"
              task="PHOTOENTCAPTURE_Operation"/>

          <event value="2"
              channel="MEChannel"
              level="win:Informational"
              keywords="Performance"
              opcode="win:Info"
              template="PHOTOENTCAPTURE_Operation_Info"
              symbol="PHOTOENTCAPTURE_Operation_Info"
              task="PHOTOENTCAPTURE_Operation"/>

          <event value="3"
              channel="MEChannel"
              level="win:Informational"
              keywords="Performance"
              opcode="win:Stop"
              symbol="PHOTOENTCAPTURE_Operation_Stop"
              task="PHOTOENTCAPTURE_Operation"/>

        </events>

      </provider>



      <!-- ZuneApp provider. -->
      
      <provider name="Microsoft-WindowsMobile-ZuneApp"
          guid="{EA7A3A2E-4E47-44b8-8814-172F772E6900}"
          symbol="MICROSOFT_WINDOWSMOBILE_ZUNEAPP"
          messageFileName="Zune.dll"
          resourceFileName="Zune.dll">

        <!-- Here we list the Channels to which this Provider writes data. -->
        <!-- Note: You can customize the "chid" values here, but they must match the "channel" values
             you declare in your events. -->
        <channels>
            <importChannel chid="MEChannel" name="Microsoft-WindowsMobile-Entertainment-Channel"/>
        </channels>


        <!-- Keywords for Microsoft-WindowsMobile-MyChannel -->
        <keywords>
          <!-- Keywords 1 and 2 are defined by WM best practices.  Every event on this channel
               should be tagged with at least one of these keywords. -->
          <keyword mask="0x0000000000000001" name="Debug" />
          <keyword mask="0x0000000000000002" name="Performance" />
        </keywords>


        <!-- Tasks are used with opcodes win:Start and win:Stop to link start and stop events from
             the same task together. -->
        <tasks>
            <!-- Tapping on a button, etc. -->
            <task name="UserAction" value="1"/>
            
            <task name="LoadUI" value="5"/>
            <task name="Purchase" value="6"/>
            <task name="Purchase_GetBillingInfo" value="7"/>
            
            <task name="UserPlayMusic_PrepareQueue" value="10"/>
            <task name="UserPlayVideo_PrepareQueue" value="11"/>
        </tasks>


        <!-- Event Templates -->
        <!-- Here we define the data payloads that may be written with events.
               If multiple events share the same data payload, they can use the same template.
               See the Remarks section in http://msdn.microsoft.com/en-us/library/aa382774(VS.85).aspx
               for valid inType / outType combinations.
               The "%" values noted here are for user convenience, when referencing the stringTable below. -->

        <templates>

            <template tid="UserAction">
                <data name="description" inType="win:UnicodeString"/>
            </template>
            
            <template tid="ContentOperation">
                <data name="ID" inType="win:UnicodeString"/>
            </template>
            
            <template tid="LoadUI">
                <data name="Page" inType="win:UnicodeString"/>
                <data name="TotalItems" inType="win:UInt32"/>
            </template>
            
        </templates>


        <events>
        
            <!-- No start/stop here because the action is "completed" in a
                 completely different part of the code that we don't have
                 direct access to, and because this is a generic event with
                 multiple start and stop points. -->
            <event value="1"
                channel="MEChannel"
                level="win:Informational"
                keywords="Performance"
                template="UserAction"
                symbol="UserAction_Event"
                task="UserAction"/>


            <event value="10"
                channel="MEChannel"
                level="win:Informational"
                keywords="Performance"
                opcode="win:Start"
                template="LoadUI"
                symbol="LoadUI_Start"
                task="LoadUI"/>
                
            <event value="11"
                channel="MEChannel"
                level="win:Informational"
                keywords="Performance"
                opcode="win:Stop"
                symbol="LoadUI_Stop"
                task="LoadUI"/>
                
            <event value="12"
                channel="MEChannel"
                level="win:Informational"
                keywords="Performance"
                opcode="win:Start"
                template="ContentOperation"
                symbol="Purchase_Start"
                task="Purchase"/>
            <event value="13"
                channel="MEChannel"
                level="win:Informational"
                keywords="Performance"
                opcode="win:Stop"
                symbol="Purchase_Stop"
                task="Purchase"/>

            <event value="14"
                channel="MEChannel"
                level="win:Informational"
                keywords="Performance"
                opcode="win:Start"
                symbol="Purchase_GetBillingInfo_Start"
                task="Purchase_GetBillingInfo"/>
            <event value="15"
                channel="MEChannel"
                level="win:Informational"
                keywords="Performance"
                opcode="win:Stop"
                symbol="Purchase_GetBillingInfo_Stop"
                task="Purchase_GetBillingInfo"/>


            <event value="20"
                channel="MEChannel"
                level="win:Informational"
                keywords="Performance"
                opcode="win:Start"
                template="ContentOperation"
                symbol="UserPlayMusic_PrepareQueue_Start"
                task="UserPlayMusic_PrepareQueue"/>

            <event value="21"
                channel="MEChannel"
                level="win:Informational"
                keywords="Performance"
                opcode="win:Stop"
                symbol="UserPlayMusic_PrepareQueue_Stop"
                task="UserPlayMusic_PrepareQueue"/>

            <event value="22"
                channel="MEChannel"
                level="win:Informational"
                keywords="Performance"
                opcode="win:Start"
                template="ContentOperation"
                symbol="UserPlayVideo_PrepareQueue_Start"
                task="UserPlayVideo_PrepareQueue"/>
                
            <event value="23"
                channel="MEChannel"
                level="win:Informational"
                keywords="Performance"
                opcode="win:Stop"
                symbol="UserPlayVideo_PrepareQueue_Stop"
                task="UserPlayVideo_PrepareQueue"/>
                    
            <event value="30"
                channel="MEChannel"
                level="win:Informational"
                keywords="Performance"
                symbol="SearchCandidateListReady"
                task="LoadUI"/>
                            
        </events>

      </provider>

      <provider name="Microsoft-WindowsMobile-MeuxApp"
          guid="{47E2B737-0A05-4103-A01D-5DB77B03AA2D}"
          symbol="MICROSOFT_WINDOWSMOBILE_MEUXAPP"
          messageFileName="Meux.exe"
          resourceFileName="Meux.exe">

        <channels>
            <importChannel chid="MEChannel" name="Microsoft-WindowsMobile-Entertainment-Channel"/>
        </channels>


        <!-- Keywords for Microsoft-WindowsMobile-MyChannel -->
        <keywords>
          <!-- Keywords 1 and 2 are defined by WM best practices.  Every event on this channel
               should be tagged with at least one of these keywords. -->
          <keyword mask="0x0000000000000001" name="Debug" />
          <keyword mask="0x0000000000000002" name="Performance" />
        </keywords>

        <tasks>
            <task name="AppInit" value="1"/>
        </tasks>

        <events>
            <event value="2"
                channel="MEChannel"
                level="win:Informational"
                keywords="Performance"
                opcode="win:Start"
                symbol="AppInit_Start"
                task="AppInit"/>
                
            <event value="3"
                channel="MEChannel"
                level="win:Informational"
                keywords="Performance"
                opcode="win:Stop"
                symbol="AppInit_Stop"
                task="AppInit"/>
        </events>

      </provider>

      <!-- PhotoService provider -->
      <provider name="Microsoft-WindowsMobile-PhotoService"
          guid="{70758AB4-479C-40C2-8300-FAB1E4E8EC72}"
          symbol="MICROSOFT_WINDOWSMOBILE_PHOTOSERVICE"
          messageFileName="PhotosService.dll"
          resourceFileName="PhotosService.dll">

        <!-- Here we list the Channels to which this Provider writes data. -->
        <!-- Note: You can customize the "chid" values here, but they must match the "channel" values
             you declare in your events. -->
        <channels>
          <importChannel chid="MEChannel" name="Microsoft-WindowsMobile-Entertainment-Channel"/>
        </channels>

        <!-- Keywords for Microsoft-WindowsMobile-MyChannel -->
        <keywords>
          <!-- Keywords 1 and 2 are defined by WM best practices.  Every event on this channel
               should be tagged with at least one of these keywords. -->
          <keyword mask="0x0000000000000001" name="Debug" />
          <keyword mask="0x0000000000000002" name="Performance" />
          <keyword mask="0x0000000000000004" name="Test" />
        </keywords>

        <events>
          <event value="1"
             channel="MEChannel"
             level="win:Informational"
             keywords="Test"
             symbol="PhotoService_GeoTag_Event"
             template="PhotoService_GeoTag_Event_Status"
             message="$(string.PhotoService_GeoTagComplete_Msg)" />
        </events>
        <templates>
          <template tid="PhotoService_GeoTag_Event_Status">
            <data
                inType="win:Int32"
                outType="win:HResult"
                name="Status"
                  />
          </template>
        </templates>

      </provider>


      <!-- PhotoEnt provider. -->
      <provider name="Microsoft-WindowsMobile-PhotoEntApp"
          guid="{F579FAFD-CA99-46BB-8BC9-A38CBB8C1F50}"
          symbol="MICROSOFT_WINDOWSMOBILE_PHOTOENTAPP"
          messageFileName="PhotoEntLib.dll"
          resourceFileName="PhotoEntLib.dll">

        <!-- Here we list the Channels to which this Provider writes data. -->
        <!-- Note: You can customize the "chid" values here, but they must match the "channel" values
             you declare in your events. -->
        <channels>
          <importChannel chid="MEChannel" name="Microsoft-WindowsMobile-Entertainment-Channel"/>
        </channels>

        <!-- Keywords for Microsoft-WindowsMobile-MyChannel -->
        <keywords>
          <!-- Keywords 1 and 2 are defined by WM best practices.  Every event on this channel
               should be tagged with at least one of these keywords. -->
          <keyword mask="0x0000000000000001" name="Debug" />
          <keyword mask="0x0000000000000002" name="Performance" />
        </keywords>

        <!-- Tasks are used with opcodes win:Start and win:Stop to link start and stop events from
             the same task together. -->
        <tasks>
          <task name="PhotoEnt_Operation" value="1"/>
          <task name="PhotoEnt_Snapshot_Operation" value="2"/>
          <task name="PhotoEnt_Fetch_Operation" value="3"/>
          <task name="PhotoEnt_BuildTimeSquareWallMosiacList_Operation" value="4"/>
          <task name="PhotoEnt_RootAlbumLoad_Operation" value="5"/>
          <task name="PhotoEnt_GalleryAlbumLoad_Operation" value="6"/>
          <task name="PhotoEnt_PhotoUpload_Operation" value="7"/>
          <task name="PhotoEnt_FetchComments_Operation" value="8"/>
          <task name="PhotoEnt_AllViewLoad_Operation" value="9"/>
          <task name="PhotoEnt_AddImagesToCameraRoll_Operation" value="10"/>
        </tasks>

        <!-- Event Templates -->
        <!-- Here we define the data payloads that may be written with events.
               If multiple events share the same data payload, they can use the same template.
               See the Remarks section in http://msdn.microsoft.com/en-us/library/aa382774(VS.85).aspx
               for valid inType / outType combinations.
               The "%" values noted here are for user convenience, when referencing the stringTable below. -->
        <templates>
          <template tid="PhotoEntType">
            <data name="Type" inType="win:UInt32"/>
          </template>
          <template tid="Snapshot_Operation_Start">
            <data name="SnapshotType" inType="win:UInt32"/>
            <data name="RefreshBeforeSync" inType="win:Boolean"/>
            <data name="Cookie" inType="win:UInt32"/>
          </template>
          <template tid="Snapshot_Operation_Stop">
              <data name="Cookie" inType="win:UInt32"/>
              <data name="Result" inType="win:Int32"/>
          </template>
          <template tid="Fetch_Operation_Start">
            <data name="ForceReload" inType="win:Boolean"/>
            <data name="Cookie" inType="win:UInt32"/>
          </template>
          <template tid="Fetch_Operation_Stop">
              <data name="Cookie" inType="win:UInt32"/>
              <data name="Result" inType="win:Int32"/>
          </template>
          <template tid="GalleryAlbumLoad_Operation_Start">
            <data name="IsOnline" inType="win:Boolean"/>
          </template>
          <template tid="PhotoUpload_Operation_Start">
            <data name="IsAutoUpload" inType="win:Boolean"/>
            <data name="zmediaIdPhoto" inType="win:UInt32"/>
            <data name="TargetNetworkName" inType="win:UnicodeString"/>
          </template>
          <template tid="PhotoUpload_Operation_Stop">
            <data name="IsAutoUpload" inType="win:Boolean"/>
            <data name="zmediaIdPhoto" inType="win:UInt32"/>
          </template>
          <template tid="PhotoEnt_Operation_Info">
            <data name="Id"    inType="win:UInt64"/>
            <data name="Event" inType="win:UnicodeString"/>
            <data name="Time"  inType="win:Int64"/>
          </template>
        </templates>

        <events>
          <event value="1"
              channel="MEChannel"
              level="win:Informational"
              keywords="Performance"
              opcode="win:Start"
              symbol="ProcessSamplePhotos_Start"
              task="PhotoEnt_Operation"/>

          <event value="2"
              channel="MEChannel"
              level="win:Informational"
              keywords="Performance"
              opcode="win:Stop"
              symbol="ProcessSamplePhotos_Stop"
              task="PhotoEnt_Operation"/>

          <event value="3"
              channel="MEChannel"
              level="win:Informational"
              keywords="Performance"
              opcode="win:Start"
              template="Snapshot_Operation_Start"
              symbol="Snapshot_Operation_Start"
              task="PhotoEnt_Snapshot_Operation"/>

          <event value="4"
              channel="MEChannel"
              level="win:Informational"
              keywords="Performance"
              opcode="win:Stop"
              template="Snapshot_Operation_Stop"
              symbol="Snapshot_Operation_Stop"
              task="PhotoEnt_Snapshot_Operation"/>

          <event value="5"
              channel="MEChannel"
              level="win:Informational"
              keywords="Performance"
              opcode="win:Start"
              template="Fetch_Operation_Start"
              symbol="Fetch_Operation_Start"
              task="PhotoEnt_Fetch_Operation"/>

          <event value="6"
              channel="MEChannel"
              level="win:Informational"
              keywords="Performance"
              opcode="win:Stop"
              template="Fetch_Operation_Stop"
              symbol="Fetch_Operation_Stop"
              task="PhotoEnt_Fetch_Operation"/>

          <event value="7"
              channel="MEChannel"
              level="win:Informational"
              keywords="Performance"
              opcode="win:Start"
              symbol="BuildTimeSquareWallMosiacList_Operation_Start"
              task="PhotoEnt_BuildTimeSquareWallMosiacList_Operation"/>

          <event value="8"
              channel="MEChannel"
              level="win:Informational"
              keywords="Performance"
              opcode="win:Stop"
              symbol="BuildTimeSquareWallMosiacList_Operation_Stop"
              task="PhotoEnt_BuildTimeSquareWallMosiacList_Operation"/>

          <event value="9"
              channel="MEChannel"
              level="win:Informational"
              keywords="Performance"
              opcode="win:Start"
              symbol="PhotoEnt_RootAlbumLoad_Operation_Start"
              task="PhotoEnt_RootAlbumLoad_Operation"/>

          <event value="10"
              channel="MEChannel"
              level="win:Informational"
              keywords="Performance"
              opcode="win:Stop"
              symbol="PhotoEnt_RootAlbumLoad_Operation_Stop"
              task="PhotoEnt_RootAlbumLoad_Operation"/>

          <event value="11"
              channel="MEChannel"
              level="win:Informational"
              keywords="Performance"
              opcode="win:Start"
              template="GalleryAlbumLoad_Operation_Start"
              symbol="PhotoEnt_GalleryAlbumLoad_Operation_Start"
              task="PhotoEnt_GalleryAlbumLoad_Operation"/>

          <event value="12"
              channel="MEChannel"
              level="win:Informational"
              keywords="Performance"
              opcode="win:Stop"
              symbol="PhotoEnt_GalleryAlbumLoad_Operation_Stop"
              task="PhotoEnt_GalleryAlbumLoad_Operation"/>
        
          <event value="13"
              channel="MEChannel"
              level="win:Informational"
              keywords="Performance"
              opcode="win:Start"
              template="PhotoUpload_Operation_Start"
              symbol="PhotoEnt_PhotoUpload_Operation_Start"
              task="PhotoEnt_PhotoUpload_Operation"/>

          <event value="14"
              channel="MEChannel"
              level="win:Informational"
              keywords="Performance"
              opcode="win:Stop"
              template="PhotoUpload_Operation_Stop"
              symbol="PhotoEnt_PhotoUpload_Operation_Stop"
              task="PhotoEnt_PhotoUpload_Operation"/>

          <event value="15"
              channel="MEChannel"
              level="win:Informational"
              keywords="Performance"
              opcode="win:Start"
              symbol="PhotoEnt_FetchComments_Begin"
              task="PhotoEnt_FetchComments_Operation"/>

          <event value="16"
              channel="MEChannel"
              level="win:Informational"
              keywords="Performance"
              opcode="win:Stop"
              symbol="PhotoEnt_FetchComments_End"
              task="PhotoEnt_FetchComments_Operation"/>
          
          <event value="17"
              channel="MEChannel"
              level="win:Informational"
              keywords="Performance"
              opcode="win:Start"
              symbol="PhotoEnt_AllViewLoad_Operation_Start"
              task="PhotoEnt_AllViewLoad_Operation"/>

          <event value="18"
              channel="MEChannel"
              level="win:Informational"
              keywords="Performance"
              opcode="win:Stop"
              symbol="PhotoEnt_AllViewLoad_Operation_Stop"
              task="PhotoEnt_AllViewLoad_Operation"/>

          <event value="19"
              channel="MEChannel"
              level="win:Informational"
              keywords="Performance"
              opcode="win:Start"
              symbol="PhotoEnt_AddImagesToCameraRoll_Begin"
              task="PhotoEnt_AddImagesToCameraRoll_Operation" />

          <event value="20"
              channel="MEChannel"
              level="win:Informational"
              keywords="Performance"
              opcode="win:Stop"
              symbol="PhotoEnt_AddImagesToCameraRoll_End"
              task="PhotoEnt_AddImagesToCameraRoll_Operation"/>


          <event value="37"
                 channel="MEChannel"
                 level="win:Informational"
                 keywords="Performance"
                 opcode="win:Start"
                 symbol="PhotoEnt_Operation_Start"
                 task="PhotoEnt_Operation"/>

          <event value="38"
                 channel="MEChannel"
                 level="win:Informational"
                 keywords="Performance"
                 opcode="win:Stop"
                 symbol="PhotoEnt_Operation_Stop"
                 task="PhotoEnt_Operation"/>

          <event value="39"
                 channel="MEChannel"
                 level="win:Informational"
                 keywords="Performance"
                 opcode="win:Info"
                 symbol="PhotoEnt_Operation_Info"
                 template="PhotoEnt_Operation_Info"
                 task="PhotoEnt_Operation"/>

        </events>
      </provider>

      <provider name="Microsoft-WindowsMobile-PhotoEntExe"
          guid="{FF605B9F-1574-4EB9-A73C-AE5B026414BF}"
          symbol="MICROSOFT_WINDOWSMOBILE_PHOTOENTEXE"
          messageFileName="PhotoEnt.exe"
          resourceFileName="PhotoEnt.exe">

        <channels>
          <importChannel chid="MEChannel" name="Microsoft-WindowsMobile-Entertainment-Channel"/>
        </channels>


        <!-- Keywords for Microsoft-WindowsMobile-MyChannel -->
        <keywords>
          <!-- Keywords 1 and 2 are defined by WM best practices.  Every event on this channel
               should be tagged with at least one of these keywords. -->
          <keyword mask="0x0000000000000001" name="Debug" />
          <keyword mask="0x0000000000000002" name="Performance" />
        </keywords>

        <tasks>
          <task name="PhotoEntInit" value="1"/>
        </tasks>

        <events>
          <event value="1"
              channel="MEChannel"
              level="win:Informational"
              keywords="Performance"
              opcode="win:Start"
              symbol="PhotoEntInit_Start"
              task="PhotoEntInit"/>

          <event value="2"
              channel="MEChannel"
              level="win:Informational"
              keywords="Performance"
              opcode="win:Stop"
              symbol="PhotoEntInit_Stop"
              task="PhotoEntInit"/>
        </events>

      </provider>

    </events>
  </instrumentation>
  <localization>
    <resources culture="en-US">
      <stringTable>
        <string id="PhotoService_GeoTagComplete_Msg"
          value="PhotoService GeoTagComplete Status: %1" />
      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>
