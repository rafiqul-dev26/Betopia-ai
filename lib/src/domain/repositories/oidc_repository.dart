import '../../core/base/result.dart';
import '../entities/oidc_provider_entity.dart';
import '../entities/sso_session_entity.dart';
import '../failures/business_failure.dart';

abstract interface class OidcRepository {
  /// Fetches the list of registered enterprise OIDC identity providers.
  Future<Result<List<OidcProviderEntity>, BusinessFailure>> getProviders();

  /// Retrieves the IdP authorization URL for the specified provider [configId].
  Future<Result<String, BusinessFailure>> getAuthUrl(int configId);

  /// Exchanges a one-time authentication ticket for JWT access and refresh
  /// tokens. Tokens are securely persisted in the data layer.
  Future<Result<SsoSessionEntity, BusinessFailure>> exchangeTicket({
    required String ticket,
    bool shouldRemember = true,
  });
}
