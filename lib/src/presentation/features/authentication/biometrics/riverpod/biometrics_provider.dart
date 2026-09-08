import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/base/result.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../core/application_state/onboarding_status_provider/onboarding_status_provider.dart';
import '../../../../core/application_state/session_status_provider/session_status_provider.dart';

part 'biometrics_provider.g.dart';

@riverpod
class Biometrics extends _$Biometrics {
  @override
  AsyncValue<bool> build() {
    return const AsyncValue.data(false);
  }

  /// Checks if biometrics hardware is available and enrolled on the device.
  Future<bool> checkAvailability() async {
    final result =
        await ref.read(checkBiometricsAvailableUseCaseProvider).call();
    return switch (result) {
      Success(:final data) => data,
      Error() => false,
    };
  }

  /// Prompts biometric authentication (fingerprint / Face ID).
  /// If authentication passes and a valid session/tokens exist, unlocks the
  /// dashboard.
  Future<bool> authenticateAndLogin({
    required String localizedReason,
  }) async {
    if (state.isLoading) return false;

    state = const AsyncValue.loading();

    final authResult = await ref
        .read(authenticateWithBiometricsUseCaseProvider)
        .call(reason: localizedReason);

    if (!ref.mounted) return false;

    switch (authResult) {
      case Success(:final data):
        if (data) {
          final tokenManager = ref.read(tokenManagerProvider);
          final access = await tokenManager.accessToken;
          final refresh = await tokenManager.refreshToken;

          final hasSession =
              (access != null && access.isNotEmpty) ||
              (refresh != null && refresh.isNotEmpty);

          if (hasSession) {
            ref.read(markOnboardingCompletedUseCaseProvider).call();
            ref.invalidate(onboardingStatusProvider);
            final _ = await ref.refresh(sessionStatusProvider.future);
            state = const AsyncValue.data(true);
            return true;
          } else {
            // Biometric succeeded, but no stored session to restore
            state = const AsyncValue.data(true);
            return true;
          }
        } else {
          state = const AsyncValue.data(false);
          return false;
        }
      case Error(:final error):
        state = AsyncValue.error(error, StackTrace.current);
        return false;
    }
  }
}
