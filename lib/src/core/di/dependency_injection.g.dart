// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependency_injection.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sharedPreferences)
final sharedPreferencesProvider = SharedPreferencesProvider._();

final class SharedPreferencesProvider
    extends
        $FunctionalProvider<
          AsyncValue<SharedPreferences>,
          SharedPreferences,
          FutureOr<SharedPreferences>
        >
    with
        $FutureModifier<SharedPreferences>,
        $FutureProvider<SharedPreferences> {
  SharedPreferencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPreferencesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesHash();

  @$internal
  @override
  $FutureProviderElement<SharedPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SharedPreferences> create(Ref ref) {
    return sharedPreferences(ref);
  }
}

String _$sharedPreferencesHash() => r'ad13470fe866595ad0f58a3e26f11048d94ef22e';

/// The single sink for programmer bugs — the repository guards and the
/// global error handlers both report here. Override with a Crashlytics- or
/// Sentry-backed implementation to ship crash telemetry; the default logs.

@ProviderFor(crashReporter)
final crashReporterProvider = CrashReporterProvider._();

/// The single sink for programmer bugs — the repository guards and the
/// global error handlers both report here. Override with a Crashlytics- or
/// Sentry-backed implementation to ship crash telemetry; the default logs.

final class CrashReporterProvider
    extends $FunctionalProvider<CrashReporter, CrashReporter, CrashReporter>
    with $Provider<CrashReporter> {
  /// The single sink for programmer bugs — the repository guards and the
  /// global error handlers both report here. Override with a Crashlytics- or
  /// Sentry-backed implementation to ship crash telemetry; the default logs.
  CrashReporterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'crashReporterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$crashReporterHash();

  @$internal
  @override
  $ProviderElement<CrashReporter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CrashReporter create(Ref ref) {
    return crashReporter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CrashReporter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CrashReporter>(value),
    );
  }
}

String _$crashReporterHash() => r'79e8625846d065e9875064bd3ec1cacc6ff87fed';

/// The single place to adapt the network stack. Every [DioBuilder]
/// argument below is a deliberate seam; change it here, never in
/// transport code:
///
/// - `config` — base URL, timeouts, default headers ([NetworkConfig]).
/// - `store` — token persistence; swap [SecureTokenStore] for another
///   [TokenStore] to change key management.
/// - `errorParser` — match your backend's error envelope.
/// - `localeResolver` — sources `Accept-Language`; defaults to reading
///   the locale repository.
/// - `extraInterceptors` — appended after the template's core stack, the
///   seam for telemetry (Sentry, Datadog, Firebase Performance) and any
///   other cross-cutting concern. Documented order is in [DioBuilder].
/// - `logger` — the single logging interceptor, placed last before
///   `RefreshRetryInterceptor` so a 401 is logged before the refresh +
///   replay. The default is `PrettyDioLogger`, active in debug builds
///   only and configured to omit request headers (the pipeline hands the
///   logger the real request, bearer token included). Its package
///   defaults still print response bodies, which include the tokens in
///   login and refresh responses — acceptable for local debugging, not
///   for a shared log sink. Alternatives: [DebugLoggerInterceptor], the
///   template's strict option (no bodies, no header values, redaction
///   built in); any other logging [Interceptor] (talker, a custom one —
///   supply your own release gate and redaction); or `null` to disable
///   request logging entirely.

@ProviderFor(networkStack)
final networkStackProvider = NetworkStackProvider._();

/// The single place to adapt the network stack. Every [DioBuilder]
/// argument below is a deliberate seam; change it here, never in
/// transport code:
///
/// - `config` — base URL, timeouts, default headers ([NetworkConfig]).
/// - `store` — token persistence; swap [SecureTokenStore] for another
///   [TokenStore] to change key management.
/// - `errorParser` — match your backend's error envelope.
/// - `localeResolver` — sources `Accept-Language`; defaults to reading
///   the locale repository.
/// - `extraInterceptors` — appended after the template's core stack, the
///   seam for telemetry (Sentry, Datadog, Firebase Performance) and any
///   other cross-cutting concern. Documented order is in [DioBuilder].
/// - `logger` — the single logging interceptor, placed last before
///   `RefreshRetryInterceptor` so a 401 is logged before the refresh +
///   replay. The default is `PrettyDioLogger`, active in debug builds
///   only and configured to omit request headers (the pipeline hands the
///   logger the real request, bearer token included). Its package
///   defaults still print response bodies, which include the tokens in
///   login and refresh responses — acceptable for local debugging, not
///   for a shared log sink. Alternatives: [DebugLoggerInterceptor], the
///   template's strict option (no bodies, no header values, redaction
///   built in); any other logging [Interceptor] (talker, a custom one —
///   supply your own release gate and redaction); or `null` to disable
///   request logging entirely.

final class NetworkStackProvider
    extends $FunctionalProvider<NetworkStack, NetworkStack, NetworkStack>
    with $Provider<NetworkStack> {
  /// The single place to adapt the network stack. Every [DioBuilder]
  /// argument below is a deliberate seam; change it here, never in
  /// transport code:
  ///
  /// - `config` — base URL, timeouts, default headers ([NetworkConfig]).
  /// - `store` — token persistence; swap [SecureTokenStore] for another
  ///   [TokenStore] to change key management.
  /// - `errorParser` — match your backend's error envelope.
  /// - `localeResolver` — sources `Accept-Language`; defaults to reading
  ///   the locale repository.
  /// - `extraInterceptors` — appended after the template's core stack, the
  ///   seam for telemetry (Sentry, Datadog, Firebase Performance) and any
  ///   other cross-cutting concern. Documented order is in [DioBuilder].
  /// - `logger` — the single logging interceptor, placed last before
  ///   `RefreshRetryInterceptor` so a 401 is logged before the refresh +
  ///   replay. The default is `PrettyDioLogger`, active in debug builds
  ///   only and configured to omit request headers (the pipeline hands the
  ///   logger the real request, bearer token included). Its package
  ///   defaults still print response bodies, which include the tokens in
  ///   login and refresh responses — acceptable for local debugging, not
  ///   for a shared log sink. Alternatives: [DebugLoggerInterceptor], the
  ///   template's strict option (no bodies, no header values, redaction
  ///   built in); any other logging [Interceptor] (talker, a custom one —
  ///   supply your own release gate and redaction); or `null` to disable
  ///   request logging entirely.
  NetworkStackProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkStackProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkStackHash();

  @$internal
  @override
  $ProviderElement<NetworkStack> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NetworkStack create(Ref ref) {
    return networkStack(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NetworkStack value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NetworkStack>(value),
    );
  }
}

String _$networkStackHash() => r'd901990436106c99cdea574eb42668c29d0d75f0';

@ProviderFor(tokenManager)
final tokenManagerProvider = TokenManagerProvider._();

final class TokenManagerProvider
    extends $FunctionalProvider<TokenManager, TokenManager, TokenManager>
    with $Provider<TokenManager> {
  TokenManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tokenManagerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tokenManagerHash();

  @$internal
  @override
  $ProviderElement<TokenManager> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TokenManager create(Ref ref) {
    return tokenManager(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TokenManager value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TokenManager>(value),
    );
  }
}

String _$tokenManagerHash() => r'dde64a5a077155c1c424ef47810ec453a3941652';

@ProviderFor(authenticationRepository)
final authenticationRepositoryProvider = AuthenticationRepositoryProvider._();

final class AuthenticationRepositoryProvider
    extends
        $FunctionalProvider<
          AuthenticationRepository,
          AuthenticationRepository,
          AuthenticationRepository
        >
    with $Provider<AuthenticationRepository> {
  AuthenticationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authenticationRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authenticationRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthenticationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AuthenticationRepository create(Ref ref) {
    return authenticationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthenticationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthenticationRepository>(value),
    );
  }
}

String _$authenticationRepositoryHash() =>
    r'fe1d0e3eb6da64e8c033d10773d92462311eed58';

@ProviderFor(routerRepository)
final routerRepositoryProvider = RouterRepositoryProvider._();

final class RouterRepositoryProvider
    extends
        $FunctionalProvider<
          RouterRepository,
          RouterRepository,
          RouterRepository
        >
    with $Provider<RouterRepository> {
  RouterRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routerRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routerRepositoryHash();

  @$internal
  @override
  $ProviderElement<RouterRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RouterRepository create(Ref ref) {
    return routerRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RouterRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RouterRepository>(value),
    );
  }
}

String _$routerRepositoryHash() => r'77c55ab3177c455191c4c5006d33a99c1b7bb929';

@ProviderFor(localeRepository)
final localeRepositoryProvider = LocaleRepositoryProvider._();

final class LocaleRepositoryProvider
    extends
        $FunctionalProvider<
          LocaleRepository,
          LocaleRepository,
          LocaleRepository
        >
    with $Provider<LocaleRepository> {
  LocaleRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localeRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localeRepositoryHash();

  @$internal
  @override
  $ProviderElement<LocaleRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LocaleRepository create(Ref ref) {
    return localeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocaleRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocaleRepository>(value),
    );
  }
}

String _$localeRepositoryHash() => r'0a0a73c4a065d0204a4c4f3e0f3a3bfc7d9f56a1';

@ProviderFor(cacheService)
final cacheServiceProvider = CacheServiceProvider._();

final class CacheServiceProvider
    extends $FunctionalProvider<CacheService, CacheService, CacheService>
    with $Provider<CacheService> {
  CacheServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cacheServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cacheServiceHash();

  @$internal
  @override
  $ProviderElement<CacheService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CacheService create(Ref ref) {
    return cacheService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CacheService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CacheService>(value),
    );
  }
}

String _$cacheServiceHash() => r'18441edd063a61728828628b49c6773bd3f4a059';

@ProviderFor(restClientService)
final restClientServiceProvider = RestClientServiceProvider._();

final class RestClientServiceProvider
    extends $FunctionalProvider<RestClient, RestClient, RestClient>
    with $Provider<RestClient> {
  RestClientServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'restClientServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$restClientServiceHash();

  @$internal
  @override
  $ProviderElement<RestClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RestClient create(Ref ref) {
    return restClientService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RestClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RestClient>(value),
    );
  }
}

String _$restClientServiceHash() => r'2d8797d82ab4d8b5269361b5a460b8373d827cd0';

@ProviderFor(loginUseCase)
final loginUseCaseProvider = LoginUseCaseProvider._();

final class LoginUseCaseProvider
    extends $FunctionalProvider<LoginUseCase, LoginUseCase, LoginUseCase>
    with $Provider<LoginUseCase> {
  LoginUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginUseCaseHash();

  @$internal
  @override
  $ProviderElement<LoginUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoginUseCase create(Ref ref) {
    return loginUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginUseCase>(value),
    );
  }
}

String _$loginUseCaseHash() => r'831e9d72a354511bd5b0dbc943bd1f2ec0f72122';

@ProviderFor(logoutUseCase)
final logoutUseCaseProvider = LogoutUseCaseProvider._();

final class LogoutUseCaseProvider
    extends $FunctionalProvider<LogoutUseCase, LogoutUseCase, LogoutUseCase>
    with $Provider<LogoutUseCase> {
  LogoutUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logoutUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logoutUseCaseHash();

  @$internal
  @override
  $ProviderElement<LogoutUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LogoutUseCase create(Ref ref) {
    return logoutUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LogoutUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LogoutUseCase>(value),
    );
  }
}

String _$logoutUseCaseHash() => r'ed03ec2c9350eb2c8fff49a0e97d6f85f7d12816';

@ProviderFor(getCurrentLocaleUseCase)
final getCurrentLocaleUseCaseProvider = GetCurrentLocaleUseCaseProvider._();

final class GetCurrentLocaleUseCaseProvider
    extends
        $FunctionalProvider<
          GetCurrentLocaleUseCase,
          GetCurrentLocaleUseCase,
          GetCurrentLocaleUseCase
        >
    with $Provider<GetCurrentLocaleUseCase> {
  GetCurrentLocaleUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCurrentLocaleUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCurrentLocaleUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetCurrentLocaleUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetCurrentLocaleUseCase create(Ref ref) {
    return getCurrentLocaleUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCurrentLocaleUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCurrentLocaleUseCase>(value),
    );
  }
}

String _$getCurrentLocaleUseCaseHash() =>
    r'9f8616c51a8e87003bb72f4110cfeda97bfac7ed';

@ProviderFor(setCurrentLocaleUseCase)
final setCurrentLocaleUseCaseProvider = SetCurrentLocaleUseCaseProvider._();

final class SetCurrentLocaleUseCaseProvider
    extends
        $FunctionalProvider<
          SetCurrentLocaleUseCase,
          SetCurrentLocaleUseCase,
          SetCurrentLocaleUseCase
        >
    with $Provider<SetCurrentLocaleUseCase> {
  SetCurrentLocaleUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'setCurrentLocaleUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$setCurrentLocaleUseCaseHash();

  @$internal
  @override
  $ProviderElement<SetCurrentLocaleUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SetCurrentLocaleUseCase create(Ref ref) {
    return setCurrentLocaleUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SetCurrentLocaleUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SetCurrentLocaleUseCase>(value),
    );
  }
}

String _$setCurrentLocaleUseCaseHash() =>
    r'dd8ff41392e903753983732efad4b901792061db';

@ProviderFor(resetRepositoryUseCase)
final resetRepositoryUseCaseProvider = ResetRepositoryUseCaseProvider._();

final class ResetRepositoryUseCaseProvider
    extends
        $FunctionalProvider<
          ResetRepositoryUseCase,
          ResetRepositoryUseCase,
          ResetRepositoryUseCase
        >
    with $Provider<ResetRepositoryUseCase> {
  ResetRepositoryUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resetRepositoryUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resetRepositoryUseCaseHash();

  @$internal
  @override
  $ProviderElement<ResetRepositoryUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ResetRepositoryUseCase create(Ref ref) {
    return resetRepositoryUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResetRepositoryUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResetRepositoryUseCase>(value),
    );
  }
}

String _$resetRepositoryUseCaseHash() =>
    r'272d74f8e5d5dea3aaa93eee0393143f03b17eb6';

@ProviderFor(getOnboardingStatusUseCase)
final getOnboardingStatusUseCaseProvider =
    GetOnboardingStatusUseCaseProvider._();

final class GetOnboardingStatusUseCaseProvider
    extends
        $FunctionalProvider<
          GetOnboardingStatusUseCase,
          GetOnboardingStatusUseCase,
          GetOnboardingStatusUseCase
        >
    with $Provider<GetOnboardingStatusUseCase> {
  GetOnboardingStatusUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getOnboardingStatusUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getOnboardingStatusUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetOnboardingStatusUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetOnboardingStatusUseCase create(Ref ref) {
    return getOnboardingStatusUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetOnboardingStatusUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetOnboardingStatusUseCase>(value),
    );
  }
}

String _$getOnboardingStatusUseCaseHash() =>
    r'f200763f0660732d376014a37377a43098c8fa01';

@ProviderFor(getSessionStatusUseCase)
final getSessionStatusUseCaseProvider = GetSessionStatusUseCaseProvider._();

final class GetSessionStatusUseCaseProvider
    extends
        $FunctionalProvider<
          GetSessionStatusUseCase,
          GetSessionStatusUseCase,
          GetSessionStatusUseCase
        >
    with $Provider<GetSessionStatusUseCase> {
  GetSessionStatusUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getSessionStatusUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getSessionStatusUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetSessionStatusUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetSessionStatusUseCase create(Ref ref) {
    return getSessionStatusUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetSessionStatusUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetSessionStatusUseCase>(value),
    );
  }
}

String _$getSessionStatusUseCaseHash() =>
    r'8fd08281a27bcdd847f8bb0e5ed8014472145a48';

@ProviderFor(restoreSessionUseCase)
final restoreSessionUseCaseProvider = RestoreSessionUseCaseProvider._();

final class RestoreSessionUseCaseProvider
    extends
        $FunctionalProvider<
          RestoreSessionUseCase,
          RestoreSessionUseCase,
          RestoreSessionUseCase
        >
    with $Provider<RestoreSessionUseCase> {
  RestoreSessionUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'restoreSessionUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$restoreSessionUseCaseHash();

  @$internal
  @override
  $ProviderElement<RestoreSessionUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RestoreSessionUseCase create(Ref ref) {
    return restoreSessionUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RestoreSessionUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RestoreSessionUseCase>(value),
    );
  }
}

String _$restoreSessionUseCaseHash() =>
    r'189047c97c81ba57a0995d0053c18d37f24af6dd';

@ProviderFor(markOnboardingCompletedUseCase)
final markOnboardingCompletedUseCaseProvider =
    MarkOnboardingCompletedUseCaseProvider._();

final class MarkOnboardingCompletedUseCaseProvider
    extends
        $FunctionalProvider<
          MarkOnboardingCompletedUseCase,
          MarkOnboardingCompletedUseCase,
          MarkOnboardingCompletedUseCase
        >
    with $Provider<MarkOnboardingCompletedUseCase> {
  MarkOnboardingCompletedUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'markOnboardingCompletedUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$markOnboardingCompletedUseCaseHash();

  @$internal
  @override
  $ProviderElement<MarkOnboardingCompletedUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MarkOnboardingCompletedUseCase create(Ref ref) {
    return markOnboardingCompletedUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MarkOnboardingCompletedUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MarkOnboardingCompletedUseCase>(
        value,
      ),
    );
  }
}

String _$markOnboardingCompletedUseCaseHash() =>
    r'a95c47e9b5ab746035908ddd70904a7775f1f73e';
