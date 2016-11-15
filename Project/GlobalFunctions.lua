if _G.GetTime == nil then
	GetTime = _GetTime;
end

----------------------------------------------
-- @module functions
-- 提供一组常用函数，以及对 Lua 标准库的扩展
-----------------------------------------------

--start-------------------------------------------
-- 输出格式化字符串
-- @param string fmt 输出格式
-- @param [mixed ...] 更多参数
-- printf("The value = %d", 100)

-- end --
function printf(fmt, ...)
    print(string.format(tostring(fmt), ...))
end


--------------------------------
-- 根据系统时间初始化随机数种子，让后续的 math.random() 返回更随机的值
-- @function [parent=#math] newrandomseed

-- end --
function math.newrandomseed()
    local ok, socket = pcall(function()
        return require("socket")
    end)

    if ok then
        -- 如果集成了 socket 模块，则使用 socket.gettime() 获取随机数种子
        math.randomseed(socket.gettime())
    else
        math.randomseed(os.time())
    end
    math.random()
    math.random()
    math.random()
    math.random()
end

-- start ----------------------------------
-- 对数值进行四舍五入，如果不是数值则返回 0
-- @function [parent=#math] round
-- @param number value 输入值
-- @return number#number 

-- end --
function math.round(value)
    value = checknumber(value)
    return math.floor(value + 0.5)
end

-- start ----------------------------------
-- 角度转弧度
-- @function [parent=#math] angle2radian

-- end --
function math.angle2radian(angle)
	return angle*math.pi/180
end

-- start ----------------------------------
-- 弧度转角度
-- @function [parent=#math] radian2angle

-- end --
function math.radian2angle(radian)
	return radian/math.pi*180
end

--------------------------------
-- @module table

-- start --

--------------------------------
-- 计算表格包含的字段数量
-- @function [parent=#table] nums
-- @param table t 要检查的表格
-- @return integer#integer 

-- Lua table 的 "#" 操作只对依次排序的数值下标数组有效，table.nums() 则计算 table 中所有不为 nil 的值的个数。

-- end --
function table.nums(t)
    local count = 0
    for k, v in pairs(t) do
        count = count + 1
    end
    return count
end

-- start ----------------------------------
-- 返回指定表格中的所有键
-- @function [parent=#table] keys
-- @param table hashtable 要检查的表格
-- @return table#table 

--[[  Example
local hashtable = {a = 1, b = 2, c = 3}
local keys = table.keys(hashtable)
keys = {"a", "b", "c"}
--]]

-- end --
function table.keys(hashtable)
    local keys = {}
    for k, v in pairs(hashtable) do
        keys[#keys + 1] = k
    end
    return keys
end

-- start ----------------------------------
-- 返回指定表格中的所有值
-- @function [parent=#table] values
-- @param table hashtable 要检查的表格
-- @return table#table 

--[[  Example
local hashtable = {a = 1, b = 2, c = 3}
local values = table.values(hashtable)
-- values = {1, 2, 3}
]]

-- end --
function table.values(hashtable)
    local values = {}
    for k, v in pairs(hashtable) do
        values[#values + 1] = v
    end
    return values
end

-- start ----------------------------------
-- 将来源表格中所有键及其值复制到目标表格对象中，如果存在同名键，则覆盖其值
-- @function [parent=#table] merge
-- @param table dest 目标表格
-- @param table src 来源表格

--[[  Example
local dest = {a = 1, b = 2}
local src  = {c = 3, d = 4}
table.merge(dest, src)
-- dest = {a = 1, b = 2, c = 3, d = 4}
]]

-- end --
function table.merge(dest, src)
    for k, v in pairs(src) do
        dest[k] = v
    end
end

-- start ----------------------------------
-- 在目标表格的指定位置插入来源表格，如果没有指定位置则连接两个表格
-- @function [parent=#table] insertto
-- @param table dest 目标表格
-- @param table src 来源表格
-- @param integer begin 插入位置,默认最后

--[[  Example
local dest = {1, 2, 3}
local src  = {4, 5, 6}
table.insertto(dest, src)
-- dest = {1, 2, 3, 4, 5, 6}

dest = {1, 2, 3}
table.insertto(dest, src, 5)
-- dest = {1, 2, 3, nil, 4, 5, 6}

]]

-- end --
function table.insertto(dest, src, begin)
	begin = checkint(begin)
	if begin <= 0 then
		begin = #dest + 1
	end

	local len = #src
	for i = 0, len - 1 do
		dest[i + begin] = src[i + 1]
	end
end

-- start ----------------------------------
-- 从表格中查找指定值，返回其索引，如果没找到返回 false
-- @function [parent=#table] indexof
-- @param table array 表格
-- @param mixed value 要查找的值
-- @param integer begin 起始索引值
-- @return integer#integer 

--[[  Example
local array = {"a", "b", "c"}
print(table.indexof(array, "b")) -- 输出 2
]]

-- end --
function table.indexof(array, value, begin)
    for i = begin or 1, #array do
        if array[i] == value then return i end
    end
	return false
end

-- start ----------------------------------
-- 从表格中查找指定值，返回其 key，如果没找到返回 nil
-- @function [parent=#table] keyof
-- @param table hashtable 表格
-- @param mixed value 要查找的值
-- @return string#string  该值对应的 key

--[[  Example
local hashtable = {name = "dualface", comp = "chukong"}
print(table.keyof(hashtable, "chukong")) -- 输出 comp
]]

-- end --
function table.keyof(hashtable, value)
    for k, v in pairs(hashtable) do
        if v == value then return k end
    end
    return nil
end

-- start ----------------------------------
-- 从表格中删除指定值，返回删除的值的个数
-- @function [parent=#table] removebyvalue
-- @param table array 表格
-- @param mixed value 要删除的值
-- @param boolean removeall 是否删除所有相同的值
-- @return integer#integer 

--[[--Example
local array = {"a", "b", "c", "c"}
print(table.removebyvalue(array, "c", true)) -- 输出 2
]]

-- end --
function table.removebyvalue(array, value, removeall)
    local c, i, max = 0, 1, #array
    while i <= max do
        if array[i] == value then
            table.remove(array, i)
            c = c + 1
            i = i - 1
            max = max - 1
            if not removeall then break end
        end
        i = i + 1
    end
    return c
end

-- start ----------------------------------
-- 对表格中每一个值执行一次指定的函数，并用函数返回值更新表格内容
-- @function [parent=#table] map
-- @param table t 表格
-- @param function fn 函数

--[[--Example
local t = {name = "dualface", comp = "chukong"}
table.map(t, function(v, k)
    -- 在每一个值前后添加括号
    return "[" .. v .. "]"
end)

-- 输出修改后的表格内容
for k, v in pairs(t) do
    print(k, v)
end

-- 输出
-- name [dualface]
-- comp [chukong]

~~~
fn 参数指定的函数具有两个参数，并且返回一个值。原型如下：
function map_function(value, key)
    return value
end

]]

-- end --
function table.map(t, fn)
    for k, v in pairs(t) do
        t[k] = fn(v, k)
    end
end

-- start ----------------------------------
-- 对表格中每一个值执行一次指定的函数，但不改变表格内容
-- @function [parent=#table] walk
-- @param table t 表格
-- @param function fn 函数

--[[--Example
local t = {name = "dualface", comp = "chukong"}
table.walk(t, function(v, k)
    -- 输出每一个值
    print(v)
end)

~~~
fn 参数指定的函数具有两个参数，没有返回值。原型如下：
function map_function(value, key)

end

]]

-- end --
function table.walk(t, fn)
    for k,v in pairs(t) do
        fn(v, k)
    end
end

-- start ----------------------------------
-- 对表格中每一个值执行一次指定的函数，如果该函数返回 false，则对应的值会从表格中删除
-- @function [parent=#table] filter
-- @param table t 表格
-- @param function fn 函数

--[[--Example
local t = {name = "dualface", comp = "chukong"}
table.filter(t, function(v, k)
    return v ~= "dualface" -- 当值等于 dualface 时过滤掉该值
end)

-- 输出修改后的表格内容
for k, v in pairs(t) do
    print(k, v)
end

-- 输出
-- comp chukong

~~~
fn 参数指定的函数具有两个参数，并且返回一个 boolean 值。原型如下：
function map_function(value, key)
    return true or false
end

]]

-- end --
function table.filter(t, fn)
    for k, v in pairs(t) do
        if not fn(v, k) then t[k] = nil end
    end
end

-- start ----------------------------------
-- 遍历表格，确保其中的值唯一
-- @function [parent=#table] unique
-- @param table t 表格
-- @param boolean bArray t是否是数组,是数组,t中重复的项被移除后,后续的项会前移
-- @return table#table  包含所有唯一值的新表格

--[[--
local t = {"a", "a", "b", "c"} -- 重复的 a 会被过滤掉
local n = table.unique(t)

for k, v in pairs(n) do
    print(v)
end

-- 输出
-- a
-- b
-- c

]]

-- end --
function table.unique(t, bArray)
    local check = {}
    local n = {}
    local idx = 1
    for k, v in pairs(t) do
        if not check[v] then
            if bArray then
                n[idx] = v
                idx = idx + 1
            else
                n[k] = v
            end
            check[v] = true
        end
    end
    return n
end


--------------------------------
-- @module string


string._htmlspecialchars_set = {}
string._htmlspecialchars_set["&"] = "&amp;"
string._htmlspecialchars_set["\""] = "&quot;"
string._htmlspecialchars_set["'"] = "&#039;"
string._htmlspecialchars_set["<"] = "&lt;"
string._htmlspecialchars_set[">"] = "&gt;"

-- start ----------------------------------
-- 将特殊字符转为 HTML 转义符
-- @function [parent=#string] htmlspecialchars
-- @param string input 输入字符串
-- @return string#string  转换结果

--[[--
print(string.htmlspecialchars("<ABC>"))
-- 输出 &lt;ABC&gt;

]]

-- end --
function string.htmlspecialchars(input)
    for k, v in pairs(string._htmlspecialchars_set) do
        input = string.gsub(input, k, v)
    end
    return input
end

-- start ----------------------------------
-- 将 HTML 转义符还原为特殊字符，功能与 string.htmlspecialchars() 正好相反
-- @function [parent=#string] restorehtmlspecialchars
-- @param string input 输入字符串
-- @return string#string  转换结果

--[[--
print(string.restorehtmlspecialchars("&lt;ABC&gt;"))
-- 输出 <ABC>

]]

-- end --

function string.restorehtmlspecialchars(input)
    for k, v in pairs(string._htmlspecialchars_set) do
        input = string.gsub(input, v, k)
    end
    return input
end

-- start ----------------------------------
-- 将字符串中的 \n 换行符转换为 HTML 标记
-- @function [parent=#string] nl2br
-- @param string input 输入字符串
-- @return string#string  转换结果

--[[--
print(string.nl2br("Hello\nWorld"))
-- 输出
-- Hello<br />World

]]

-- end --
function string.nl2br(input)
    return string.gsub(input, "\n", "<br />")
end

-- start ----------------------------------
-- 将字符串中的特殊字符和 \n 换行符转换为 HTML 转移符和标记
-- @function [parent=#string] text2html
-- @param string input 输入字符串
-- @return string#string  转换结果

--[[--
print(string.text2html("<Hello>\nWorld"))
-- 输出
-- &lt;Hello&gt;<br />World

]]

-- end --

function string.text2html(input)
    input = string.gsub(input, "\t", "    ")
    input = string.htmlspecialchars(input)
    input = string.gsub(input, " ", "&nbsp;")
    input = string.nl2br(input)
    return input
end

-- start ----------------------------------
-- 用指定字符或字符串分割输入字符串，返回包含分割结果的数组
-- @function [parent=#string] split
-- @param string input 输入字符串
-- @param string delimiter 分割标记字符或字符串
-- @return array#array  包含分割结果的数组

--[[--
local input = "Hello,World"
local res = string.split(input, ",")
-- res = {"Hello", "World"}

local input = "Hello-+-World-+-Quick"
local res = string.split(input, "-+-")
-- res = {"Hello", "World", "Quick"}

]]
-- end --
function string.split(input, delimiter)
    input = tostring(input)
    delimiter = tostring(delimiter)
    if (delimiter=='') then return false end
    local pos,arr = 0, {}
    -- for each divider found
    for st,sp in function() return string.find(input, delimiter, pos, true) end do
        table.insert(arr, string.sub(input, pos, st - 1))
        pos = sp + 1
    end
    table.insert(arr, string.sub(input, pos))
    return arr
end

-- start ----------------------------------
-- 去除输入字符串头部的空白字符，返回结果
-- @function [parent=#string] ltrim
-- @param string input 输入字符串
-- @return string#string  结果
-- @see string.rtrim, string.trim

--[[--
local input = "  ABC"
print(string.ltrim(input))
-- 输出 ABC，输入字符串前面的两个空格被去掉了

空白字符包括：
-   空格
-   制表符 \t
-   换行符 \n
-   回到行首符 \r

]]

-- end --

function string.ltrim(input)
    return string.gsub(input, "^[ \t\n\r]+", "")
end

-- start ----------------------------------
-- 去除输入字符串尾部的空白字符，返回结果
-- @function [parent=#string] rtrim
-- @param string input 输入字符串
-- @return string#string  结果
-- @see string.ltrim, string.trim

--[[--
local input = "ABC  "
print(string.rtrim(input))
-- 输出 ABC，输入字符串最后的两个空格被去掉了

]]

-- end --

function string.rtrim(input)
    return string.gsub(input, "[ \t\n\r]+$", "")
end

-- start ----------------------------------
-- 去掉字符串首尾的空白字符，返回结果
-- @function [parent=#string] trim
-- @param string input 输入字符串
-- @return string#string  结果
-- @see string.ltrim, string.rtrim

-- end --

function string.trim(input)
    input = string.gsub(input, "^[ \t\n\r]+", "")
    return string.gsub(input, "[ \t\n\r]+$", "")
end

-- start ----------------------------------
-- 将字符串的第一个字符转为大写，返回结果
-- @function [parent=#string] ucfirst
-- @param string input 输入字符串
-- @return string#string  结果

--[[--
local input = "hello"
print(string.ucfirst(input))
-- 输出 Hello

]]

-- end --

function string.ucfirst(input)
    return string.upper(string.sub(input, 1, 1)) .. string.sub(input, 2)
end


local function urlencodechar(char)
    return "%" .. string.format("%02X", string.byte(char))
end
-- start ----------------------------------
-- 将字符串转换为符合 URL 传递要求的格式，并返回转换结果
-- @function [parent=#string] urlencode
-- @param string input 输入字符串
-- @return string#string  转换后的结果
-- @see string.urldecode

--[[--
local input = "hello world"
print(string.urlencode(input))
-- 输出
-- hello%20world

]]

-- end --
function string.urlencode(input)
    -- convert line endings
    input = string.gsub(tostring(input), "\n", "\r\n")
    -- escape all characters but alphanumeric, '.' and '-'
    input = string.gsub(input, "([^%w%.%- ])", urlencodechar)
    -- convert spaces to "+" symbols
    return string.gsub(input, " ", "+")
end

-- start ----------------------------------
-- 将 URL 中的特殊字符还原，并返回结果
-- @function [parent=#string] urldecode
-- @param string input 输入字符串
-- @return string#string  转换后的结果
-- @see string.urlencode

--[[--
local input = "hello%20world"
print(string.urldecode(input))
-- 输出
-- hello world

]]

-- end --

function string.urldecode(input)
    input = string.gsub (input, "+", " ")
    input = string.gsub (input, "%%(%x%x)", function(h) return string.char(checknumber(h,16)) end)
    input = string.gsub (input, "\r\n", "\n")
    return input
end

-- start ----------------------------------
-- 计算 UTF8 字符串的长度，每一个中文算一个字符
-- @function [parent=#string] utf8len
-- @param string input 输入字符串
-- @return integer#integer  长度

--[[--
local input = "你好World"
print(string.utf8len(input))
-- 输出 7

]]

-- end --

function string.utf8len(input)
    local len  = string.len(input)
    local left = len
    local cnt  = 0
    local arr  = {0, 0xc0, 0xe0, 0xf0, 0xf8, 0xfc}
    while left ~= 0 do
        local tmp = string.byte(input, -left)
        local i   = #arr
        while arr[i] do
            if tmp >= arr[i] then
                left = left - i
                break
            end
            i = i - 1
        end
        cnt = cnt + 1
    end
    return cnt
end

-- start ----------------------------------
-- 将数值格式化为包含千分位分隔符的字符串
-- @function [parent=#string] formatnumberthousands
-- @param number num 数值
-- @return string#string  格式化结果

--[[--
print(string.formatnumberthousands(1924235))
-- 输出 1,924,235

]]

-- end --

function string.formatnumberthousands(num)
    local formatted = tostring(checknumber(num))
    local k
    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if k == 0 then break end
    end
    return formatted
end
