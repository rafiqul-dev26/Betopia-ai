// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Logout)
final logoutProvider = LogoutProvider._();

final class LogoutProvider
    extends $NotifierProvider<Logout, AsyncValue<bool?>> {
  LogoutProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logoutProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logoutHash();

  @$internal
  @override
  Logout create() => Logout();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<bool?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<bool?>>(value),
    );
  }
}

String _$logoutHash() => r'6ca43f9bf41849aa35370ac35f58e299bdf8f6f2';

abstract class _$Logout extends $Notifier<AsyncValue<bool?>> {
  AsyncValue<bool?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<bool?>, AsyncValue<bool?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool?>, AsyncValue<bool?>>,
              AsyncValue<bool?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
