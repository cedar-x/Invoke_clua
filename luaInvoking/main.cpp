#include<iostream>  
#include "lunar.h"
#include "FileSystem.h"

using namespace XXHelper;


lua_State* L;  

int main (int argc,char*argv[])  
{  
	int error;
	/* initialize Lua */  
	L = luaL_newstate();  
	/* load Lua libraries */  
	luaL_openlibs(L);  
	
	//Lua÷–◊¢≤·¿‡////////////////////////////////////////////////////
	Lunar<FileSystem>::Register(L);
	FileSystem * g_pFileSystem = new FileSystem();
	Lunar<FileSystem>::push(L, g_pFileSystem, true);
	lua_setglobal(L, "FileSystem");
	if ( (error = luaL_dofile(L, "LuaUseClass.lua")) != 0)
	{
		printf("Failed:%d,%s\n", error, lua_tostring(L, -1));
	}
	lua_getglobal(L, "main");   
	if((error = lua_pcall(L,0,0,0))!=0)
	{
		printf("Failed:%d,%s\n", error, lua_tostring(L, -1));
	}
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
	printf("Press any key To Exit Console....");
	getchar();
	return 0;  
}  