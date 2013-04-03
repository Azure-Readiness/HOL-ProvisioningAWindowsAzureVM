@echo off
SET Output=%1

:PromptForOutput
    IF [%Output%]==[] SET /p Output="Type the location for the new HOL (e.g. C:\NewHOL):"
IF [%Output%]==[] GOTO PromptForOutput

IF [%Output:~-1%]==[\] GOTO NoAddSlash
    SET Output=%Output%\
:NoAddSlash
IF EXIST "%Output%" GOTO NoCreateOutput
    MD %Output%
:NoCreateOutput

echo Copying HOL.md file...
copy HOL.md %Output%HOL.md

echo Copying README.md file...
copy README.md %Output%README.md

echo Copying Lab.xml file...
copy Lab.xml %Output%Lab.xml

echo Copying LICENSE.md file...
copy LICENSE.md %Output%LICENSE.md


echo Copying .gitignore file...
copy .gitignore %Output%.gitignore

echo Creating folder structure...
md %Output%images
md %Output%source
md %Output%source\setup

echo Completed!
