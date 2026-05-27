hs.alert.show("Hammerspoon OK")

local base = hs.configdir
local script = base .. "/openvpn_script/vpn-auto.exp"
local log = base .. "/openvpn_script/exec_openvpn.log"

-- 执行函数
local function run(cmd)
  hs.task.new("/bin/zsh", nil, {"-c", cmd}):start()
end

-- VPN connect
hs.hotkey.bind({"cmd", "alt"}, "O", function()
  hs.alert.show("VPN connecting...")
  run(script .. " connect >> " .. log .. " 2>&1 &")
end)

-- VPN disconnect
hs.hotkey.bind({"cmd", "alt"}, "P", function()
  hs.alert.show("VPN disconnecting...")
  run(script .. " disconnect >> " .. log .. " 2>&1 &")
end)