#!/usr/bin/env bash

function show_usage()
{
    echo "Usage:"
    echo "  ./pack.sh [TOMCAT_HOME]"
    echo ""
}

function pack()
{
    local TOMCAT_HOME="$1"
    local SERVLET="DemoServlet"
    local WAR_FILE="deploy/$SERVLET.war"
    local CLASS_DIR="WebContent/WEB-INF/classes"

    mkdir -p deploy
    mkdir -p "$CLASS_DIR"

    javac\
    -cp "$TOMCAT_HOME"/lib/servlet-api.jar\
    -d "$CLASS_DIR"\
    "src/demo/$SERVLET.java"

    jar cvf "$WAR_FILE" -C WebContent .
    echo "$WAR_FILE packed"

    cp "$WAR_FILE" "$TOMCAT_HOME"/webapps
    echo "$WAR_FILE copyed to $TOMCAT_HOME/webapps"
    echo "View at http://127.0.0.1:8080/$SERVLET"
}

# Main entrance
if [ "$1" == "" ]
then
    show_usage
    exit 1
fi

pack "$1"
