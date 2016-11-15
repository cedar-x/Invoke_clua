
--[[--

创建一个类

**注意:** Lua 继承类覆盖的方法并不能从 C++ 调用到。也就是说通过 C++ 代码调用这个 cc.Node 对象的 setPosition() 方法时，并不会执行我们在 Lua 中定义的 Toolbar:setPosition() 方法。

@param string classname 类名
@param [mixed super] 父类或者创建对象实例的函数

@return table

--]]

_G.object = {}

setmetatable(object, {__call =
    function ( base ,init)
        local function createClass( base ,init)
            local class = init or {};
            class . base = base
            class .constructor= false
            class .instance= function (self, o, ...)
                local obj={}
                local arg = {...};
                --copy from self( class prototype)
                for k,v in pairs(self) do
                    obj[k] = v;
                end
                if (type(o) == "table" ) then
                    --copy from o
                    for k,v in pairs(o) do
                        obj[k] = v;
                    end
                else
                    table.insert(arg, 1, o);
                end
                
                do
                    local function call_constructor(c,...)
                        if c. base then
                            call_constructor(c. base ,...)
                        end
                        if c.constructor then
                            c.constructor(obj,...)
                        end
                    end
                    call_constructor( class ,table.unpack(arg))
                end
                setmetatable(obj,{ __index=self.base })
                return obj
            end
            setmetatable( class ,{
            __call = createClass,
            __index = class . base
            })
            
            return class
        end;

        return createClass( base ,init);
    end;
});

--[[
@param string classname 类名
@param [mixed super] 父类或者创建对象实例的函数

@return table

]]

_G.new = function(class, init, ...)
    return class:instance(init, ...);
end