local skynet = require "skynet"
skynet.start(function()
    skynet.error("[start main] hello world")

    -- TODO 启动其他服务
    -- 启动打工服务，其中第二个参数和第三个参数会透传给service/worker/init.lua脚本
    local worker1 = skynet.newservice("worker", "worker", 1)

    skynet.exit()
end)
