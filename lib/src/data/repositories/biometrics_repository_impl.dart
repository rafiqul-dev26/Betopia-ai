import '../../core/base/result.dart';
import '../../domain/failures/business_failure.dart';
import '../../domain/repositories/biometrics_repository.dart';
import '../base/repository.dart';
import '../services/biometrics/biometrics_service.dart';
import '../services/cache/cache_service.dart';

final class BiometricsRepositoryImpl extends Repository
    implements BiometricsRepository {
  BiometricsRepositoryImpl({
    required this.biometricsService,
    required this.cacheService,
    required super.crashReporter,
  });

  final BiometricsService biometricsService;
  final CacheService cacheService;

  @override
  Future<Result<bool, BusinessFailure>> isAvailable() async {
    return asyncGuard(() async {
      return biometricsService.isAvailable();
    });
  }

  @override
  Future<Result<bool, BusinessFailure>> authenticate({
    required String reason,
  }) async {
    return asyncGuard(() async {
      final authenticated =
          await biometricsService.authenticate(localizedReason: reason);
      return authenticated;
    });
  }

  @override
  Future<bool> isEnabled() async {
    try {
      return cacheService.get<bool>(CacheKey.biometricsEnabled) ?? false;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<void> setEnabled(bool enabled) async {
    try {
      await cacheService.save(CacheKey.biometricsEnabled, enabled);
    } catch (_) {}
  }
}
