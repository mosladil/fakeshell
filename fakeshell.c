#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_HOSTNAME	255

int
main(int argc)
{
	char nodename[MAX_HOSTNAME];
	gethostname(nodename, MAX_HOSTNAME);
	printf("Welcome to %s service on %s!\n", PROVIDER, nodename);
	
	const char filename[] = BANNER;
	FILE * file = fopen(filename, "r");
	if(file)
	{
		char line [BUFSIZ];
		while(fgets(line, sizeof line, file))
		{
			fputs(line, stdout);
		}
		fclose(file);
	}

	printf("In case of any urgency, do not hesitate to contact us at %s.\n", ADMINS);

	char c;
	while(c != EOF)
	{
		c = getchar();
		if(c == '\n')
		{
			printf("What do you think I am, a shell?\n");
			fflush(stdout);
		}
	}
	return (0);
}
