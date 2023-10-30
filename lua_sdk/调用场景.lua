local lebai_sdk = require('lebai_sdk')
lebai_sdk.init()

function main()
    -- 设备发现
    print(lebai_sdk.discover_devices(2))

    local lebai = lebai_sdk.connect("127.0.0.1", false)
    lebai:start_sys()
    lebai:start_task("10087", nil, nil, false, 1)
end

co = coroutine.create(main)
while coroutine.status(co) ~= "dead" do
  coroutine.resume(co)
end
