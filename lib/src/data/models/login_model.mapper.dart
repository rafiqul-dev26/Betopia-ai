// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'login_model.dart';

class LoginResponseModelMapper extends ClassMapperBase<LoginResponseModel> {
  LoginResponseModelMapper._();

  static LoginResponseModelMapper? _instance;
  static LoginResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoginResponseModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LoginResponseModel';

  static int _$id(LoginResponseModel v) => v.id;
  static const Field<LoginResponseModel, int> _f$id = Field('id', _$id);
  static String _$username(LoginResponseModel v) => v.username;
  static const Field<LoginResponseModel, String> _f$username = Field(
    'username',
    _$username,
  );
  static String _$email(LoginResponseModel v) => v.email;
  static const Field<LoginResponseModel, String> _f$email = Field(
    'email',
    _$email,
  );
  static String _$firstName(LoginResponseModel v) => v.firstName;
  static const Field<LoginResponseModel, String> _f$firstName = Field(
    'firstName',
    _$firstName,
  );
  static String _$lastName(LoginResponseModel v) => v.lastName;
  static const Field<LoginResponseModel, String> _f$lastName = Field(
    'lastName',
    _$lastName,
  );
  static String _$gender(LoginResponseModel v) => v.gender;
  static const Field<LoginResponseModel, String> _f$gender = Field(
    'gender',
    _$gender,
  );
  static String _$image(LoginResponseModel v) => v.image;
  static const Field<LoginResponseModel, String> _f$image = Field(
    'image',
    _$image,
  );
  static String _$accessToken(LoginResponseModel v) => v.accessToken;
  static const Field<LoginResponseModel, String> _f$accessToken = Field(
    'accessToken',
    _$accessToken,
  );
  static String _$refreshToken(LoginResponseModel v) => v.refreshToken;
  static const Field<LoginResponseModel, String> _f$refreshToken = Field(
    'refreshToken',
    _$refreshToken,
  );

  @override
  final MappableFields<LoginResponseModel> fields = const {
    #id: _f$id,
    #username: _f$username,
    #email: _f$email,
    #firstName: _f$firstName,
    #lastName: _f$lastName,
    #gender: _f$gender,
    #image: _f$image,
    #accessToken: _f$accessToken,
    #refreshToken: _f$refreshToken,
  };

  static LoginResponseModel _instantiate(DecodingData data) {
    return LoginResponseModel(
      id: data.dec(_f$id),
      username: data.dec(_f$username),
      email: data.dec(_f$email),
      firstName: data.dec(_f$firstName),
      lastName: data.dec(_f$lastName),
      gender: data.dec(_f$gender),
      image: data.dec(_f$image),
      accessToken: data.dec(_f$accessToken),
      refreshToken: data.dec(_f$refreshToken),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static LoginResponseModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LoginResponseModel>(map);
  }

  static LoginResponseModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<LoginResponseModel>(json);
  }
}

mixin LoginResponseModelMappable {}

class LoginRequestModelMapper extends ClassMapperBase<LoginRequestModel> {
  LoginRequestModelMapper._();

  static LoginRequestModelMapper? _instance;
  static LoginRequestModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoginRequestModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LoginRequestModel';

  static String _$username(LoginRequestModel v) => v.username;
  static const Field<LoginRequestModel, String> _f$username = Field(
    'username',
    _$username,
  );
  static String _$password(LoginRequestModel v) => v.password;
  static const Field<LoginRequestModel, String> _f$password = Field(
    'password',
    _$password,
  );

  @override
  final MappableFields<LoginRequestModel> fields = const {
    #username: _f$username,
    #password: _f$password,
  };

  static LoginRequestModel _instantiate(DecodingData data) {
    return LoginRequestModel(
      username: data.dec(_f$username),
      password: data.dec(_f$password),
    );
  }

  @override
  final Function instantiate = _instantiate;
}

mixin LoginRequestModelMappable {
  String toJsonString() {
    return LoginRequestModelMapper.ensureInitialized()
        .encodeJson<LoginRequestModel>(this as LoginRequestModel);
  }

  Map<String, dynamic> toJson() {
    return LoginRequestModelMapper.ensureInitialized()
        .encodeMap<LoginRequestModel>(this as LoginRequestModel);
  }
}

