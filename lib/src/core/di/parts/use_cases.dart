part of '../dependency_injection.dart';

@riverpod
LoginUseCase loginUseCase(Ref ref) {
  return LoginUseCase(ref.watch(authenticationRepositoryProvider));
}

@riverpod
LogoutUseCase logoutUseCase(Ref ref) {
  return LogoutUseCase(ref.watch(authenticationRepositoryProvider));
}

@riverpod
GetCurrentLocaleUseCase getCurrentLocaleUseCase(Ref ref) {
  return GetCurrentLocaleUseCase(ref.watch(localeRepositoryProvider));
}

@riverpod
SetCurrentLocaleUseCase setCurrentLocaleUseCase(Ref ref) {
  return SetCurrentLocaleUseCase(ref.watch(localeRepositoryProvider));
}

@riverpod
ResetRepositoryUseCase resetRepositoryUseCase(Ref ref) {
  return const ResetRepositoryUseCase();
}

@riverpod
GetOnboardingStatusUseCase getOnboardingStatusUseCase(Ref ref) {
  return GetOnboardingStatusUseCase(ref.watch(routerRepositoryProvider));
}

@riverpod
GetSessionStatusUseCase getSessionStatusUseCase(Ref ref) {
  return GetSessionStatusUseCase(ref.watch(routerRepositoryProvider));
}

@riverpod
RestoreSessionUseCase restoreSessionUseCase(Ref ref) {
  return RestoreSessionUseCase(ref.watch(authenticationRepositoryProvider));
}

@riverpod
MarkOnboardingCompletedUseCase markOnboardingCompletedUseCase(Ref ref) {
  return MarkOnboardingCompletedUseCase(ref.watch(routerRepositoryProvider));
}

@riverpod
GetOidcProvidersUseCase getOidcProvidersUseCase(Ref ref) {
  return GetOidcProvidersUseCase(ref.watch(oidcRepositoryProvider));
}

@riverpod
GetOidcAuthUrlUseCase getOidcAuthUrlUseCase(Ref ref) {
  return GetOidcAuthUrlUseCase(ref.watch(oidcRepositoryProvider));
}

@riverpod
ExchangeAuthTicketUseCase exchangeAuthTicketUseCase(Ref ref) {
  return ExchangeAuthTicketUseCase(ref.watch(oidcRepositoryProvider));
}

@riverpod
CheckBiometricsAvailableUseCase checkBiometricsAvailableUseCase(Ref ref) {
  return CheckBiometricsAvailableUseCase(
    ref.watch(biometricsRepositoryProvider),
  );
}

@riverpod
AuthenticateWithBiometricsUseCase authenticateWithBiometricsUseCase(Ref ref) {
  return AuthenticateWithBiometricsUseCase(
    ref.watch(biometricsRepositoryProvider),
  );
}

@riverpod
GetBiometricsEnabledUseCase getBiometricsEnabledUseCase(Ref ref) {
  return GetBiometricsEnabledUseCase(ref.watch(biometricsRepositoryProvider));
}

@riverpod
SetBiometricsEnabledUseCase setBiometricsEnabledUseCase(Ref ref) {
  return SetBiometricsEnabledUseCase(ref.watch(biometricsRepositoryProvider));
}
