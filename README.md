# DATA3900-Bacheloroppgave

## Installation process

To run this project you have to install flutter first (follow the guide on https://docs.flutter.dev/get-started/install).

Then you'll have to install an emulator if you dont have one already. The app can't be launched in a web browser due to restrictions regarding http requests! We have used emulators through Android Studio during development, so this is what we recommend, because we know it works. 

To install an Android Studio emulator you have to: 
1. Install Android Studio. Follow this guide: https://developer.android.com/studio/install
2. Create an emulator through Android Studio. Follow this guide: https://developer.android.com/studio/run/managing-avds
   - We have used a Nexus 6 device with Android x86 API 27, so we recommend using this one.

After you have installed flutter and have a working emulator, you have to run the command: "flutter pub get". Flutter will now install all dependencies used by the application.

To run the program use the command: "flutter run --no-sound-null-safety" (Note: it's not possible to run the app without --no-sound-null-safety due to the url-launcher package). Then you have to choose which device/program you want to run the application in. Choose the emulator that you created earlier. If the device does not show in the list of available devices, you'll probably have start the emulator before trying to run the program again.

## What to do if the server doesn't work?

If the server isn't working and you get an error code when running the program and starting a new count, go to /lib/route_generator.dart and comment/uncomment the lines as instructed in the comments in the file. Here you can choose between using the server or using a mock database that is stored in the local storage.

## Usages

The appliaction's main purpose is to document the usage of libraries. Through the use of zones and activities librarians can count what users of a library does and where they do it.
