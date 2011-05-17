#!/bin/sh

CWD=`pwd`/`dirname ${0}`

JSDOC_DIR=${CWD}/tools/jsdoc-toolkit/
JSRUN_BIN=${JSDOC_DIR}/jsrun.jar
APPRUN_JS=${JSDOC_DIR}/app/run.js
TEMPLATES=${JSDOC_DIR}/templates/jsdoc/

SOURCES=src/helloJsTestDriver.js

(java -jar ${JSRUN_BIN} ${APPRUN_JS} ${SOURCES} \
    -t=${TEMPLATES} -d=doc)

# EOF
