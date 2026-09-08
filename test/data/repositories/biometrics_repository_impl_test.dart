import 'package:betopia_ai/src/core/base/crash_reporter.dart';
import 'package:betopia_ai/src/core/base/result.dart';
import 'package:betopia_ai/src/data/repositories/biometrics_repository_impl.dart';
import 'package:betopia_ai/src/data/services/biometrics/biometrics_service.dart';
import 'package:betopia_ai/src/data/services/cache/cache_service.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeBiometricsService implements BiometricsService {
  bool available = true;
  bool authResult = true;

  @override
  Future<bool> isAvailable() async => available;

  @override
  Future<bool> authenticate({required String localizedReason}) async =>
      authResult;
}

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

void main() {
  late _FakeBiometricsService biometricsService;
  late _FakeCacheService cacheService;
  late BiometricsRepositoryImpl repository;

  setUp(() {
    biometricsService = _FakeBiometricsService();
    cacheService = _FakeCacheService();
    repository = BiometricsRepositoryImpl(
      biometricsService: biometricsService,
      cacheService: cacheService,
      crashReporter: const LoggingCrashReporter(),
    );
  });

  group('BiometricsRepositoryImpl.isAvailable', () {
    test('returns true when hardware and enrollment available', () async {
      final result = await repository.isAvailable();
      expect(result, isA<Success>());
      expect((result as Success).data, isTrue);
    });

    test('returns false when biometrics unavailable', () async {
      biometricsService.available = false;
      final result = await repository.isAvailable();
      expect(result, isA<Success>());
      expect((result as Success).data, isFalse);
    });
  });

  group('BiometricsRepositoryImpl.authenticate', () {
    test('returns success on valid authentication', () async {
      final result = await repository.authenticate(reason: 'Test reason');
      expect(result, isA<Success>());
      expect((result as Success).data, isTrue);
    });
  });

  group('BiometricsRepositoryImpl.isEnabled & setEnabled', () {
    test('persists and reads biometric enabled state', () async {
      expect(await repository.isEnabled(), isFalse);
      await repository.setEnabled(true);
      expect(await repository.isEnabled(), isTrue);
    });
  });
}
