// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'exchange_ticket_model.dart';

class ExchangeTicketRequestModelMapper
    extends ClassMapperBase<ExchangeTicketRequestModel> {
  ExchangeTicketRequestModelMapper._();

  static ExchangeTicketRequestModelMapper? _instance;
  static ExchangeTicketRequestModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = ExchangeTicketRequestModelMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'ExchangeTicketRequestModel';

  static String _$ticket(ExchangeTicketRequestModel v) => v.ticket;
  static const Field<ExchangeTicketRequestModel, String> _f$ticket = Field(
    'ticket',
    _$ticket,
  );

  @override
  final MappableFields<ExchangeTicketRequestModel> fields = const {
    #ticket: _f$ticket,
  };

  static ExchangeTicketRequestModel _instantiate(DecodingData data) {
    return ExchangeTicketRequestModel(ticket: data.dec(_f$ticket));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin ExchangeTicketRequestModelMappable {
  String toJsonString() {
    return ExchangeTicketRequestModelMapper.ensureInitialized()
        .encodeJson<ExchangeTicketRequestModel>(
          this as ExchangeTicketRequestModel,
        );
  }

  Map<String, dynamic> toJson() {
    return ExchangeTicketRequestModelMapper.ensureInitialized()
        .encodeMap<ExchangeTicketRequestModel>(
          this as ExchangeTicketRequestModel,
        );
  }
}

class TokenResponseModelMapper extends ClassMapperBase<TokenResponseModel> {
  TokenResponseModelMapper._();

  static TokenResponseModelMapper? _instance;
  static TokenResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TokenResponseModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TokenResponseModel';

  static String _$accessToken(TokenResponseModel v) => v.accessToken;
  static const Field<TokenResponseModel, String> _f$accessToken = Field(
    'accessToken',
    _$accessToken,
    key: r'access_token',
  );
  static String _$refreshToken(TokenResponseModel v) => v.refreshToken;
  static const Field<TokenResponseModel, String> _f$refreshToken = Field(
    'refreshToken',
    _$refreshToken,
    key: r'refresh_token',
  );
  static String _$tokenType(TokenResponseModel v) => v.tokenType;
  static const Field<TokenResponseModel, String> _f$tokenType = Field(
    'tokenType',
    _$tokenType,
    key: r'token_type',
    opt: true,
    def: 'bearer',
  );
  static int _$expiresIn(TokenResponseModel v) => v.expiresIn;
  static const Field<TokenResponseModel, int> _f$expiresIn = Field(
    'expiresIn',
    _$expiresIn,
    key: r'expires_in',
    opt: true,
    def: 0,
  );

  @override
  final MappableFields<TokenResponseModel> fields = const {
    #accessToken: _f$accessToken,
    #refreshToken: _f$refreshToken,
    #tokenType: _f$tokenType,
    #expiresIn: _f$expiresIn,
  };

  static TokenResponseModel _instantiate(DecodingData data) {
    return TokenResponseModel(
      accessToken: data.dec(_f$accessToken),
      refreshToken: data.dec(_f$refreshToken),
      tokenType: data.dec(_f$tokenType),
      expiresIn: data.dec(_f$expiresIn),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TokenResponseModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TokenResponseModel>(map);
  }

  static TokenResponseModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<TokenResponseModel>(json);
  }
}

mixin TokenResponseModelMappable {}

