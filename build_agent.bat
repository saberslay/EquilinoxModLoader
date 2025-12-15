@echo off
SET SRC_DIR=src
SET BIN_DIR=bin
SET LIB_DIR=lib
SET JAR_NAME=EquilinoxModLoader.jar
SET MANIFEST_FILE=manifest.MF

REM Clean bin folder
IF EXIST %BIN_DIR% rmdir /S /Q %BIN_DIR%
mkdir %BIN_DIR%

REM Compile your Java sources
javac -cp ".;%LIB_DIR%\javassist.jar" -source 1.8 -target 1.8 -d %BIN_DIR% %SRC_DIR%\*.java
IF %ERRORLEVEL% NEQ 0 (
    echo Compilation failed!
    pause
    exit /b 1
)

REM Unpack Javassist into bin (merge classes)
cd %LIB_DIR%
jar xf javassist.jar
xcopy /Y /E * ..\%BIN_DIR%
cd ..

REM Build the agent JAR (now includes Javassist)
jar cfm %JAR_NAME% %MANIFEST_FILE% -C %BIN_DIR% .

echo ================================
echo Done! Fat agent JAR created: %JAR_NAME%
echo ================================
pause
