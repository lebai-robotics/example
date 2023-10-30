com1 = serial.open("/dev/ttyS1")
com1:set_timeout(0)
com1:set_baud_rate(9600)

function recv_data()
	-- 读取串口，使用pcall捕获错误
	success, result = pcall(function() return com1:read() end)
	if success then
	  local data = string.char(table.unpack(result))
	  return data
	else
	  print("Error: ", result)
	end
end

while true
do
	data = recv_data()
	if(data == "1")
	then
		movej({j1 = 0, j2 = 0, j3 = 0, j4 = 0, j5 = 0, j6 = 0}, 0.1, 0.1, 0, 0)
		sync() -- 等待运动结束
		local str = "finish 1"
		com1:write({string.byte(str, 1, #str)}) -- 发送字符串
	elseif(data == "2")
	then
		scene(10001) -- 执行场景
		local str = "finish 2"
		com1:write({string.byte(str, 1, #str)}) -- 发送字符串
	else
	    print("unknown data:", data)
    end
end
