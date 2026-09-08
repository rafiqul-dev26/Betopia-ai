// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_status_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Whether a session exists, derived from the stored tokens — not from a
/// cached boolean that can go stale. `routerState` watches this to pick
/// the auth gate; login and logout invalidate it, which is what moves the
/// user between the authenticated and unauthenticated areas.

@ProviderFor(sessionStatus)
final sessionStatusProvider = SessionStatusProvider._();

/// Whether a session exists, derived from the stored tokens — not from a
/// cached boolean that can go stale. `routerState` watches this to pick
/// the auth gate; login and logout invalidate it, which is what moves the
/// user between the authenticated and unauthenticated areas.

final class SessionStatusProvider
    extends
        $FunctionalProvider<
          AsyncValue<SessionStatus>,
          SessionStatus,
          FutureOr<SessionStatus>
        >
    with $FutureModifier<SessionStatus>, $FutureProvider<SessionStatus> {
  /// Whether a session exists, derived from the stored tokens — not from a
  /// cached boolean that can go stale. `routerState` watches this to pick
  /// the auth gate; login and logout invalidate it, which is what moves the
  /// user between the authenticated and unauthenticated areas.
  SessionStatusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionStatusProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionStatusHash();

  @$internal
  @override
  $FutureProviderElement<SessionStatus> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SessionStatus> create(Ref ref) {
    return sessionStatus(ref);
  }
}

String _$sessionStatusHash() => r'932f191d1953fbdbe17c3089c811de9f46ba0b7f';
