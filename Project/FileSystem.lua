
_G.FileSystem={}

-- 设置当前的相对路径
function FileSystem:SetCurrentDirectory(path)

end

-- 得到当前路径
function FileSystem:GetCurrentDirectory()

end

-- 搜索文件
-- eg local files = FileSystem:SearchFile("D:/works/*.log");
-- 
function FileSystem:SearchFile(pattern,bFullPath,bSearchHide)

end

-- 搜索指定目录下的子目录
function FileSystem:SearchFolder(path,bRecursive,bSearchHide)

end

-- 得到一个文件所在的文件夹
-- eg: local folder = FileSystem:GetDirectoryPath("D:/works/hello.log");
-- "folder=D:/works"
function FileSystem:GetDirectoryPath(filePath)

end

-- 得到文件名
-- eg: print(FileSystem:GetFileName("D:/works/hello.log")); 返回 hello.log
function FileSystem:GetFileName(filePath)

end

-- 得到不带扩展名的文件名
function FileSystem:GetFileNameWithoutExtension(filePath)

end

-- 得到扩展名部分
function FileSystem:GetExtension(filePath)

end

-- 得到文件信息,如文件大小，创建日期,最后一次访问时间，以及修改时间,是否隐藏，文件类型等
-- return fileInfo,code,errInfo
function FileSystem:GetFileInfo(filePath)

end

-- 返回路径对应的文件信息
-- directory 如果path是文件夹
-- file 如果path是文件
-- nil 如果路径不对应任何文件
-- invalid 如果是无效的路径
function FileSystem:GetPathInfo(path)

end

-- 移动文件,返回0成功没有错误
-- 返回code,errInfo
function FileSystem:MoveFile(src,dst,bOverride)

end

-- 复制文件到指定目录
-- return code,errInfo
function FileSystem:CopyFile(src,dst,bOverride)

end

-- 删除文件
-- return code,errInfo
function FileSystem:DeleteFile(filePath)

end

-- 删除文件夹
-- path:要删除的路径必须是个文件夹
-- bRecursive:是否递归删除子目录
-- return: code, errInfo
function FileSystem:DeleteFolder(path,bRecursive)

end

-- 更具指定的路径构建文件夹目录
function FileSystem:BuildPath(path)

end

-- 创建文件夹
-- return code,errInfo
function FileSystem:CreateFolder(folderPath)

end

-- 将文件打包到一个指定地址
-- return code, errInfo
function FileSystem:PackPackage(folder,dstPath)

end

-- 将压缩包解压到指定文件位置
function FileSystem:UnpackPackage(packagePath,dstPath)
	
end
