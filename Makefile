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
	install -o root -g bin -m 0755 ${PROG} ${PREFIX}/bin
	@echo
	@echo "Now, please process following:"
	@echo
	@echo "1. Add ${PROG} to /etc/shells"
	@echo "   echo ${PREFIX}/bin/${PROG} >> /etc/shells"
	@echo
	@echo "2. Put your own banner message to ${PREFIX}/etc/${BANNER}
	@echo "   cp banner ${PREFIX}/etc/${BANNER}"
	@echo
	@echo "3. Set as user's shell"
	@echo "   chsh -s ${PREFIX}/bin/${PROG} username"

uninstall:
	rm -f ${PREFIX}/bin/${PROG}
	rm -f ${PREFIX}/etc/${BANNER}
	@echo "Do not forget to remove shell from /etc/shells"

clean:
	rm -f *.o ${PROG}

