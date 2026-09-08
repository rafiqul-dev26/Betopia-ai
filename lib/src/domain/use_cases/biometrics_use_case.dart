import '../../core/base/result.dart';
import '../failures/business_failure.dart';
import '../repositories/biometrics_repository.dart';

final class CheckBiometricsAvailableUseCase {
  const CheckBiometricsAvailableUseCase(this.repository);

  final BiometricsRepository repository;

  Future<Result<bool, BusinessFailure>> call() {
    return repository.isAvailable();
  }
}

final class AuthenticateWithBiometricsUseCase {
  const AuthenticateWithBiometricsUseCase(this.repository);

  final BiometricsRepository repository;

  Future<Result<bool, BusinessFailure>> call({required String reason}) {
    return repository.authenticate(reason: reason);
  }
}

final class GetBiometricsEnabledUseCase {
  const GetBiometricsEnabledUseCase(this.repository);

  final BiometricsRepository repository;

  Future<bool> call() {
    return repository.isEnabled();
  }
}

final class SetBiometricsEnabledUseCase {
  const SetBiometricsEnabledUseCase(this.repository);

  final BiometricsRepository repository;

  Future<void> call(bool enabled) {
    return repository.setEnabled(enabled);
  }
}
