OBERON_BIN ?= ${HOME}/prj/oberonc/bin
JAVA ?= java -cp ${OBERON_BIN}:.

.PHONY: test clean

test: MyOut.class
	${JAVA} MyOut

%.class: %.mod
	${JAVA} oberonc . $<+

clean:
	rm -f MyOut.mod MyOut.smb
