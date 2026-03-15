# ⛅ Lottie Weather App

A minimalist simple weather application built with Flutter.

## Technologies

* **Flutter**
* **Riverpod** (State Management)
* **Dio** (Networking / API calls)
* **Lottie** (Animations)
* **Geolocator & Geocoding** (Location Services)
* **OpenWeatherMap API**

## Features

* 7 distinct Lottie animations (clear, clouds, rain, mist, snow, thunderstorm, and default) tailored to current weather conditions.
* Smooth background color transitions based on the weather state.
* Responsive design built with mathematical proportions (`Spacer`) ensuring UI stability across different screen ratios without breaking the layout.
* Automatic geolocation fetching with reverse geocoding to display the current city and country.
* Robust handling of screen rotations and background updates (every 15 minutes) using Riverpod's `keepAlive`.

## The Process

I built this app to practice API integration, state management, and UI adaptability. I started by designing a structured interface and creating custom Lottie animations in After Effects to make the app feel alive. 

The development journey involved several architectural decisions and challenges:

* Initially, I wanted to implement a standard pull-to-refresh (`RefreshIndicator`). However, forcing scrollable widgets broke my carefully crafted adaptive layout built with `Spacer`. I prioritized UI stability and opted for a clean manual refresh button in the `AppBar` instead.
* Awaiting network requests in the UI layer caused interruptions during screen rotations (when Flutter destroys and recreates the screen). I fixed this by delegating the execution to Riverpod and forcing the provider to stay alive independently of the screen using the `keepAlive` property.
* I implemented a 15-minute cyclic auto-update but noticed it kept triggering GPS permission requests. I resolved this by strictly separating the one-time permission check at startup from the periodic coordinate fetching.
* I discovered that some complex After Effects features (like the Repeater) don't translate perfectly to Flutter. This taught me to bake complex effects into the base animation early in the design phase.

## Running the Project (Android)

Since this repository contains only the core source code (`lib`) and resources (`assets`), please follow these steps to integrate and run it on an Android device or emulator:

1. Create a new Flutter project.
2. Navigate into your new project directory.
3. Replace the default lib folder with the lib folder from this repository.
4. Copy the assets folder from this repository into the root of your new project.
5. Open your pubspec.yaml file and add the required dependencies and assets:
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.0.0 # or latest
  dio: ^5.0.0
  lottie: ^3.1.0
  geolocator: ^10.0.0
  geocoding: ^2.1.0

flutter:
  uses-material-design: true
  assets:
    - assets/animations/
```

6. Install the dependencies.
7. Get a free API key from OpenWeatherMap.
8. Open lib/core/constants/app_constants.dart and insert your API key and base URL.
9. Connect an Android device or start an Android emulator, then run.

## Preview


