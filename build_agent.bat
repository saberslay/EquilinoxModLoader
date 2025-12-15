@echo off
SET SRC_DIR=src
SET BIN_DIR=bin
SET LIB_DIR=lib
SET JAR_NAME=EquilinoxModLoader.jar
SET MANIFEST_FILE=manifest.MF
SET JAVASSIST_URL=https://repo1.maven.org/maven2/org/javassist/javassist/3.28.0-GA/javassist-3.28.0-GA.jar
SET JAVASSIST_JAR=%LIB_DIR%\javassist.jar

REM -------------------------------
REM Detect Java 8 in C:\Program Files\Java
REM -------------------------------
SET JAVA_FOUND=
FOR /D %%i IN ("C:\Program Files\Java\jdk1.8*") DO (
    SET JAVA_FOUND=%%i
    GOTO :JAVA_OK
)

:JAVA_OK
IF "%JAVA_FOUND%"=="" (
    echo ERROR: No Java 8 JDK found in C:\Program Files\Java
    pause
    exit /b 1
)

SET JAVA_HOME=%JAVA_FOUND%
SET PATH=%JAVA_HOME%\bin;%PATH%
echo Using Java from: %JAVA_HOME%

REM -------------------------------
REM Create folders
REM -------------------------------
IF NOT EXIST %BIN_DIR% mkdir %BIN_DIR%
IF NOT EXIST %LIB_DIR% mkdir %LIB_DIR%

REM -------------------------------
REM Download Javassist if missing
REM -------------------------------
IF NOT EXIST %JAVASSIST_JAR% (
    echo Downloading Javassist...
    powershell -Command "Invoke-WebRequest -Uri '%JAVASSIST_URL%' -OutFile '%JAVASSIST_JAR%'"
    IF %ERRORLEVEL% NEQ 0 (
        echo Failed to download javassist.jar!
        pause
        exit /b 1
    )
)

REM -------------------------------
REM Compile Java sources
REM -------------------------------
javac -cp ".;%JAVASSIST_JAR%" -source 1.8 -target 1.8 -d %BIN_DIR% %SRC_DIR%\*.java
IF %ERRORLEVEL% NEQ 0 (
    echo Compilation failed!
    pause
    exit /b 1
)

REM -------------------------------
REM Unpack Javassist into bin (merge classes)
REM -------------------------------
cd %LIB_DIR%
jar xf javassist.jar
xcopy /Y /E * ..\%BIN_DIR%
cd ..

REM -------------------------------
REM Build the agent JAR
REM -------------------------------
jar cfm %JAR_NAME% %MANIFEST_FILE% -C %BIN_DIR% .

echo ================================
echo Done! Fat agent JAR created: %JAR_NAME%
echo ================================
pause
