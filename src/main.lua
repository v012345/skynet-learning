local skynet = require "skynet"
skynet.start(function()
    skynet.error("[start main] hello world")

    -- TODO 启动其他服务
    -- 启动打工服务，其中第二个参数和第三个参数会透传给service/worker/init.lua脚本
    local worker1 = skynet.newservice("worker", "worker", 1)

    -- 启动买猫粮服务
    local buy1 = skynet.newservice("buy", "buy", 1)

    -- 开始工作
    skynet.send(worker1, "lua", "start_work")
    -- 主服务休息2秒，注意，这里是主服务休息2秒，并不会卡住worker服务
    skynet.sleep(200)
    -- 停止工作
    skynet.send(worker1, "lua", "stop_work")

    -- 买猫粮
    skynet.send(buy1, "lua", "buy")


    skynet.exit()
end)
