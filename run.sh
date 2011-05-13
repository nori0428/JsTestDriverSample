#!/bin/sh

CWD=`pwd`/`dirname ${0}`
tempfoo=`basename $0`
TMPFILE=`mktemp -t ${tempfoo}.XXXXXX` || exit 1
RET=0
PLATFORM=`uname -s`

JSTESTDRIVER_DIR=${CWD}/tools/JsTestDriver
JSTESTDRIVER_BIN=${JSTESTDRIVER_DIR}/JsTestDriver-1.3.1.jar
JSTESTDRIVER_CONF=${CWD}/JsTestDriver.conf

(java -jar ${JSTESTDRIVER_BIN} \
    --config ${JSTESTDRIVER_CONF} \
    --tests all \
    --verbose \
    --captureConsole \
    2>&1 | tee ${TMPFILE})

grep -q -e 'Total.*tests (Passed:.*Fails: 0; Errors: 0' ${TMPFILE} || RET=1
rm -f ${TMPFILE}
exit ${RET}

# EOF
