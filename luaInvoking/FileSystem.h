#ifndef __FILESYSTEM_H__
#define __FILESYSTEM_H__
#include "lunar.h"

namespace XXHelper
{
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
		int SetCurrentDirectory(lua_State* lua);
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
		bool _MoveFile(string src,string dst,bool bOverride);
		bool _SetCurrentDirectory(string path);
		string _GetCurrentDirectory();
		bool _CopyFile(string src,string dst,bool bOverride);
		bool _GetFileInfo(string filePath);
		bool _BuildPath(string path);
		string _GetExtension(string filePath);
		bool _Foreach();
		bool _GetSysPath();
		bool _CreateFolder();
		bool _DeleteFile(string filePath);
		bool _RenameFile();
		bool _DeleteFolder(string path,bool bRecursive);
		string _GetDirectoryPath(string filePath);
		bool _FileExist();
		string _GetFileName(string filePath);
		bool _SearchFile(string pattern,bool bFullPath,bool bSearchHide);
		bool _GetPathInfo(string path);
		bool _StrReplacePathSpliteToUnixStyle();
		string _GetFileNameWithoutExtension(string filePath);
		bool _PackBundle();
		bool _UnpackBundle();
		bool _SearchFolder(string path,bool bRecursive,bool bSearchHide);

	};
}
#endif