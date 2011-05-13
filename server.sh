#!/bin/sh

CWD=`pwd`/`dirname ${0}`

JSTESTDRIVER_BIN=${CWD}/tools/JsTestDriver/JsTestDriver-1.3.1.jar

(java -jar ${JSTESTDRIVER_BIN} --port 4224)

# EOF
