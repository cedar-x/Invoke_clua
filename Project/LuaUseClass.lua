setfenv = setfenv or function(f, t)
     f = (type(f) == 'function' and f or debug.getinfo(f + 1, 'f').func)
     local name
     local up = 0
     repeat
         up = up + 1
         name = debug.getupvalue(f, up)
     until name == '_ENV' or name == nil
     if name then
         debug.upvaluejoin(f, up, function() return name end, 1)  -- use unique upvalue
         debug.setupvalue(f, up, t)
     end
end

_G.ServerLuaEnv = {};
setmetatable(ServerLuaEnv, {__index = _G, __newindex = function(tab, key, value)
	if type(value) == "function" then 
		-- print("sf:", tab, key, value);
		rawset(_G, key, value);
		return;
	end
	print(key .. "=======_G not Exist========字段是不存在的，不要试图给它赋值！");
 end});
setfenv(1, ServerLuaEnv);
for i, v in pairs(_G) do 
	print(i, ":", v)
end
function FileSystem22:MoveFile22()
	print("FileSystem22:MoveFile22")
	self:MoveFile();
end
FileSystem:MoveFile22();
print("===============111=============================")
local test = FileSystem22()
test:MoveFile22();
print("===============2222============================", test)
collectgarbage("collect")
print("===============3333============================")

-- for i, v in pairs(_G) do 
-- 	print(i, ":", v)
-- end
function main()
	print("======main=============")
end