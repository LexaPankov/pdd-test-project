set PATH=C:\Program Files\Microsoft Visual Studio\2022\Community\Msbuild\Current\Bin;%PATH%
set BDS=C:\Program Files (x86)\Embarcadero\Studio\21.0
set FrameworkDir=C:\Windows\Microsoft.NET\Framework\v4.0.30319
set FrameworkVersion=v4.5

@echo off
set /p UserInputDisk="What Disk would you like? "
%UserInputDisk%

@echo off
set /p UserInputPath="What Directory would you like? "
cd %UserInputPath%

set DCC_Define=RELEASE
msbuild /t:Clean;Build_Prod PDD.ciproj /p:DCC_ExeOutput=..\builds /p:OutputDir=builds /p:FileVersion=0.1.0.0