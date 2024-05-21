function on_robot_stop(is_estop)
    -- 覆盖默认的停机函数，禁止停机时停止任务
end

while(true)
do
    local val = get_signal(100)
    if(val ~= 0)
    then
        set_signal(100, 0)
        scene(val)
        set_signal(101, val)
    end

    wait(20)
end
