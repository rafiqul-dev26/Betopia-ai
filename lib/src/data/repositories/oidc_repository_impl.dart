import '../../core/base/result.dart';
import '../../domain/entities/oidc_provider_entity.dart';
import '../../domain/entities/sso_session_entity.dart';
import '../../domain/failures/business_failure.dart';
import '../../domain/repositories/oidc_repository.dart';
import '../base/repository.dart';
import '../mappers/oidc_mapper.dart';
import '../models/exchange_ticket_model.dart';
import '../models/oidc_auth_url_model.dart';
import '../services/cache/cache_service.dart';
import '../services/network/auth/token_manager.dart';
import '../services/network/rest_client.dart';

final class OidcRepositoryImpl extends Repository implements OidcRepository {
  OidcRepositoryImpl({
    required this.remote,
    required this.local,
    required this.tokens,
    required super.crashReporter,
  });

  final RestClient remote;
  final CacheService local;
  final TokenManager tokens;

  static const _oidcMapper = OidcMapper();

  @override
  Future<Result<List<OidcProviderEntity>, BusinessFailure>>
      getProviders() async {
    return asyncGuard(() async {
      final response = await remote.getOidcProviders();
      final data = response.data;
      if (data is List) {
        return _oidcMapper.toProviderEntityList(data);
      }
      return const <OidcProviderEntity>[];
    });
  }

  @override
  Future<Result<String, BusinessFailure>> getAuthUrl(int configId) async {
    return asyncGuard(() async {
      final response = await remote.getOidcAuthUrl(configId);
      final rawData = response.data;
      final map = rawData is Map<String, dynamic>
          ? rawData
          : (rawData as Map).cast<String, dynamic>();
      final model = OidcAuthUrlModel.fromJson(map);
      return model.authorizationUrl;
    });
  }

  @override
  Future<Result<SsoSessionEntity, BusinessFailure>> exchangeTicket({
    required String ticket,
    bool shouldRemember = true,
  }) async {
    return asyncGuard(() async {
      final request = ExchangeTicketRequestModel(ticket: ticket);
      final response = await remote.exchangeTicket(request.toJson());

      final rawData = response.data;
      final map = rawData is Map<String, dynamic>
          ? rawData
          : (rawData as Map).cast<String, dynamic>();
      final model = TokenResponseModel.fromJson(map);

      await tokens.persist(
        access: model.accessToken,
        refresh: model.refreshToken,
      );

      if (shouldRemember) {
        try {
          await local.save(CacheKey.isLoggedIn, true);
        } catch (_) {
          await tokens.clear();
          rethrow;
        }
      }

      return _oidcMapper.toSessionEntity(model);
    });
  }
}
