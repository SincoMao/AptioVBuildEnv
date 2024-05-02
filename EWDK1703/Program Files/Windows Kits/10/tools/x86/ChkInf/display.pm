# (C) Copyright 1999-2003 Microsoft Corporation

package DISPLAY;

use strict;                # Keep the code clean
no strict 'refs';          # no strict references

sub FALSE { return(0); }     # Utility subs
sub TRUE  { return(1); }

#---------------------------------------------------#
# Module level variables
#---------------------------------------------------#
my $Version  = "5.1.2250.0"; # Version of this file
my $DEBUG    = 0;            # Set to 1 for debugging output

my $Current_INF_File;       # Stores name of the current INF file.
my $Current_HTM_File;       # Name of the output file to use.

my @Device_Class_Options;   # Array to store device specific options.

my $Models = {};            # Hash for all models, keyed on models-section-name[.TargetOS]
my $ManufacturerPrefix;     # Value of the manufacturer defined prefix for model sections.

my $OverriddenOsVersion = undef; # Allows a user to override the OS version for this execution time.
my $Current_INF_HighestOsVersion = 0.0; # Keep track of the highest OS version this INF is written for.
my $Current_INF_HighestMinBuild = 0; # Keep track of the highest minbuild this INF is written for.

my %DisplayErrorTable  = (
   6001 => ["Directive %s invalid in this section."],
   6002 => ["%s takes a single numeric parameter."],
   6003 => ["The only values %s allows are 0 and 1."],
   6004 => ["Applet extensions should be installed to HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Controls Folder\\Display."],
   6005 => [" Section %s does not contain InstalledDisplayDrivers directive."],
   6006 => [" CapablilityOverride should contain value of 0x8 but contains value %s"],
   6007 =>["UseXPModel should not be set"],
   6008 =>["UseVSConverter should not be set"],
   6009 =>["UsePSConverter should not be set"],
   6010 =>["CapabilityOverride is not defined."],
   6011 =>["%s should not be greater than 16"],
   6012 =>["StartType value should be set as 3 (SERVICE_DEMAND_START) for Vista display adapter inf's"],
   6013 =>["Device name used here (%s) should be updated. For Vista inbox display inf's: %s needs to be appended to the Device Name"],
   6014 =>["FeatureScore Directive's value should be F8 for inbox WDDM drivers"],
   6015 =>["Install section should have FeatureScore Directive"],
   6016 =>["Copy Flags value (0x00004000 or 0x00004020) or Destination of DIRID_DRIVER_STORE should be specified for WDDM user mode binaries. Neither should be specified for XDDM user mode binaries."],
   6017 =>["Inbox display INF's should not reference LayoutFile "],
   6018 =>["Inbox display INF's should not reference CatalogFile"],
   6019 =>["All inbox Vista inf's should have '3426=windows cd' entry in SourceDisksNames"],
   6020 =>["All inbox Vista inf's should use 3426 entry in SourceDisksFiles"],
   6023 =>["CapabilityOverride directive is only applicable for XDDM inf's"],
   6024 =>["FeatureScore Directive's value should be FD for inbox XDDM drivers"],
   6025 =>["FeatureScore Directive's value should be FC for 3rd party XDDM drivers"],
   6026 =>["FeatureScore Directive's value should be F6, E6, E0 or DA for 3rd party WDDM drivers"],
   6027 =>["Inbox Vista inf's date for DriverVer in Version section should not be greater than 08\\21\\2006"],
   6028 =>["Running on Pre Vista OS, should not have Feature Score directive"],
   6029 =>["Running on Vista or later, should have Feature Score directive"],
   6030 =>["FeatureScore Directive's value is unrecognized"],
   6031 =>["FeatureScore information does not match inf type - Expected WDDM FS, got XDDM"],
   6032 =>["FeatureScore information does not match inf type - Expected XDDM FS, got WDDM"],
   6033 =>["No install section name defined for this device"],
   6034 =>["No hardware ID defined for this device"],
   6035 =>["Hardware ID '%s' is already claimed by the install section labeled '%s'"],
   6036 =>["File may not claim to provide a driver for the default display device IDs"],
   6037 =>["All FeatureScore values must be the same per inf. '%s' previously seen"],
   6038 =>["FeatureScore information does not match the minimum requirement, for the targeted OS version:'%s'."],
   6039 =>["Driver must implement run from driver store capability."],
   6040 =>["Driver version does not match required versioning scheme."],
   6041 =>["Driver specifies driver store paths on downlevel unsupported section."]
   );

#This table defines OS versions that have strict featurescore requirements.
#When an OS version is in this table the feature score has to match an entry
#in the set.
my %TargetExpectedFeatureScore = (
    '10.0' => {'fscore' => ['D1','D4','D7']},
    '6.3' => {'fscore' => ['DA','DD']},
    '6.2' => {'fscore' => ['DA','DD','E0','FB','E6','EC','F4','F6','F8','FC','FD','FE','FF']}
    );

my %FeatureScoreTable = (
   'D1' => {'type' => 'WDDM', 'ver'  => 2,      'from' => 'WHQL' },
   'D4' => {'type' => 'WDDM', 'ver'  => 2,      'from' => 'WHQL' },
   'D7' => {'type' => 'WDDM', 'ver'  => 2,      'from' => 'WHQL' },
   'DC' => {'type' => 'WDDM', 'ver'  => 2,      'from' => 'Inbox' },
   'DA' => {'type' => 'WDDM', 'ver'  => 1.3,      'from' => 'WHQL' },
   'DD' => {'type' => 'WDDM', 'ver'  => 1.3,      'from' => 'Inbox' },
   'E0' => {'type' => 'WDDM', 'ver'  => 1.2,      'from' => 'WHQL' },
   'FB' => {'type' => 'MSBDD', 'ver'  => 1.2,      'from' => 'Inbox' },
   'E6' => {'type' => 'WDDM', 'ver'  => 1.1,    'from' => 'WHQL' },
   'EC' => {'type' => 'WDDM', 'ver'  => 1.1,    'from' => 'Inbox' },
   'F4' => {'type' => 'WDDM', 'ver'  => 1,      'from' => 'Inbox' },
   'F6' => {'type' => 'WDDM', 'ver'  => 1,      'from' => 'WHQL' },
   'F8' => {'type' => 'WDDM', 'ver'  => 1,      'from' => 'Inbox' },
   'FC' => {'type' => 'XDDM', 'ver'  => undef,  'from' =>  'third party' },
   'FD' => {'type' => 'XDDM', 'ver'  => undef,  'from' => 'Inbox' },
   'FE' => {'type' => 'VGA',  'ver'  => undef,  'from' => undef },
   'FF' => {'type' => 'Default or No Score' , 'ver'  => undef, 'from' => undef }
   );

my %DisplayWarningTable =(
   6101 => ["Client SKU (0x00000001) required for MS Inbox drivers"],
   6102 => ["64 bit decoration (.NTamd64) is necessary to install driver on x64 systems"]
   );

# This table tracks the allowable driver version numbers (in format of AA.BB.CCCC.DDDD)
my %DriverVersionTable = (
    '10.0' => {'AAfield' => ['22','21','20'],  'BBfield' => ['21','20','19','18','17','16','15','14']}
    );

#Variable indicating the OS version
my %OSVer = ('Maj'=> undef, 'Min' => undef);

#Define DIRID values
my $DirIdSystem32 = 11;
my $DirIdSysWoW64 = 10;
my $DirIdDriverStore = 13;

# Determine if this is a WDDM or XDDM inf
my $IsWDDMInf;

# Determine if this may be a display only driver by it not having any UMD file copies
my $FoundDllFilesToCopy;

# Store a "seen" feature score. Only one feature score is allowed per inf
my $SeenFeatureScore = "";
my $SeenFeatureScoreFrom = "";

# TH2 release version
my $TH2ver = 10586;

#---------------------------------------------------#
# Routine for checking device class specific
# directives that occur in common sections verified
# by ChkINF.  Return 0 if directive is unknown or
# 1 if the directive is known (you should also verify
# it and write any appropriate warnings/errors.
#---------------------------------------------------#
sub DCDirective
{
   return(0); # return 1 on success
}

#-------------------------------------------------------------------------------------------------#
# Main Entry Point to Device Specific Module. REQUIRED!                                           #
#-- InfCheck() -----------------------------------------------------------------------------------#
sub InfCheck
{
   my($Item);
   my $Section;
   my $SkipUndecorated = 0;


   print(STDERR "\tInvoking Display::InfCheck...\n") if ($DEBUG);
   
   # Reset variables used to track file state
   $IsWDDMInf = 0;
   $FoundDllFilesToCopy = 0;
   %OSVer = ('Maj'=> undef, 'Min' => undef);
   $Models = {};            # Hash for all models, keyed on models-section-name[.TargetOS]

   # Parse the OS version and store in %OSVer
   GetOSVersion();

   # Populate a list of all models found in the INF
   LearnModels();

   if ( $Current_INF_File->sectionDefined("GeneralConfigData") )
   {
      # We should work with this && .NTALPHA if exists
      VerifyGCData("GeneralConfigData");
   }

   
   ChkUserModeDllFlag(); # Checks copy flag and sets the $IsWDDMInf and $FoundDllFilesToCopy flags

   # Check setting based on model-specific information
   CheckAllModels();
   ChkInstalledDisplayDriver(); #check to see if InstalledDisplayDriver exists (both XDDM/WDDM)
   ChkRegKeys(); #verifies debug related registry keys are not set (both XDDM/WDDM)
   ChkCapabilityOverride(); #check to see if CapabilityOverride exists (only XDDM)
   ChkDriverVersion();

   #Tests for inbox display INF's
   if(ChkInf::GetGlobalValue("MS_INTERNAL"))
   {
      #ChkDeviceNamingScheme(); # Checks the device naming scheme on Vista (both XDDM/LDDM)
      ChkVersionSection();
      ChkSourceDisksNames();
      ChkSourceDisksFiles();
   }
}

#---------------------------------------------------#
#Verifies the driver does not set following registry keys:
#HKLM\CurrentControlSet\Control\GraphicsDrivers\UseXPModel
#HKLM\Software\Microsoft\Direct3D\UseVSConverter
#HKLM\Software\Microsoft\Direct3D\UsePSConverter
#---------------------------------------------------#

sub ChkRegKeys
{
   my %sections = $Current_INF_File->getSections();
   my $section;
   my $count=0;
   my @lines;
   my $line;
   my($RegRoot, $SubKey, $Name, $Flags, $Value);

   print(STDERR "\tInvoking Display::ChkRegKeys...\n") if ($DEBUG);

   foreach $section (%sections)
   {
      $count = 0;

      next if !$section; # Skip blank sections
      @lines = $Current_INF_File->getSection($section);
      foreach $line (@lines)
      {
         $count++ , next if ($line =~ /^\s*$/); # Skip if it's a blank line

         ($RegRoot, $SubKey, $Name, $Flags, $Value) = ChkInf::GetList($line,$Current_INF_File->getIndex($section ,$count));

         if ((uc $RegRoot eq "HKLM")&& ($SubKey =~ /SYSTEM\\CurrentControlSet\\Control\\GraphicsDrivers/i) && ($Name eq "UseXPModel"))
         {
            if($Value == 1)
            {
               AddDisplayError(6007, $Current_INF_File->getIndex($section ,$count),$section );
            }
         }

         if ((uc $RegRoot eq "HKLM")&& ($SubKey =~ /Software\\Microsoft\\Direct3D/i))
         {
            if(($Name eq "UseVSConverter")&&($Value == 1))
            {
               AddDisplayError(6008, $Current_INF_File->getIndex($section ,$count),$section );
            }
            if(($Name eq "UsePSConverter")&&($Value == 1))
            {
               AddDisplayError(6009, $Current_INF_File->getIndex($section,$count),$section );
            }
         }
         $count++;
      }
   }
}

#---------------------------------------------------#
# Verifies that the module contains a "CapabilityOverride"
# directive in each SoftwareDeviceSettings section.
#---------------------------------------------------#
sub ChkCapabilityOverride
{

   my %sections = $Current_INF_File->getSections();
   my $LastValidSection;
   my $section;
   my $count = 0;
   my $find = 0;
   my @lines;
   my $line;
   my ($RegRoot, $SubKey, $Name, $Flags, $Value);
   
   print(STDERR "\tInvoking Display::ChkCapabilityOverride...\n") if ($DEBUG);

   foreach $section (%sections)
   {
      next if($section !~ /SoftwareDeviceSettings/i);
      $LastValidSection = $section;
      $count = 0;
      $find = 0;
      @lines = $Current_INF_File->getSection($section);
      foreach $line (@lines)
      {
         $count++ , next if ($line =~ /^\s*$/); # Skip if it's a blank line

         if($line =~ /CapabilityOverride/i)
         {
            $find++;
            if($IsWDDMInf)
            {
               #This directive is only applicable in XDDM
               AddDisplayError(6023, $Current_INF_File->getIndex($section,$count),$Value);
            }
            elsif(ChkInf::GetGlobalValue("MS_INTERNAL"))
            {
               ($RegRoot, $SubKey, $Name, $Flags, $Value) = ChkInf::GetList($line,$Current_INF_File->getIndex($section ,$count));
               if(($Value ne "0x8") && ($Value != 8))
               {
                  AddDisplayError(6006, $Current_INF_File->getIndex($section,$count),$Value);
               }
            }
         }
         $count++;
      }

      if(($find == 0) && (!$IsWDDMInf) && (ChkInf::GetGlobalValue("MS_INTERNAL")))
      {
         AddDisplayError(6010, $Current_INF_File->getIndex($LastValidSection,$count-2));
      }
   }
}

#---------------------------------------------------#
# Verifies that RS drivers support run from driver store.
# Also verifies that downlevel sections in these drivers
# do not incorrectly attempt to use this feature.
#---------------------------------------------------#
sub ChkDriverStoreSupport
{
   # For each listed install section, locate the [Section.Services] key
   #   For each AddService, locate the service install section name
   #   For each section, verify ServiceBinary references $DirIdDriverStore ("%13%")
   # For each listed section, check the AddReg keys
   #   Verify UserModeDriverName and UserModeDriverNameWoW, if present, references $DirIdDriverStore ("%13%")

   # Check KMD paths

   my $section = "$_[0].Services";
   my $sectionMinBuild = $_[1] + 0;
   my $count = 0;

   return unless $Current_INF_File->sectionDefined($section);
   foreach my $line ($Current_INF_File->getSection($section))
   {
      $count++ , next if ($line =~ /^\s*$/); # Skip if it's a blank line

      if($line =~ /AddService/i)
      {
         # AddService=ServiceName,[flags],service-install-section[,event-log-install-section[,[EventLogType][,EventName]]]
         my($ServiceName, $Flags, $SISec, $ELSec, $ELType, $EName) =
            ChkInf::GetList($line,$Current_INF_File->getIndex($section,$count));

        $count++ , next if ($SISec =~ /^\s*$/);  # Skip if it's a blank line
        $count++ , next unless ($Current_INF_File->sectionDefined($SISec)); # Skip if section doesn't exist
        my $SIcount = 0;

        foreach my $SIline ($Current_INF_File->getSection($SISec))
        {
           $SIcount++ , next if ($SIline =~ /^\s*$/); # Skip if it's a blank line
           
           if ($sectionMinBuild > $TH2ver)
           {
              # Verify run from driver store is implemented
              if($SIline =~ /ServiceBinary/i && $SIline !~ /%$DirIdDriverStore%/i)
              {
                 AddDisplayError(6039, $Current_INF_File->getIndex($SISec,$SIcount));
              }
           }
           else
           {
              # Verify run from driver store is NOT specified
              if($SIline =~ /ServiceBinary/i && $SIline =~ /%$DirIdDriverStore%/i)
              {
                 AddDisplayError(6041, $Current_INF_File->getIndex($SISec,$SIcount));
              }
           }
           
           $SIcount++;
        }
      }

      $count++;
   } 

   # Check UMD paths

   $section = "$_[0]";
   $count = 0;

   return unless $Current_INF_File->sectionDefined($section);
   foreach my $line ($Current_INF_File->getSection($section))
   {
      $count++ , next if ($line =~ /^\s*$/); # Skip if it's a blank line

      my ($Directive,$SectionValue) = ChkInf::SplitLine($section,$count,$line);

      if($Directive =~ /AddReg/i)
      {
         $count++ , next unless ($Current_INF_File->sectionDefined($SectionValue)); # Skip if section doesn't exist

         my $SectionCount = 0;
         foreach my $SectionLine ($Current_INF_File->getSection($SectionValue))
         {
            if($SectionLine =~ /UserModeDriverName/i) # UserModeDriverName or UserModeDriverNameWoW
            {
               my(@LineValues) = split(/,/, $SectionLine);

               my $index;

               for ($index=4; $index<scalar(@LineValues); $index++)
               {
                  if ($sectionMinBuild > $TH2ver)
                  {
                    # Verify run from driver store is implemented
                    if ($LineValues[$index] !~ /%$DirIdDriverStore%/i)
                    {
                       AddDisplayError(6039, $Current_INF_File->getIndex($SectionValue,$SectionCount));
                    }
                  }
                  else
                  {
                    # Verify run from driver store is NOT specified
                    if ($LineValues[$index] =~ /%$DirIdDriverStore%/i)
                    {
                       AddDisplayError(6041, $Current_INF_File->getIndex($SectionValue,$SectionCount));
                    }
                  }
               }
            }
            $SectionCount++;
         }
      }
      $count++;
   }
}

#---------------------------------------------------#
# Verifies that RS drivers implement proper versioning.
#---------------------------------------------------#
sub ChkDriverVersion
{
   # If RS, validate driver meets expected versioning scheme
   if($Current_INF_HighestMinBuild > $TH2ver && !ChkInf::GetGlobalValue("MS_INTERNAL"))
   {
      my $section = 'Version';

      my @lines;
      my $line;
      my $value;
      my $count = 0;

      @lines = $Current_INF_File->getSection($section);
      foreach $line (@lines)
      {
         if($line =~ /DriverVer/i)
         {
            my ($Directive, $Value) = ChkInf::SplitLine($section,$count,$line);
            my(@Values) = split(/,/, $Value); # Split date from version number
            my $DriverVersion = $Values[1];
            $DriverVersion =~ s/^\s+|\s+$//g; # Trim whitespace
           
            my(@VerionParts) = split(/\./, $DriverVersion);

            if (scalar(@VerionParts) != 4)
            {
               #The versioning does not meet the requirements
               AddDisplayError(6040, $Current_INF_File->getIndex($section,0));
            }
            else
            {
               #Verify AA and BB are acceptable values (in format of AA.BB.CCCC.DDDD)
               my $RunningOsVersion = scalar($OSVer{'Maj'} . "." . $OSVer{'Min'});

               if (defined($DriverVersionTable{$RunningOsVersion}))
               {
                  #Convert the driver version values into a hashtable to make lookups easier.
                  my %AAvalues = map { $_ => 1 } @{$DriverVersionTable{$RunningOsVersion}->{'AAfield'}};
                  my %BBvalues = map { $_ => 1 } @{$DriverVersionTable{$RunningOsVersion}->{'BBfield'}};
                  if(!defined($AAvalues{$VerionParts[0]}) || !defined($BBvalues{$VerionParts[1]}))
                  {
                     #The versioning does not meet the requirements
                     AddDisplayError(6040, $Current_INF_File->getIndex($section,0));
                  }
               }
            }
            last;
         }
         
         $count++;
      }
   }
}

#---------------------------------------------------#
# Verifies that the module contains a "InstalledDisplayDrivers"
# directive in each SoftwareDeviceSettings section.
#---------------------------------------------------#
sub ChkInstalledDisplayDriver
{

   my $section = 'SoftwareDeviceSettings';

   print(STDERR "\tInvoking Display::ChkInstalledDisplayDriver...\n") if ($DEBUG);

   return unless $Current_INF_File->sectionDefined($section);
   foreach my $line ($Current_INF_File->getSection($section))
   {
      if($line =~ /InstalledDisplayDrivers/i)
      {
         return; # Section exists, things are okay
      }
   }

   AddDisplayError(6005, $Current_INF_File->getIndex($section,0),$section);
}

#-------------------------------------------------------------------------------------------------------#
# ChkStartType verifies that StartType is set to 3 (in ServiceInstall section) for LH display adapter inf's
# They do not print any error if the AddService/StartType directive is not defined since chkinf.pm module already does that.
#-------------------------------------------------------------------------------------------------------#

sub ChkStartType
{
   my $section = "$_[0].Services";
   my $count = 0;
   
   print(STDERR "\tInvoking Display::ChkStartType...\n") if ($DEBUG);

   return unless $Current_INF_File->sectionDefined($section);
   foreach my $line ($Current_INF_File->getSection($section))
   {
      $count++ , next if ($line =~ /^\s*$/); # Skip if it's a blank line
      if($line =~ /AddService/i)
      {
         # AddService=ServiceName,[flags],service-install-section[,event-log-install-section[,[EventLogType][,EventName]]]
         my($ServiceName, $Flags, $SISec, $ELSec, $ELType, $EName) =
            ChkInf::GetList($line,$Current_INF_File->getIndex($section,$count));

         if (defined($Flags))
         {
            # Handle the blank case
            if ($Flags =~ /^\s*$/)
            {
               $Flags=0;
            }

            if ($Flags=~/^\d*$/)
            {
               # Force numeric strings to numeric context
               #(When a scalar contains just a number, there exists ambiguity:
               #is it a string of characters (that happen to be numbers) or is it a number);
               #The addition operator forces its operands into numeric context

               $Flags+=0;
            }

            if ($Flags =~ /^0x/i)
            {
               $Flags =~ s/^0x//i;
               #Covert the string to hex
               $Flags = hex($Flags);
            } 
            elsif ($Flags =~ /^0/)
            {
               $Flags =~ s/^0//i;
               #Convert string to Octal number
               $Flags = oct($Flags);
            } # Otherwise, assume it's already in decimal

            # 
            if (!(ChkInf::is_numeric($Flags)) || $Flags =~/^\s*$/ )
            {
               $Flags=0;
            }

            if(defined($SISec) && ($SISec !~ /^$/))
            {
               if($Current_INF_File->sectionDefined($SISec))
               {
                  #Flags specifies one or more (ORed) system-defined flags
                  if (($Flags & 0x2)== 0x2)
                  {
                     #PNP drivers have flag value set to 0x00000002 and  StartType check only needs to be done for PnP
                     my $SIcount = 0;
                     foreach my $ServiceLine ($Current_INF_File->getSection($SISec))
                     {
                        $SIcount++ , next if ($ServiceLine =~ /^\s*$/); # Skip if it's a blank line
                        if($ServiceLine =~ /StartType/i)
                        {
                           my ($Directive, $Value) = ChkInf::SplitLine($SISec,$count,$ServiceLine);
                           if($Value != 3)
                           {
                              AddDisplayError(6012, $Current_INF_File->getIndex($SISec,$SIcount),$Value);
                           }
                        }
                        $SIcount++;

                     }
                  }
               }
            }
         }
      }
      $count++;
   } 
}


#---------------------------------------------------------------------#
# Verifies that the WDDM inf contains new copy flag to Support PNPStop Directive
# This flag (0x00004000 or 0x00004020) is only required for user mode binaries,
# and only when driver is not being run from driver store. 
#---------------------------------------------------------------------#
sub ChkUserModeDllFlag
{
   #Check the DestinationDirs section to get the file-list-section:
   #[DestinationDirs]
   #[DefaultDestDir=dirid[,subdir]]
   #[file-list-section=dirid[,subdir]]

   my $section = 'DestinationDirs';
   my @Values;

   print(STDERR "\tInvoking Display::ChkUserModeDllFlag...\n") if ($DEBUG);

   return unless ($Current_INF_File->sectionDefined($section));

   my $DestDirsCount = 0;
   my $FoundCopyWithFlagsOrDriverStore = 0;
   my $FoundCopyWithoutFlagsAndDriverStore = 0;
   my @LineNumbersOfErrors;

   foreach my $DestDirsLine ($Current_INF_File->getSection($section))
   {
      $DestDirsCount++ , next if ($DestDirsLine =~ /^\s*$/); # Skip if it's a blank line
      $DestDirsCount++ , next if ($DestDirsLine =~ /.del/i); # Skip if this is a delete section. This logic will be improved when we move to InfVerif.
      $DestDirsCount++ , next if ($DestDirsLine =~ /.clean/i); # Skip if this is a delete section. This logic will be improved when we move to InfVerif.
      my ($FileListSec, $dirid) = ChkInf::SplitLine($section,$DestDirsCount,$DestDirsLine);

      #$Directive contains the file-list-section and $Value contains dirid,[,subdir]]
      @Values = ChkInf::GetList($dirid,$Current_INF_File->getIndex($section, $DestDirsCount));

      #Get the dirid
      my $dirid  = shift(@Values);

      #Check the file section only for user mode copy file section
      if ( $Current_INF_File->sectionDefined($FileListSec) && ($dirid == $DirIdSystem32 || $dirid == $DirIdSysWoW64 || $dirid == $DirIdDriverStore))
      {
         my $FileListCount = 0;
         #Check the file-list-section for CopyFlag
         foreach my $FileListLine ($Current_INF_File->getSection($FileListSec))
         {
            $FileListCount++ , next if ($FileListLine =~ /^\s*$/); # Skip if it's a blank line
            if($FileListLine =~ /.dll/i)
            {
               if( ($FileListLine =~ /4000|4020/ && $OSVer{'Maj'} > 5) || ( $dirid == $DirIdDriverStore && $OSVer{'Maj'} >= 10 ) )
               {
                  #The inf contains new Copy File flag for user mode WDDM binary, or runs from driver store. It is WDDM inf.
                  $FoundCopyWithFlagsOrDriverStore = 1;
               }
               else
               {
                  # No copy flags and doesn't have run from driver store support - it's an XDDM driver
                  $FoundCopyWithoutFlagsAndDriverStore = 1;

                  # Save these line numbers so we can display them in error messages if needed
                  push(@LineNumbersOfErrors,$Current_INF_File->getIndex($FileListSec,$FileListCount));
               }
            }
            $FileListCount++;
         }
      }
   }

    if ($FoundCopyWithFlagsOrDriverStore && $FoundCopyWithoutFlagsAndDriverStore)
    {
        # Generate an error since these are mutually exclusive. List all files without copy flags or driver store support.
        foreach (@LineNumbersOfErrors)
        {
            AddDisplayError(6016, $_);
        }
    }

    $FoundDllFilesToCopy = $FoundCopyWithFlagsOrDriverStore || $FoundCopyWithoutFlagsAndDriverStore;
    $IsWDDMInf = $FoundCopyWithFlagsOrDriverStore;
}

#-----------------------------------------------------------------------------#
# This method checks a given feature score against currently known settings
#-----------------------------------------------------------------------------#
sub ChkFeatureScore
{
   my ($Value,$section,$count,$OsVersion) = @_;

   print(STDERR "\tInvoking Display::ChkFeatureScore ($Value)...\n") if ($DEBUG);

   # Create a reference to the anonymous hash stored at $Value in %FeatureScoreTable
   my $score = \%{ $FeatureScoreTable{ $Value } };

   if ($SeenFeatureScore eq "")
   {
      $SeenFeatureScore = $Value;
      $SeenFeatureScoreFrom = $score->{'from'};
   }
   elsif ($SeenFeatureScore ne $Value)
   {
      if ($score->{'from'} eq "Inbox" or $SeenFeatureScoreFrom eq "Inbox")
      {
         AddDisplayError(6037, $Current_INF_File->getIndex($section,$count),$SeenFeatureScore);
      }
   }

   if (!(%{$score})) # %{$foo} dereferences, allowing to check for perl's "null" (undef)
   {
      # FeatureScore is an unrecognized value
      AddDisplayError(6030, $Current_INF_File->getIndex($section,$count),$Value);
   }
   elsif ($FoundDllFilesToCopy == 0)
   {
      #Display only driver
      if ($score->{'type'} ne "WDDM" and $score->{'type'} ne "XDDM" and $score->{'type'} ne "MSBDD")
      {
         #Driver is not WDDM or XDDM driver
         AddDisplayError(6038, $Current_INF_File->getIndex($section,$count),$Value);
      }
   }
   elsif ($IsWDDMInf) # Windows Display Driver Model (formerly LDDM for Longhorn DDM)
   {
      if ($score->{'type'} ne "WDDM" and $score->{'type'} ne "MSBDD")
      {
         #FeatureScore information does not match inf type
         AddDisplayError(6031, $Current_INF_File->getIndex($section,$count),$Value);
      }
   }
   else #should be of type XDDM/third party
   {
      if ($score->{'type'} ne "XDDM") # XP Device Driver Model
      {
         #FeatureScore information does not match inf type
         AddDisplayError(6032, $Current_INF_File->getIndex($section,$count),$Value);
      }
      else
      {
         if (ChkInf::GetGlobalValue("MS_INTERNAL"))
         {
            if ($score->{'from'} ne "Inbox")
            {
               AddDisplayError(6024, $Current_INF_File->getIndex($section,$count),$Value);
            }
         }
         elsif ($score->{'from'} ne "third party")
         {
            # Non-internal drivers must be from a third party
            AddDisplayError(6025, $Current_INF_File->getIndex($section,$count),$Value);
         }
      }
   }

   if ($score->{'type'} eq "WDDM")
   {
      if (defined($TargetExpectedFeatureScore{$OsVersion}))
      {
         #Convert the feature score array into a hashtable to make lookups easier.
         my %Scores = map { $_ => 1 } @{$TargetExpectedFeatureScore{$OsVersion}->{'fscore'}};
         if(!defined($Scores{$Value}))
         {
            #The feature score does not meet the minimum requirement for this OS version.
            AddDisplayError(6038, $Current_INF_File->getIndex($section,$count),$OsVersion);
         }
       }

       if (ChkInf::GetGlobalValue("MS_INTERNAL"))
       {
          if ($score->{'from'} ne "Inbox")
          {
            #Internal drivers must come from the inbox
            AddDisplayError(6014, $Current_INF_File->getIndex($section,$count),$Value);
          }
       }
       elsif ($score->{'from'} ne "WHQL" && $score->{'from'} ne "Inbox")
       {
         #Non internal WDDM drivers must be verified by WHQL
         AddDisplayError(6026, $Current_INF_File->getIndex($section,$count),$Value);
       }
   }
}

sub ChkNameScheme
{
   my $count   =     0;
   my $section = 'Manufacturer';
   
   foreach my $line ($Current_INF_File->getSection($section))
   {
      $count++, next if ($line =~ /^[\s\t]*$/);# Skip if it's a blank line

      my ($Directive,@ErrorArgs);

      if( (!$IsWDDMInf) && (($Directive !~ /Microsoft\s*Corporation/i) || ($Directive !~ /XDDM/)))
      {
         $ErrorArgs[1] = "'XDDM (Microsoft Corporation)'";
         AddDisplayError(6013, $Current_INF_File->getIndex($section,$count), @ErrorArgs);
      }

      if( ($IsWDDMInf) && (($Directive !~ /Microsoft\s*Corporation/i) || ($Directive !~ /WDDM/)))
      {
         $ErrorArgs[1] = "'(Microsoft Corporation - WDDM)'";
         AddDisplayError(6013, $Current_INF_File->getIndex($section,$count), @ErrorArgs);
      }

      $count++;
   }
}

#--------------------------------------------------------------------#
# Verifies that inbox display inf's do not reference LayoutFile or CatalogFile
#--------------------------------------------------------------------#
sub ChkVersionSection()
{
   my $section = 'Version';

   my $count = 0;
   my @lines;
   my $line;
   my $value;

   @lines = $Current_INF_File->getSection($section);
   foreach $line (@lines)
   {
      $count++ , next if ($line =~ /^\s*$/); # Skip if it's a blank line
      if($line =~ /LayoutFile/i)
      {
         AddDisplayError(6017, $Current_INF_File->getIndex($section,$count-1),$section);
      }
      elsif($line =~ /CatalogFile/i)
      {
         AddDisplayError(6018, $Current_INF_File->getIndex($section,$count-1),$section);
      }
      elsif($line =~ /DriverVer/i)
      {
         # This currently only supports Vista
         # TODO: Add support for Win7 when the release date is known
         next if ($OSVer{'Maj'} < 6 || ($OSVer{'Maj'} >= 6 && $OSVer{'Min'} >= 1));

         my ($Directive, $Value) = ChkInf::SplitLine($section,$count,$line);
         #$Value is of form (Month)/(Day)/(Year,Version)
         #Main ckinf module checks for most invalid date scenarios (i.e. if date is two digit and is > 31, month > 12 and so on
         #So simply check for 08\21\2006

         my(@Values)  = split(/\//, $Value);

         #$Values[2] is of form (Year,Version)
         my(@Values1) = split(/,/, $Values[2]);

         # Make sure the date is not greater than 08\21\2006
         if ($Values1[0]  > 2006)
         {
            AddDisplayError(6027, $Current_INF_File->getIndex($section,$count),$line);
         } 
         elsif ($Values1[0]  == 2006)
         {
            if ($Values[0] > 8)
            {
               AddDisplayError(6027, $Current_INF_File->getIndex($section,$count),$line);
            }
            elsif ($Values[0] == 8)
            {
               if ($Values[1] > 21)
               {
                  AddDisplayError(6027, $Current_INF_File->getIndex($section,$count),$line);
               }
            }
         }
      }
      $count++;
   }
}

#---------------------------------------------------------------------------------#
# Verifies that Vista inbox display inf's contain '3426=windows cd' entry in SourceDiskNamesSection
#---------------------------------------------------------------------------------#
sub ChkSourceDisksNames()
{
   my $section = 'SourceDisksNames';

   print (STDERR "Invoking Display::ChkSourceDisksNames...") if ($DEBUG);

   my $count = 0;
   my @lines;
   my $line;
   my $value;
   my ($Directive, $Value);

   return unless $Current_INF_File->sectionDefined($section);
   foreach my $line ($Current_INF_File->getSection($section))
   {
      $count++ , next if ($line =~ /^\s*$/); # Skip if it's a blank line
      ($Directive, $Value) = ChkInf::SplitLine($section,$count,$line);

      if(($Directive != 3426) || ($Value !~ /windows[\s|\t]*cd/i))
      {
         AddDisplayError(6019, $Current_INF_File->getIndex($section,$count-1),$section);
      }
      $count++;
   }
}

sub ChkSourceDisksFiles()
{
   my $section = 'SourceDisksFiles';
   my $count = 0;
   my @lines;
   my $line;
   my $value;
   my ($Directive, $Value);

   return unless $Current_INF_File->sectionDefined($section);
   foreach my $line ($Current_INF_File->getSection($section))
   {
      $count++ , next if ($line =~ /^\s*$/); # Skip if it's a blank line
      ($Directive, $Value) = ChkInf::SplitLine($section,$count,$line);

      if($Value != 3426)
      {
         AddDisplayError(6020, $Current_INF_File->getIndex($section,$count-1),$section);
      }
      $count++;
   }

}



#---------------------------------------------------#
# Verifies that the module loaded correctly.  Be sure
# to change the string to the name of your module.
#---------------------------------------------------#
sub Exists
{
   print(STDERR "Module \"DISPLAY\" Loaded\n");
   return(1); # return 1 on success
}


#---------------------------------------------------#
# Is called when module is first included.
# Use it to set your per-inf variables.
#---------------------------------------------------#
sub InitGlobals
{
   # First parameter is the INF object
   $Current_INF_File=$_[1];

   # Output file = htm subdir + ((INF Name - .inf) + .htm)
   $Current_HTM_File = $Current_INF_File->{inffile};
   $Current_HTM_File = substr($Current_HTM_File, rindex($Current_HTM_File,"\\")+1);
   $Current_HTM_File =~ s/\.inf$/\.htm/i;
   $Current_HTM_File = "htm\\" . $Current_HTM_File;

   # Second parameter is a list of Device Specific options.
   my($DC_Specific_Options) = $_[2];

   # $DC_Specific_Options is a string that contains all device
   #   class options delimited by &'s
   if (defined($DC_Specific_Options))
   {
      @Device_Class_Options = split(/&/,$DC_Specific_Options);
   } 
   else
   {
      @Device_Class_Options = ("NULL", "NULL");
   }

   # Array must be shifted since first element also had a & prepended
   shift(@Device_Class_Options);

   # Parse the device class options.
   foreach my $Option (@Device_Class_Options)
   {
      if (index($Option, 'OverrideOSVersion') != -1)
      {
          my @OverrideOption = split(/:/, $Option);
          $OverriddenOsVersion = $OverrideOption[1];
      }
   }

   return(1); # return 1 on success
}


#---------------------------------------------------#
# Allows to add Device specific information to the
# top of the INF summary page.  The information here
# should be brief and link to detailed summaries
# below. (Which will be written using PrintDetials).
#---------------------------------------------------#
sub PrintHeader
{
   return(1); # return 1 on success
}


#---------------------------------------------------#
# Allows addition of device specific results to the
# detail section on the INF summary.
#---------------------------------------------------#
sub PrintDetails
{
   return(1); # return 1 on success
}

###################################################################################################
#+-----------------------------------------------------------------------------------------------+#
#|                                    WORK SUBROUTINES                                           |#
#+-----------------------------------------------------------------------------------------------+#
###################################################################################################

sub CheckAllModels
{
   print(STDERR "\tInvoking Display::CheckAllModels...\n") if($DEBUG);
  

   my $VistaSeen = 0;
   # Have to check all target OSes prior to using them. This way, we can differentiate
   # between an inf that expects to use the default (untargetted/decorated) and 
   # one that uses target differentiation for XP/Vista/Win7
   # This prevents featurescore errors triggering on pre-vista INF files
   foreach my $TargetOS (keys(%$Models))
   {
      # Trim manufacturer string from start of $TargetOS string, along with ending period. This string may contain other periods ".".
      my $TrimmedTargetOS = substr $TargetOS, length($ManufacturerPrefix) + 1;
      my ($NTARCH,$OSMaj,$OSMin,$OSType,$Suite,$MinBuildNum) = split(/\./,$TrimmedTargetOS);

      $OSMaj += 0; # Convert to scalar and/or set a value

      if ($OSMaj != 0 && $OSMaj >= 6)
      {
         $VistaSeen = 1;
      }

      # Determine the highest OS version supported in this INF.
      my $OsVersion = $OSMaj . "." . $OSMin;
      $OsVersion += 0;
      if ($Current_INF_HighestOsVersion < $OsVersion)
      {
         $Current_INF_HighestOsVersion = $OsVersion;
      }
      
      if ($MinBuildNum > $Current_INF_HighestMinBuild)
      {
         $Current_INF_HighestMinBuild = $MinBuildNum;
      }      
   }

   # $Models is a hash reference where $Models->{TargetOS}->{HardwareID} is a unique descriptor
   # for a particular device. Loop through all descriptors, grouped by TargetOS.
   foreach my $TargetOS (keys(%$Models))
   {
      # $ModelList holds the hash reference to all devices, keyed by hardware IDs.
      my $ModelList = $Models->{$TargetOS};
      
      # Trim manufacturer string from start of $TargetOS string, along with ending period. This string may contain other periods ".".
      my $TrimmedTargetOS = substr $TargetOS, length($ManufacturerPrefix) + 1;
      my ($NTARCH,$OSMaj,$OSMin,$OSType,$Suite,$MinBuildNum) = split(/\./,$TrimmedTargetOS);
      $OSMaj += 0;

      foreach my $HardwareID ( keys(%$ModelList) )
      {
         # $Device holds the hash reference to the specific device's hash
         my $Device = $ModelList->{$HardwareID};

         # SetupAPI automatically adds relevant architecture platform to install section
         # Therefore, emulate this behavior by trying for all possible arch targets 
         foreach my $TargetArch ("",".nt",".ntx86",".ntia64",".ntamd64")
         {
            # Add ".TargetArch" to install section if target architecture isn't empty
            my $InstSecName = $Device->{'DDINSTALL'} . $TargetArch;

            # Skip this architecture target if we can't find the install section name
            next unless $Current_INF_File->sectionDefined($InstSecName);

            # This section specifically targets Vista+, FS required regardless of OS the INF is running on
            # OR: This OS is Vista, and no specific target for vista seen, require FS
            if ($OSMaj >= 6 || ($OSVer{'Maj'} >=6 && !$VistaSeen))
            {
               # CheckSingleModel(Install Section Name, Allow FS, Require FS)
               CheckSingleModel($InstSecName,1,1,$TargetOS);
            }
            # This OS is Vista+ and a specific Vista+ section has been seen
            # Feature Score is allowed but not required, as the fallback section may or may not be for XP
            elsif ($OSVer{'Maj'} >= 6 && $VistaSeen)
            {
               CheckSingleModel($InstSecName,1,0,$TargetOS);
            }
            # This section is not allowed to have feature score
            else
            {
               CheckSingleModel($InstSecName,0,0,$TargetOS);
            }
            
            # Vista+ start type is required to be SERVICE_DEMAND_START (3)
            if ($IsWDDMInf)
            {
               ChkStartType($InstSecName);

               if(!ChkInf::GetGlobalValue("MS_INTERNAL"))
               {
                  ChkDriverStoreSupport($InstSecName, $MinBuildNum);
               }
            }

         } # END: foreach my $TargetArch ...

         

      }  # END: foreach my $HardwareID ( keys(%{$Models->{$TargetOS}}) )
   } # END: foreach my $TargetOS (keys(%$Models))
}

sub CheckSingleModel
{
   my $InstSecName = shift;
   my $AllowFS = shift;
   my $RequireFS = shift;
   my $TargetOs = shift;
   my $IsWDFdriver = 0;

   print(STDERR "\tInvoking Display::CheckSingleModel ($InstSecName)...\n") if($DEBUG);

   # Check for device-specific software settings and configuration data
   if ( $Current_INF_File->sectionDefined($InstSecName.".SOFTWARESETTINGS") )
   {
      VerifySoftwareSettings($InstSecName.".SOFTWARESETTINGS");
   }

   if ( $Current_INF_File->sectionDefined($InstSecName.".OPENGLSOFTWARESETTINGS") )
   {
      VerifySoftwareSettings($InstSecName.".OPENGLSOFTWARESETTINGS");
   }

   if ( $Current_INF_File->sectionDefined($InstSecName.".GENERALCONFIGDATA") )
   {
      VerifyGCData($InstSecName.".GENERALCONFIGDATA");
   }
   
   if ( $Current_INF_File->sectionDefined($InstSecName.".Wdf") || $Current_INF_File->sectionDefined($InstSecName.".NT.Wdf") )
   {
      $IsWDFdriver = 1;
   }

   my $count = 0;
   my $FinalCount = 0;

   my @RegLines;
   my $FSFound = 0; # Has the feature score been found?
   my $RegDllFound = 0; # Have any dlls been found?

   # Trim manufacturer string from start of $TargetOs string, along with ending period. This string may contain other periods ".".
   my $TrimmedTargetOs = substr $TargetOs, length($ManufacturerPrefix) + 1;
   my ($MdlSecName,$NTARCH,$OSMaj,$OSMin,$OSType,$Suite,$MinBuildNum) = split(/\./,$TrimmedTargetOs);
   my $RunningOsVersion = $OSVer{'Maj'} . "." . $OSVer{'Min'};
   my $TargetOsVersion;
   $RunningOsVersion += 0;
   if (defined($OSMaj))
   {
       $TargetOsVersion = $OSMaj . "." . $OSMin;
       $TargetOsVersion += 0; # Convert to scalar.
       # When an INF only specifies target versions below the current version of
       # the OS. Force the target OS version to the current OS.
       if (($Current_INF_HighestOsVersion == $TargetOsVersion) &&
           ($RunningOsVersion > $Current_INF_HighestOsVersion)) 
       {
           $TargetOsVersion = $RunningOsVersion;
       }
   }
   else
   {
       $TargetOsVersion = $RunningOsVersion;
   }

   foreach my $line ($Current_INF_File->getSection($InstSecName))
   {
      $count++, next if ($line =~ /^\s*$/); # Skip if it's a blank line
      
      $FinalCount = $count; # Store last line of section for error output

      my ($Directive,$Value) = ChkInf::SplitLine($InstSecName,$count,$line);

      if (uc $Directive eq "ADDREG")
      {
         foreach ( ChkInf::GetList($Value,$Current_INF_File->getIndex($InstSecName,$count)) )
         {
            push(@RegLines, RegLines($_)) if ( $Current_INF_File->sectionDefined($_) );
         }
      }

      if (uc $Directive eq 'FEATURESCORE')
      {
         $FSFound = 1;
         
         if (!$IsWDFdriver)
         {
            ChkFeatureScore($Value,$InstSecName,$count,$TargetOsVersion);
         }
      }

      $count++;
   }
   

   if ($AllowFS && $RequireFS && !$FSFound && !$IsWDFdriver)
   {
      # Running on Vista OS, FS required
      AddDisplayError(6029, $Current_INF_File->getIndex($InstSecName,$FinalCount),'FeatureScore');
   }
   elsif (!$AllowFS && $FSFound && !$IsWDFdriver)
   {
      #print "Running on Pre Vista OS; should not have Feature Score directive";
      AddDisplayError(6028,$Current_INF_File->getIndex($InstSecName,$FinalCount),'FeatureScore');
   }


   # Check all AddReg lines to make sure none touch the following location
   foreach (@RegLines)
   {
      if ($$_[0] =~ /^HKLM\s*,\s*"?SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Controls\sFolder\\Device/i)
      {
         AddDisplayError(6004,$$_[1]);
      }
   }
}

#-------------------------------------------------------------------------------------------------#
# GetOSVersion - Fills the global %OSVer with major, minor, and build information                 #
#-- GetOSVersion() -------------------------------------------------------------------------------#
sub GetOSVersion
{
   my @tokens;
   my $ver1;

   if (!defined($OverriddenOsVersion))
   {
       # Get the OS version
       # Pipe the output of the 'ver' command to OSVER
       open (OSVER, "ver |");

       # The first line contains garbage
       my $t = <OSVER>;

       # This is the actual output text from 'ver'. Chop the newline character.
       my $ver = <OSVER>;
       chomp($ver);
       close (OSVER);

       # Retrieve the version from the text
       @tokens = split(/ /, $ver);

       $ver1 = pop(@tokens);
   }
   else
   {
       $ver1 = $OverriddenOsVersion;
   }

   my ($MajVer,$MinVer,$Build) = split(/\./,$ver1);

   $OSVer{'Maj'} = $MajVer;
   $OSVer{'Min'} = $MinVer;
   $OSVer{'Build'} = $Build;
}


#-------------------------------------------------------------------------------------------------#
# LearnModels - Returns an array of all models listed in the INF                                  #
#-- LearnModels() --------------------------------------------------------------------------------#
sub LearnModels
{
   my $section = 'Manufacturer';
   my $count   = 0;

   my($Directive, $Value, @Targets);

   print(STDERR "\tInvoking Display::LearnModels...\n") if ($DEBUG);

   my $ntamd64found = 0;

   foreach my $line ($Current_INF_File->getSection($section))
   {
      $count++, next if ($line =~ /^\s*$/); # Skip if it's a blank line

      if ($line =~ /ntamd64/i)
      {
        $ntamd64found = 1;
      }

      ($Directive,$Value) = ChkInf::SplitLine($section,$count,$line);

      # Whistler allows new TargetDecorations.
      @Targets = ChkInf::GetList($Value,$Current_INF_File->getIndex($section, $count));
      # Value holds the undecorated section, @Values holds TargetDecorations.
      $Value  = shift(@Targets);

      # [Manufacturers] may not have both a directive & a value
      if ($Value =~ /^\s*$/)
      {
         $Value     = $Directive;
         $Directive = "";
      }
      else
      {
         $Value =~ s/\x93/\"/g; # Replace "smart quotes" with straight quotes
         $Value =~ s/\x94/\"/g;
         $Value    =~  s/^\"(.*)\"/$1/;   # And Strip the Quotes!
      }
      
      $ManufacturerPrefix = $Value; # Save manufacturer prefix

      if ( $Current_INF_File->sectionDefined($Value) )
      {
         $Models->{$Value} = ExpandModelSection($Value);
      }
      foreach (@Targets)
      {
         if ( $Current_INF_File->sectionDefined("$Value.$_") )
         {
            $Models->{"$Value.$_"} = ExpandModelSection("$Value.$_");
         }

         # Internal devices are required to have a "client" OS type set
         if(ChkInf::GetGlobalValue("MS_INTERNAL"))
         {
            my ($NTARCH,$OSMaj,$OSMin,$OSType,$Suite,$MinBuildNum) = split(/\./,$_);
            
            # Must be set to 1 for all win7 client devices
            if ($OSType != 1)
            {
               AddDisplayWarning(6101,$Current_INF_File->getIndex($section,$count),$Directive);
            }

         }

      }

      $count++;
   }
   # We need to see if there is an NTamd64 decorated section. It's not a hard requirement, but is a "best practice" for WDDM 1.2
   if (0 == $ntamd64found)
   {
      AddDisplayWarning(6102,1);
   }
}

#-------------------------------------------------------------------------------------------------#
#-- VerifyGCData($line, $Model, $Extension) ------------------------------------------------------#
sub VerifyGCData
{
   my $Section     = $_[0];
   my @lines       = $Current_INF_File->getSection($Section);
   my $count       = 0;
   my $line;

   my($Directive, @Values, $Value);

   my(%SecToCheck) = ("MAXIMUMDEVICEMEMORYCONFIGURATION", TRUE,
         "MAXIMUMNUMBEROFDEVICES"          , TRUE,
         "KEEPEXISTINGDRIVERENABLED"       , TRUE,
         "COPYFILES"                       , TRUE,
         "SESSIONIMAGESIZE"                , TRUE);

   my($CurrentLine, $Temp, @LineItems, $SizeOfArray);
   ChkInf::Mark("$Section");

   print(STDERR "\tInvoking Display::VerifyGCData (@_)...\n") if ($DEBUG);
   foreach $line (@lines)
   {
      $count++, next if ($line =~ /^\s*$/);# Skip if it's a blank line

      ($Directive,$Value) = ChkInf::SplitLine($Section,$count,$line);
      @Values             = ChkInf::GetList($Value,$Current_INF_File->getIndex($Section,$count));

      if (uc($Directive) eq "MAXIMUMDEVICEMEMORYCONFIGURATION")
      {
         if (defined($Values[0]))
         {
            if (defined($Values[1]))
            {
               AddDisplayError(6002,$Current_INF_File->getIndex($Section,$count),$Directive);
            }
         }
         else
         {
            AddDisplayError(6002,$Current_INF_File->getIndex($Section,$count),$Directive);
         }
      }
      elsif (uc($Directive) eq "MAXIMUMNUMBEROFDEVICES")
      {
         if (defined($Values[0]))
         {
            if (defined($Values[1]))
            {
               AddDisplayError(6002,$Current_INF_File->getIndex($Section,$count),$Directive);
            }
         }
         else
         {
            AddDisplayError(6002,$Current_INF_File->getIndex($Section,$count),$Directive);
         }
      }
      elsif (uc($Directive) eq "KEEPEXISTINGDRIVERENABLED")
      {
         if (defined($Values[0]))
         {
            if (defined($Values[1]))
            {
               AddDisplayError(6002,$Current_INF_File->getIndex($Section,$count),$Directive);
            }
            if (($Values[0] != 1) and ($Values[0] != 0))
            {
               AddDisplayError(6003,$Current_INF_File->getIndex($Section,$count),$Directive);
            }
         }
         else
         {
            AddDisplayError(6002,$Current_INF_File->getIndex($Section,$count),$Directive);
         }
      }
      elsif (uc($Directive) eq "SESSIONIMAGESIZE")
      {
         if (defined($Values[0]))
         {
            if (defined($Values[1]))
            {
               AddDisplayError(6002,$Current_INF_File->getIndex($Section,$count),$Directive);
            }
            if($Values[0] > 16)
            {
               AddDisplayError(6011,$Current_INF_File->getIndex($Section,$count),$Directive);
            }
         }
         else
         {
            AddDisplayError(6002,$Current_INF_File->getIndex($Section,$count),$Directive);
         }
      }
      else
      {
         AddDisplayError(6001,$Current_INF_File->getIndex($Section,$count),$Directive)
            unless (defined $SecToCheck{uc $Directive});
      }
      $count++;

   }

   return(TRUE);
}

#-------------------------------------------------------------------------------------------------#
#-- VerifySoftwareSettings($line, $Model, $Extension) --------------------------------------------#
sub VerifySoftwareSettings
{
   my $Section     = $_[0];
   my @lines      = $Current_INF_File->getSection($Section);
   my $count      = 0;
   my $line;

   my($Directive, @Values, $Value);


   my(%SecToCheck) = ("ADDREG",    TRUE,
                      "COPYFILES", TRUE,
                      "NEEDS",     TRUE);

   my($CurrentLine, $Temp, @LineItems, $SizeOfArray);

   ChkInf::Mark("$Section");
   print(STDERR "\tBeginning VerifyModel (@_)...\n") if ($DEBUG);
   foreach $line (@lines)
   {

      $count++, next if ($line =~ /^\s*$/);# Skip if it's a blank line

      ($Directive,$Value) = ChkInf::SplitLine($Section,$count,$line);
      @Values             = ChkInf::GetList($line,$Current_INF_File->getIndex($Section,$count));

      if (uc($Directive) eq "ADDREG")
      {
         # ADDREG is valid, so call the ChkInf ADDREG checking routine
         ChkInf::ADDREG($Section, $count, $Value);
      } 
      elsif (uc($Directive) eq "DELREG")
      {
         # ADDREG is valid, so call the ChkInf ADDREG checking routine
         ChkInf::DELREG($Section, $count, $Value);
      } 
      else
      {
         AddDisplayError(6001,$Current_INF_File->getIndex($Section,$count),$Directive)
            unless (defined $SecToCheck{uc $Directive});
      }

      $count++;

   }
   return(TRUE);
}

###################################################################################################
#+-----------------------------------------------------------------------------------------------+#
#|                                   HELPER SUBROUTINES                                          |#
#+-----------------------------------------------------------------------------------------------+#
###################################################################################################

#-------------------------------------------------------------------------------------------------#
# This sub adds a new error to the list of errors for the file.                                   #
#-- AddDisplayError($ErrorNum, $LineNum, @ErrorArgs) ---------------------------------------------#
sub AddDisplayError
{
   my($ErrorNum) = $_[0], shift;
   my($LineNum)  = $_[0], shift;
   my(@ErrorArgs)= @_;

   $ErrorArgs[0] = " " if (! defined($ErrorArgs[0]));
   my($str, $this_str, $info_err, $format_err);

   $info_err = $DisplayErrorTable{"$ErrorNum"};

   if ( !defined($info_err) )
   {
      $this_str = "Unknown error $ErrorNum.";
   }
   else
   {
      $format_err = $$info_err[0];
      $this_str = sprintf($format_err, @ErrorArgs);
   }

   ChkInf::AddDeviceSpecificError($LineNum, $ErrorNum, $this_str);
}

#-------------------------------------------------------------------------------------------------#
# This sub adds a new warning to the list of warnings for the file.                               #
#-- AddDisplayWarning($WarnNum, $LineNum, @ErrorArgs) --------------------------------------------#
sub AddDisplayWarning
{
   my($WarnNum)  = $_[0], shift;
   my($LineNum)  = $_[0], shift;
   my(@WarnArgs) = @_;

   $WarnArgs[0] = " " if (! defined($WarnArgs[0]));
   my($str, $this_str, $info_wrn, $format_wrn);

   $info_wrn = $DisplayWarningTable{"$WarnNum"};

   if ( !defined($info_wrn) )
   {
      $this_str = "Unknown warning $WarnNum.";
   }
   else
   {
      $format_wrn = $$info_wrn[0];
      $this_str = sprintf($format_wrn, @WarnArgs);
   }
   ChkInf::AddDeviceSpecificWarning($LineNum, $WarnNum, $this_str);
}

#-------------------------------------------------------------------------------------------------#
#-- ExpandModelSection($Section) -----------------------------------------------------------------#
sub ExpandModelSection
{
   my $Section  = shift;
   my @lines    =  $Current_INF_File->getSection($Section);
   my $count    = 0;

   my $Devices  =  {};

   print(STDERR "\tInvoking Display::ExpandModelSection...\n") if ($DEBUG);

   foreach my $line (@lines)
   {
      # Keep track of line count within the section and skip any blank lines
      if ($line =~ /^\s*$/)
      {
         $count++;
         next;
      }

      # Each line should be formatted as follows:
      # device-description=install-section-name,hw-id[,compatible-id...]
      my ($DevDesc,$hwidList) = ChkInf::SplitLine($Section,$count,$line);
      my @hwids = ChkInf::GetList($hwidList,$Current_INF_File->getIndex($Section,$count));

      my $installSectionName = shift(@hwids);

      # Remove leading and trailing spaces
      $installSectionName =~ s/^\s*//i;
      $installSectionName =~ s/\s*$//i; 

      # Check that there is an install section name for this device description
      if ($installSectionName eq "")
      {
          AddDisplayError(6033,$Current_INF_File->getIndex($Section,$count));
          next;
      } 

      # Check that at least one hardware ID is defined for this device
      if (!defined $hwids[0])
      {
         AddDisplayError(6034,$Current_INF_File->getIndex($Section,$count));
         next;
      } 

      # Check each hardware ID to make sure it doesn't claim support for the base VGA device
      # Add all found devices to the hardware ID table
      foreach my $hwid (@hwids)
      {
         $hwid = uc($hwid);
         if (defined $Devices->{$hwid})
         {
            AddDisplayError(6035,$Current_INF_File->getIndex($Section,$count),$hwid,$Devices->{$hwid}->{'DESCRIPTION'});
            next;
         }

         if ( $hwid =~ /.*CC_03.*/i
           or $hwid =~ /.*CLS_0003.*/i)
         {
            AddDisplayError(6036,$Current_INF_File->getIndex($Section,$count));
            next;
         }

         $Devices->{$hwid} = {'DDINSTALL' => $installSectionName, 
                              'DESCRIPTION' => $DevDesc };            
      }
      
      if ($DevDesc =~ /WDDM/i)
      {
         $IsWDDMInf = 1;
      }
      $count++;
   }

   return $Devices;
}

#-------------------------------------------------------------------------------------------------#
# RegLines - returns all reglines (w/ string tokens removed) from a section.                      #
#-- RegLines() -----------------------------------------------------------------------------------#
sub RegLines
{
   my $line;
   my $Section  =  shift;
   my @lines    =  $Current_INF_File->getSection($Section);
   my $count    =  0;
   my @reglines;

   print(STDERR "\tInvoking Media::RegLines...\n") if ($DEBUG);

   foreach $line (@lines)
   {
      #Skip blank lines even though this should never be true.
      $count++, next if ($line =~ /^[\s\t]*$/);
      # Remove all string tokens
      $line = ChkInf::RemoveStringTokens($Current_INF_File->getIndex($Section,$count),$line);
      # Update our list with [$line, $linenum]
      push(@reglines, [$line,$Current_INF_File->getIndex($Section,$count)]);
      $count++;
   }
   return(@reglines);
}

return(1); # Module must return 1 to let chkinf know it loaded correctly.
