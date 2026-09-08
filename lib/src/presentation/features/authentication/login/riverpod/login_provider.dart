import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/base/result.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../core/application_state/onboarding_status_provider/onboarding_status_provider.dart';
import '../../../../core/application_state/session_status_provider/session_status_provider.dart';

part 'login_provider.g.dart';

@riverpod
class Login extends _$Login {
  @override
  AsyncValue build() {
    return const AsyncValue.data(null);
  }

  void login({
    required String email,
    required String password,
    bool? shouldRemember,
  }) async {
    if (state.isLoading) return;

    state = const AsyncValue.loading();

    final result = await ref
        .read(loginUseCaseProvider)
        .call(email: email, password: password, shouldRemember: shouldRemember);

    if (!ref.mounted) return;

    switch (result) {
      case Success():
        ref.read(markOnboardingCompletedUseCaseProvider).call();
        ref.invalidate(onboardingStatusProvider);
        final _ = await ref.refresh(sessionStatusProvider.future);
        state = AsyncValue.data(result);
      case Error(:final error):
        state = AsyncValue.error(error, StackTrace.current);
    }
  }
}
