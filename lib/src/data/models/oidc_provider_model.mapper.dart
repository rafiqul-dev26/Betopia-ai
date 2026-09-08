// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'oidc_provider_model.dart';

class OidcProviderModelMapper extends ClassMapperBase<OidcProviderModel> {
  OidcProviderModelMapper._();

  static OidcProviderModelMapper? _instance;
  static OidcProviderModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OidcProviderModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'OidcProviderModel';

  static int _$id(OidcProviderModel v) => v.id;
  static const Field<OidcProviderModel, int> _f$id = Field('id', _$id);
  static String _$oidcName(OidcProviderModel v) => v.oidcName;
  static const Field<OidcProviderModel, String> _f$oidcName = Field(
    'oidcName',
    _$oidcName,
    key: r'oidc_name',
  );
  static String _$issuerUrl(OidcProviderModel v) => v.issuerUrl;
  static const Field<OidcProviderModel, String> _f$issuerUrl = Field(
    'issuerUrl',
    _$issuerUrl,
    key: r'issuer_url',
  );
  static String _$scope(OidcProviderModel v) => v.scope;
  static const Field<OidcProviderModel, String> _f$scope = Field(
    'scope',
    _$scope,
  );
  static String? _$allowedDomains(OidcProviderModel v) => v.allowedDomains;
  static const Field<OidcProviderModel, String> _f$allowedDomains = Field(
    'allowedDomains',
    _$allowedDomains,
    key: r'allowed_domains',
    opt: true,
  );

  @override
  final MappableFields<OidcProviderModel> fields = const {
    #id: _f$id,
    #oidcName: _f$oidcName,
    #issuerUrl: _f$issuerUrl,
    #scope: _f$scope,
    #allowedDomains: _f$allowedDomains,
  };

  static OidcProviderModel _instantiate(DecodingData data) {
    return OidcProviderModel(
      id: data.dec(_f$id),
      oidcName: data.dec(_f$oidcName),
      issuerUrl: data.dec(_f$issuerUrl),
      scope: data.dec(_f$scope),
      allowedDomains: data.dec(_f$allowedDomains),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static OidcProviderModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OidcProviderModel>(map);
  }

  static OidcProviderModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<OidcProviderModel>(json);
  }
}

mixin OidcProviderModelMappable {}

