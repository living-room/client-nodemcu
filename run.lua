local SERVER = 'http://crosby.cluster.recurse.com:3000'
function roomAssert(facts, cb)
  http.post(SERVER..'/assert', 'Content-Type: application/json\r\n',
    sjson.encode({facts=facts}),
    cb or function (a, b) print(a, b) end)
end
function roomRetract(facts, cb)
  http.post(SERVER..'/retract', 'Content-Type: application/json\r\n',
    sjson.encode({facts=facts}),
    cb or function (a, b) print(a, b) end)
end

local mac = wifi.sta.getmac()
roomAssert({'"'..mac..'" got ip "'..wifi.sta.getip()..'"',
            'mcuManager is active'}, function (status, x)

if status == -1 then print(status, x) return end

-- Check the ADC and assert its value every so often.
local adctmr = tmr.create()
local seq = 0
adctmr:alarm(100, tmr.ALARM_SEMI, function ()
  roomAssert({'"'..mac..'" has analog value '..adc.read(0)..' @ '..seq}, function (status, x)
    if status == -1 then print(status, x) return end
    seq = seq + 1
    adctmr:start()
  end)
end)

end)
