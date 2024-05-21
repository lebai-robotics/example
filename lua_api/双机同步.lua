disable_auto_sync()

lebai = lebai_sdk.connect("127.0.0.1", false)
target = lebai_sdk.connect("192.168.4.35", false) -- 被控机器
target:start_sys() -- 使能被控机器
wait(3000)

-- 让被控机器运动到本机的当前位置
pose = (lebai:get_kin_data())["actual_joint_pose"]
target:movej(pose, 0.1, 0.1, 0, 0) 
target:wait_move()

print("start")
last_time = timestamp() --上一次同步的毫秒时间戳
while true
do
    wait(10)
    now = timestamp()
    used_time = now-last_time
    last_time = now

    -- 同步手臂位置
    status = lebai:get_kin_data()
    target:move_pvat(status["actual_joint_pose"], status["actual_joint_speed"], status["actual_joint_acc"], used_time/1000) --同步运动
end
