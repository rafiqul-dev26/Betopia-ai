import 'package:betopia_ai/src/core/base/result.dart';
import 'package:betopia_ai/src/domain/failures/business_failure.dart';
import 'package:betopia_ai/src/domain/repositories/biometrics_repository.dart';
import 'package:betopia_ai/src/domain/use_cases/biometrics_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

class _MockBiometricsRepository implements BiometricsRepository {
  bool available = true;
  bool authResult = true;
  bool enabled = false;

  @override
  Future<Result<bool, BusinessFailure>> isAvailable() async =>
      Result.success(available);

  @override
  Future<Result<bool, BusinessFailure>> authenticate({
    required String reason,
  }) async =>
      Result.success(authResult);

  @override
  Future<bool> isEnabled() async => enabled;

  @override
  Future<void> setEnabled(bool isEnabled) async {
    enabled = isEnabled;
  }
}

void main() {
  late _MockBiometricsRepository repository;

  setUp(() {
    repository = _MockBiometricsRepository();
  });

  test('CheckBiometricsAvailableUseCase delegates to repository', () async {
    final useCase = CheckBiometricsAvailableUseCase(repository);
    final result = await useCase();
    expect(result, isA<Success<bool, BusinessFailure>>());
    expect((result as Success).data, isTrue);
  });

  test('AuthenticateWithBiometricsUseCase delegates to repository', () async {
    final useCase = AuthenticateWithBiometricsUseCase(repository);
    final result = await useCase(reason: 'Test Reason');
    expect(result, isA<Success<bool, BusinessFailure>>());
    expect((result as Success).data, isTrue);
  });

  test('GetBiometricsEnabledUseCase & SetBiometricsEnabledUseCase', () async {
    final getUseCase = GetBiometricsEnabledUseCase(repository);
    final setUseCase = SetBiometricsEnabledUseCase(repository);

    expect(await getUseCase(), isFalse);
    await setUseCase(true);
    expect(await getUseCase(), isTrue);
  });
}
