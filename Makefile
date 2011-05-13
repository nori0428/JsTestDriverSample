# $Id$
# %.subdirs target
# <URL: http://ochoo.blog48.fc2.com/blog-entry-72.html>

SUBDIRS=src tests

.PHONY: all check clean server run

%.subdirs:
	@for subdir in ${SUBDIRS}; do \
		(cd $$subdir && ${MAKE} $(basename $@)); \
	done

all: check

check:
	sh ./auto.sh

clean: clean.subdirs
	rm -f *~

server:
	sh ./server.sh

run:
	sh ./run.sh

# EOF
