name = "test"

function on_robot_state(state)
    if state == 11
    then
        -- 进入示教模式时，开始轨迹记录
        start_record_trajectory(0.01)
    end
    if last_state == 11
    then
        -- 退出示教模式时，完成轨迹记录
        end_record_trajectory(name)
        -- 复现轨迹
        move_trajectory(name)
    end

    last_state = state
end

while true
do
    -- move_trajectory(name)
    sleep(1000)
end
