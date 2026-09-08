import 'package:dart_mappable/dart_mappable.dart';

part 'oidc_provider_model.mapper.dart';

@MappableClass(
  caseStyle: CaseStyle.snakeCase,
  generateMethods: GenerateMethods.decode,
)
class OidcProviderModel with OidcProviderModelMappable {
  const OidcProviderModel({
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

  static const fromJson = OidcProviderModelMapper.fromJson;
}
