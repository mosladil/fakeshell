PROG=		fakeshell
SRCS=		fakeshell.c
BANNER=		banner
PREFIX=		/usr/local
PROVIDER=	"Tunnelr.com"
ADMINS=		"support@tunnelr.com"
CC=		gcc

CPPFLAGS += \
	-DPROVIDER='${PROVIDER}' \
	-DADMINS='${ADMINS}' \
	-DBANNER='"${PREFIX}/etc/${BANNER}"'

build: ${SRCS}
	${CC} ${CPPFLAGS} -o ${PROG} ${SRCS}

install: 
	install -m 0755 ${PROG} ${PREFIX}/bin
	install -m 0644 ${BANNER} ${PREFIX}/etc
	@echo
	@echo "Now, add ${PROG} to ${PREFIX}/etc/shells"
	@echo "Example:"
	@echo "  echo ${PREFIX}/bin/${PROG} >> ${PREFIX}/etc/shells"
	@echo

uninstall:
	rm -f ${PREFIX}/bin/${PROG}
	rm -f ${PREFIX}/etc/${BANNER}
	@echo "Do not forget to remove shell from ${PREFIX}/etc/shells"

clean:
	rm -f *.o ${PROG}

