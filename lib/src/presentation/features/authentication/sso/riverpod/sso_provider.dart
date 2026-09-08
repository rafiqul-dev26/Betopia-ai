import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/base/result.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../data/services/cache/cache_service.dart';
import '../../../../../domain/entities/oidc_provider_entity.dart';
import '../../../../../domain/failures/business_failure.dart';
import '../../../../core/application_state/onboarding_status_provider/onboarding_status_provider.dart';
import '../../../../core/application_state/session_status_provider/session_status_provider.dart';

part 'sso_provider.g.dart';

@riverpod
class Sso extends _$Sso {
  @override
  AsyncValue build() {
    return const AsyncValue.data(null);
  }

  /// Fetches available enterprise OIDC providers.
  Future<Result<List<OidcProviderEntity>, BusinessFailure>>
      fetchProviders() async {
    return ref.read(getOidcProvidersUseCaseProvider).call();
  }

  /// Obtains the IdP authorization URL for [configId].
  Future<Result<String, BusinessFailure>> getAuthUrl(int configId) async {
    return ref.read(getOidcAuthUrlUseCaseProvider).call(configId);
  }

  /// Launches the enterprise IdP URL in the in-app browser tab or external browser.
  Future<bool> launchIdpUrl(String url) async {
    final uri = Uri.tryParse(url.trim());
    if (uri == null) return false;

    if (await canLaunchUrl(uri)) {
      try {
        final launched = await launchUrl(
          uri,
          mode: LaunchMode.inAppBrowserView,
        );
        if (launched) return true;
      } catch (_) {}

      return launchUrl(uri, mode: LaunchMode.externalApplication);
    }
    return false;
  }

  /// Exchanges the one-time authentication ticket for access & refresh tokens.
  Future<void> exchangeTicket({
    required String ticket,
    bool shouldRemember = true,
  }) async {
    if (state.isLoading) return;

    state = const AsyncValue.loading();

    final result = await ref
        .read(exchangeAuthTicketUseCaseProvider)
        .call(ticket: ticket.trim(), shouldRemember: shouldRemember);

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

  /// Direct session completion when tokens are provided directly.
  Future<void> completeDirectSession({
    required String accessToken,
    String? refreshToken,
    bool shouldRemember = true,
  }) async {
    if (state.isLoading) return;

    state = const AsyncValue.loading();

    try {
      final tokenManager = ref.read(tokenManagerProvider);
      await tokenManager.persist(
        access: accessToken,
        refresh: refreshToken,
      );

      if (shouldRemember) {
        final cache = ref.read(cacheServiceProvider);
        await cache.save(CacheKey.isLoggedIn, true);
      }

      ref.read(markOnboardingCompletedUseCaseProvider).call();
      ref.invalidate(onboardingStatusProvider);
      final _ = await ref.refresh(sessionStatusProvider.future);
      state = const AsyncValue.data(true);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}
