//---------------------------------------------------------------------------
// Microsoft Test Automation Sources
//
// Copyright 2005 Microsoft Corporation. All Rights Reserved.
//
// Common.js
//
// Collection: WDTF Automation Scenarios
// 
// Environment: CScript
//
// Primary Contact: WDTF Support (WDTFSupp@microsoft.com)
//
// Remarks:
//   This file is used as an include file for many of the Automated Scenarios
// produced using WDTF. It exports classes that make writing, understanding,
// and maintaining these scenarios easier.
//
// History:
//   [Date]        -   [Status]
//   Dec 00 2005   -   Created
//   Apr 08 2006   -   Converted to JScript implementation, updated
//                     comments.
//   Apr 12 2006   -   Created JScript_WDTF wrappers.
//                     Created class based implementation.
//---------------------------------------------------------------------------



//----------------------------------------------------------------------------
// The following "JScript_*" classes are JScript wrappers around WDTF.
//
// Remarks:
//   Whenever you use JScript to implement WDTF scenarios, start by creating an
// instance of JScript_WDTF in the following way:
//
//    var WDTF = new JScript_WDTF();
//
//   These wrappers behave almost exactly like the real WDTF except in the
// following ways:
//
//     1. A "Targets Collection" is a JScript array. It does not have a 
//        Query() method.
//     2. Target::GetRelations() can be called with just the first parameter.
//     3. Target additionally has a TryGetInterface() method that returns
//        'null' when no implementation of the interface is found.
//     4. Target does not support the Target::Context(...) property, because
//        JScript does not support Parameterized properties. You should use
//        SetContext()/GetContext() instead.
//----------------------------------------------------------------------------
function JScript_WDTF(COM_WDTF)
{
  // Hold an internal reference to the actual WDTF COM object
  if(COM_WDTF != undefined && COM_WDTF != null)
  {
    this.COM_WDTF = COM_WDTF;
  }
  else
  {
    this.COM_WDTF = new ActiveXObject("WDTF.WDTF");
  }
  
  // Wrap the IWDTF::DeviceDepot property
  this.DeviceDepot = new JScript_DeviceDepot(this.COM_WDTF.DeviceDepot, this);
  
  // Wrap the IWDTF::SystemDepot property
  this.SystemDepot = new JScript_SystemDepot(this.COM_WDTF.SystemDepot, this);
  
  // Wrap the ITracing::SetTraceLevel method
  this.SetTraceLevel = 
    function(Level) { this.COM_WDTF.SetTraceLevel(Level); };
  
  // Wrap the IWDTF::Destroy method
  this.Destroy = function()
  {
    this.DeviceDepot = null;
    this.SystemDepot = null;
    
    this.COM_WDTF.Destroy();
    this.COM_WDTF = null;
  };

  // Internal JScript_* method. Looks up and returns an existing JScript_Target
  // object or returns a new one if one doesn't exist.
  this._Get_JScript_Target = function(COM_Target)
  {
    var _JScript_Target = COM_Target.Context("_JScript_Target");

    if(_JScript_Target == undefined || _JScript_Target == null)
    {
      _JScript_Target = new JScript_Target(COM_Target, this);
      COM_Target.Context("_JScript_Target") = _JScript_Target;
    }

    return _JScript_Target;
  }
}
function JScript_SystemDepot(COM_SystemDepot, WDTF)
{
  // Hold an internal reference to the actual SystemDepot COM object
  this.COM_SystemDepot = COM_SystemDepot;
  
  // Wrap the ISystemDepot::WDTF property
  this.WDTF = WDTF;
  
  // Wrap the ISystemDepot::ThisSystem property
  this.ThisSystem = new JScript_Target(this.COM_SystemDepot.ThisSystem, WDTF);
  
  // Wrap the ITracing::SetTraceLevel method
  this.SetTraceLevel = 
    function(Level) { this.COM_SystemDepot.SetTraceLevel(Level); };
}
function JScript_DeviceDepot(COM_DeviceDepot, WDTF)
{
  // Hold an internal reference to the actual DeviceDepot COM object
  this.COM_DeviceDepot = COM_DeviceDepot;
  
  // Wrap the IDeviceDepot::WDTF property
  this.WDTF = WDTF;
  
  // Wrap the IDeviceDepot::RootDevice property
  this.RootDevice = new JScript_Target(this.COM_DeviceDepot.RootDevice, WDTF);
  
  // Wrap the IDeviceDepot::Query method
  this.Query = 
    function(SDEL) { return JScript_Targets(this.COM_DeviceDepot.Query(SDEL), WDTF); };
  
  // Wrap the IDeviceDepot::GetMatchEventSource method
  this.GetMatchEventSource = 
    function(SDEL) { return new JScript_MatchEventSource(this.COM_DeviceDepot.GetMatchEventSource(SDEL), SDEL, WDTF); };
  
  // Wrap the IDeviceDepot::UpdateAndReportMatches method
  this.UpdateAndReportMatches = 
    function() { return COM_DeviceDepot.UpdateAndReportMatches(); };
  
  // Wrap the ITracing::SetTraceLevel method
  this.SetTraceLevel = 
    function(Level) { this.COM_DeviceDepot.SetTraceLevel(Level); };
}
function JScript_Targets(COM_Targets, WDTF)
{
  // Convert the COM_Targets COM object into a simple JScript array.
  var res = new Array();
  
  var count = COM_Targets.Count;
  
  for(var idx=0; idx<count; idx++)
  {
    res[idx] = WDTF._Get_JScript_Target(COM_Targets.Item(idx));
  }
  return res;
}
function JScript_Target(COM_Target, WDTF)
{
  // Hold an internal reference to the actual Target COM object
  this.COM_Target = COM_Target;
  
  // Wrap the ITarget::WDTF property
  this.WDTF = WDTF;
  
  // Wrap the ITarget::Type property
  this.Type = COM_Target.Type;
  
  // Wrap the ITarget::Context property with two methods
  this.GetContext = 
    function(name) { return this.COM_Target.Context(name); };
  this.SetContext = 
    function(name, value) { this.COM_Target.Context(name) = value; };
  
  // Wrap the ITracing::SetTraceLevel method
  this.SetTraceLevel = 
    function(Level) { this.COM_Target.SetTraceLevel(Level); };
  
  // Wrap the ITarget::GetValue() method directly
  this.GetValue = 
    function(value)
    {
      return FixDataType(this.COM_Target.GetValue(value));
    };
    
  // Wrap the ITarget::Eval() method directly
  this.Eval = 
    function(SDEL) { return this.COM_Target.Eval(SDEL); };
    
  // Wrap the ITarget::GetRelations() method directly
  this.GetRelations = 
    function(SDEL, matchSDEL) { return JScript_Targets(this.COM_Target.GetRelations(SDEL, matchSDEL), WDTF); };
  
  // Wrap the ITarget::GetInterface() method directly
  this.GetInterface = 
    function(progID, args, monikerSuffix) { return this.COM_Target.GetInterface(progID, args, monikerSuffix); };
  
  // Wrap the ITarget::GetInterface() method, returning null
  // in place of any caught errors.
  this.TryGetInterface =
    function(progID, args, monikerSuffix)
    {
      try
      {
        return this.GetInterface(progID, args, monikerSuffix);
      }
      catch(e)
      {
        return null;
      }
    };
}
function JScript_MatchEventSource(COM_EventSource, SDEL, WDTF)
{
  // Hold an internal reference to the actual IMatchEventSource COM object
  this.COM_EventSource = COM_EventSource;
  
  // Wrap the IMatchEventSource::WDTF property
  this.WDTF = WDTF;
  
  // Wrap the IMatchEventSource::SDEL property
  this.SDEL = SDEL;
  
  
  // Wrap IMatchEventSource::Start, but have three callbacks instead of only two
  // Do not include Func_MatchExisting if you want these events treated as normal
  // MatchFound events
  this.Start =
    function(Func_MatchFound, Func_MatchLost, Func_MatchExisting)
    {
      // Calling Start again is ignored.
      if(COM_EventSource.Context == this)
      {
        return;
      }
      
      COM_EventSource.Context = this;
      
      WScript.ConnectObject(COM_EventSource, "_JScript_MatchEventSource_");
      
      this._Func_MatchLost     = Func_MatchLost;
      this._Func_MatchFound    = Func_MatchFound;
      
      // If Func_MatchExisting is provided, MatchFound will redirect to 
      // MatchExisting during the start method.
      if(Func_MatchExisting != null && Func_MatchExisting != undefined)
      {
        this._Func_MatchFound = Func_MatchExisting;
      }
      
      COM_EventSource.Start();
      
      this._Func_MatchFound    = Func_MatchFound;
    }
    
  // Wrap the IMatchEventSource::Destroy method
  this.Destroy = 
    function()
    {
      COM_EventSource.Destroy();
    }
}
function _JScript_MatchEventSource_MatchFound(COM_Target, COM_EventSource)
{
  var EventSource = COM_EventSource.Context;
  EventSource._Func_MatchFound(EventSource.WDTF._Get_JScript_Target(COM_Target), EventSource);
}
function _JScript_MatchEventSource_MatchLost(COM_Target, COM_EventSource)
{
  var EventSource = COM_EventSource.Context;
  EventSource._Func_MatchLost(EventSource.WDTF._Get_JScript_Target(COM_Target), EventSource);
}

//----------------------------------------------------------------------------
//  This method tries to fix up any unknown data-types.
//----------------------------------------------------------------------------
function FixDataType(Value)
{
  if(typeof(Value) == "unknown")
  {
    try
    {
      // first try to convert it using VBArray
      Value = VBArray(Value).toArray();
      for(var idx in Value)
      {
        // since it is an array, need to fix it's members too
        Value[idx] = FixDataType(Value[idx]);
      }
    }
    catch(e)
    {
      // Then try to use a VBScript method to convert it to a string (JScript can't do it?)
      // Need to include Common.vbs in order for this to work.
      Value = JStr(Value);
    }
  }
  return Value;
}


//----------------------------------------------------------------------------
//  Simple method for outputting standard device information to the Log
//----------------------------------------------------------------------------
function TraceDeviceInfo(InfoDevice)
{
  try
  {
    Log.TraceMsg("DeviceID: " + InfoDevice.GetValue("DeviceID"));
    Log.TraceMsg("Name: "     + InfoDevice.GetValue("DisplayName"));
    Log.TraceMsg("Class: "    + InfoDevice.GetValue("ClassGUID"));
  }
  catch(e)
  {
    throw new Error(e.number, "TraceDeviceInfo() -> " + e.description);
  }
}


//----------------------------------------------------------------------------
// Algorithm to backoff/retry an operation. This is useful because it's
// not always knowable how long something should take to complete.
//
// Parameters:
//  RetryTimes      This is an array of integers that indicate how long to timeout
//                  between retries. The values are in seconds.
//
//  Operation       This parameter should be a function that returns true/false. If
//                  the operation returns false or throws an exception, it will be
//                  retried. If the operation returns true, the Retry() method will
//                  return without any additional retries.
//
//  Timeout         This should be a function with three args, the current try, 
//                  the total number of retrys, and how long it is about to wait for.
//                  This function will be called before each retry (not the first try).
//
// Remarks:
//  This function will trace retry messages to the log when the operation fails and
// is retried.
//----------------------------------------------------------------------------
function Retry(RetryTimes, Operation, Timeout)
{
  try
  {
    for(var idx in RetryTimes)
    {
      try
      {
        if(Operation())
        {
          return true;
        }
      }
      catch(e)
      {
      }
      Timeout(idx, RetryTimes.length, RetryTimes[idx]);
      WScript.Sleep(1000*RetryTimes[idx]);
    }
  }
  catch(e)
  {
    throw new Error(e.number, "Retry() -> " + e.description);
  }
  return Operation();
}



//----------------------------------------------------------------------------
// This class is used by JScript scripts to help construct scenarios.
//
// Remarks:
//   This class gets all the required device management interfaces for 
// constructing a set of scenarios.
//   This class will also save the initial Status and ProblemCode of the devices
// to make sure that they don't change in a bad way.
//   
//----------------------------------------------------------------------------
function JScript_CommonScenarioModule(WDTF, Devices)
{
  try
  {
    this.WDTF = WDTF;
     
    this.Devices = Devices;
    
    // Flag to indicate that we have at least one device to test
    this.bFoundSimpleIO = false;
    
    // Flag to indicate that we want to do an initial baseline SimpleIOStress.
    // During ConstructSimpleIOStress(), if the SimpleIOStress doesn't pass,
    // it won't be included in the list.
    this.bBaselineSimpleIO = false;
    
    // Get the System DeviceManagement from ThisSystem
    this.SysDevMan = WDTF.SystemDepot.ThisSystem.GetInterface("DeviceManagement");
    
    // initialize all the devices for use in this Scenario class
    for(var idx in this.Devices)
    {
      var Device = this.Devices[idx];

      var DeviceInterface = Device.GetInterface("DeviceManagement");
      
      Device.SetContext("DeviceInterface", DeviceInterface);

      try
      {
        Device.SetContext("OriginalDriverPackage", DeviceInterface.DriverPackage);
      }
      catch(e)
      {
        Log.TraceMsg("WARNING: Device doesn't have a driver installed on it: '" + Device.GetValue("DeviceID") + "'");
      }
      
      //  Save Device problem code and status
      Device.SetContext("PreviousStatus", Device.GetValue("Status"));
      Device.SetContext("PreviousProblemCode", Device.GetValue("ProblemCode"));
    }
  }
  catch(e)
  {
    throw new Error(e.number, "JScript_CommonScenarioModule() -> " + e.description);
  }
}

//----------------------------------------------------------------------------
// Find and Start all the SimpleIO for devices.
//
// Remarks:
//   This method will attempt to find an implementation of the SimpleIOStress
// interface for every device in the 'Devices' parameter. If one is found, it
// will be Started and then attached to the device for later use.
//
//   This method should be called first before the CheckSimpleIOStress method is called.
//----------------------------------------------------------------------------
JScript_CommonScenarioModule.prototype.ConstructSimpleIOStress =
function()
{
  try
  {
    for(var idx in this.Devices)
    {
      var Device = this.Devices[idx];
      
      TraceDeviceInfo(Device);
      
      try
      {
        // Retrieve and then Save the SimpleIOStress in the "SimpleIO" expando property
        Device.SetContext("SimpleIO", Device.GetInterface("SimpleIOStress"));
        
        Log.TraceMsg("SimpleIOStress found. Starting it.");
        
        try
        {
          Retry([10, 30, 60], 
                function()
                {
                  Device.GetContext("SimpleIO").Start();
                  return true;
                },
                function(Index, MaxRetry, TimeOut)
                {
                  Log.TraceMsg("Try " + Index + " of " + MaxRetry + " failed. Waiting " + TimeOut + " seconds.");
                });
        }
        catch(e)
        {
          if(this.bBaselineSimpleIO)
          {
            Log.TraceMsg("WARNING: SimpleIOStress::Start() failed! -> " + e.description);
          }
          else
          {
            Log.TraceExcept(e, "SimpleIOStress::Start() failed!");
          }
          
          // Mark the device so that we don't try to use the SimpleIOStress later
          Device.SetContext("SimpleIO", null);
        }
      }
      catch(e)
      {
        // This is the case when a device doesn't happen to have an implementation for
        // the SimpleIOStress interface.
        Log.TraceMsg("SimpleIOStress NOT found.");
        
        // Mark the device so that we don't try to use the SimpleIOStress later
        Device.SetContext("SimpleIO", null);
      }
    }
    
    // Do some SimpleIO for a short period
    WScript.Sleep(5000);

    // Now check if we have found any good SimpleIOStress
    for(var idx in this.Devices)
    {
      var Device = this.Devices[idx];

      var SimpleIO = Device.GetContext("SimpleIO");

      if(SimpleIO != null)
      {
        if(this.bBaselineSimpleIO)
        {
          try
          {
            SimpleIO.Pause();
          }
          catch(e)
          {
            Log.TraceExcept(e, "SimpleIOStress::Pause() failed! Internal Test Error.");
          }

          if(SimpleIO.Status.FCount > 0)
          {
            Log.TraceMsg("WARNING: SimpleIOStress baseline failed, ignoring this SimpleIOStress.");
            
            try
            {
              Device.GetContext("SimpleIO").Stop();
            }
            catch(e)
            {
              Log.TraceExcept(e, "SimpleIOStress::Stop() failed to close device!");
            }
            
            Device.SetContext("SimpleIO", null);
            SimpleIO = null;
          }
        }
      }
      
      if(SimpleIO != null)
      {
        // We found a good SimpleIOStress!
        this.bFoundSimpleIO = true;
      }
    }
  }
  catch(e)
  {
    throw new Error(e.number, "ConstructSimpleIOStress() -> " + e.description);
  }
}


//----------------------------------------------------------------------------
// Pause or Stop the SimpleIOs and check their status.
//
// Remarks:
//   This method will attempt to either Pause or Stop all the SimpleIOs attached
// to each device in Devices. The Action is specified by a string.
//
//   The ConstructSimpleIOStress method should be called first before this method is
// called.
//----------------------------------------------------------------------------
JScript_CommonScenarioModule.prototype.CheckSimpleIOStress =
function(Action)
{
  try
  {
    Log.TraceMsg("Calling SimpleIOStress::" + Action + "()");

    for(var idx in this.Devices)
    {
      var Device = this.Devices[idx];

      // Ignore all devices that don't have a SimpleIO
      if(Device.GetContext("SimpleIO") != null)
      {
        TraceDeviceInfo(Device);
        
        switch(Action.toLowerCase())
        {
        case "stop":
          if(Device.GetContext("SimpleIO").State == SimpleIO_Started ||
             Device.GetContext("SimpleIO").State == SimpleIO_Paused )
          {
            try
            {
              Device.GetContext("SimpleIO").Stop();
            }
            catch(e)
            {
              Log.TraceExcept(e, "SimpleIOStress::Stop() failed to close device!");
            }
          }
          break;
        case "pause":
          if(Device.GetContext("SimpleIO").State == SimpleIO_Started)
          {
            try
            {
              Device.GetContext("SimpleIO").Pause();
            }
            catch(e)
            {
              Log.TraceExcept(e, "SimpleIOStress::Pause() failed! Internal Test Error.");
            }
          }
          break;
        case "continue":
          if(Device.GetContext("SimpleIO").State == SimpleIO_Paused)
          {
            try
            {
              Device.GetContext("SimpleIO").Continue();
            }
            catch(e)
            {
              Log.TraceExcept(e, "SimpleIOStress::Continue() failed! Internal Test Error.");
            }
          }
          continue;   // move to the next device in the list
        case "start":
          if(Device.GetContext("SimpleIO").State == SimpleIO_Stopped)
          {
            try
            {
              Retry([10, 30, 60], 
                    function()
                    {
                      Device.GetContext("SimpleIO").Start();
                      return true;
                    },
                    function(Index, MaxRetry, TimeOut)
                    {
                      Log.TraceMsg("Try " + Index + " of " + MaxRetry + " failed. Waiting " + TimeOut + " seconds.");
                    });
            }
            catch(e)
            {
              Log.TraceExcept(e, "SimpleIOStress::Start() failed!");
            }
          }
          continue;   // move to the next device in the list
        default:
          Log.TraceErr(-1, "Internal Test Error. CheckSimpleIOStress method called with invalid 'Action' parameter.");
          break;
        }
        
        Log.TraceMsg("Failure Count: " + Device.GetContext("SimpleIO").Status.FCount);
        Log.TraceMsg("Success Count: " + Device.GetContext("SimpleIO").Status.SCount);
        
        try
        {
          Device.GetContext("SimpleIO").Status.AssertSuccess();
        }
        catch(e)
        {
          Log.TraceExcept(e, "SimpleIOStress Failed!");
        }
        
        // Clear the status, so next round will be independent of this one.
        Device.GetContext("SimpleIO").Status.Clear();
      }
    }
  }
  catch(e)
  {
    throw new Error(e.number, "CheckSimpleIOStress() -> " + e.description);
  }
}


//----------------------------------------------------------------------------
// Delete all SimpleIOs
//
// Remarks:
//   This method will destroy every SimpleIO attached to the Devices without
// even checking the status of the individual SimpleIO.
//----------------------------------------------------------------------------
JScript_CommonScenarioModule.prototype.DestructSimpleIOStress =
function()
{
  try
  {
    for(var idx in this.Devices)
    {
      this.Devices[idx].SetContext("SimpleIO", null);
    }
  }
  catch(e)
  {
    throw new Error(e.number, "DestructSimpleIOStress() -> " + e.description);
  }
}



//----------------------------------------------------------------------------
//  Check problem codes and status for all devices in the scenario
//----------------------------------------------------------------------------
JScript_CommonScenarioModule.prototype.DoCheckStatus =
function()
{
  try
  {
    for(var idx in this.Devices)
    {
      this.CheckStatus(this.Devices[idx]);
    }
  }
  catch(e)
  {
    throw new Error(e.number, "DoCheckStatus() -> " + e.description);
  }
}

//----------------------------------------------------------------------------
//  Check problem codes and status for a single device in the scenario
//----------------------------------------------------------------------------
JScript_CommonScenarioModule.prototype.CheckStatus =
function(Device)
{
  try
  {
    Retry([10, 30, 60], 
          function()
          {
            return Device.GetValue("ProblemCode") == Device.GetContext("PreviousProblemCode");
          },
          function(Index, MaxRetry, TimeOut)
          {
            Log.TraceMsg("Try " + Index + " of " + MaxRetry + " failed. Waiting " + TimeOut + " seconds.");
          });
    
    var NewProblemCode      = Device.GetValue("ProblemCode");
    var PreviousProblemCode = Device.GetContext("PreviousProblemCode");
    
    Device.SetContext("PreviousProblemCode", NewProblemCode);
    
    
    if(NewProblemCode == undefined && PreviousProblemCode == undefined)
    {
      // Missing device is still missing, that's OK.
      return;
    }
    
    if(NewProblemCode == undefined && PreviousProblemCode != undefined)
    {
      TraceDeviceInfo(Device);
      Log.TraceMsg("Previous Problem Code: " + PreviousProblemCode);
      Log.TraceErr(-1, "Device is missing!");
      return;
    }
    
    if(NewProblemCode != undefined && PreviousProblemCode == undefined)
    {
      TraceDeviceInfo(Device);
      Log.TraceErr(-1, "Unexpected new Device found! New Problem Code: " + NewProblemCode);
      return;
    }

    if(NewProblemCode != PreviousProblemCode)
    {
      TraceDeviceInfo(Device);
      
      Log.TraceMsg("Previous Problem Code: " + PreviousProblemCode);
      Log.TraceErr(-1, "Problem Code has changed to: " + NewProblemCode);
    }

  }
  catch(e)
  {
    throw new Error(e.number, "CheckStatus() -> " + e.description);
  }
}


//----------------------------------------------------------------------------
//  Do a disable/enable cycle on all devices in the scenario
//----------------------------------------------------------------------------
JScript_CommonScenarioModule.prototype.DoDisableEnable =
function()
{
  try
  {
    for (var idx in this.Devices)
    {
      var Device = this.Devices[idx];
      
      TraceDeviceInfo(Device);

      this.DisableEnable(Device);
    }
    
    WScript.Sleep(30000);
  }
  catch(e)
  {
    throw new Error(e.number, "DoDisableEnable() -> " + e.description);
  }
}

//----------------------------------------------------------------------------
//  Do a disable/enable cycle on a single device in the scenario
//----------------------------------------------------------------------------
JScript_CommonScenarioModule.prototype.DisableEnable =
function(Device)
{
  try
  {
    try
    {
      Device.GetContext("DeviceInterface").Disable();
      Log.TraceMsg("Disable()");
    }
    catch(e)
    {
      Log.TraceExcept(e, "Disable() failed!");
    }
    
    if(Device.Eval("IsRebootNeeded=False"))
    {
      if(!Retry([1, 4, 10, 25, 60], 
                function()
                {
                  return !Device.Eval("IsStarted");
                },
                function(Index, MaxRetry, TimeOut)
                {
                  Log.TraceMsg("Device is still started (" + Index + " of " + MaxRetry + "). Waiting " + TimeOut + " seconds.");
                }))
      {
        Log.TraceMsg("Status  Code: " + Device.GetValue("Status"));
        Log.TraceMsg("Problem Code: " + Device.GetValue("ProblemCode"));
        Log.TraceErr(-1, "The device failed to disable.");
      }
    }
    try
    {
      Device.GetContext("DeviceInterface").Enable();
      Log.TraceMsg("Enable()");
      
      Retry([1, 4, 10, 25, 60], 
            function()
            {
              return !Device.Eval("IsDisabled");
            },
            function(Index, MaxRetry, TimeOut)
            {
              Log.TraceMsg("Device is still disabled (" + Index + " of " + MaxRetry + "). Waiting " + TimeOut + " seconds.");
            });

      WScript.Sleep(5000);
    }
    catch(e)
    {
      Log.TraceExcept(e, "Enable() failed!");
    }
  }
  catch(e)
  {
    throw new Error(e.number, "DisableEnable() -> " + e.description);
  }

}

//----------------------------------------------------------------------------
//  Do an uninstall/reinstall cycle on all devices in the scenario
//----------------------------------------------------------------------------
JScript_CommonScenarioModule.prototype.DoUninstallReinstall =
function()
{
  try
  {
    for (var idx in this.Devices)
    {
      var Device = this.Devices[idx];

      TraceDeviceInfo(Device);

      this.UninstallReinstall(Device);
    }
  }
  catch(e)
  {
    throw new Error(e.number, "DoUninstallReinstall() -> " + e.description);
  }
}

//----------------------------------------------------------------------------
//  Do an Uninstall/Reinstall cycle on a single device in the scenario
//----------------------------------------------------------------------------
JScript_CommonScenarioModule.prototype.UninstallReinstall =
function(Device)
{
  try
  {
    var DriverPackage = Device.GetContext("DeviceInterface").DriverPackage;
    var OrigVersion = DriverPackage.Version;
    var OrigInf = DriverPackage.Inf;
    Log.TraceMsg("Original Version " + OrigVersion);
    Log.TraceMsg("Original Inf " + OrigInf);
    Device.GetContext("DeviceInterface").Remove();
    this.SysDevMan.Rescan();
    var noMoreEvents = this.SysDevMan.WaitNoPendingInstallEvents(5*60*1000); // wait max of five minutes
    if(!noMoreEvents)
    {
      Log.TraceErr(-1, "After removing device " + Device.GetValue("DeviceID") + " and rescanning, there were still installs happening after 5 minutes.");
    }

    // refresh DeviceInterface after uninstall/reinstall
    Device.SetContext("DeviceInterface", Device.GetInterface("DeviceManagement"));

    DriverPackage = Device.GetContext("DeviceInterface").DriverPackage;
    if(DriverPackage.Inf != OrigInf)
    {
      Log.TraceErr(-1, "On re-install, inf changed from " + OrigInf + " to " + DriverPackage.Inf);
    }
    if(DriverPackage.Version != OrigVersion)
    {
      Log.TraceErr(-1, "On re-install, version changed from " + OrigVersion + " to " + DriverPackage.Version);
    }

    Log.TraceMsg("Final Version " + DriverPackage.Version);
    Log.TraceMsg("Final Inf " + DriverPackage.Inf);
  }
  catch(e)
  {
    throw new Error(e.number, "UninstallReinstall() -> " + e.description);
  }
}


//----------------------------------------------------------------------------
//  Do a Reinstall of the original driver on a single device in the scenario
//----------------------------------------------------------------------------
JScript_CommonScenarioModule.prototype.Reinstall =
function(Device)
{
  try
  {
    var bRebootNeeded = false;
    
    var OriginalDriverPackage = Device.GetContext("OriginalDriverPackage");
    
    try
    {
      bRebootNeeded = Device.GetContext("DeviceInterface").InstallFromInf(OriginalDriverPackage.Inf);
      Log.TraceMsg("InstallFromInf(" + OriginalDriverPackage.Inf + ")");
    }
    catch(e)
    {
      Log.TraceExcept(e, "InstallFromInf(" + OriginalDriverPackage.Inf + ") failed! " +
                         "See setupapi.log for details.");
    }
    
    Device.bRebootNeeded = bRebootNeeded;
    
    if(bRebootNeeded)
    {
      Log.TraceMsg("WARNING: Device needs a reboot to reinstall, this is a bad user experience.");
    }
    else
    {
      this.WaitNoPendingInstallEvents(5); // Warn after 5 minutes, but keep waiting
    }
  }
  catch(e)
  {
    throw new Error(e.number, "RemoveAndRescan() -> " + e.description);
  }
}

//----------------------------------------------------------------------------
//  Do an Uninstall + Scan for New Hardware on a single device in the scenario
//----------------------------------------------------------------------------
JScript_CommonScenarioModule.prototype.RemoveAndRescan =
function(Device)
{
  try
  {
    Device.bRebootNeeded = false;
    
    var OriginalDriverPackage = Device.GetContext("OriginalDriverPackage");
    
    try
    {
      Device.GetContext("DeviceInterface").Remove();
      Log.TraceMsg("Remove()");
    }
    catch(e)
    {
      Log.TraceExcept(e, "Remove() failed!");
    }
    
    if(Device.Eval("IsRebootNeeded=False"))
    {
      if(!Retry([1, 4, 10, 25, 60], 
                function()
                {
                  return !Device.Eval("IsStarted");
                },
                function(Index, MaxRetry, TimeOut)
                {
                  Log.TraceMsg("Device is still started (" + Index + " of " + MaxRetry + "). Waiting " + TimeOut + " seconds.");
                }))
      {
        Log.TraceMsg("Status  Code: " + Device.GetValue("Status"));
        Log.TraceMsg("Problem Code: " + Device.GetValue("ProblemCode"));
        Log.TraceErr(-1, "The device failed to Remove (Uninstall)! See setupapi.log for details.");
        
        Device.bRebootNeeded = true;
      }
    }
    
    this.SysDevMan.Rescan();
    
    Log.TraceMsg("Rescan()");

    WScript.Sleep(15000);
    
    this.WaitNoPendingInstallEvents(5); // Warn after 5 minutes, but keep waiting

    try
    {
      var DriverPackage = Device.GetContext("DeviceInterface").DriverPackage;
      if(DriverPackage.Inf != OriginalDriverPackage.Inf)
      {
        Log.TraceMsg("WARNING: INF changed from " + OriginalDriverPackage.Inf + " to " + DriverPackage.Inf + ". " + 
                     "You may want to ensure that the driver-under-test is the best match for this device.");
      }
      else if(DriverPackage.Version != OriginalDriverPackage.Version)
      {
        Log.TraceMsg("WARNING: Driver Version changed from " + OriginalDriverPackage.Version + " to " + 
                     DriverPackage.Version + ". Manually removing these old drivers may help clear up " +
                     "other test failures, however, end-users may experience these failures first-hand.");
      }      
    }
    catch(e)
    {
        Log.TraceErr(-1, "Driver Failed to Install during Rescan(), please see setupapi.log for details.");
    }
  }
  catch(e)
  {
    throw new Error(e.number, "RemoveAndRescan() -> " + e.description);
  }
}


//----------------------------------------------------------------------------
// Wait for all Device Install events to complete and enforce a limit where
// a Warning is logged. However, always keep waiting till all events are complete.
//----------------------------------------------------------------------------
JScript_CommonScenarioModule.prototype.WaitNoPendingInstallEvents =
function(WaitMinutes)
{
  var noMoreEvents = false;
  var waitCount = 1;

  while(!noMoreEvents)
  {
    noMoreEvents = this.SysDevMan.WaitNoPendingInstallEvents(WaitMinutes*60*1000);

    if(!noMoreEvents)
    {
      Log.TraceMsg("WARNING: Device Installation is taking too long (over " + waitCount*WaitMinutes +" minutes). Is your device installation hung?");
    }
  }
}
//----------------------------------------------------------------------------
// Constructs an object that is useful for sending the machine to sleep.
//----------------------------------------------------------------------------
function SleepCycler(WDTF)
{
  try
  {
    this.Console = WDTF.SystemDepot.ThisSystem.TryGetInterface("Console");
  
    this.SleepState = this.Console.GetFirstSleepState();
  
    // Remember if any sleep states are available at all
    this.bSleepStateAvailable = (this.SleepState > 0);
  
    this.Console.PasswordProtectSleep       = false;
    this.Console.PasswordProtectScreenSaver = false;
  }
  catch(e)
  {
    throw new Error(e.number, "SleepCycler() -> " + e.description);
  }
  
  //----------------------------------------------------------------------------
  // Perform a simple sleep cycle on the system using the provided Console
  // interface.
  //
  // Remarks:
  //   This method will use an automatic wake timer. The SleepState parameter is
  // used to determine which sleep state to go to.
  //----------------------------------------------------------------------------
  this.DoSleepCycle = 
    function(SleepPeriod)
    {
      try
      {
        if(this.SleepState == 0)
        {
          // Loop back to the lightest sleep state
          this.SleepState = this.Console.GetFirstSleepState();
        }
        
        if(this.SleepState == 0)
        {
          Log.TraceErr(-1, "The system reports that it no longer supports any sleep states.");
          return;
        }
  
  
        var ToSleepTime = new Date();
        
        Log.TraceMsg("Time: " + ToSleepTime);
        Log.TraceMsg("SleepPeriod: " + SleepPeriod + " seconds");
        Log.TraceMsg("Sleep State: S" + this.SleepState);
                
        // Set sleep and wake info
        this.Console.SetSleepStateInfoEx(SleepPeriod, this.SleepState);
  
  
        if(!this.Console.EnableAutoWakeIfPossible())
        {
          Log.TraceErr(-1, "Automatic wakeup is not supported for this sleep state.");
        }
        else
        {
          try
          {
            // Go to sleep
            this.Console.SetSleepState();
            
            // Now awake!
            
            var AwakeTime = new Date();
            Log.TraceMsg("Awake: " + AwakeTime);
          }
          catch(e)
          {
            Log.TraceExcept(e, "SetSleepState() failed!");
          }
        }
        
        // Reset the idle timers, to make sure the system doesn't just go back to sleep.
        this.Console.SimulateUserKeyPress();

        // Get the next sleep state for the next round
        this.SleepState = this.Console.GetNextSleepState();
      }
      catch(e)
      {
         throw new Error(e.number, "DoSleepCycle() -> " + e.description);
      }
    }
}



//----------------------------------------------------------------------------
//  This is a JScript function that helps argument parsing.
//
// Remarks:
//   It checks that the argument exists and that the argument is not just the
// empty string ("").
//----------------------------------------------------------------------------
function ArgExists(NamedArg)
{
  try
  {
    if(WScript.Arguments.Named.Exists(NamedArg))
    {
      if(WScript.Arguments.Named(NamedArg) != "")
      {
        return true;
      }
    }
    return false;
  }
  catch(e)
  {
    throw new Error(e.number, "ArgExists() -> " + e.description);
  }
}

//----------------------------------------------------------------------------
//  This is a JScript function that helps integer argument parsing.
//
// Remarks:
//   First, it checks that the argument exists and that the argument is not just the
// empty string (""). Then it checks that the argument is an integer. Finally,
// it returns the value.
//----------------------------------------------------------------------------
function IntegerFromArg(NamedArg, DefaultValue)
{
  try
  {
    if(ArgExists(NamedArg))
    {
      var res = parseInt(WScript.Arguments.Named(NamedArg));
      if(!isNaN(res))
      {
        return res;
      }
    }
    return DefaultValue;
  }
  catch(e)
  {
    throw new Error(e.number, "IntegerFromArg() -> " + e.description);
  }
}

//----------------------------------------------------------------------------
//  This is a JScript function that helps floating point argument parsing.
//
// Remarks:
//   First, it checks that the argument exists and that the argument is not just the
// empty string (""). Then it checks that the argument is an integer. Finally,
// it returns the value.
//----------------------------------------------------------------------------
function FloatFromArg(NamedArg, DefaultValue)
{
  try
  {
    if(ArgExists(NamedArg))
    {
      var res = parseFloat(WScript.Arguments.Named(NamedArg));
      if(!isNaN(res))
      {
        return res;
      }
    }
    return DefaultValue;
  }
  catch(e)
  {
    throw new Error(e.number, "FloatFromArg() -> " + e.description);
  }
}


//----------------------------------------------------------------------------
//  This is a JScript wrapper around the WTTLogger. It makes hierarchical logs
// simple to output.
//
// Remarks:
//   Each level of StartTest/EndTest uses a unique 'TUID' that is built up by
// appending a 'Suffix' when StartTest is called (EndTest takes this
// suffix back off. Additionally, this class keeps track of the Assertions
// being made at each level of TestCase.
//----------------------------------------------------------------------------
function JScript_WTTLogger(InitStr)
{
  try
  {
    function TestCase(Parent, Suffix, Assertion)
    {
      // Pointer to the parent test case in the linked list
      this.Parent = Parent;
      
      if(Suffix == "WTTLOG")
      {
        // This is THE root test case, it has no Name
        this.TUID = Suffix;
      }
      else if(Suffix == "" || Suffix == "_")
      {
        // This is a root level test case, the full TUID is just the Suffix
        this.TUID = Suffix;

        this.Name = Assertion;
      }
      else if(Parent.Parent.Parent == null)
      {
        // This is a first-level test case
        this.TUID = Suffix;

        this.Name = this.TUID + " - " + Assertion;
      }
      else
      {
        // All other lower-level test cases.
        this.TUID = Parent.TUID + "." + Suffix;

        this.Name = this.TUID + " - " + Assertion;
      }
 
      this.Suffix = Suffix;

      // Has this testcase failed?
      this.Failed = false;
      
    }
    

    // Set to 'true' in order to cause a DebugBreak to occur whenever an
    // error is traced to the log.
    this.BreakOnError = false;  
   
    // WTT Log Constants and helper functions
    var LVL_MSG = 268435456;
    var LVL_ERR = 16777216;
    var LVL_ROLLUP = 16;

    var WTT_TESTCASE_RESULT_PASS = 1;
    var WTT_TESTCASE_RESULT_FAIL = 2;

    try
    {
      var L = new ActiveXObject("WTTLogger.Logger");
      var hLog = L.CreateLogDevice(InitStr);
      L.TraceMachineInfo("", hLog);
    }
    catch(e)
    {
      WScript.Echo("***************************************************");
      WScript.Echo("* WTT Logger unavailable! Please reinstall WDTF.  *");
      WScript.Echo("*                                                 *");
      WScript.Echo("*   press ctrl-c to end this script.              *");
      WScript.Echo("***************************************************");
      WScript.Echo("Description: " + e.description);
      WScript.Echo("Name: " + e.name);
      WScript.Echo("Number: 0x" + e.number.toString(16));
      WScript.Sleep(1000*60*60*24*7); // Sleep for 7 days
      WScript.Quit(2);
    }

    // Create THE root test case
    var m_CurrentTestCase = new TestCase(null, "WTTLOG", "");
    
    var m_TraceEnabled = false;
    
  }
  catch(e)
  {
    throw new Error(e.number, "JScript_WTTLogger() -> " + e.description);
  }

  this.TestCases = new Object();
  
  this.TestCases.RootCommonScenarioStress =
    "Devices and the System as a whole must continue to function before and after Sleep/PnP Cycles. " +
    "{ADCBD180-16E8-11DB-B50B-0010C65AFEB5}";
    
  this.TestCases.CommonScenarioStressCycle =
    "The device and system must pass this cycle of Common Scenario Stress. " +
    "{ADCBD181-16E8-11DB-B50B-0010C65AFEB5}";
    
    
  this.TestCases.RootDisableEnable = 
    "Devices and the System as a whole must continue to function before and after Disable/Enable Cycles. " +
    "{ADCBD190-16E8-11DB-B50B-0010C65AFEB5}";
    
  this.TestCases.RootReinstall = 
    "DEVFUND-0030 + DEVFUND-0007 - The Device must continue to function after Remove/Reinstall Cycles without restarting the system. " +
    "{ADCBD191-16E8-11DB-B50B-0010C65AFEB5}";
    
    
  this.TestCases.RootSleepStress = 
    "Devices and the System as a whole must continue to function before and after Sleep Cycles. " +
    "{ADCBD1A0-16E8-11DB-B50B-0010C65AFEB5}";
    
  this.TestCases.SleepStressCycle = 
    "The device and system must pass this cycle of Sleep Stress with IO. " +
    "{ADCBD1A1-16E8-11DB-B50B-0010C65AFEB5}";
    
    
  this.TestCases.StartSimpleIOStress =
    "If a SimpleIOStress implementation is found for a device, it must Start running IO without failing. " +
    "{ADCBD1E0-16E8-11DB-B50B-0010C65AFEB5}";

  this.TestCases.PauseSimpleIOStress = 
    "The device must pass SimpleIOStress functionality tests. " +
    "{ADCBD1E1-16E8-11DB-B50B-0010C65AFEB5}";
    
  this.TestCases.StopSimpleIOStress =  
    "The device must pass SimpleIOStress functionality tests and then must properly close when the SimpleIOStress is stopped. " +
    "{ADCBD1E2-16E8-11DB-B50B-0010C65AFEB5}";
    
    
  this.TestCases.DoSleepCycle =        
    "The device and system must go to sleep fully and then wake automatically. " +
    "{ADCBD1E6-16E8-11DB-B50B-0010C65AFEB5}";
    
    
  this.TestCases.DoDisableEnable =     
    "The device must respond to a disable request followed by an enable request. " +
    "{ADCBD1E7-16E8-11DB-B50B-0010C65AFEB5}";
    
    
  this.TestCases.DoCheckStatus =       
    "The device's Problem Codes (if any) and its Status should not change throughout this test. " +
    "{ADCBD1E8-16E8-11DB-B50B-0010C65AFEB5}";
    
  this.TestCases.DoReinstall =     
    "DEVFUND-0030 - Driver re-installation must be completed without any error. " +
    "{ADCBD200-16E8-11DB-B50B-0010C65AFEB5}";
    
  this.TestCases.DoRemoveAndRescan =     
    "DEVFUND-0030 - Driver un-installation and installation must be completed without any error. DEVFUND-0007 - Device is functional without restarting the system." +
    "{ADCBD201-16E8-11DB-B50B-0010C65AFEB5}";
    
    
  this.TestCases.ScriptError =         
    "A script error occured! " +
    "{ADCBD1F0-16E8-11DB-B50B-0010C65AFEB5}";
    
    
  //----------------------------------------------------------------------------
  //  Returns the current TestCase TUID
  //----------------------------------------------------------------------------
  this.GetTestCaseTUID = function()
  {
    return m_CurrentTestCase.TUID;
  }

  //----------------------------------------------------------------------------
  //  Returns true if the current TestCase has failed
  //----------------------------------------------------------------------------
  this.GetTestCaseFailed = function()
  {
    return m_CurrentTestCase.Failed;
  }
  
  
  //----------------------------------------------------------------------------
  //  This method starts a new test case.
  //
  // Remarks:
  //   Calling this method twice in a row creates a hierarchical test case tree.
  // Any failures in a lower test case will be rolled up to the containing test
  // case.
  //
  // Parameters:
  //   Suffix       This suffix is added to the TUID of the new test case defined
  //                by this method call. The individual Suffix's are separated
  //                by a '.' character.
  //
  //   Assertion    The assertion being made by this test case. This is meant to
  //                force assertion based testing.
  //----------------------------------------------------------------------------
  this.StartTest = function(Suffix, Assertion)
  {
    try
    {
      var test = new TestCase(m_CurrentTestCase, Suffix, Assertion);

      L.StartTest(test.Name, hLog);
      
      // Replace the parent test case with the new current test case
      m_CurrentTestCase = test;
      
      m_TraceEnabled = true;
    }
    catch(e)
    {
      throw new Error(e.number, "StartTest(\"" + Suffix + "\", \"" + Assertion + "\") -> " + e.description);
    }
  }
  
  
  //----------------------------------------------------------------------------
  //  This method ends a test case and rolls up results to the next higher test
  // case in the tree of test cases.
  //
  // Remarks:
  //   The assertion for the test case being ended is recalled for you. Note, that
  // due to a limitation in WTTLogger, you cannot call Trace*(...) immediately
  // after EndTest(...), you must have a call to StartTest(...) again before
  // traces are possible.
  //
  // Parameters:
  //   Suffix       The suffix of the test case you'd like to end. This suffix 
  //                is used to double check that your StartTest/EndTest are
  //                correctly nested.
  //----------------------------------------------------------------------------
  this.EndTest = function(Suffix)
  {
    try
    {
      var parentTest = m_CurrentTestCase.Parent;
      var test = m_CurrentTestCase;

      if(test.Suffix != Suffix)
      {
        throw new Error(-1, "Test has a bug in logging, StartTest/EndTest are improperly nested. TUID=\"" + test.TUID + "\" parentTUID=\"" + parentTest.TUID + "\"");
      }

      if(this.Failed)
      {
        L.EndTest(test.Name, WTT_TESTCASE_RESULT_FAIL, "", hLog);
      }
      else
      {
        L.EndTest(test.Name, WTT_TESTCASE_RESULT_PASS, "", hLog);
      }
      
      
      // Set the current test case to the parent test case
      m_CurrentTestCase = parentTest;
      
      m_TraceEnabled = false;
    }  
    catch(e)
    {
      throw new Error(e.number, "EndTest(\"" + Suffix + "\") -> " + e.description);
    }
  }
  
  
  //----------------------------------------------------------------------------
  //  This method ends all test cases up to a certain level. Each level's results 
  // are rolled up to the next higher level test case in the tree of test cases.
  //
  // Remarks:
  //   The assertions and TUIDs for the intermediate test cases being ended are
  // recalled for you. This method is mostly useful in catastrophic error cases,
  // where a whole tree of test cases needs to be ended mid-run and rolled up.
  //
  //  The Suffix parameter is used to identify the test case level at which you'd 
  // like to stop rolling up. 
  // 
  //  Eg: If this method is called with Suffix="A" while running test case "I.A.3.b".
  //      The method will effectivly call EndTest("b"), EndTest("3"), and finally
  //      EndTest("A"). You'll be left still in TestCase "I".
  //
  // Parameters:
  //   Suffix       The suffix of the test case you'd like to end.
  //                
  //----------------------------------------------------------------------------
  this.EndTests = function(Suffix)
  {
    try
    {
      var test = m_CurrentTestCase;
  
      while(true)
      {
        if(test.Suffix == "WTTLOG")
        {
          throw new Error(-1, "Test has a bug in logging, StartTest/EndTests are improperly nested.");
        }

        this.EndTest(test.Suffix);

        if(test.Suffix == Suffix)
        {
          break;
        }

        test = test.Parent;
      }
    }  
    catch(e)
    {
      throw new Error(e.number, "EndTests(\"" + Suffix + "\") -> " + e.description);
    }
  }

  
  //----------------------------------------------------------------------------
  //  This method traces a message to the current test case. 
  //
  // Remarks:
  //   Messages are merely for informational purposes.
  //
  // Parameters:
  //   Msg       The message to trace.
  //                
  //----------------------------------------------------------------------------
  this.TraceMsg = function(Msg)
  {
    try
    {
      if(!m_TraceEnabled)
      {
        throw new Error(-1, "Test has a bug in logging, attempting to trace outside of a test case. Call StartTest(...) first.");
      }
    
      L.Trace(LVL_MSG, hLog, Msg);
    }  
    catch(e)
    {
      throw new Error(e.number, "TraceMsg(\"" + Msg + "\") -> " + e.description);
    }
  }


  //----------------------------------------------------------------------------
  //  This method traces an error to the current test case.
  //
  // Remarks:
  //   Errors cause the test case (and all parent test cases) to fail.
  //
  // Parameters:
  //   Msg       The message to trace.
  //                
  //----------------------------------------------------------------------------
  this.TraceErr = function(Number, Msg)
  {
    try
    {
      if(!m_TraceEnabled)
      {
        throw new Error(-1, "Test has a bug in logging, attempting to trace outside of a test case. Call StartTest(...) first.");
      }

      // Rollup failures to all ancestor test cases
      var test = m_CurrentTestCase;
      while(test != null)
      {
        test.Failed = true;
        test = test.Parent;
      }
      
      L.Trace(LVL_ERR, hLog, parseInt(Number), 1, ".", 0, Msg);

      if(this.BreakOnError)
      {
        Console.DebugBreak(Msg);
      }

    }  
    catch(e)
    {
      throw new Error(e.number, "TraceErr(" + Number + ", \"" + Msg + "\") -> " + e.description);
    }
  }
  
  
  //----------------------------------------------------------------------------
  //  This method traces an error to the current test case by using an exception object.
  //
  // Remarks:
  //   Errors cause the test case (and all parent test cases) to fail.
  //
  // Parameters:
  //   Msg       The message to trace.
  //                
  //----------------------------------------------------------------------------
  this.TraceExcept = function(Except, Msg)
  {
    try
    {
      this.TraceErr(Except.number, Msg + " -> " + Except.description);
    }  
    catch(e)
    {
      throw new Error(e.number, "TraceExcept(" + Except + ", \"" + Msg + "\") -> " + e.description);
    }
  }
  
  
  //----------------------------------------------------------------------------
  //  This method closes the log file at the end of a test.
  //
  // Remarks:
  //   This logger object can no longer be used to log after this method is called.
  // This method will return "1" if the test failed, and "0" otherwise.
  // 
  //----------------------------------------------------------------------------
  this.Close = function()
  {
    try
    {
      if(m_CurrentTestCase.Suffix != "WTTLOG")
      {
        throw new Error(-1, "Test has a bug in logging, attempting to Close without ending all test cases. Call EndTest(...)/EndTests(...) first.");
      }
      
      L.Trace(LVL_ROLLUP, hLog, 0, 0, 0, 0, 0);
      L.CloseLogDevice(0, hLog);
      
      L = undefined;
      hLog = undefined;
      
      // The return value is used to indicate what the exit status of the
      // test as a whole should be. If the test failed, the exit status is 1.
      // If the test passes, the exit status will be 0.
      return m_CurrentTestCase.failed ? 1 : 0;
    }
    catch(e)
    {
      throw new Error(e.number, "Close() -> " + e.description);
    }
  }

}

function RunProgram(CommandLine)
{
  var WshShell = WScript.CreateObject("WScript.Shell");

  var exec = WshShell.Exec(CommandLine);
  while(exec.Status == 0)
  {
    WScript.Sleep(100);
  }
  if(exec.ExitCode != 0)
  {
    throw new Error(exec.ExitCode, "Failed to run command line: '" + CommandLine + "'");
  }
}

String.prototype.padLeft =
function(TotalLength, PadChar)
{
  if((PadChar == undefined) || (PadChar == null) || (PadChar == ""))
  {
    PadChar = " ";
  }

  var RetVal = this;

  while(RetVal.length < TotalLength)
  {
    RetVal = PadChar.concat(RetVal);
  }

  return RetVal;
}

Number.prototype.padLeft =
function(TotalLength, Radix)
{
  if(Radix == null || Radix == undefined)
  {
    Radix = 10;
  }
  
  return this.toString(Radix).padLeft(TotalLength, "0");
}

//----------------------------------------------------------------------------
// This class assists in retrieving AppVerifier logs for CScript.exe and 
// DrvInst.exe
//----------------------------------------------------------------------------
function JScript_AppVerifier(bFailOnError)
{
  var WshShell = WScript.CreateObject("WScript.Shell");
  var Environment = WshShell.Environment("Process");
  
  var UserDrvInstLogDir = Environment("USERPROFILE") + "\\AppVerifierLogs";
  var SystemDrvInstLogs = Environment("WINDIR") + "\\system32\\config\\systemprofile\\AppVerifierLogs\\DrvInst*.*";
  
  try
  {
    RunProgram("appverif.exe -stamp log -for CScript.exe -with Stamp=Start");
  }
  catch(e)
  {
    throw new Error(e.number, "AppVerifier must be enabled on CScript.exe and DrvInst.exe");
  }

  //----------------------------------------------------------------------------
  // Clear the current AppVerifier logs for DrvInst.exe and stamp the log for
  // CScript.exe.
  // Ignores failures.
  //----------------------------------------------------------------------------
  this.ClearLog = function()
  {
    try
    {
      try
      {
        RunProgram("appverif.exe -stamp log -for CScript.exe -with Stamp=" + Log.GetTestCaseTUID());
      }
      catch(e) { }
      
      // Clear all the DrvInst AppVerifier logs
      try
      {
        fso.DeleteFile(UserDrvInstLogDir + "\\DrvInst*.*");
      }
      catch(e) { }
    }
    catch(e)
    {
      throw new Error(e.number, "ClearLog() -> " + e.description);
    }
  }

  function SnapLog_Internal(TempLogName, Name)
  {
    var WarnLogName = Name + ".AppVerif_WARNING_" + Log.GetTestCaseTUID() + ".xml";
    var FailLogName = Name + ".AppVerif_FAILED_" + Log.GetTestCaseTUID() + ".xml";
    var PassLogName = Name + ".AppVerif_passed_" + Log.GetTestCaseTUID() + ".xml";

    var LogName = PassLogName;

    try
    {
      var xmlDoc = new ActiveXObject("Msxml2.DOMDocument.6.0");
      xmlDoc.setProperty("SelectionNamespaces", "xmlns:avrf='Application Verifier'");

      xmlDoc.async = false;
      xmlDoc.load(TempLogName);
      if(xmlDoc.parseError.errorCode != 0)
      {
        var err = xmlDoc.parseError;

        throw new Error(err.errorCode, err.reason);
      }

      if(xmlDoc.selectNodes("avrf:logfile/avrf:logSession/avrf:logEntry[@Severity='Error']").length > 0)
      {
        var LogName = FailLogName;
        Log.TraceMsg("ERROR: The Application Verifier found one or more ERRORS in the " + Name + ".exe " +
                     "process. Please see the " + LogName + " log for more details.");
      }
      else if(xmlDoc.selectNodes("avrf:logfile/avrf:logSession/avrf:logEntry[@Severity='Warning']").length > 0)
      {
        var LogName = WarnLogName;
        Log.TraceMsg("WARNING: The Application Verifier found one or more WARNINGS in the " + Name + ".exe " +
                     "process. Please see the " + LogName + " log for more details.");
      }

      // Move the temp log to it's final name
      fso.MoveFile(TempLogName, LogName);

      // loop through all Errors and Warnings
      var Nodes = xmlDoc.selectNodes("avrf:logfile/avrf:logSession/avrf:logEntry[@Severity='Error' or @Severity='Warning']");

      for (var i = 0; i < Nodes.length; i++)
      {
        var Node = Nodes.item(i);
        
        Log.TraceMsg("LogEntry StopCode: " + Node.getAttribute("StopCode"));
        Log.TraceMsg("LayerName: " + Node.getAttribute("LayerName"));
        Log.TraceMsg("Message: " + Node.selectSingleNode("avrf:message").text);

        var FormatMessageNode = Node.selectSingleNode("avrf:formatmessage");
        if (FormatMessageNode != null)
        {
          Log.TraceMsg("FormatMessage: " + FormatMessageNode.text);
        }

        if(Node.getAttribute("Severity") == "Error" && bFailOnError)
        {
          Log.TraceErr(Node.getAttribute("StopCode"),
                       "The above Application Verifier StopCode has Severity: " + Node.getAttribute("Severity"));
        }
        else
        {
          Log.TraceMsg("The above Application Verifier StopCode has Severity: " + Node.getAttribute("Severity"));
        }
      }
      
    }
    catch(e)
    {
      throw new Error(e.number, "SnapLog_Internal() -> " + e.description);
    }
  }

  //----------------------------------------------------------------------------
  // Export the current AppVerifier logs for CScript.exe and DrvInst.exe.
  //----------------------------------------------------------------------------
  this.SnapLog = function()
  {
    try
    {
      var Name;
      var TempLogSuffix = ".AppVerif.xml";
      
      // Snap the CScript log
      Name = "CScript";

      RunProgram("appverif.exe -export log -for " + Name + ".exe -with " +
                 "To=" + Name + TempLogSuffix + " StampFrom=" + Log.GetTestCaseTUID());
      
      SnapLog_Internal(Name + TempLogSuffix, Name);

      // Snap the DrvInst log
      Name = "DrvInst";
      
      fso.MoveFile(SystemDrvInstLogs, UserDrvInstLogDir);

      try
      {
        RunProgram("appverif.exe -export log -for " + Name + ".exe -with " +
                   "To=" + Name + TempLogSuffix);
      
        SnapLog_Internal(Name + TempLogSuffix, Name);
      }
      catch(e)
      {
        // Ignore errors to snap this log
      }
    }
    catch(e)
    {
      throw new Error(e.number, "SnapLog() -> " + e.description);
    }
  }
}
