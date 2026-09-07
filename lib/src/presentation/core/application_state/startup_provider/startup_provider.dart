import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/di/dependency_injection.dart';
import '../localization_provider/localization_provider.dart';

part 'startup_provider.g.dart';

@Riverpod(keepAlive: true)
Future<void> startup(Ref ref) async {
  ref.onDispose(() {
    ref.invalidate(sharedPreferencesProvider);
  });

  await ref.watch(sharedPreferencesProvider.future);

  try {
    await ref.read(localizationProvider.notifier).setCurrentLocal();
  } catch (_) {
    // Non-fatal, fallback to default English locale
  }

  try {
    await ref.read(restoreSessionUseCaseProvider).call();
  } catch (_) {
    // Non-fatal, fallback to unauthenticated state
  }
}
