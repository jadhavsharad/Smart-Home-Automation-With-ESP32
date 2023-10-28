# 🏡 Smart Home Automation Using Firebase and ESP32

This "Home Automation System" combines a number of modern tools and technologies to create a comprehensive and intelligent method to manage and monitor a home environment. The major hardware components of the project consist of an ESP32 microcontroller, a 2-channel relay for device control, a DHT11 sensor for temperature and humidity readings, and a photodiode for fire detection.The personalized smartphone app has a straightforward interface for controlling lighting and other home appliances connected to the relay. Users may remotely monitor their home environment, manage tasks, and personalize settings.
<br><br>
Let's Get Started...
<br><br>
**Components Required**

**1. ESP32** <br>
**2. DHT11 Sensor** <br>
**3. Relay Module** <br>
**4. Photodiode** <br>
**5. Some Jumper Wires** <br>
**6. Any AC Device** <br>
<br>

## First let's setup our Realtime Firebase Database

Step 1: Visit `https://firebase.google.com/`

<img width="1680" alt="Screenshot 2023-10-28 at 5 03 05 PM" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/7a84446c-4b57-4a1d-8117-023d537d6c66">

Step  2: Click on Get Started

<img width="1680" alt="Screenshot 2023-10-28 at 5 12 22 PM" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/571d225c-8e6b-4ca5-9213-9305cded9bd4">

Step 3: Click on 'Create a Project'

<img width="1680" alt="Screenshot 2023-10-28 at 5 13 21 PM" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/cfb0763e-67c0-421d-b5a5-1f091541d246">

Step 4: Give a Project Name

<img width="1680" alt="Screenshot 2023-10-28 at 5 15 20 PM" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/319eb062-9a70-40e7-a051-f73ac16916b1">

Step 5: Select an Default Account

<img width="1680" alt="Screenshot 2023-10-28 at 5 16 48 PM" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/b11897d7-4078-4fa3-871e-9f0d00420286">

Step 6: Click on 'Continue'

<img width="1680" alt="Screenshot 2023-10-28 at 5 17 53 PM" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/b964e0f9-0ee7-4c2c-b456-45a355a16f9f">

Step 7: Open the 'Build' menu

<img width="1704" alt="Screenshot 2023-10-28 at 5 18 45 PM" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/195e8ac6-d1b3-46b8-9382-bcd8a7a5503c">

Step 8: Click on 'Realtime Database'

<img width="1680" alt="Screenshot 2023-10-28 at 5 19 30 PM" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/14b24e1b-eb54-4526-971f-c33612b12daa">

Step 9: Create Database

<img width="1680" alt="Screenshot 2023-10-28 at 5 21 11 PM" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/2b92c98f-b83f-4568-aea2-c2854e53e72b">

Step 10: Select Realtime Database location and click on Next
<br>

> [!NOTE] 
I'm going with default Relatime Database Location Settings you can change the location if needed..

<img width="1680" alt="Screenshot 2023-10-28 at 5 28 20 PM" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/01069f11-7a0f-4feb-8350-6c789d32b3b4">

Step 11: For now i'm setting security rules as 'Start in Test Mode'

<img width="1704" alt="Screenshot 2023-10-28 at 5 33 40 PM" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/eaf2a363-8d51-4179-b7a4-15111c1bc66d">

Step 12: Copy the Database URL and Keep it somewhere we will need it later

<img width="1680" alt="Screenshot 2023-10-28 at 6 10 30 PM" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/e65cb767-b876-484e-9af1-b220a578d4c9">

Step 13: Go to Build > Select Authentication > Get Started

<img width="1680" alt="Screenshot 2023-10-28 at 6 11 28 PM" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/0b3b8e30-80db-418d-9beb-25c071b3309f">

Step 14: Select Email/Password

<img width="1680" alt="Screenshot 2023-10-28 at 6 11 59 PM" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/ac7cab11-2748-4c3f-85d4-f06816ef2f12">

Step 15: Enable it

<img width="1704" alt="Screenshot 2023-10-28 at 6 12 50 PM" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/0c8900f0-4f8f-4b0f-ab20-7e48c39463be">

Step 16: Go to User > Add User

<img width="1680" alt="Screenshot 2023-10-28 at 6 24 21 PM" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/dd0b97a6-f981-4427-8c20-0524cfa31140">

Step 17: Add an email and password > click on add user

<img width="1680" alt="Screenshot 2023-10-28 at 6 26 00 PM" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/fbc30170-d7d7-4695-9637-a72bd6e646d5">

Step 18: Go to Project Settings

<img width="1680" alt="Screenshot 2023-10-28 at 6 18 09 PM" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/58f5731d-c3e6-4244-b051-cc2d8c770918">

Step 19: Copy the Web Api Key and Keep it, we will need it later on..

## Now Let's Move On to ESP32 Programming Part

Download the given `ESP32 Code.ino` file after that you can use Arduino IDE or Platform IO for programming the ESP32. I am using Arduino IDE for this project.

Download the Arduino IDE from their offical website `https://arduino.cc/`

Step 1: Download the Arduino IDE and Open It

<img width="1680" alt="Screenshot 2023-10-28 at 6 34 09 PM" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/77115b95-6cc0-4d88-99e5-ed13d9f7f079">

Step 2: Go to Arduino Settings > Additional Board Manager and paste the link given and click Ok: 

`https://raw.githubusercontent.com/espressif/arduino-esp32/gh-pages/package_esp32_index.json`

<img width="1680" alt="Screenshot 2023-10-28 at 6 34 30 PM" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/7e834281-2dde-43c8-9fa4-5a1864060057">

Step 3: Go to Boards Manager > Search For ESP32 

<img width="1680" alt="Screenshot 2023-10-28 at 6 35 30 PM" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/9a05b9a5-c402-4182-8a0d-76f0d0ccc7da">

Step 4: Install the Board: esp32 by espressif

<img width="1680" alt="Screenshot 2023-10-28 at 6 36 38 PM" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/25d37d68-19e6-4b87-9fc3-ca53f1bc8afe">

Step 5: Go to Library Manager > Serach The Libraries One By One > Intall the Libraries <br>

**1. NTPClient** <br>

**2. Firebase Arduino Client Library For ESP8266 and ESP32 By Mobizt** <br>

**3. DHT Sensor Library by Adafruit** <br>

<img width="810" alt="image" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/2bc8de74-405c-429a-af91-6dfc9cc73549">

Step 6: Add your Database URL, Web Api Key, the email you created in database and it's password. Then add your Wifi SSID and Wifi Password.

<img width="1679" alt="image" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/83da3203-7d9e-4210-bc5a-c102355892a7">

Step 7: Connect your esp and select ESP32 Dev Module  (It may vary with the module you are currently using) and Click upload, then wait until the Code successfully uploads to the ESP32 Module.

Let's move on to the next section which is connecting all the hardware.
#### Download the Connection Schematic and Connect the Hardware:

$${\textsf{\color{red}BE CAREFUL WHILE WORKING WITH AC POWER SUPPLY}}$$

## Let's Move on to the App Developement

Download Flutter and Install it.
<br>
`https://flutter.dev/`
<br>

> [!NOTE] 
> 
> Create New Flutter Project by running `flutter create home_automation` command in terminal <br>
> Replace the lib folder in flutter project with the given `lib` folder and also add the `assets` folder in your flutter project folder <br>
>

## Let's Connect the Database To Our App

<img width="1680" alt="Screenshot 2023-10-28 at 8 48 11 PM" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/624032f9-6207-469a-8cf3-a7fc3d0668db">

Step 1: Go to Database > Project Overivew > Click on Flutter Icon

<img width="1680" alt="Screenshot 2023-10-28 at 8 51 51 PM" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/4d927967-7edb-48c6-a5c5-8d05a6bfeeb3">

Step 2: Do the given required steps

<img width="274" alt="image" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/f9c4f129-0e2b-4d98-8999-fbdac6d4d03c">

Step 3: Import these dependencies in `pubspec.ymal` file and also run `flutter pub get` in terminal of your flutter project directory to install any remaining packages.

<img width="540" alt="image" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/5bde25b8-5824-47c3-8f70-b3a7e5ccd212">

Step 4: Add your Database URL in **chart.dart** file

Step 5: Add your Datapoint path in  `chart.dart` file , For this project it will be `/Humidity/` and `/Temperature/` and also modify the path in `led_switch.dart `, `fan_switch.dart`, `button_widget_led.dart`, `button_widget_fan.dart`, `bottom_sheet_led.dart`, `bottom_sheet_fan.dart`.

<img width="540" alt="image" src="https://github.com/jadhavsharad/Smart-Home-Automation-With-ESP32/assets/60263979/0e952113-2bc7-4df2-9ae1-aa61505ee238">

Step 6: Add an icon in assets folder to add an launcher icon

Step 7: Run `flutter_launcher_icons` and if you get any errors run first `flutter pub get` then run `flutter_launcher_icons`

Step 8: Now run `flutter build apk --split-per-abi` in flutter project terminal to build an apk

Step 9: Install that apk file in your device, it may show some google play protect errors while installing, it's beacuse we haven't signed our apk. After installing now it's time to control our home our own app.
<br><br><br>
# Thank You!

<br>

### You can raise issues if you have any kind of errors/issues regarding this project.

<br>

### Your suggestions and feedbacks are most welcome




