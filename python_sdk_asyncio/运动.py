import asyncio
import lebai_sdk

lebai_sdk.init()

async def main():
    # print(await lebai_sdk.discover_devices(2)) #发现同一局域网内的机器人

    robot_ip = "192.168.x.x" #设定机器人ip地址，需要根据机器人实际ip地址修改
    lebai = await lebai_sdk.connect(robot_ip, False) #创建实例
    await lebai.start_sys() #启动手臂
    joint_pose = [0,-1.05,1.05,0,1.57,0] #目标位姿关节数据
    cartesian_pose = {'x' : -0.383, 'y' : -0.121, 'z' : 0.36, 'rz' : -1.57, 'ry' : 0, 'rx' : 1.57}#目标位姿笛卡尔数据
    a = 0.5 #关节加速度 (rad/s2)
    v = 0.2 #关节速度 (rad/s)
    t = 0   #运动时间 (s)。 当 t > 0 时，参数速度 v 和加速度 a 无效
    r = 0   #交融半径 (m)。用于指定路径的平滑效果
    await lebai.movej(joint_pose,a,v,t,r) #关节运动 https://help.lebai.ltd/sdk/motion.html#%E5%85%B3%E8%8A%82%E8%BF%90%E5%8A%A8
    a = 0.3 #空间加速度 (m/s2)
    v = 0.1 #空间速度 （m/s）
    t = 0   #运动时间 (s)。 当 t > 0 时，参数速度 v 和加速度 a 无效
    r = 0   #交融半径 (m)。用于指定路径的平滑效果
    await lebai.movel(cartesian_pose,a,v,t,r) #直线运动 https://help.lebai.ltd/sdk/motion.html#%E7%9B%B4%E7%BA%BF%E8%BF%90%E5%8A%A8
    await lebai.wait_move() #等待运动完成
    await lebai.stop_sys() #停止手臂

asyncio.run(main())