@echo off
setlocal enabledelayedexpansion

set "PROJECT_DIR=%~dp0"
if "%PROJECT_DIR:~-1%"=="\" set "PROJECT_DIR=%PROJECT_DIR:~0,-1%"

set "WEBAPP_DIR=%PROJECT_DIR%\src\main\webapp"
set "SOURCE_DIR=%PROJECT_DIR%\src\main\java"
set "LIB_DIR=%PROJECT_DIR%\src\main\lib"
set "DEPLOYED_WEB_INF=%PROJECT_DIR%\WEB-INF"
set "CLASSES_DIR=%DEPLOYED_WEB_INF%\classes"
set "DEPLOYED_LIB=%DEPLOYED_WEB_INF%\lib"

if not exist "%CLASSES_DIR%" mkdir "%CLASSES_DIR%"
if not exist "%DEPLOYED_LIB%" mkdir "%DEPLOYED_LIB%"

copy /Y "%LIB_DIR%\*.jar" "%DEPLOYED_LIB%\" >nul
if errorlevel 1 (
  echo [ERREUR] Copie des jars impossible.
  exit /b 1
)

REM --- Liste des fichiers .java (slashs pour le fichier d'arguments de javac)
set "SOURCES_FILE=%TEMP%\sources_javac.txt"
if exist "%SOURCES_FILE%" del "%SOURCES_FILE%"
for /r "%SOURCE_DIR%" %%F in (*.java) do (
  set "P=%%F"
  set "P=!P:\=/!"
  echo "!P!">>"%SOURCES_FILE%"
)

javac -encoding UTF-8 -cp "%DEPLOYED_LIB%\*" -d "%CLASSES_DIR%" "@%SOURCES_FILE%"
if errorlevel 1 (
  echo [ERREUR] Echec de la compilation.
  exit /b 1
)

copy /Y "%WEBAPP_DIR%\web.xml" "%DEPLOYED_WEB_INF%\web.xml" >nul
if exist "%WEBAPP_DIR%\WEB-INF" (
  xcopy "%WEBAPP_DIR%\WEB-INF" "%DEPLOYED_WEB_INF%\" /E /I /Y >nul
)

if exist "%PROJECT_DIR%\Etudiant.jsp" del /F /Q "%PROJECT_DIR%\Etudiant.jsp"

REM --- Copie du reste de webapp (sauf WEB-INF et web.xml)
for /d %%D in ("%WEBAPP_DIR%\*") do (
  if /i not "%%~nxD"=="WEB-INF" xcopy "%%D" "%PROJECT_DIR%\%%~nxD\" /E /I /Y >nul
)
for %%F in ("%WEBAPP_DIR%\*") do (
  if /i not "%%~nxF"=="web.xml" copy /Y "%%F" "%PROJECT_DIR%\" >nul
)

REM --- Redemarrage de Tomcat
cd /d "%PROJECT_DIR%\..\..\bin"
call shutdown.bat >nul 2>&1
call startup.bat

endlocal