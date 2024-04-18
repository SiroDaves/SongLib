# Welcome to Songlib

## Overview

Songlib is a robust mobile solution tailored for our users who need to sing hymns, designed to streamline their operations and enhance productivity. This Flutter-based application facilitates their access to your church songbook/hymns seamlessly that you don't have to worry about even being online once you have set up the app on your device.

## Getting Started

Follow this guide to set up and run Songlib:

### Setting Up Songlib:

1. **Install Flutter and Dependencies:** Ensure Flutter is installed on your system. Download the Flutter SDK from the official website and set up your preferred IDE (e.g., Android Studio or Visual Studio Code) with the Flutter plugin.

2. **Clone the Repository:** Clone Songlib repository from GitHub using Git:

    ```bash
    git clone https://github.com/SiroDevs/SonglibApp.git
    ```

3. **Install Packages:** Navigate to the project directory and run:

    ```bash
    flutter pub get
    ```

### Running Songlib:

1. **Device Setup:** Connect an emulator or physical device to your development environment. Check connected devices:

    ```bash
    flutter devices
    ```

2. **Run the App:** Execute the following command from the project directory:

    ```bash
    flutter run
    ```

    - **Update Dependencies:**

        ```bash
        dart run build_runner build --delete-conflicting-outputs
        ```

    - **Update Localization Strings:**

        ```bash
        flutter gen-l10n
        ```

3. **Build the App:**

    - **AppTester (Firebase Distribution):**

        ```bash
        flutter build apk --flavor apptester -t lib/main.dart --no-tree-shake-icons
        ```

    - **Production (For Play Store):**

        ```bash
        flutter build appbundle --flavor prod -t lib/main_prod.dart --no-tree-shake-icons
        ```

Congratulations! You've successfully set up and run or built Songlib. Explore the codebase, make modifications, and contribute to creating a seamless experience for field agents in the insurance industry. Happy coding!