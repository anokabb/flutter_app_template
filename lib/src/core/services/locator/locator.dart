import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app_template/src/core/constants/env_config.dart';
import 'package:flutter_app_template/src/core/network/client/dio_factory.dart';
import 'package:flutter_app_template/src/core/network/client/interceptors/logger_interceptor.dart';
import 'package:flutter_app_template/src/core/network/client/interceptors/mock_logger_interceptor.dart';
import 'package:flutter_app_template/src/features/auth/data/repos/auth_repo.dart';
import 'package:flutter_app_template/src/features/auth/data/repos/mock_auth_repo.dart';
import 'package:flutter_app_template/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter_app_template/src/features/languages/presentation/cubit/language_cubit.dart';
import 'package:flutter_app_template/src/features/theme/presentation/cubit/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

// TODO: Remove this when not testing
bool isMockTesting = kDebugMode && true;

final locator = GetIt.instance;

void setupLocator() {
  // 1. Dio Client
  locator.registerLazySingleton<Dio>(
    () => DioFactory.create(
      baseUrl: EnvConfig.baseUrl,
      interceptors: [
        // AuthInterceptor(() => locator<AuthRepo>().getToken() ?? ''),
        isMockTesting ? MockLoggerInterceptor() : LoggerInterceptor(),
      ],
    ),
  );

  // 2. APIs
  // locator.registerLazySingleton<AuthApi>(() => AuthApi(locator<Dio>()));

  // 3. Repositories
  if (isMockTesting ) {
    locator.registerLazySingleton<AuthRepo>(() => MockAuthRepo());
  } else {
    // locator.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(locator<AuthApi>()));
  }

  // 4. Cubits
  locator.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
  locator.registerLazySingleton<LanguageCubit>(() => LanguageCubit());
  locator.registerLazySingleton<AuthCubit>(() => AuthCubit(locator<AuthRepo>()));
}

void onLoggedIn(GetIt instance) async {
  log('Locator onLoggedIn');
}

List<BlocProvider> blocProviders = [
  BlocProvider<ThemeCubit>.value(value: locator<ThemeCubit>()),
  BlocProvider<LanguageCubit>.value(value: locator<LanguageCubit>()),
  BlocProvider<AuthCubit>(create: (_) => locator<AuthCubit>(), lazy: false),
];
