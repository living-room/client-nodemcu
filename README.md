# client-nodemcu

Client for NodeMCU (Lua).

Run on an ESP8266 with the [NodeMCU
firmware](http://nodemcu.com/index_en.html) flashed.

Flash the firmware (you want modules http and adc and wifi at least),
then use [nodemcu-uploader](https://github.com/kmpm/nodemcu-uploader)
to upload the Lua files to the persistent MCU filesystem.

As of this writing, it continuously asserts the value on the analog
input pin to the Crosby server.

