**Kraken Case**

Kraken Case is a Flutter application designed to display anime details fetched from the Jikan API. It provides an anime list, detailed information for each anime, and character details, integrating several technologies to handle data fetching, state management, and navigation.

**Features**

-  **Anime Listing:** Fetches a list of top anime using the Jikan API.

-  **Anime Details:** Displays detailed information about selected anime, including title, score, synopsis, and character information.

-  **Character Details:** Shows character details for selected anime.

-  **Filter and Sorting:** Supports filtering anime by type and status.

-  **Navigation:** Uses AutoRoute for declarative navigation.

-  **State Management:** Utilizes flutter_bloc for handling states and events.

-  **Dependency Injection:** Employs GetIt and injectable for dependency injection.

-  **API Integration:** Uses Chopper for networking and API service.

-  **Firebase Integration:** Implements Firebase Crashlytics for crash reporting.

-  **Cross-Platform:** Supports both Android and iOS with native platform integration using Method Channels.

**Table of Contents**

-  [Architecture](#architecture)

-  [Dependencies](#dependencies)

-  [Project Structure](#project-structure)

-  [Getting Started](#getting-started)

-  [Running the Application](#running-the-application)

-  [API Reference](#api-reference)

**Architecture**

**Overview**

The project follows a layered architecture pattern that separates concerns into different layers:

-  **Data Layer:** Handles data fetching from the Jikan API, serialization, and deserialization using Chopper and json_serializable.

-  **Domain Layer:** Defines business logic, entities, and use cases, ensuring that the business logic is decoupled from data sources and UI.

-  **Application Layer:** Contains the constants, dependency injection setup, and method channel handlers.

-  **Presentation Layer:** Manages UI components and uses flutter_bloc for state management.

**Key Technologies**

-  **Flutter Bloc:** Manages state within the application using a reactive and event-driven architecture.

-  **GetIt:** Provides a service locator for dependency injection, promoting decoupled and testable code.

-  **Injectable:** Works with GetIt to generate dependency injection configurations automatically.

-  **Chopper:** A networking library that facilitates API requests, making it easier to define services and handle responses.

-  **AutoRoute:** A declarative navigation package that simplifies route management within Flutter applications.

-  **Firebase Crashlytics:** Monitors app crashes and logs fatal errors for debugging and analysis.

**Project Structure**

```dart

assets/                               # Asset files

│

lib/

│

├── application_layer/                # Application-level utilities and configurations

│   ├── constants/                    # App-wide constants

│   ├── di/                          # Dependency injection setup

│   └── handlers/                    # Method channel handlers

│

├── data_layer/                      # Data management and network communication

│   ├── models/                      # JSON serializable models

│   └── services/                    # Remote services and API interactions

│

├── domain_layer/                    # Business logic and use cases

│   ├── entities/                    # Business entities

│   ├── repositories/                # Repositories abstracting data sources

│   └── usecases/                    # Application use cases

│

├── presentation_layer/              # UI and state management

│   ├── pages/                       # Different UI pages and their blocs

│   ├── widgets/                     # Reusable widgets

│   └── routes/                      # Route definitions using AutoRoute

│

└── main.dart                        # Entry point of the application

```

**Getting Started**

**Prerequisites**

-  **Flutter SDK:** Install the Flutter SDK ([Flutter installation guide](https://flutter.dev/docs/get-started/install)).

-  **Dart SDK:** Ensure Dart SDK is installed along with Flutter.

-  **Firebase Setup:** Set up Firebase in your Flutter project ([Firebase Flutter setup guide](https://firebase.flutter.dev/docs/overview)).

-  **Method Channels:** Ensure the native iOS and Android code is set up to handle method channels as outlined in the MainActivity.kt and AppDelegate.swift files.

**Installing Dependencies**

Run the following command to install the required dependencies:

```dart
fvm flutter pub get
```

**Generating Code**

Use build_runner to generate injectable configurations, JSON serializers, and other generated files:

```dart
fvm flutter pub run build_runner build --delete-conflicting-outputs
```


**Running the Application**

To run the **Kraken Case** application properly, you need to take care of a few important steps regarding **FVM** and **Firebase**:

**1\. FVM (Flutter Version Manager)**

Ensure that **FVM** is properly set up, as indicated by the .fvmrc file in the project. This file ensures that the correct Flutter version is used, as specified for the project. Follow these steps:

-  **Install FVM** (if you haven't already):

dart pub global activate fvm

-  **Install the correct Flutter version** specified in the .fvmrc file:

```dart
fvm install
```

-  **Use the correct Flutter version** when running the project:

```dart
fvm use
```

```dart
fvm flutter pub get
```

```dart
fvm flutter run
```

**2\. Adding Environment Variables**

To configure Firebase and other secrets, the project uses the .env file located inside the **assets** folder. You need to create this .env file with the appropriate keys. Here's what you should do:

-  Create a .env file in the assets folder.

Example .env file:

```dart
FIREBASE_API_KEY_WEB=your_firebase_api_key_for_web

FIREBASE_APP_ID_WEB=your_firebase_app_id_for_web

FIREBASE_MESSAGING_SENDER_ID_WEB=your_firebase_messaging_sender_id_for_web

FIREBASE_PROJECT_ID_WEB=your_firebase_project_id_for_web

FIREBASE_AUTH_DOMAIN_WEB=your_firebase_auth_domain_for_web

FIREBASE_STORAGE_BUCKET_WEB=your_firebase_storage_bucket_for_web

FIREBASE_API_KEY_ANDROID=your_firebase_api_key_for_android

FIREBASE_APP_ID_ANDROID=your_firebase_app_id_for_android

FIREBASE_MESSAGING_SENDER_ID_ANDROID=your_firebase_messaging_sender_id_for_android

FIREBASE_PROJECT_ID_ANDROID=your_firebase_project_id_for_android

FIREBASE_STORAGE_BUCKET_ANDROID=your_firebase_storage_bucket_for_android

FIREBASE_API_KEY_IOS=your_firebase_api_key_for_ios

FIREBASE_APP_ID_IOS=your_firebase_app_id_for_ios

FIREBASE_MESSAGING_SENDER_ID_IOS=your_firebase_messaging_sender_id_for_ios

FIREBASE_PROJECT_ID_IOS=your_firebase_project_id_for_ios

FIREBASE_STORAGE_BUCKET_IOS=your_firebase_storage_bucket_for_ios
```

**3\. Firebase Options**

In the Firebase options, you need to retrieve these keys from the .env file using **flutter_dotenv**. Make sure to populate all necessary environment variables in the .env file for each platform (Web, Android, iOS, macOS, etc.).

After setting these up, you can run the project using:

```dart
fvm flutter run
```

If you encounter any errors during Firebase integration, ensure that Firebase is correctly configured in your Firebase Console for the appropriate platforms (Web, Android, iOS).

By following these steps, your **Kraken Case** application should work smoothly with the correct Flutter version and Firebase settings.

**Firebase Crashlytics**

The application is set up with Firebase Crashlytics. To test Crashlytics integration, force a crash by throwing an exception in the code.

**Cross-Platform Method Channel**

The application uses method channels for native platform communication. You can trigger native method calls using MethodChannelHandler from the Dart side.

**API Reference**

The application uses the Jikan API (https://api.jikan.moe/v4) for fetching anime data. The API endpoints are defined in AnimeApiService using Chopper.

**Endpoints**

-  **GET** /top/anime**:** Fetches the top anime list.

-  **GET** /anime/{id}**:** Fetches detailed information about an anime by its ID.

-  **GET** /anime/{id}/characters**:** Fetches characters of a specific anime.

**Testing**

The project includes comprehensive unit tests and widget tests. The test/ directory contains tests for models, blocs, use cases, and widgets. To run tests, use:

```dart
fvm flutter test
```


**Golden Tests**

Golden tests are included to verify the UI. Ensure you have the necessary image assets for golden tests, which compare screenshots to predefined images.

**Code Quality**

The project uses the following packages for code quality:

-  flutter_lints**:** Enforces best practices and coding standards.

-  mockito**:** Mocking for testing.

-  bloc_test**:** Utilities for testing Blocs.

**Scripts**

The pubspec.yaml contains predefined scripts to help with code generation:

-  build_runner_delete_conflict: Deletes conflicting outputs during code generation.

-  build_runner_build: Runs the build_runner to generate necessary files.

