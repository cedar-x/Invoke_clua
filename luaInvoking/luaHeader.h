#ifndef __LUAHEADER_H__
#define __LUAHEADER_H__ 

#include <stdio.h>
#include <iostream>
using namespace std;

extern "C" {
#include "./HeadFile/luaconf.h"
#include "./HeadFile/lua.h"
#include "./HeadFile/lauxlib.h"
#include "./HeadFile/lualib.h"
}
#endif
