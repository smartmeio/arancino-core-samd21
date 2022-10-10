# Arduino Core for Arancino SAMD21 Boards
![Release](https://img.shields.io/github/v/release/smartmeio/arancino-core-samd21?style=plastic)

This core is a fork of the [Arduino SAMD21](https://github.com/arduino/ArduinoCore-samd) core modified to support the functionality of the Arancino architecture.

# Supported Boards
* Arancino
* Arancino Mignon

## Installation on Arduino IDE

This core is available as a package in the Arduino IDE cores manager. If you want to install it:

  1. Open the **Preferences** of the Arduino IDE.
  2. Add this URL `https://raw.githubusercontent.com/smartmeio/arancino-boards/master/package_smartmeio_index.json` in the **Additional Boards Manager URLs** field, and click OK.
  3. Open the **Boards Manager** (menu `Tools` -> `Board` -> `Board Manager...`)
  4. Install **Arancino SAMD Boards**
  5. Select one of the boards under **Arancino SAMD Boards** in `Tools` -> `Board` menu

## Installation on PlatformIO and Visual Studio Code
To create a project with Visual Studio Code and PlatformIO it is necessary to initially create a project for `Arduino M0` and then modify the `platformio.ini` file in order to point to the Arancino packages. The `platformio.ini` file must be modififed in order to contains this configuration:
```
[env:arancinosamd]
platform = https://github.com/smartmeio/platform-atmelsam.git#8.1.0-arancino
board = arancino
framework = arduino
upload_protocol = sam-ba
platform_packages = smartme-io/framework-arduino-samd-arancino@https://git.smartme.io/smartme.io/arancino/ide/smartmeio-arancino-platform.git
upload_port = ...
```
Any used library (e.g. Arancino library) must be included under the `lib` folder, so the project structure should look like:
```
include
lib
+-- your_library
     +-- examples
     +-- include
     +-- keywords.txt
     +-- library.json
     +-- src
src
+-- main.cpp
test
```

Alternatively, you can set an extra directory in which to search for libraries. For example, if you want to include all the libraries installed in the Arduino IDE, you can specify it adding this lines to the `platformio.ini` configuration file:
```
lib_extra_dirs = ~/Arduino/libraries
```

# Uploading Sketches

### Arduino IDE
Select the appropriate serial port shown in the Arduino `Tools` -> `Port` -> `Serial Port` menu once (this setting will stick and does not need to be
touched for multiple uploads). This selection allows the auto-reset tool to identify the proper device to reset.

### PlatformIO
Set the appropriate serial port into the `platformio.ini` file, e.g.:
```
upload_port = /dev/ttyACM1
```
Then hit the upload button and your sketch should upload and run.

In some cases the MCU will encounter a hard hang and its USB port will not respond to the auto-reset request. Should this happen, put the MCU in `bootloader mode` double-tapping the reset button and then retry the upload on the new serial port.

# Debugging with OpenOCD and GDB

### PlatformIO
To debug the code you need an external debugger (e.g. Atmel EDBG, Ateml ICE, etc).

This additional debugging information can be added to the `platformio.ini` file in order to improve the debugging process.
```
build_type = debug
lib_archive = no
```

# Enabling FreeRTOS support
This core supports FreeRTOS: to include and enable it just include the `Arancino.h` library and, depending on the used IDE, enable it. 

### Arduino IDE
Through the menu `Tools` -> `Using FreeRTOS` -> `Yes`.

### PlatformIO
Add an extra flag to the `platformio.ini` configuration file:
```
build_flags = -DUSEFREERTOS
```


# Licensing and Credits
* The [Arduino SAMD21 core](https://github.com/arduino/ArduinoCore-samd) is developed and maintained by Arduino LLC in collaboration with Atmel.
* The [Arduino IDE and ArduinoCore-API](https://arduino.cc) are developed and maintained by the Arduino team. The IDE is licensed under GPL.
* [FreeRTOS](https://freertos.org) is Copyright Amazon.com, Inc. or its affiliates, and distributed under the MIT license.

This core has been developed by Arduino LLC in collaboration with Atmel, 
and customized by smartme.IO s.r.l.

```
  Copyright (c) 2019 smartme.IO.  All right reserved.

  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
  See the GNU Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
```

Arduino and Atmel are trademarks of their respective owners.
