#include "FileSystem.h"

const char FileSystem::className[] = "FileSystem22";
Lunar<FileSystem>::RegType FileSystem::methods[] =
{
	LUNAR_DECLARE_METHOD(FileSystem, MoveFile),
	LUNAR_DECLARE_METHOD(FileSystem, GetCurrentDirectory),
	LUNAR_DECLARE_METHOD(FileSystem, CopyFile),
	LUNAR_DECLARE_METHOD(FileSystem, GetFileInfo),
	LUNAR_DECLARE_METHOD(FileSystem, BuildPath),
	LUNAR_DECLARE_METHOD(FileSystem, GetExtension),
	LUNAR_DECLARE_METHOD(FileSystem, Foreach),
	LUNAR_DECLARE_METHOD(FileSystem, GetSysPath),
	LUNAR_DECLARE_METHOD(FileSystem, CreateFolder),
	LUNAR_DECLARE_METHOD(FileSystem, DeleteFile),
	LUNAR_DECLARE_METHOD(FileSystem, RenameFile),
	LUNAR_DECLARE_METHOD(FileSystem, DeleteFolder),
	LUNAR_DECLARE_METHOD(FileSystem, GetDirectoryPath),
	LUNAR_DECLARE_METHOD(FileSystem, SetCurrentDirectory),
	LUNAR_DECLARE_METHOD(FileSystem, FileExist),
	LUNAR_DECLARE_METHOD(FileSystem, GetFileName),
	LUNAR_DECLARE_METHOD(FileSystem, SearchFile),
	LUNAR_DECLARE_METHOD(FileSystem, GetPathInfo),
	LUNAR_DECLARE_METHOD(FileSystem, StrReplacePathSpliteToUnixStyle),
	LUNAR_DECLARE_METHOD(FileSystem, GetFileNameWithoutExtension),
	LUNAR_DECLARE_METHOD(FileSystem, PackBundle),
	LUNAR_DECLARE_METHOD(FileSystem, UnpackBundle),
	LUNAR_DECLARE_METHOD(FileSystem, SearchFolder),
	{0,0}
};

FileSystem::FileSystem(void){}
FileSystem::FileSystem(lua_State* L){}
FileSystem::~FileSystem(void){}

int FileSystem::MoveFile(lua_State* lua)
{
	printf("FileSystem::MoveFile:\n");
	return 0;
}
int FileSystem::GetCurrentDirectory(lua_State* lua)
{
	return 0;
}
int FileSystem::CopyFile(lua_State* lua)
{
	return 0;
}
int FileSystem::GetFileInfo(lua_State* lua)
{
	return 0;
}
int FileSystem::BuildPath(lua_State* lua)
{
	return 0;
}
int FileSystem::GetExtension(lua_State* lua)
{
	return 0;
}
int FileSystem::Foreach(lua_State* lua)
{
	return 0;
}
int FileSystem::GetSysPath(lua_State* lua)
{
	return 0;
}
int FileSystem::CreateFolder(lua_State* lua)
{
	return 0;
}
int FileSystem::DeleteFile(lua_State* lua)
{
	return 0;
}
int FileSystem::RenameFile(lua_State* lua)
{
	return 0;
}
int FileSystem::DeleteFolder(lua_State* lua)
{
	return 0;
}
int FileSystem::GetDirectoryPath(lua_State* lua)
{
	return 0;
}
int FileSystem::SetCurrentDirectory(lua_State* lua)
{
	return 0;
}
int FileSystem::FileExist(lua_State* lua)
{
	return 0;
}
int FileSystem::GetFileName(lua_State* lua)
{
	return 0;
}
int FileSystem::SearchFile(lua_State* lua)
{
	return 0;
}
int FileSystem::GetPathInfo(lua_State* lua)
{
	return 0;
}
int FileSystem::StrReplacePathSpliteToUnixStyle(lua_State* lua)
{
	return 0;
}
int FileSystem::GetFileNameWithoutExtension(lua_State* lua)
{
	return 0;
}
int FileSystem::PackBundle(lua_State* lua)
{
	return 0;
}
int FileSystem::UnpackBundle(lua_State* lua)
{
	return 0;
}
int FileSystem::SearchFolder(lua_State* lua)
{
	return 0;
}
bool FileSystem::_MoveFile()
{
	return true;
}
bool FileSystem::_GetCurrentDirectory()
{
	return true;
}
bool FileSystem::_CopyFile()
{
	return true;
}
bool FileSystem::_GetFileInfo()
{
	return true;
}
bool FileSystem::_BuildPath()
{
	return true;
}
bool FileSystem::_GetExtension()
{
	return true;
}
bool FileSystem::_Foreach()
{
	return true;
}
bool FileSystem::_GetSysPath()
{
	return true;
}
bool FileSystem::_CreateFolder()
{
	return true;
}
bool FileSystem::_DeleteFile()
{
	return true;
}
bool FileSystem::_RenameFile()
{
	return true;
}
bool FileSystem::_DeleteFolder()
{
	return true;
}
bool FileSystem::_GetDirectoryPath()
{
	return true;
}
bool FileSystem::_SetCurrentDirectory()
{
	return true;
}
bool FileSystem::_FileExist()
{
	return true;
}
bool FileSystem::_GetFileName()
{
	return true;
}
bool FileSystem::_SearchFile()
{
	return true;
}
bool FileSystem::_GetPathInfo()
{
	return true;
}
bool FileSystem::_StrReplacePathSpliteToUnixStyle()
{
	return true;
}
bool FileSystem::_GetFileNameWithoutExtension()
{
	return true;
}
bool FileSystem::_PackBundle()
{
	return true;
}
bool FileSystem::_UnpackBundle()
{
	return true;
}
bool FileSystem::_SearchFolder()
{
	return true;
}

