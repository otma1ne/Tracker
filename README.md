# Tracker

A modern Flutter-based task and project management application designed to help users organize their work, track progress, and build productive habits.

## Features

- **User Authentication** - Secure sign-up and sign-in functionality with persistent sessions
- **Project Management** - Create, organize, and track multiple projects with custom colors
- **Task Tracking** - Add tasks to projects with status management and progress tracking
- **Progress Monitoring** - Visual progress indicators showing completion percentages
- **Onboarding Flow** - First-time user experience with introduction screens
- **Dark/Light Themes** - Customizable appearance with built-in theme switching
- **Local Storage** - Offline-first architecture using GetStorage for data persistence
- **Modern UI** - Clean, intuitive interface with custom animations and transitions

## Tech Stack

- **Framework**: Flutter 3.4.4+
- **State Management**: GetX
- **Local Storage**: GetStorage
- **Navigation**: GetX Router with middleware protection
- **UI Components**: Custom-designed widgets with Material Design
- **Typography**: Poppins font family

## Project Structure

```
lib/
├── main.dart                    # App entry point
├── constants.dart               # App-wide constants
├── controllers/                 # GetX controllers
│   ├── auth_controller.dart     # Authentication logic
│   └── project_controller.dart  # Project management logic
├── data/
│   └── repositories/            # Data access layer
│       ├── user_repository.dart
│       └── project_repository.dart
├── enums/                       # Type-safe enumerations
│   ├── project_status.dart
│   └── task_status.dart
├── middlewares/                 # Route protection
│   ├── auth_middleware.dart
│   └── guest_middleware.dart
├── models/                      # Data models
│   ├── user.dart
│   ├── project.dart
│   └── task.dart
├── pages/                       # UI screens
│   ├── onboarding_page.dart
│   ├── signin_page.dart
│   ├── signup_page.dart
│   ├── main_page.dart
│   ├── home_page.dart
│   ├── projects_page.dart
│   ├── add_task_page.dart
│   ├── profile_page.dart
│   └── chat_page.dart
├── routes/                      # Navigation configuration
│   ├── routes.dart              # Route constants
│   └── app_pages.dart           # Route definitions
├── services/                    # Business logic services
│   ├── storage_service.dart
│   └── project_service.dart
├── theme/                       # Theming configuration
│   ├── light_theme.dart
│   ├── dark_theme.dart
│   ├── button_theme.dart
│   ├── input_theme.dart
│   └── drawer_theme.dart
└── widgets/                     # Reusable components
    ├── task_card.dart
    └── loading_overlay.dart
```

## Getting Started

### Prerequisites

- Flutter SDK 3.4.4 or higher
- Dart SDK (included with Flutter)
- Android Studio / VS Code with Flutter extensions
- An Android/iOS device or emulator

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/tracker.git
cd tracker
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

### Platform-Specific Setup

**Android**
```bash
flutter run -d android
```

**iOS** (macOS only)
```bash
flutter run -d ios
```

**Web**
```bash
flutter run -d chrome
```

**Windows**
```bash
flutter run -d windows
```

## Architecture

The app follows a **clean architecture** pattern with clear separation of concerns:

- **Models** - Data structures with serialization logic
- **Repositories** - Data access abstractions
- **Services** - Business logic implementation
- **Controllers** - State management with GetX
- **Pages** - UI screens
- **Widgets** - Reusable UI components
- **Middlewares** - Route guards for authentication

## Key Dependencies

| Package | Purpose |
|---------|---------|
| `get` | State management and routing |
| `get_storage` | Local key-value storage |
| `animated_bottom_navigation_bar` | Bottom navigation UI |
| `hexcolor` | Color management |
| `intl` | Date formatting and internationalization |

## Development

### Adding a New Feature

1. Create model in `lib/models/`
2. Add repository in `lib/data/repositories/`
3. Implement service in `lib/services/`
4. Create controller in `lib/controllers/`
5. Build UI in `lib/pages/`
6. Register route in `lib/routes/`

### Code Style

This project follows Flutter's official style guide and uses `flutter_lints` for code analysis.

Run linter:
```bash
flutter analyze
```

Format code:
```bash
flutter format .
```

## Building for Production

### Android APK
```bash
flutter build apk --release
```

### Android App Bundle
```bash
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

For questions or support, please open an issue on GitHub.
