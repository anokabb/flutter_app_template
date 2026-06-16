---
description: Flutter/Dart coding rules derived from this codebase. Apply to all .dart files.
globs: ["**/*.dart"]
alwaysApply: true
---

# Flutter / Dart — Project Rules

## Architecture

This project uses **Feature-First Clean Architecture**:

```
lib/src/
├── core/                        # Shared infrastructure
│   ├── components/              # Reusable UI widgets (buttons, forms, layouts, pop-ups…)
│   ├── constants/               # AppConfig, HiveConfig, deep-link constants
│   ├── extensions/              # Dart extensions on BuildContext, String, DateTime, double…
│   ├── gen/                     # flutter_gen output — assets, fonts (never edit manually)
│   ├── models/                  # Shared/cross-feature models (pagination, dropdown…)
│   ├── services/
│   │   ├── di/locator.dart      # GetIt DI setup — single source of truth
│   │   ├── http/api_locator.dart # HTTP client (GET/POST/PATCH/DELETE/multipart)
│   │   ├── navigation/          # GoRouter setup + route constants
│   │   ├── analytics/           # Firebase Analytics wrapper
│   │   ├── logging/logger.dart  # Custom Logger using `logger` package
│   │   └── notifications/       # Firebase Messaging + local notifications
│   ├── theme/                   # AppTheme, AppColors, AppTypography, ThemeExtension
│   └── utils/                   # Validators, extension utilities, helper functions
└── features/
    └── <feature>/
        ├── infrastructure/      # Repository — calls ApiLocator, returns Either<>
        ├── models/              # Freezed + json_serializable data models
        └── presentation/
            ├── cubit/           # Cubit + State (Freezed union)
            └── views/           # Screens + feature-specific widgets
```

Each feature owns its own infrastructure, models, and presentation layers. Never import a feature's internal files from another feature directly — go through DI (`locator<XCubit>()`) or shared core instead.

---

## State Management — flutter_bloc Cubits

- Every feature uses a **Cubit** (never BLoC with events).
- State is always a **Freezed union** in a separate `*_state.dart` file, declared as `part of '<cubit>.dart'`.
- The cubit file declares `part '<cubit>.freezed.dart'` and `part '<state>.dart'`.
- States carry data (e.g., `CartState.loaded(CartModel cart)`) — not bare enums.
- Global/singleton cubits are registered as `registerLazySingleton` in `locator.dart`. Scoped/per-screen cubits use `registerFactory`.
- Access singletons via `locator<XCubit>()` inside views/repos, not through `BlocProvider.of`.
- Use `BlocBuilder<XCubit, XState>` with an explicit `bloc: cubit` prop (do not rely on inherited BlocProvider unless the cubit is explicitly provided above).
- Call `emit()` immediately on state change; use `Future.microtask(() => emit(...))` only when you need to emit twice in one frame.

### State pattern
```dart
// *_state.dart
part of 'feature_cubit.dart';

@freezed
class FeatureState with _$FeatureState {
  const factory FeatureState.initial() = FeatureStateInitial;
  const factory FeatureState.loading() = FeatureStateLoading;
  const factory FeatureState.loaded(MyModel data) = FeatureStateLoaded;
  const factory FeatureState.error({required String message}) = FeatureStateError;
}
```

### Cubit pattern
```dart
// feature_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_cubit.freezed.dart';
part 'feature_state.dart';

class FeatureCubit extends Cubit<FeatureState> {
  final FeatureRepository _repository = FeatureRepository();
  final _log = getLogger('FeatureCubit');

  FeatureCubit() : super(const FeatureState.initial());

  Future<void> fetchData() async {
    emit(const FeatureState.loading());
    final result = await _repository.getData();
    result.fold(
      (data) => emit(FeatureState.loaded(data)),
      (error) => emit(FeatureState.error(message: error.message)),
    );
  }
}
```

---

## Models — Freezed + json_serializable

Every data model uses `@freezed` + `json_serializable`. Always generate both `.freezed.dart` and `.g.dart`.

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_model.freezed.dart';
part 'my_model.g.dart';

@freezed
class MyModel with _$MyModel {
  const factory MyModel({
    required int id,
    @JsonKey(name: 'first_name') required String firstName,
    String? optionalField,
  }) = _MyModel;

  // Custom getters require a private constructor:
  const MyModel._();

  factory MyModel.fromJson(Map<String, dynamic> json) => _$MyModelFromJson(json);

  // Static factory for empty/default state:
  factory MyModel.empty() => const MyModel(id: 0, firstName: '');

  // Computed getters go after the private constructor:
  String get displayName => '$firstName';
}
```

Rules:
- All API field name mismatches use `@JsonKey(name: 'snake_case_key')`.
- `dynamic` is acceptable for truly polymorphic API fields.
- Always add `factory MyModel.empty()` for models used as initial cubit state.
- Never write manual `toJson`/`fromJson` — always use code generation.
- Run `fvm dart run build_runner build --delete-conflicting-outputs` after changing models.

---

## Infrastructure / Repositories

```dart
class FeatureRepository {
  final ApiLocator _apiLocator = locator<ApiLocator>();
  final _log = getLogger('Feature Repository');

  Future<Either<MyModel, APIServerError>> getData() async {
    try {
      final result = await _apiLocator.get('/endpoint');
      if (result != null && result['success'] == true) {
        return Left(MyModel.fromJson(result['data']));
      }
      return Right(APIServerError(message: result?['error']?.toString() ?? 'Unknown error'));
    } catch (e) {
      _log.e('[ERROR getData] ${e.toString()}');
      return Right(APIServerError(message: e.toString()));
    }
  }
}
```

Rules:
- Every repository method returns `Either<SuccessType, APIServerError>` from `fpdart`.
- Left = success, Right = error (matches fpdart convention used throughout).
- Always wrap in try/catch and log with `_log.e('[ERROR methodName] ...')`.
- Instantiate `ApiLocator` via `locator<ApiLocator>()` — never `new ApiLocator()`.
- Repositories are **not** registered in the locator unless they are shared (e.g., `SupplierRepository`). Scope-local repos are instantiated directly inside cubits.
- Use `_log = getLogger('Feature Repository')` for traceability.

---

## HTTP Client — ApiLocator

`ApiLocator` is the single HTTP client. Use its methods:

```dart
// GET with optional cache
final result = await _apiLocator.get('/endpoint', enableCache: true, cacheMinutes: 30);

// POST
final result = await _apiLocator.post('/endpoint', {'key': 'value'});

// POST public (no auth header)
final result = await _apiLocator.post('/endpoint', body, isPublic: true);

// PATCH / DELETE
final result = await _apiLocator.patch('/endpoint', body);
final result = await _apiLocator.delete('/endpoint', body);

// File upload
final result = await _apiLocator.postMultipart('/endpoint', fields, filePath);
```

- Always check `result != null && result['success'] == true` before parsing.
- `returnError: true` on POST if you need the raw error body from the server.
- Never use `http` package directly in feature code — always go through `ApiLocator`.
- `isPublic: true` means no `Authorization` header is sent.

---

## Dependency Injection — GetIt

```dart
// Registration (locator.dart only)
locator.registerLazySingleton<MyCubit>(() => MyCubit());
locator.registerFactory<MyScreenCubit>(() => MyScreenCubit());

// Access anywhere
locator<MyCubit>().someMethod();
```

- All registrations live in `lib/src/core/services/di/locator.dart` — never register elsewhere.
- `registerLazySingleton` for cubits/services that outlive a single screen.
- `registerFactory` for cubits that should be fresh per navigation push.
- Call `onLoggedIn(locator)` after successful login to trigger post-auth data fetches.
- Call `locator.pushNewScope(init: onLoggedIn)` when a user logs in.

---

## Navigation — GoRouter

```dart
// Route constant on the view class itself
class MyView extends StatefulWidget {
  static const routeName = '/my-view';
  // ...
}

// Navigate
context.go(MyView.routeName);
context.push(MyView.routeName);
context.pop();

// With query params
context.push('${MyView.routeName}?id=$id');
// Read:  state.uri.queryParameters['id']

// With extra (typed objects)
context.push(MyView.routeName, extra: myObject);
// Read:  state.extra as MyObject
```

- Every routable screen declares `static const routeName = '/route-name'`.
- Route definitions live in `RouteMap._otherRoutes()` or in branch files (`home_branch.dart`, etc.).
- Shell routes go in `_statefulShellRoute()`.
- Use `NoTransitionPage` for auth screens; default `builder:` for all others.
- Prefer query params for primitives; prefer `extra` for typed objects passed between screens.

---

## Theming & Styling

Access theme via extensions — never call `Theme.of(context)` raw:

```dart
// Colors
context.theme.appColors.primary
context.theme.appColors.secondary
context.theme.appColors.background
context.theme.appColors.onPrimary
context.theme.appColors.borderColor

// Typography — use these, not Theme.of(context).textTheme.*
context.theme.appTextTheme.h1      // 96px bold
context.theme.appTextTheme.h5      // 24px bold
context.theme.appTextTheme.subtitle1  // 16px w800
context.theme.appTextTheme.subtitle2  // 14px w800
context.theme.appTextTheme.subtitle3  // 12px w800
context.theme.appTextTheme.body1   // 16px normal
context.theme.appTextTheme.body2   // 14px normal
context.theme.appTextTheme.body3   // 12px normal

// Override color or weight inline
context.theme.appTextTheme.subtitle2.copyWith(color: Colors.grey)
```

- Font family is **Montserrat** (via `google_fonts`).
- Never hardcode colors — use `AppColors.*` static constants or `context.theme.appColors.*`.
- Theme extensions (`AppColorsExtension`, `SimpleAppTextThemeExtension`) implement full `copyWith` and `lerp`.

---

## Shared UI Components

Always prefer components from `lib/src/core/components/` over raw Flutter widgets:

| Need | Use |
|------|-----|
| Primary / secondary button | `AppButton(label: '...', onPressed: () {})` |
| Text input | `AppTextFormField(inputType: InputType.email, label: 'Email')` |
| Bottom sheet / modal | `CustomPopUpView.show(context: context, view: MyPopUpView())` |
| App bar | `CustomAppBar(title: 'Title')` |
| Screen layout | `DefaultLayout(title: 'Title', child: ...)` |
| Success / error toast | `showTopAlert('Message', isError: true)` |
| Alert dialog | `showAgrimarkAlert('Message', context: context)` |
| Infinite list | `InfiniteScrollView(...)` |
| Product card | `ProductCard(...)` |

Pop-up views extend `CustomPopUpView` and `CustomPopUpViewState`:

```dart
class MyPopUpView extends CustomPopUpView {
  const MyPopUpView({super.key});

  @override
  State<MyPopUpView> createState() => _MyPopUpViewState();
}

class _MyPopUpViewState extends CustomPopUpViewState<MyPopUpView> {
  @override
  Widget buildContent(BuildContext context) {
    return Column(children: [...]);
  }
}
```

---

## BuildContext Extensions

```dart
context.localization.someKey   // AppLocalizations — use for all user-facing strings
context.height                 // MediaQuery height
context.width                  // MediaQuery width
context.showSnackBar('msg')    // Bottom snackbar
context.showCustomDatePicker(...)  // Bottom date picker
```

---

## String / Data Extensions

```dart
someString.ucFirst()           // "hello_world" → "Hello world"
someString.formatStatus()      // Capitalises each word
someNullableString.isNullOrEmpty  // true if null, 'null', or blank

someDouble.formatPrice()       // "1,234.56"
someDouble.formatCurrency()    // "1,234.56" (nullable-safe)

someDateTime.formatDate()      // "2024-01-31"
someDateTime.formatNoticeDate()  // "Jan 31st 2024"
someDateTime.formatNotificationDate()  // relative "2h ago" / "Yesterday"
```

---

## Logging

```dart
class MyClass {
  final _log = getLogger('MyClass');  // always name-match the class

  void someMethod() {
    _log.i('Info message');
    _log.w('Warning message');
    _log.e('[ERROR someMethod] ${e.toString()}');
  }
}

// Log raw API responses in debug only:
logResponse(result, name: 'MyEndpoint');
```

- `getLogger` uses `CustomLogger` which is silenced in release builds automatically.
- Prefix error logs with `[ERROR methodName]` for searchability.
- Never use `print()` — always use `_log` or `dart:developer`'s `log()`.

---

## Local Storage — Hive

Pre-defined boxes (never create new boxes without updating `hive_config.dart`):

```dart
userBox         // encrypted — user data, tokens
cacheBox        // encrypted — HTTP response cache
settingsBox     // encrypted — app settings, biometrics, pin
devBox          // encrypted — environment, expiry override
localizationBox // encrypted — language preference
persistsData    // encrypted — data that survives logout
```

Usage:
```dart
settingsBox.put('key', value);
final value = settingsBox.get('key', defaultValue: fallback);
settingsBox.delete('key');
```

All Hive boxes are AES-encrypted. Key is stored in `FlutterSecureStorage`.

---

## Naming Conventions

| Thing | Convention | Example |
|-------|-----------|---------|
| Files | `snake_case.dart` | `cart_repository.dart` |
| Classes | `PascalCase` | `CartRepository` |
| Cubits | `FeatureCubit` | `CartCubit` |
| States | `FeatureState` | `CartState` |
| Repositories | `FeatureRepository` | `CartRepository` |
| Models | `FeatureModel` | `CartModel` |
| Views/screens | `FeatureView` | `CartView` |
| Widget files | `feature_widget.dart` | `cart_icon_widget.dart` |
| Route names | `/kebab-case` | `/cart-view` |
| Private methods | `_camelCase` | `_buildButton()` |
| Constants | `SCREAMING_SNAKE_CASE` | `API_ROOT`, `ACCOUNT_EXPIRY_TIME` |
| Enum members | `camelCase` | `ConfigEnvironments.staging` |
| Private widget classes | `_PascalCase` | `_EmptyCart` |

---

## Views / Screens

```dart
class MyView extends StatefulWidget {
  static const routeName = '/my-view';
  final String someParam;

  const MyView({super.key, required this.someParam});

  @override
  State<MyView> createState() => _MyViewState();
}

class _MyViewState extends State<MyView> {
  final cubit = locator<MyCubit>();  // get cubit from locator

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.appColors.background,
      body: BlocBuilder<MyCubit, MyState>(
        bloc: cubit,
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (data) => _buildContent(data),
            error: (msg) => Center(child: Text(msg)),
          );
        },
      ),
    );
  }
}
```

- Prefer `StatefulWidget` for screens that own local UI state.
- Use `StatelessWidget` for pure display widgets with no local state.
- Extract private widget classes (e.g., `class _EmptyCart extends StatelessWidget`) instead of long inline builders.
- Always wrap the root `Scaffold` body with the relevant `BlocBuilder`.
- Avoid `setState` inside `BlocBuilder` — lift local state to fields on the `State` class.

---

## Auth Guard Pattern

```dart
// Guard any action requiring login:
await executeIfLoggedIn(() async {
  // only runs if logged in; shows login pop-up otherwise
}, context: context);

// Check inline:
if (!locator<AuthCubit>().isLoggedIn) { ... }

// Get current user:
final user = locator<AuthCubit>().user; // nullable
```

---

## Error Handling

- Repository layer: catch all exceptions, return `Right(APIServerError(...))`.
- Cubit layer: fold the Either, emit error state OR call `showTopAlert(error.message, isError: true)`.
- Never let exceptions propagate to the UI layer uncaught.
- For 401 responses, `ApiLocator` automatically retries once after token refresh.
- For 500 responses, `ApiLocator` returns `{'error': 'Something went wrong on the server...'}`.

---

## Code Generation

After editing any `@freezed` model or adding `@JsonSerializable`:

```bash
fvm dart run build_runner build --delete-conflicting-outputs
```

After changing assets:

```bash
fvm flutter pub run flutter_gen_runner
```

Never manually edit `.freezed.dart` or `.g.dart` files.

---

## Assets

Use generated `Assets` class — never hardcode paths:

```dart
// Images
Assets.images.authBackground2.image(fit: BoxFit.cover)

// SVG
SvgPicture.asset(Assets.svg.store, width: 24)

// GIF
Assets.gif.logoAnimation.image(width: context.width * 0.4)
```

---

## Localization

All user-facing strings go through `AppLocalizations`:

```dart
context.localization.myCart
context.localization.shop
context.localization.yourShoppingCartIsEmpty
```

ARB files live in `lib/src/l10n/`. Generated output is in `lib/src/l10n/generated/` and `lib/generated/intl/`.

Never hardcode English strings in the UI — always add to the ARB file and use `context.localization.*`.

---

## Firebase / Analytics

```dart
final _analyticsService = locator<AnalyticsService>();

_analyticsService.logEvent('Event_Name');
_analyticsService.logLogin(method: 'email');
_analyticsService.logSignUp(email: email);
_analyticsService.logAddToCart(sku: sku, quantity: qty);
_analyticsService.logViewCart(cart: cart);
```

- Use `AnalyticsService` wrapper — never call `FirebaseAnalytics.instance` directly in feature code.
- Crashlytics is enabled only in release builds.

---

## Environment Config

```dart
AppConfig.API_ROOT        // base API URL from dotenv
AppConfig.TEST_EMAIL      // debug only
AppConfig.HMS_AVAILABILITY // Huawei / GMS detection
```

Environments: `production`, `staging`, `beta`. Loaded from `<env>.env` files via `flutter_dotenv`. The active env is stored in `devBox` and can be changed from dev mode.

---

## Key Dependencies Reference

| Package | Purpose |
|---------|---------|
| `flutter_bloc` | Cubit state management |
| `freezed` + `freezed_annotation` | Immutable models and union states |
| `json_serializable` + `json_annotation` | JSON serialization |
| `get_it` | Dependency injection |
| `go_router` | Navigation |
| `fpdart` | Either type for functional error handling |
| `hive_flutter` | Encrypted local storage |
| `http` | HTTP requests (via ApiLocator only) |
| `google_fonts` | Montserrat font |
| `flutter_svg` | SVG rendering |
| `cached_network_image` | Network image caching |
| `flutter_gen` | Type-safe asset access |
| `logger` | Structured debug logging |
| `firebase_*` | Analytics, Crashlytics, FCM |
| `connectivity_plus` + `internet_connection_checker` | Network state |
| `flutter_secure_storage` | Hive encryption key storage |
| `tuple` | Tuple2/Tuple3 for multi-return values |
| `fvm` | Flutter version management — prefix all flutter/dart commands with `fvm` |
