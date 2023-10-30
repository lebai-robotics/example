import asyncio
import lebai_sdk

lebai_sdk.init()

async def main():
    # print(await lebai_sdk.discover_devices(2)) #发现同一局域网内的机器人

    robot_ip = "192.168.x.x" #设定机器人ip地址，需要根据机器人实际ip地址修改
    lebai = await lebai_sdk.connect(robot_ip, False) #创建实例
    await lebai.start_sys() #启动手臂
    await lebai.start_task("10087", None, None, False, 1) #调用场景
    await lebai.stop_sys() #停止手臂

asyncio.run(main())