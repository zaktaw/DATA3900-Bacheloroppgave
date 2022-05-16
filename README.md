# DATA3900-Bacheloroppgave

## Installation process

To run this project you have to install flutter first (follow the guide on https://docs.flutter.dev/get-started/install).

Then you'll have to install an emulator if you dont have one already. We have used emulators through Android Studio during development, so this is what we recommend, because we know it works. 

To install an Android Studio emulator you have to: 
    1. Install Android Studio. Follow this guide: https://developer.android.com/studio/install
    2. Create an emulator through Android Studio. Follow this guide: https://developer.android.com/studio/run/managing-avds
      - We have used a Nexus 6 device with Android x86 API 27, so we recommend using this one.

After you have installed flutter and have a working emulator, you have to run the command: "flutter pub get". Flutter will now install all dependencies used by the application.

To run the program use the command: "flutter run --no-sound-null-safety". Then you have to choose whice device/program you want to run the application in. Choose the emulator that you created earlier. If the device does not show in the list of available devices, you'll probably have start the emulator before trying to run the program again.

## Usages

The appliaction's main purpose is to document the usage of libraries. Through the use of zones and activities librarians can count what users of a library does and where they do it.
