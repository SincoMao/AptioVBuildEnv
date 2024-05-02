# (C) Copyright 1999-2003 Microsoft Corporation

# The name of this module. For our purposes it must be all in caps.
package KEYBOARD;

    use strict;                # Keep the code clean
    #---------------------------------------------------#
    # Module level variables
    #---------------------------------------------------#
    my $Version  = "5.1.2402.0";# Version of this file
    my $DEBUG    = 0;           # Toggles verbose-ness
    my $CurrentINF;             # Stores name of the current INF file.
    my $Current_HTM_File;       # Name of the output file to use.
    my @Device_Class_Options;   # Array to store device specific options.
    my %Services;

#---------------------------------------------------#
# Routine for checking device class specific
# directives that occur in common sections verified
# by ChkINF.  Return 0 if directive is unknown or
# 1 if the directive is known (you should also verify
# it and write any appropriate warnings/errors.
#---------------------------------------------------#
sub DCDirective {
    my($Directive) = uc $_[1];

    my(%ValidDirectives) = ( "SHAREDDRIVER"  => 1);
    return(0) unless (defined($ValidDirectives{$Directive}));
    return(1);
}

#---------------------------------------------------#
# The module's main checking routine.
# This is your entry point for verifying an INF
#---------------------------------------------------#
sub InfCheck {
    my %AllModels;
    my $Model;

    %AllModels  = LearnModels();

    if ( $CurrentINF->sectionDefined("ControlFlags") ) {
         VerifyControlFlags("ControlFlags");
    }

    foreach $Model (keys(%AllModels) ) {
        %Services = ();

        CheckService("$Model.Services")
            if ( $CurrentINF->sectionDefined("$Model.Services") );
        CheckService("$Model.NT.Services")
            if ( $CurrentINF->sectionDefined("$Model.NT.Services") );
        CheckService("$Model.NTX86.Services")
            if ( $CurrentINF->sectionDefined("$Model.NTX86.Services") );
        CheckService("$Model.NTIA64.Services")
            if ( $CurrentINF->sectionDefined("$Model.NTIA64.Services") );

        CheckKeepVals("$Model.KeepValues")
            if ( $CurrentINF->sectionDefined("$Model.KeepValues") );
        CheckKeepVals("$Model.NT.KeepValues")
            if ( $CurrentINF->sectionDefined("$Model.NT.KeepValues") );
        CheckKeepVals("$Model.NTX86.KeepValues")
            if ( $CurrentINF->sectionDefined("$Model.NTX86.KeepValues") );
        CheckKeepVals("$Model.NTIA64.KeepValues")
            if ( $CurrentINF->sectionDefined("$Model.NTIA64.KeepValues") );

        CheckMigrate("$Model.MigrateToDevNode")      
            if ( $CurrentINF->sectionDefined("$Model.MigrateToDevNode") );
        CheckMigrate("$Model.NT.MigrateToDevNode")   
            if ( $CurrentINF->sectionDefined("$Model.NT.MigrateToDevNode") );
        CheckMigrate("$Model.NTX86.MigrateToDevNode")
            if ( $CurrentINF->sectionDefined("$Model.NTX86.MigrateToDevNode") );
        CheckMigrate("$Model.NTIA64.MigrateToDevNode")
            if ( $CurrentINF->sectionDefined("$Model.NTIA64.MigrateToDevNode") );

    }
    return(1); # return 1 on success
}


#---------------------------------------------------#
# Verifies that the module loaded correctly.  Be sure
# to change the string to the name of your module.
#---------------------------------------------------#
sub Exists {
    print(STDERR "Module \"KEYBOARD\" Loaded\n");
    return(1); # return 1 on success
}


#---------------------------------------------------#
# Is called when module is first included.
# Use it to set your per-inf variables.
#---------------------------------------------------#
sub InitGlobals {
    # First parameter is the INF object
    $CurrentINF=$_[1];
    %Services  =();

    # Output file = htm subdir + ((INF Name - .inf) + .htm)
    $Current_HTM_File = $CurrentINF->{inffile};
    $Current_HTM_File = substr($Current_HTM_File, rindex($Current_HTM_File,"\\")+1);
    $Current_HTM_File =~ s/\.inf$/\.htm/i;
    $Current_HTM_File = "htm\\" . $Current_HTM_File;

    # Second parameter is a list of Device Specific options.
    my($DC_Specific_Options) = $_[2];

    # $DC_Specific_Options is a string that contains all device
    #   class options delimited by &'s
    if (defined($DC_Specific_Options)) {
        @Device_Class_Options = split(/&/,$DC_Specific_Options);
    } else {
        @Device_Class_Options = ("NULL", "NULL");
    }

    # Array must be shifted since first element also had a & prepended
    shift(@Device_Class_Options);

    return(1); # return 1 on success
}


#---------------------------------------------------#
# Allows to add Device specific information to the
# top of the INF summary page.  The information here
# should be brief and link to detailed summaries
# below. (Which will be written using PrintDetials).
#---------------------------------------------------#
sub PrintHeader {
    return(1); # return 1 on success
}


#---------------------------------------------------#
# Allows addition of device specific results to the
# detail section on the INF summary.
#---------------------------------------------------#
sub PrintDetails {
    return(1); # return 1 on success
}

return(1); # Module must return 1 to let chkinf know it loaded correctly.

###########################################################################
#+-----------------------------------------------------------------------+#
#|                   Device Class Specific Procedures                    |#
#+-----------------------------------------------------------------------+#
###########################################################################
#--------------------------------------------------------------------------#
# This sub adds a new error to the list of errors for the file.            #
#-- AddKBError($ErrorNum, $LineNum, @ErrorArgs) ---------------------------#
sub AddKBError {
    my($ErrorNum) = $_[0], shift;
    my($LineNum)  = $_[0], shift;
    my(@ErrorArgs)= @_;

    my %ErrorTable = (  5001 => ["No corresponding [%s] section is defined."],
                        5002 => ["Unknown directive: %s"],
                        5003 => ["Service %s not valid for this model"],
                        5004 => ["SharedDriver should be in the format 'SharedDriver=%DDInstall Section%,%Text String%'."],
                        5999 => ["Line checked"],
                     );

    $ErrorArgs[0] = " " if (! defined($ErrorArgs[0]));
    my($str, $this_str, $info_err, $format_err);

    $info_err = $ErrorTable{"$ErrorNum"};

    if ( !defined($info_err) ) {
        $this_str = "Unknown error $ErrorNum.";
    } else {
        $format_err = $$info_err[0];
        $this_str = sprintf($format_err, @ErrorArgs);
    }
    ChkInf::AddDeviceSpecificError($LineNum, $ErrorNum, $this_str);
}

#-------------------------------------------------------------------------#
#-- CheckKeepVals($Section) ----------------------------------------------#
sub CheckKeepVals {
    my $Section = shift;
    my @lines   = $CurrentINF->getSection($Section);
    my $count   = 0;
    my $line;

    my $Directive;
    my $Value;
    my @Values;

#BUGBUG#
    print("Keyboard::CheckKeepVals [$Section]...\n") if ($DEBUG);

    ChkInf::Mark($Section);

    foreach $line (@lines) {
        $count++, next if ($line =~ /^\s*$/);
        ($Directive,$Value) = ChkInf::SplitLine($Section,$count,$line);
        @Values             = ChkInf::GetList($Value,$CurrentINF->getIndex($Section,$count));

        $count++;
    }

}

#-------------------------------------------------------------------------#
#-- CheckMigrate($Section) -----------------------------------------------#
sub CheckMigrate {
    my $Section = shift;
    my @lines   = $CurrentINF->getSection($Section);
    my $count   = 0;
    my $line;

    my $Directive;
    my $Value;
    my @Values;

    my $Model   = $Section;
       $Model   =~ s/\.MigrateToDevNode$//i;

    print("Keyboard::CheckMigrate [$Section]...\n") if ($DEBUG);

    ChkInf::Mark($Section);

    foreach $line (@lines) {
        $count++, next if ($line =~ /^\s*$/);
        ($Directive,$Value) = ChkInf::SplitLine($Section,$count,$line);
        @Values             = ChkInf::GetList($Value,$CurrentINF->getIndex($Section,$count));

        if ((! defined($Services{uc($Model)}) ) or
            (grep(/$Directive/i,@{$Services{uc($Model)}}) < 1 )) {
            AddKBError(5003,$CurrentINF->getIndex($Section,$count),$Directive);
        }
                
        $count++;
    }

}

#-------------------------------------------------------------------------#
#-- CheckService($Section) -----------------------------------------------#
sub CheckService {
    my $Section = shift;
    my @lines   = $CurrentINF->getSection($Section);
    my $count   = 0;
    my $line;

    my $Directive;
    my $Value;
    my @Values;

    my $Model   = $Section;
       $Model   =~ s/\.Services$//i;

    print("Keyboard::CheckService [$Section]...\n") if ($DEBUG);

    foreach $line (@lines) {
        $count++, next if ($line =~ /^\s*$/);
        ($Directive,$Value) = ChkInf::SplitLine($Section,$count,$line);
        @Values             = ChkInf::GetList($Value,$CurrentINF->getIndex($Section,$count));

        if (uc($Directive) eq "ADDSERVICE") {
            push (@{$Services{uc($Model)}},uc($Values[0]));
        }

        $count++;
    }

}

#-------------------------------------------------------------------------#
#-- ExpandModelSection($line, $Section) ----------------------------------#
sub ExpandModelSection {
    my $Section  = shift;
    my $line;
    my @lines    =  $CurrentINF->getSection($Section);
    my $count    = 0;

    my(%Models)  =  ();
    my($TempVar);

    my($Directive, @Values, $Value);

    print(STDERR "\tInvoking Infrared::ExpandModelSection...\n") if ($DEBUG);

    foreach $line (@lines) {
        $count++, next if ($line =~ /^\s*$/);# Skip if it's a blank line

        ($Directive,$Value) = ChkInf::SplitLine($Section,$count,$line);
        @Values             = ChkInf::GetList($Value,$CurrentINF->getIndex($Section,$count));

        if (defined($Values[0])) {
            $Models{$Values[0]} = $Values[1];
        }
        $count++;
    }

    return(%Models);
}

#-------------------------------------------------------------------------#
# LearnModels - Returns an array of all models listed in the INF          #
#-- LearnModels() --------------------------------------------------------#
sub LearnModels {
    return() if (! $CurrentINF->sectionDefined("Manufacturer") );
    my $Section = "Manufacturer";
    my $line;
    my @lines   = $CurrentINF->getSection("Manufacturer");
    my $count   = 0;

    my($Provider, $DevSection);
    my(%Models);
    my($ModelSectionName);
    my(@TargetOSVersions);
    my($ModelSectionName);
    my($TargetOSVersion);
    my(@SectionProviderPairs);
    my($SectionProviderPair);

    print(STDERR "\tInvoking Keyboard::LearnModels...\n") if ($DEBUG);

    foreach $line (@lines) {
        print(STDERR "\t\tline: $line\n") if ($DEBUG);

        $count++, next if ($line =~ /^\s*$/); # Skip if it's a blank line

        ($Provider,$DevSection) = ChkInf::SplitLine($Section,$count,$line);
        
        print(STDERR "\t\tProvider: $Provider\n") if ($DEBUG);
        # [Manufacturers] may not have both a directive & a value
        if ($DevSection =~ /^\s*$/) {                                   # DevSection is empty
            push @SectionProviderPairs, [($Provider, $Provider)];
        } else {
            $DevSection    =~  s/^\"(.*)\"/$1/;                         # And Strip the Quotes!
            print(STDERR "\t\tDevSection: $DevSection\n") if ($DEBUG);
        
	    # we split the string following the strkey
            @TargetOSVersions = split('\s*,\s*', $DevSection);          # we split the string based on comma but also remove all the whitespaces around the comma
            $ModelSectionName = shift(@TargetOSVersions);               # but the first element is models-section-name, remove the first element from the array of target OS versions
            
            print(STDERR "\t\tModelSectionName: $ModelSectionName\n") if ($DEBUG);
            
            if ($#TargetOSVersions eq -1) {                             # Target OS Versions is empty
                push @SectionProviderPairs, [($Provider, $ModelSectionName)];
            } else {
                foreach $TargetOSVersion (@TargetOSVersions) {
                    print(STDERR "\t\tTargetOSVersion: $TargetOSVersion\n") if ($DEBUG);
   
                    $DevSection = "$ModelSectionName.$TargetOSVersion";
                    print(STDERR "\t\t\tDevSection: $DevSection\n") if ($DEBUG);
                    push @SectionProviderPairs, [($Provider, $DevSection)];
                }
            }
        }
        $count++;
    }

    foreach $SectionProviderPair (@SectionProviderPairs) {
        ($Provider, $DevSection) = @{$SectionProviderPair};
        print(STDERR "\t\tExpanding Model for (Provider:$Provider)$DevSection\n");
        
        if ( $CurrentINF->sectionDefined($DevSection) ) {
            # Add the models from $INFSections{$DevSection} to our running list
            %Models = (%Models, ExpandModelSection($DevSection, $Provider));
        }
    }

    return(%Models);
}

#-------------------------------------------------------------------------#
# VerifyControlFlags - Validates the SharedDriver directive               #
#-- VerifyControlFlags() -------------------------------------------------#
sub VerifyControlFlags {
    print("Starting VerifyControlFlags\n") if ($DEBUG);
    my($Section) =  $_[0];
    my(@lines)    = $CurrentINF->getSection($Section);
    my($SecStart) = $CurrentINF->getIndex($Section,0)-1;
    my($line);
    my($count)=0;

    my($Directive, $Value, @Values);
    foreach $line (@lines) {
        $count++, next if ($line =~ /^[\s\t]*$/); # Skip if it's a blank line

        ($Directive, $Value) = ChkInf::SplitLine($Section,$count,$line);

        next unless (uc $Directive eq "SHAREDDRIVER");

        @Values = ChkInf::GetList($Value,$CurrentINF->getIndex($Section,$count),0);

        if (defined $Values[2]) {
            # Too many parameters
            AddMouseError(5004,$CurrentINF->getIndex($Section,$count));
        }

        if (defined $Values[0]) {
            unless ($CurrentINF->sectionDefined($Values[0])) {
                # Refers to unknown section
                AddMouseError(5001,$CurrentINF->getIndex($Section,$count), $Values[0]);
            }
        } else {
            # Not defined
            AddMouseError(5004,$CurrentINF->getIndex($Section,$count));
        }

        unless (defined $Values[1]) {
            AddMouseError(5004,$CurrentINF->getIndex($Section,$count));
        }
    }
    return(1);
}
