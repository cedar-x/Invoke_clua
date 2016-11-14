#include<iostream>  
using namespace std;  
#include "lunar.h"
#include "FileSystem.h"


lua_State* L;  

int main (int argc,char*argv[])  
{  
	/* initialize Lua */  
	L = luaL_newstate();  
	/* load Lua libraries */  
	luaL_openlibs(L);  

	//Lua÷–◊¢≤·¿‡////////////////////////////////////////////////////
	Lunar<FileSystem>::Register(L);
	FileSystem * g_pFileSystem = new FileSystem();
	Lunar<FileSystem>::push(L, g_pFileSystem, true);
	lua_setglobal(L, "FileSystem");
	luaL_dofile(L, "LuaUseClass.lua"); 
	/*
	--LuaUseClass.lua
	function FileSystem22:MoveFile22()
	print("FileSystem22:MoveFile22")
	self:MoveFile();
	end
	FileSystem:MoveFile22();
	print("===============111=============================")
	test = FileSystem22()
	test:MoveFile22();
	print("===============2222============================", test)
	collectgarbage("collect")
	print("===============3333============================")
	*/

	lua_close(L);  
	getchar();
	return 0;  
}  