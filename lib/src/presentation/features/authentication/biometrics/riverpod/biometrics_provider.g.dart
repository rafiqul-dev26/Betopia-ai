// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biometrics_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Biometrics)
final biometricsProvider = BiometricsProvider._();

final class BiometricsProvider
    extends $NotifierProvider<Biometrics, AsyncValue<bool>> {
  BiometricsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'biometricsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$biometricsHash();

  @$internal
  @override
  Biometrics create() => Biometrics();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<bool> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<bool>>(value),
    );
  }
}

String _$biometricsHash() => r'cb507f15c515e554c5601a4deea4bf25478db5a9';

abstract class _$Biometrics extends $Notifier<AsyncValue<bool>> {
  AsyncValue<bool> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<bool>, AsyncValue<bool>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, AsyncValue<bool>>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
