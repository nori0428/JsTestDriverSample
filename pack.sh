#!/bin/sh

CWD=`pwd`/`dirname ${0}`

CLOSURE_COMPILER=${CWD}/tools/closure_compiler/compiler.jar
SOURCES=src/helloJsTestDriver.js
RELEASE_FILE=src/helloJsTestDriver.min.js

(java -jar ${CLOSURE_COMPILER} --js ${SOURCES} \
    --compilation_level WHITESPACE_ONLY --jscomp_error=checkTypes \
    --js_output_file ${RELEASE_FILE})

# EOF
