
function sub_1()
  -- define sub program 1 here
  print("sub 1")
end


function sub_2()
  -- define sub program 2 here
  print("sub 2")
end

while(true)
do
  if (get_dio(0) == 1 and get_dio(1) == 1) then
    sub_1()
  elseif(get_tcp_dio(0) == 1) then
    sub_2()
  else
    print("else")
  end
  -- 此处务必要增加一个wait等待，否则会跑高速的while循环，会导致系统资源耗尽甚至死机，等待时间单位为毫秒
  wait(200)
end

