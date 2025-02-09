# Welcome to SongLib

<a href='https://play.google.com/store/apps/details?id=com.songlib'>
  <img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/images/generic/en_badge_web_generic.png' width='200'/>
</a>

<a href="https://apps.apple.com/app/id6446771305">
  <img alt='Get it on AppStore' src='https://developer.apple.com/app-store/marketing/guidelines/images/badge-example-preferred_2x.png' width='200'>
</a>

<a href="https://github.com/Solido/awesome-flutter#components">
   <img alt="Awesome Flutter" src="https://img.shields.io/badge/Awesome-Flutter-blue.svg?longCache=true&style=flat-square" />
</a>

 SongLib for Android, iOS, Windows

## Overview

SongLib is a robust mobile solution tailored for our users who need to sing hymns, designed to streamline their operations and enhance productivity. This Flutter-based application facilitates their access to your church songbook/hymns seamlessly that you don't have to worry about even being online once you have set up the app on your device.
<table>
<tr>
<td><img src="screenshots/Droid/image1.png" width="200px" /></td>
<td><img src="screenshots/Droid/image2.png" width="200px" /></td>
<td><img src="screenshots/Droid/image3.png" width="200px" /></td>
<td><img src="screenshots/Droid/image4.png" width="200px" /></td>
<td><img src="screenshots/Droid/image5.png" width="200px" /></td>
</tr>
</table>

## Getting Started

Follow this guide to set up and run SongLib:

### Setting Up SongLib:

1. **Install Flutter and Dependencies:** Ensure Flutter is installed on your system. Download the Flutter SDK from the official website and set up your preferred IDE (e.g., Android Studio or Visual Studio Code) with the Flutter plugin.

2. **Clone the Repository:** Clone SongLib repository from GitHub using Git:

    ```bash
    git clone git@github.com:SiroDaves/SongLibApp.git
    ```

3. **Install Packages:** Navigate to the project directory and run:

    ```bash
    flutter pub get
    ```

### Running SongLib:

1. **Device Setup:** Connect an emulator or physical device to your development environment. Check connected devices:

    ```bash
    flutter devices
    ```

2. **Update Dependencies:**

    ```bash
    flutter pub get
    ```

3. **Update Code Generated Files:**

    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

4. **Update Localization Strings:**

    ```bash
    flutter gen-l10n
    ```
5. **Running SongLib:**
    ```bash
    flutter run
    ```

### Building SongLib

1. **Android:**

    - **Staging: AppTester (Firebase Distribution):**

        ```bash
        flutter build apk --flavor staging -t lib/main_stg.dart --no-tree-shake-icons
        ```

    - **Production (For Play Store):**

        ```bash
        flutter build appbundle --flavor production -t lib/main_prod.dart --no-tree-shake-icons
        ```
    
2. **iOS:**

    - **Production (For Play Store):**

        ```bash
        flutter build ipa -t lib/main_prod.dart --no-tree-shake-icons
        ```
    To upload to the App Store either:
    - Drag and drop the "build/ios/ipa/*.ipa" bundle into the Apple Transporter macOS app https://apps.apple.com/us/app/transporter/id1450874784
    - Run "xcrun altool --upload-app --type ios -f build/ios/ipa/*.ipa --apiKey your_api_key --apiIssuer your_issuer_id".
       See "man altool" for details about how to authenticate with the App Store Connect API key.
        
3. **Windows:**

    ```
    flutter build windows --target=lib/main_prod.dart
    ```
          
4. **MacOS:**

    ```
    flutter build macos -t lib/main_prod.dart --no-tree-shake-icons
    ```
        
5. **All the mobile builds:**

    ```
    flutter build appbundle --flavor production -t lib/main_prod.dart --no-tree-shake-icons
    flutter build ipa -t lib/main_prod.dart --no-tree-shake-icons
    ```

---

Congratulations! You've successfully set up and run or built SongLib. Explore the codebase, make modifications, and contribute to creating a seamless experience for the users. Happy coding!