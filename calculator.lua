-- Lua - 绝对值计算
function absolute(x)
    return math.abs(x)
end

local file = io.open("input.txt", "r")
if file then
    local output = "Lua绝对值计算:\n"
    local i = 1
    
    for line in file:lines() do
        local a, b = line:match("([%-%d%.]+)%s+([%-%d%.]+)")
        if a and b then
            a = tonumber(a)
            b = tonumber(b)
            local absA = absolute(a)
            local absB = absolute(b)
            output = output .. string.format("行%d: |%.2f| = %.2f, |%.2f| = %.2f\n", 
                i, a, absA, b, absB)
            i = i + 1
        end
    end
    
    file:close()
    
    -- 追加到输出文件
    local outFile = io.open("output.txt", "a")
    if outFile then
        outFile:write(output .. "\n")
        outFile:close()
    end
    
    print("Lua绝对值计算完成!")
else
    print("Lua无法打开输入文件")
end