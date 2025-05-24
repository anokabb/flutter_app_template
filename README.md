## 📁 Project Structure

```
lib/
├── l10n/                  # Localization files
├── src/
│   ├── core/             # Core functionality
│   │   ├── config/       # App configuration
│   │   ├── constants/    # Constants and enums
│   │   ├── errors/       # Error handling
│   │   ├── network/      # Network related code
│   │   ├── storage/      # Local storage
│   │   └── utils/        # Utility functions
│   ├── features/         # App features
│   │   └── feature_name/ # Each feature follows clean architecture
│   │       ├── data/
│   │       └── presentation/
│   └── app.dart          # App configuration and setup
└── main.dart             # Entry point
```

### Feature Structure Example (Authentication Feature)

Each feature follows a clean architecture pattern with the following structure:

```
feature_name/
├── data/                 # Data Layer
│   ├── api/             # API related code
│   │   ├── auth_api.dart
│   │   └── gen/         # Generated API code
│   ├── models/          # Data models
│   │   ├── gen/         # Generated model code
│   │   │   ├── login_response.g.dart
│   │   │   └── user_model.g.dart
│   │   ├── login_response.dart
│   │   └── user_model.dart
│   └── repos/           # Repository implementations
│       ├── auth_repo.dart
│       └── mock_auth_repo.dart
└── presentation/        # Presentation Layer
    ├── cubit/          # State management
    │   ├── auth_cubit.dart
    │   ├── auth_state.dart
    │   └── gen/        # Generated state code
    │       └── auth_cubit.freezed.dart
    ├── pages/          # Feature screens
    │   ├── login_page.dart
    │   ├── register_page.dart
    │   ├── forgot_password_page.dart
    │   ├── otp_verification_page.dart
    │   └── reset_password_page.dart
    └── widgets/        # Reusable UI components
```

#### Layer Responsibilities:

1. **Data Layer** (`data/`):
   - `api/`: Contains API clients and endpoints using Retrofit
   - `models/`: Data models with JSON serialization
   - `repos/`: Repository implementations that handle data operations
   - `gen/`: Auto-generated code for models and API clients

2. **Presentation Layer** (`presentation/`):
   - `cubit/`: BLoC/Cubit state management
   - `pages/`: Feature screens and UI logic
   - `widgets/`: Reusable UI components specific to the feature

This structure ensures:
- Clear separation of concerns
- Easy testing and maintenance
- Scalable and modular code
- Consistent pattern across features

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.3.0)
- Dart SDK (>=3.0.0)
- iOS development tools (for iOS development)
- Android development tools (for Android development)

### Installation
1. Install dependencies:
   ```bash
   flutter pub get
   ```

2. Set up environment variables:
   - Copy `staging.env.example` to `staging.env`
   - Update the values according to your configuration

3. Run code generation:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

### Scripts

The template includes helpful scripts:

- `create_feature.sh`: Creates a new feature with all necessary boilerplate
- `create_empty_feature.sh`: Creates a minimal feature structure

Usage:
```bash
./create_feature.sh feature_name
```

## 🛠 Configuration

### App Icons

Update `assets/images/app_icon.png` and run:
```bash
dart run flutter_launcher_icons
```

### Splash Screen

Update splash screen configuration in `pubspec.yaml` and run:
```bash
dart run flutter_native_splash:create
```

### Localization

1. Add new strings to `lib/l10n/app_en.arb`
2. Run the app to auto-generate translations


## 🌟 Features

- **Clean Architecture**: Organized project structure following clean architecture principles
- **State Management**: Implements `flutter_bloc` for robust state management
- **Routing**: Uses `go_router` for declarative routing
- **Localization**: Built-in support for multiple languages
- **Network**: Dio with Retrofit for API communication
- **Local Storage**: Secure storage with `flutter_secure_storage` and `hive_flutter`
- **Authentication**: Ready-to-use authentication flow
- **Push Notifications**: Firebase Cloud Messaging integration
- **UI Components**: Pre-built common UI components and animations
- **Asset Management**: Automated asset generation with `flutter_gen`
- **Environment Configuration**: Environment variable support with `flutter_dotenv`
- **Code Generation**: Built-in support for JSON serialization and freezed models
- **App Icon & Splash Screen**: Easy configuration for app icons and splash screens
- **Error Handling**: Comprehensive error handling and logging system
- **Connectivity**: Internet connection handling with automatic retry mechanisms
- **Permissions**: Structured permission handling with `permission_handler`