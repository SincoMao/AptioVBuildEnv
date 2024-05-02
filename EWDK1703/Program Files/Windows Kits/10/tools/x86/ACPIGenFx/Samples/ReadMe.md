ACPI Generation Framework (ACPIGenFX) Sample
============================================

APCIGenFx is a C# library for generating static ACPI description tables, e.g. the FADT, MADT, and DBG2. Using a set of premade device classes, it abstracts the user from the complexities and intricacies of ACPI firmware development. At runtime, the tool validates the input, catching common ACPI Source Language (ASL) errors to reduce debugging.

For more information about ACPI, see the ACPI specification at uefi.org/specifications.

Please direct feedback and questions to acpigenfx@microsoft.com.

Usage:

1. Launch Samples.sln using Visual Studio.
2. Select the DSDTSamples project in the Solution Explorer.
3. Click Project -> Add Reference and navigate to the folder containing AcpiGenFx.dll
4. Click OK
5. Repeat steps 2-4 for the SSDTSample Project.
6. Build the solution.
7. Mark one of the projects as the Default Project by right clicking it and selecting Set as Start up Project.
8. Run the project by clicking Start.
9. Running the project will generate the output tables in the Output folder under bin\Debug or bin\Release.
10. The Output folder contains all of the output tables and files as well as two subfolders: Aslc and Bin.
11. The Output folder contains DSDT.asl or SSDT.asl.
12. The Aslc folder contains all the firmware tables in the .aslc format.
13. The Bin folder will contain the firmware tables in binary blob format.
