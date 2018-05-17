-- For esp82
wifi.setmode(wifi.STATION)
wifi.sta.config {ssid='Recurse Center', pwd='nevergraduate!'}

cnt = 0
local wifitmr = tmr.create()
wifitmr:alarm(3000, 1, function()
  if (wifi.sta.getip() == nil) and (cnt < 20) then 
    print("IP unavailable. Waiting...")
    cnt = cnt + 1
  else
    wifitmr:stop()
    if (cnt < 20) then
      print("Config done. IP is "..wifi.sta.getip())
      dofile("run.lua")
    else
      print("Network setup timeout.")
    end
  end
end)
