
--start-------------------------------------------
-- 获取当前时间UTCtime

-- end --
if _G.GetTime == nil then
	GetTime = _GetTime;
end


_G.DateTime = {}

--如果只有dwYear 一个参数，那么dwYear表示的是一个UtcTime， 从全局函数 GetTime中获取
--如果没有参数那么表示当前时间
function DateTime:New(dwYear,dwMonth,dwDay,dwHour,dwMinute,dwSecond)
	return DateTime Object;
end

function DateTime:GetYear();

function DateTime:GetMonth();

function DateTime:GetDay();

function DateTime:GetDayOfYear();

function DateTime:GetDayOfWeek();

function DateTime:GetHour();

function DateTime:GetMinute();

function DateTime:GetSecond();

function DateTime:DaysInMonth();

function DateTime:AddYear(dwValue);

function DateTime:AddMonth(dwValue);

function DateTime:AddDay(dwValue);

function DateTime:AddHour(dwValue);

function DateTime:AddMinute(dwValue);

function DateTime:AddSecond(dwValue);

function DateTime:AddMillSecond(dwValue);

function DateTime:ToString(dwValue);

function DateTime:GetUtcTime();


--eg: 获取当前时间

-- local tNow = DateTime:New();
-- print(tNow:ToString());
-- 
--下周的这个时候
-- tNow:AddDay(7);
-- print(tNow:ToString());

