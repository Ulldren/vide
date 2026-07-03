type function Read(t: type): type
    if t:is("union") then
        for _, component in t:components() do
            if not component:is("function") then
                return component
            end
        end
    end
    
    return if t:is("function") then (t:returns().head :: { type })[1] else t
end

local function read<T>(value: T | () -> T): Read<T>
    return if type(value) == "function" then value() else value
end

return read
