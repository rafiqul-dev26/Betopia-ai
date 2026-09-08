import '../../core/base/result.dart';
import '../entities/oidc_provider_entity.dart';
import '../entities/sso_session_entity.dart';
import '../failures/business_failure.dart';
import '../repositories/oidc_repository.dart';

final class GetOidcProvidersUseCase {
  const GetOidcProvidersUseCase(this.repository);

  final OidcRepository repository;

  Future<Result<List<OidcProviderEntity>, BusinessFailure>> call() {
    return repository.getProviders();
  }
}

final class GetOidcAuthUrlUseCase {
  const GetOidcAuthUrlUseCase(this.repository);

  final OidcRepository repository;

  Future<Result<String, BusinessFailure>> call(int configId) {
    return repository.getAuthUrl(configId);
  }
}

final class ExchangeAuthTicketUseCase {
  const ExchangeAuthTicketUseCase(this.repository);

  final OidcRepository repository;

  Future<Result<SsoSessionEntity, BusinessFailure>> call({
    required String ticket,
    bool shouldRemember = true,
  }) {
    return repository.exchangeTicket(
      ticket: ticket,
      shouldRemember: shouldRemember,
    );
  }
}
