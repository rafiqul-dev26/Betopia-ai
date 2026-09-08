// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'oidc_auth_url_model.dart';

class OidcAuthUrlModelMapper extends ClassMapperBase<OidcAuthUrlModel> {
  OidcAuthUrlModelMapper._();

  static OidcAuthUrlModelMapper? _instance;
  static OidcAuthUrlModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OidcAuthUrlModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'OidcAuthUrlModel';

  static String _$authorizationUrl(OidcAuthUrlModel v) => v.authorizationUrl;
  static const Field<OidcAuthUrlModel, String> _f$authorizationUrl = Field(
    'authorizationUrl',
    _$authorizationUrl,
    key: r'authorization_url',
  );

  @override
  final MappableFields<OidcAuthUrlModel> fields = const {
    #authorizationUrl: _f$authorizationUrl,
  };

  static OidcAuthUrlModel _instantiate(DecodingData data) {
    return OidcAuthUrlModel(authorizationUrl: data.dec(_f$authorizationUrl));
  }

  @override
  final Function instantiate = _instantiate;

  static OidcAuthUrlModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OidcAuthUrlModel>(map);
  }

  static OidcAuthUrlModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<OidcAuthUrlModel>(json);
  }
}

mixin OidcAuthUrlModelMappable {}

