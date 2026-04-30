# Story Spark

A magical kids story app built with Flutter.

## Project Architecture

This project follows a **Feature-based / Clean Architecture** approach to ensure scalability, maintainability, and clean code principles.

```text
lib/
├── core/
│   ├── constants/      # App constants, asset paths, route names
│   ├── themes/         # Theme data and app colors
│   ├── utils/          # Helper functions, validators
│   └── widgets/        # Shared UI components
├── data/
│   ├── models/         # Data models (UserModel, etc.)
│   └── services/       # External services (Auth, Firestore)
├── features/
│   ├── auth/           # Login and Sign Up features
│   │   └── presentation/
│   │       └── screens/
│   └── onboarding/     # Onboarding screens
│       └── presentation/
│           └── screens/
├── network/            # Network responses and helpers
├── main.dart           # App entry point
└── firebase_options.dart # Firebase configuration
```

### Key Improvements

1. **Code Organization:**
   - Restructured folders to separate core logic, data, and features.
   - Removed redundant nested folders and deprecated `.sdart` extensions.
2. **Code Quality & DRY:**
   - Centralized App Colors and Constants to eliminate hardcoded strings.
   - Extracted reusable widgets to `lib/core/widgets`.
   - Consolidated 3 separate onboarding screens into a single `PageView` driven screen.
3. **Performance Optimization:**
   - Added `const` constructors where possible.
   - Reduced widget rebuilds by moving state logic appropriately.
4. **UI/UX:**
   - Ensured consistent usage of `flutter_screenutil` for responsiveness.

## How to Run

1. Make sure you have Flutter installed (`flutter doctor`).
2. Run `flutter pub get` to fetch dependencies.
3. Start an emulator or connect a physical device.
4. Run the app using:
   ```bash
   flutter run
   ```

## Requirements
- Flutter SDK `^3.11.4`
- Firebase core & auth
