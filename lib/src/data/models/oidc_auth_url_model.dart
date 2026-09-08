import 'package:dart_mappable/dart_mappable.dart';

part 'oidc_auth_url_model.mapper.dart';

@MappableClass(
  caseStyle: CaseStyle.snakeCase,
  generateMethods: GenerateMethods.decode,
)
class OidcAuthUrlModel with OidcAuthUrlModelMappable {
  const OidcAuthUrlModel({
    required this.authorizationUrl,
  });

  final String authorizationUrl;

  static const fromJson = OidcAuthUrlModelMapper.fromJson;
}
