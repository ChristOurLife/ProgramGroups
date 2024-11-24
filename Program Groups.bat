@echo off
Rem Set various variables
set agreement=TOSSignCheck.txt
set memory=generalMemory.txt
set groupFile=programGroups.txt

if not exist "%agreement%" (
    echo Hello! You have executed the very scary and broken script.
    timeout /t 3 >nul
    echo Please note this code may break at any time, and the author of this code will probably not bother to fix it. By proceeding, you agree to sign your life away to some random guy online.
    pause
    echo TOS has been signed! > "%agreement%"
    
)

:launchProgramGroup
cls
echo Which set of programs would you like to launch? You've saved:
Rem Does the file exist? Breathe if yes. Recite the bible in Japanese if no.
if not exist "%groupFile%"  (
    echo Oops! You haven't saved any program groups yet. Would you like to create some?
    set /p CreateProgramPrompt="(Y/N)"
    if "%CreateProgramPrompt%"=="Y" (goto CreateProgramGroup) else if /i "%CreateProgramPrompt%"=="N" (curl parrot.live) else if /i "%CreateProgramPrompt%"="debug" (goto debug)
) else (
    echo Program groups found:
    type %groupFile%
    set /p programGroupChoice=Which program group would you like to launch?
    if %programGroupChoice%==debug (goto debug)
)

:CreateProgramGroup
find "creatorGroupProgramVisited=1" "%memory%" >nul
if %errorlevel%==1 (
    timeout /t 3 >nul
    echo Welcome to the Program Group Creator!
    echo creatorGroupProgramVisited=1 >> "%memory%"
) else (echo .)

echo What is the name of the program group you would like to create?
set /p programGroupName=Format: "Example Group"
set /p programPaths=What are the paths to your programs? {Format: C:\\Users\ExampleUser\ExampleDesktop\ExampleYadaYadaYada\pleasebringthekidsback.exe}
Rem Create files needed for later
echo "%programGroupName%" >> "%groupFile%"
echo "%programPaths%" "%programGroupName%"

set /p createrAgain=Would you like to create another program group? (Y/N)
if /i "%createrAgain%"=="Y" (goto CreateProgramGroup) else if /i "%createrAgain%"=="N" (goto launchProgramGroup)





:debug
echo Debug mode activated. Congratulations, you have achieved cool kid status.
set debugMode=1
goto line   