tasks = {}

-- 取消全部任务
function cancel_all_tasks()
    for k,v in pairs(tasks) do
        print(k,v)
        cancel_task(v)
        tasks[k] = nil
    end
end

while true do
    wait(100) -- 0.1s检测一次

    if get_di(0) == 0 then
        wait_di(0, 0, "=")  -- 等待释放按键
        cancel_all_tasks()
        tasks["0"] = start_task("10160", {}, "", true, 1)
    end
    if get_di(1) == 1 then
        wait_di(1, 0, "=")  -- 等待释放按键
        cancel_all_tasks()
        tasks["1"] = start_task("10160", {}, "", true, 1)
    end
    if get_signal(0) == 1  then
        set_signal(0, 0)  -- 复位保持寄存器1000
        cancel_all_tasks()
        tasks["10"] = start_task("10160", {}, "", true, 1)
    end
    if get_signal(1) == 1  then
        set_signal(1, 0)  -- 复位保持寄存器1001
        cancel_all_tasks()
        tasks["11"] = start_task("10160", {}, "", true, 1)
    end
end

