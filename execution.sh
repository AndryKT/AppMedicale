#!/bin/bash

set -e

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
WEBAPP_DIR="$PROJECT_DIR/src/main/webapp"
SOURCE_DIR="$PROJECT_DIR/src/main/java"
LIB_DIR="$PROJECT_DIR/src/main/lib"
DEPLOYED_WEB_INF="$PROJECT_DIR/WEB-INF"
CLASSES_DIR="$DEPLOYED_WEB_INF/classes"
DEPLOYED_LIB="$DEPLOYED_WEB_INF/lib"

mkdir -p "$CLASSES_DIR" "$DEPLOYED_LIB"

cp "$LIB_DIR"/*.jar "$DEPLOYED_LIB/"

javac -encoding UTF-8 \
  -cp "$DEPLOYED_LIB/*" \
  -d "$CLASSES_DIR" \
  $(find "$SOURCE_DIR" -name "*.java")

cp "$WEBAPP_DIR/web.xml" "$DEPLOYED_WEB_INF/web.xml"
if [ -d "$WEBAPP_DIR/WEB-INF" ]; then
  cp -r "$WEBAPP_DIR/WEB-INF/." "$DEPLOYED_WEB_INF/"
fi

rm -f "$PROJECT_DIR/Etudiant.jsp"
find "$WEBAPP_DIR" -mindepth 1 -maxdepth 1 \
  ! -name WEB-INF \
  ! -name web.xml \
  -exec cp -r {} "$PROJECT_DIR/" \;

cd "$PROJECT_DIR/../../bin"
./shutdown.sh >/dev/null 2>&1 || true
./startup.sh