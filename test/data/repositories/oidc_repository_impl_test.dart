import 'package:betopia_ai/src/core/base/crash_reporter.dart';
import 'package:betopia_ai/src/core/base/result.dart';
import 'package:betopia_ai/src/data/repositories/oidc_repository_impl.dart';
import 'package:betopia_ai/src/data/services/cache/cache_service.dart';
import 'package:betopia_ai/src/data/services/network/auth/token_manager.dart';
import 'package:betopia_ai/src/data/services/network/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:retrofit/retrofit.dart';

import '../services/network/helpers.dart';

class _FakeCacheService implements CacheService {
  final Map<CacheKey, Object?> _data = {};

  @override
  Future<void> save<T>(CacheKey key, T value) async {
    _data[key] = value;
  }

  @override
  T? get<T>(CacheKey key) => _data[key] as T?;

  @override
  Future<void> remove(List<CacheKey> keys) async {
    keys.forEach(_data.remove);
  }

  @override
  Future<void> clear() async {
    _data.clear();
  }
}

class _MockRestClient implements RestClient {
  List<dynamic> providersResponse = [];
  Map<String, dynamic> authUrlResponse = {};
  Map<String, dynamic> exchangeResponse = {};

  @override
  Future<HttpResponse> getOidcProviders() async {
    return HttpResponse(
      providersResponse,
      Response(requestOptions: RequestOptions()),
    );
  }

  @override
  Future<HttpResponse> getOidcAuthUrl(int configId) async {
    return HttpResponse(
      authUrlResponse,
      Response(requestOptions: RequestOptions()),
    );
  }

  @override
  Future<HttpResponse> exchangeTicket(Map<String, dynamic> request) async {
    return HttpResponse(
      exchangeResponse,
      Response(requestOptions: RequestOptions()),
    );
  }

  @override
  Future<HttpResponse> currentUser() => throw UnimplementedError();

  @override
  Future<HttpResponse> login(Map<String, dynamic> request) =>
      throw UnimplementedError();
}

void main() {
  late _MockRestClient remote;
  late _FakeCacheService local;
  late FakeTokenStore tokenStore;
  late TokenManager tokenManager;
  late OidcRepositoryImpl repo;

  setUp(() {
    remote = _MockRestClient();
    local = _FakeCacheService();
    tokenStore = FakeTokenStore();
    tokenManager = TokenManager(
      store: tokenStore,
      transport: Dio(),
      refreshEndpoint: testRefreshPath,
    );
    repo = OidcRepositoryImpl(
      remote: remote,
      local: local,
      tokens: tokenManager,
      crashReporter: const LoggingCrashReporter(),
    );
  });

  group('OidcRepositoryImpl.getProviders', () {
    test('parses and returns OIDC providers list', () async {
      remote.providersResponse = [
        {
          'id': 1,
          'oidc_name': 'Okta Enterprise',
          'allowed_domains': 'betopia.ai',
          'issuer_url': 'https://okta.example.com',
          'scope': 'openid profile email',
        },
      ];

      final result = await repo.getProviders();

      expect(result, isA<Success>());
      final list = (result as Success).data;
      expect(list.length, 1);
      expect(list.first.id, 1);
      expect(list.first.oidcName, 'Okta Enterprise');
      expect(list.first.allowedDomains, 'betopia.ai');
    });
  });

  group('OidcRepositoryImpl.getAuthUrl', () {
    test('returns authorization URL', () async {
      remote.authUrlResponse = {
        'authorization_url': 'https://auth.example.com/oauth/authorize?client_id=123',
      };

      final result = await repo.getAuthUrl(1);

      expect(result, isA<Success>());
      expect(
        (result as Success).data,
        'https://auth.example.com/oauth/authorize?client_id=123',
      );
    });
  });

  group('OidcRepositoryImpl.exchangeTicket', () {
    test('exchanges ticket and persists tokens', () async {
      remote.exchangeResponse = {
        'access_token': 'sso_access_jwt',
        'refresh_token': 'sso_refresh_jwt',
        'token_type': 'bearer',
        'expires_in': 3600,
      };

      final result = await repo.exchangeTicket(ticket: 'test_ticket_123');

      expect(result, isA<Success>());
      expect(await tokenManager.accessToken, 'sso_access_jwt');
      expect(await tokenManager.refreshToken, 'sso_refresh_jwt');
      expect(local.get<bool>(CacheKey.isLoggedIn), isTrue);
    });
  });
}
