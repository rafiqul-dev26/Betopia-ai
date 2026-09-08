/// Domain representation of a successfully authenticated SSO session.
/// Tokens are managed securely in the data layer; this entity represents
/// the session metadata returned upon authentication ticket exchange.
class SsoSessionEntity {
  const SsoSessionEntity({
    required this.tokenType,
    required this.expiresIn,
  });

  final String tokenType;
  final int expiresIn;
}
