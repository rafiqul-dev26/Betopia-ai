part of '../dependency_injection.dart';

@Riverpod(keepAlive: true)
AuthenticationRepository authenticationRepository(Ref ref) {
  return AuthenticationRepositoryImpl(
    remote: ref.watch(restClientServiceProvider),
    local: ref.watch(cacheServiceProvider),
    tokens: ref.watch(tokenManagerProvider),
    crashReporter: ref.watch(crashReporterProvider),
  );
}

@Riverpod(keepAlive: true)
RouterRepository routerRepository(Ref ref) {
  return RouterRepositoryImpl(
    cacheService: ref.watch(cacheServiceProvider),
    tokens: ref.watch(tokenManagerProvider),
  );
}

@Riverpod(keepAlive: true)
LocaleRepository localeRepository(Ref ref) {
  return LocaleRepositoryImpl(ref.watch(cacheServiceProvider));
}

@Riverpod(keepAlive: true)
OidcRepository oidcRepository(Ref ref) {
  return OidcRepositoryImpl(
    remote: ref.watch(restClientServiceProvider),
    local: ref.watch(cacheServiceProvider),
    tokens: ref.watch(tokenManagerProvider),
    crashReporter: ref.watch(crashReporterProvider),
  );
}

@Riverpod(keepAlive: true)
BiometricsRepository biometricsRepository(Ref ref) {
  return BiometricsRepositoryImpl(
    biometricsService: ref.watch(biometricsServiceProvider),
    cacheService: ref.watch(cacheServiceProvider),
    crashReporter: ref.watch(crashReporterProvider),
  );
}
