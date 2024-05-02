# Copyright 1999-2000 Microsoft Corporation

package MONITOR;          # The name of this module. For our purposes,
                          #  must be all in caps.

    use strict;           # Keep this code clean
    my $Version  = "5.1.2402.0"; # Version of this file
    my $Current_INF_File;

    sub TRUE  { return(1); }
    sub FALSE { return(0); }

1;

# Subroutine required to be defined
sub PrintHeader {        return(-1);}

# Subroutine required to be defined
sub PrintDetails {       return(-1);}

#-------------------------------------------------------------------------------------------------#
# Required subroutine! Used to verify a Directive as being device specific.                       #
#-- Exists ---------------------------------------------------------------------------------------#
sub DCDirective {
    my($Directive) = $_[1];
    return(FALSE); # Only return 1 if validating the line
}

#-------------------------------------------------------------------------------------------------#
# Required subroutine! Allows us to verify that the module loaded correctly.                      #
#-------------------------------------------------------------------------------------------------#
sub Exists {
    print(STDERR "Module \"MONITOR\" Loaded\n");
    return(TRUE);
}

#-------------------------------------------------------------------------------------------------#
# REQUIRED- Entry point for Class specific checking                                               #
#-------------------------------------------------------------------------------------------------#
sub InfCheck {
    ClassInstall32("ClassInstall32")
            if ( $Current_INF_File->sectionDefined("CLASSINSTALL32") );
    ClassInstall32("ClassInstall32.NT")
            if ( $Current_INF_File->sectionDefined("CLASSINSTALL32.NT") );
    ClassInstall32("ClassInstall32.NTX86")
            if ( $Current_INF_File->sectionDefined("CLASSINSTALL32.NTX86") );


    CheckForDefaultMonitor();

    return(TRUE);
}

#-------------------------------------------------------------------------------------------------#
# Required subroutine                                                                             #
#-------------------------------------------------------------------------------------------------#
sub InitGlobals {
    # Is called when module is first included.
    # Use it to set your per-inf variables.
    shift;
    $Current_INF_File = shift;
    return(TRUE);
}

#-------------------------------------------------------------------------------------------------#
# Verifies required regkeys in ClassInstall32 sections                                            #
#-------------------------------------------------------------------------------------------------#
sub ClassInstall32 {
    my $Section = shift;
    my @lines   = $Current_INF_File->getSection($Section);
    my $count   = 0;
    my $line;

    my($Directive, $Value, @Sections);

    foreach $line (@lines) {
        $count++, next if ($line =~ /^\s*$/);# Skip if it's a blank line

        ($Directive, $Value) = ChkInf::SplitLine($Section,$count,$line);

        if (uc($Directive) eq "ADDREG") {
            @Sections = ChkInf::GetList($Value,$Current_INF_File->getIndex($Section,$count));
            foreach (@Sections) {
                CheckAddReg($_);
            }
        }

      $count++;
    }
    return(TRUE);

}

#-------------------------------------------------------------------------------------------------#
# Helper routine for ClassInstall32()                                                             #
#-------------------------------------------------------------------------------------------------#
sub CheckAddReg {
    my $Section  = shift;
    my @lines   = $Current_INF_File->getSection($Section);
    my $count   = 0;
    my $line;

    my @NeededKeys = (0,0,0);
    my $SecStart   = $Current_INF_File->getIndex($Section) - 1;
    my @RegKey;
    my $REG;

    my $Pattern1 = quotemeta("HKR,,NoInstallClass,,1");
    my $Pattern2 = quotemeta("HKR,,Icon,,-1");
    my $Pattern3 = quotemeta("HKR,,,,%MonitorClassName%");
    my($Quote);

    foreach $line (@lines) {

        $count++, next if ($line =~ /^\s*$/);# Skip if it's a blank line

        $REG  = $line;

        $REG =~ s/\"//g;
        if ($REG =~ /^$Pattern1$/i) {
            $NeededKeys[0] = 1;
        } elsif ($REG =~ /^$Pattern2$/i) {
            $NeededKeys[1] = 1;
        } elsif ($REG =~ /^$Pattern3.*/i) {
            $NeededKeys[2] = 1;
        }
        $count++;
    }

    my($i);
    if (! $NeededKeys[0]) {
            ChkInf::AddDeviceSpecificError($SecStart,3001,"Missing a required regkey! (\"HKR,,NoInstallClass,,1\")");
    }
    if (! $NeededKeys[1]) {
            ChkInf::AddDeviceSpecificError($SecStart,3002,"Missing a required regkey! (\"HKR,,Icon,,-1\"");
    }
    if (! $NeededKeys[2]) {
            ChkInf::AddDeviceSpecificError($SecStart,3003,"Missing a required regkey! (\"HKR,,,,%MonitorClassName%\")");
    }

    return(TRUE);
}

sub CheckForDefaultMonitor
{
    my $manufacturerSectionName = 'Manufacturer';
    my $curLineNum = 0;

    # check every line in the [Manufacturer] section to find install sections
    foreach my $manufacturerSectionLine ($Current_INF_File->getSection($manufacturerSectionName))
    {
        # Keep track of current line in manufacturer section and skip blank lines
        $curLineNum++, next if ($manufacturerSectionLine =~ /^\s*$/);

        my ($manufacturerName,$sectionNameAndTargets) = ChkInf::SplitLine($manufacturerSectionName,$curLineNum,$manufacturerSectionLine);
        
        # Per MSDN, format can be %strkey%=model-sections-name[,TargetOSVersion][,TargetOSVersion]...
        # Get the section name and targets as a list, then strip off the section name
        my @targets = ChkInf::GetList($sectionNameAndTargets,$Current_INF_File->getIndex($manufacturerSectionName, $curLineNum) );
        my $sectionName = shift(@targets);

        # The [Manufacturers] section may have a manufacturer-name or a set of key and associated values
        # In the case it only has a manufacturer-name, $sectionName will be blank, so set it to the manufacturer name
        if ($sectionName =~ /^s*$/)
        {
            $sectionName = $manufacturerName;
        }
        else
        {
            # Replace smart quotes with straight quotes and remove all quotes
            $sectionName =~ s/\x93/\"/g; #left smart quote
            $sectionName =~ s/\x94/\"/g; #right smart quote
            $sectionName =~ s/^\"(.*)\"/$1/;
        }

        my @sections;
        # Check the non-OS-specific section's supported hardware IDs
        if ( $Current_INF_File->sectionDefined($sectionName) )
        {
            unshift(@sections,$sectionName);
        }

        foreach my $target (@targets)
        {
            if ( $Current_INF_File->sectionDefined("$sectionName.$target") )
            {
                unshift(@sections,"$sectionName.$target");
            }
        }

        foreach my $section (@sections)
        {
            my @lines    =  $Current_INF_File->getSection($section);
            my $sectionLineNum = 0;
            foreach my $line (@lines)
            {
                if ($line =~ /^\s*$/)
                {
                    $sectionLineNum++;
                    next;
                }

                # Every line in this section should be in the following format:
                # device-description=install-section-name,hw-id[,compatible-id...]
                my ($DevDesc,$hwidList) = ChkInf::SplitLine($section,$sectionLineNum,$line);
                my @hwids = ChkInf::GetList($hwidList,$Current_INF_File->getIndex($section,$sectionLineNum));

                my $installSectionName = shift(@hwids);

                foreach my $hwid (@hwids)
                {
                    $hwid =~ s/^\s*//i; # Kill leading spaces
                    $hwid =~ s/\s*$//i; # Kill trailing spaces

                    if ( uc($hwid) eq 'MONITOR\DEFAULT_MONITOR' )
                    {
                        ChkInf::AddDeviceSpecificError($Current_INF_File->getIndex($section,$sectionLineNum),
                            3004,
                            "INF may not specify Monitor\\default_monitor as a supported hardware ID");
                    }
                }
                $sectionLineNum++;
            }
        } 
    }
}
