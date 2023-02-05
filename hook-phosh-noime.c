#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dlfcn.h>
#include <limits.h>
#include <errno.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>

char *(*_getenv_orig)(const char *) = NULL;

char *getenv(const char *name) {
    if (_getenv_orig == NULL)
        _getenv_orig = dlsym(RTLD_NEXT, "getenv");

    char *e = _getenv_orig(name);

    if (strcmp(name, "GTK_IM_MODULE") != 0)
        return e;

    char self[255];
    if (readlink("/proc/self/exe", self, sizeof(self)) < 0)
        return e;

    if (strstr(self, "phosh") == NULL && strstr(self, "phoc") == NULL)
        return e;

    return NULL;
}
