#pragma once
#include "lunar.h"

class FileSystem
{

public:
	FileSystem(void);
	FileSystem(lua_State* L);
	~FileSystem(void);
	
	static const char className[];
	static Lunar<FileSystem>::RegType methods[];

public:
	int MoveFile(lua_State* lua);
	int GetCurrentDirectory(lua_State* lua);
	int CopyFile(lua_State* lua);
	int GetFileInfo(lua_State* lua);
	int BuildPath(lua_State* lua);
	int GetExtension(lua_State* lua);
	int Foreach(lua_State* lua);
	int GetSysPath(lua_State* lua);
	int CreateFolder(lua_State* lua);
	int DeleteFile(lua_State* lua);
	int RenameFile(lua_State* lua);
	int DeleteFolder(lua_State* lua);
	int GetDirectoryPath(lua_State* lua);
	int SetCurrentDirectory(lua_State* lua);
	int FileExist(lua_State* lua);
	int GetFileName(lua_State* lua);
	int SearchFile(lua_State* lua);
	int GetPathInfo(lua_State* lua);
	int StrReplacePathSpliteToUnixStyle(lua_State* lua);
	int GetFileNameWithoutExtension(lua_State* lua);
	int PackBundle(lua_State* lua);
	int UnpackBundle(lua_State* lua);
	int SearchFolder(lua_State* lua);

public:
	bool _MoveFile();
	bool _GetCurrentDirectory();
	bool _CopyFile();
	bool _GetFileInfo();
	bool _BuildPath();
	bool _GetExtension();
	bool _Foreach();
	bool _GetSysPath();
	bool _CreateFolder();
	bool _DeleteFile();
	bool _RenameFile();
	bool _DeleteFolder();
	bool _GetDirectoryPath();
	bool _SetCurrentDirectory();
	bool _FileExist();
	bool _GetFileName();
	bool _SearchFile();
	bool _GetPathInfo();
	bool _StrReplacePathSpliteToUnixStyle();
	bool _GetFileNameWithoutExtension();
	bool _PackBundle();
	bool _UnpackBundle();
	bool _SearchFolder();

};

