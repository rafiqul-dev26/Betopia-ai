import '../../core/base/result.dart';
import '../failures/business_failure.dart';

abstract interface class BiometricsRepository {
  /// Checks whether biometric authentication (fingerprint/face) is available
  /// and enrolled on the device.
  Future<Result<bool, BusinessFailure>> isAvailable();

  /// Prompts the system biometric authentication dialog.
  Future<Result<bool, BusinessFailure>> authenticate({
    required String reason,
  });

  /// Checks if biometrics is enabled in user preferences.
  Future<bool> isEnabled();

  /// Sets biometric preference flag.
  Future<void> setEnabled(bool enabled);
}
