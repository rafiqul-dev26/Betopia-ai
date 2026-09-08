// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The gate destination the router enforces, derived from app startup,
/// onboarding, and session status.
///
/// The router reacts to this alone — it never reads startup or session
/// directly, and never sees a token. Splash while startup (or the session
/// read) is pending or failed; onboarding until completed; then home or
/// login by session. New inputs (a force-update flag, a maintenance mode)
/// compose here without touching the router.
///
/// A pure derivation on purpose: no timers, no side effects, no
/// imperative transitions. The pages that change the underlying state
/// (login, logout, onboarding completion) invalidate the providers this
/// one watches, and the gate follows.

@ProviderFor(routerState)
final routerStateProvider = RouterStateProvider._();

/// The gate destination the router enforces, derived from app startup,
/// onboarding, and session status.
///
/// The router reacts to this alone — it never reads startup or session
/// directly, and never sees a token. Splash while startup (or the session
/// read) is pending or failed; onboarding until completed; then home or
/// login by session. New inputs (a force-update flag, a maintenance mode)
/// compose here without touching the router.
///
/// A pure derivation on purpose: no timers, no side effects, no
/// imperative transitions. The pages that change the underlying state
/// (login, logout, onboarding completion) invalidate the providers this
/// one watches, and the gate follows.

final class RouterStateProvider
    extends $FunctionalProvider<Routes, Routes, Routes>
    with $Provider<Routes> {
  /// The gate destination the router enforces, derived from app startup,
  /// onboarding, and session status.
  ///
  /// The router reacts to this alone — it never reads startup or session
  /// directly, and never sees a token. Splash while startup (or the session
  /// read) is pending or failed; onboarding until completed; then home or
  /// login by session. New inputs (a force-update flag, a maintenance mode)
  /// compose here without touching the router.
  ///
  /// A pure derivation on purpose: no timers, no side effects, no
  /// imperative transitions. The pages that change the underlying state
  /// (login, logout, onboarding completion) invalidate the providers this
  /// one watches, and the gate follows.
  RouterStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routerStateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routerStateHash();

  @$internal
  @override
  $ProviderElement<Routes> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Routes create(Ref ref) {
    return routerState(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Routes value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Routes>(value),
    );
  }
}

String _$routerStateHash() => r'd2f90d33dd4e0398ea264eab105cc11bef2a3379';
