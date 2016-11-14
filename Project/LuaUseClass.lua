-- ret ,err= pcall(f, "hello world")
-- print( ret)
-- print(err)
-- print("okkkkkkkkkkk")
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

