import 'package:betopia_ai/src/core/base/result.dart';
import 'package:betopia_ai/src/domain/entities/oidc_provider_entity.dart';
import 'package:betopia_ai/src/domain/entities/sso_session_entity.dart';
import 'package:betopia_ai/src/domain/failures/business_failure.dart';
import 'package:betopia_ai/src/domain/repositories/oidc_repository.dart';
import 'package:betopia_ai/src/domain/use_cases/oidc_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

class _MockOidcRepository implements OidcRepository {
  List<OidcProviderEntity> providers = [];
  String authUrl = '';
  SsoSessionEntity session =
      const SsoSessionEntity(tokenType: 'bearer', expiresIn: 3600);

  @override
  Future<Result<List<OidcProviderEntity>, BusinessFailure>>
      getProviders() async {
    return Result.success(providers);
  }

  @override
  Future<Result<String, BusinessFailure>> getAuthUrl(int configId) async {
    return Result.success(authUrl);
  }

  @override
  Future<Result<SsoSessionEntity, BusinessFailure>> exchangeTicket({
    required String ticket,
    bool shouldRemember = true,
  }) async {
    return Result.success(session);
  }
}

void main() {
  late _MockOidcRepository repository;

  setUp(() {
    repository = _MockOidcRepository();
  });

  test('GetOidcProvidersUseCase delegates to repository', () async {
    repository.providers = [
      const OidcProviderEntity(
        id: 1,
        oidcName: 'Azure AD',
        issuerUrl: 'https://login.microsoft.com',
        scope: 'openid',
      ),
    ];
    final useCase = GetOidcProvidersUseCase(repository);

    final result = await useCase();

    expect(result, isA<Success<List<OidcProviderEntity>, BusinessFailure>>());
    expect((result as Success).data.length, 1);
    expect((result as Success).data.first.oidcName, 'Azure AD');
  });

  test('GetOidcAuthUrlUseCase delegates to repository', () async {
    repository.authUrl = 'https://login.microsoft.com/auth';
    final useCase = GetOidcAuthUrlUseCase(repository);

    final result = await useCase(1);

    expect(result, isA<Success<String, BusinessFailure>>());
    expect((result as Success).data, 'https://login.microsoft.com/auth');
  });

  test('ExchangeAuthTicketUseCase delegates to repository', () async {
    final useCase = ExchangeAuthTicketUseCase(repository);

    final result = await useCase(ticket: 'test_ticket');

    expect(result, isA<Success<SsoSessionEntity, BusinessFailure>>());
    expect((result as Success).data.tokenType, 'bearer');
  });
}
