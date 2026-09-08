class OidcProviderEntity {
  const OidcProviderEntity({
    required this.id,
    required this.oidcName,
    required this.issuerUrl,
    required this.scope,
    this.allowedDomains,
  });

  final int id;
  final String oidcName;
  final String? allowedDomains;
  final String issuerUrl;
  final String scope;
}
