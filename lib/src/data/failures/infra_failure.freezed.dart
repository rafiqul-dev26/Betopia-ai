// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'infra_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InfraFailure {

 String? get message; String? get code; Object? get cause; StackTrace? get stackTrace;
/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InfraFailureCopyWith<InfraFailure> get copyWith => _$InfraFailureCopyWithImpl<InfraFailure>(this as InfraFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InfraFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,code,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'InfraFailure(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $InfraFailureCopyWith<$Res>  {
  factory $InfraFailureCopyWith(InfraFailure value, $Res Function(InfraFailure) _then) = _$InfraFailureCopyWithImpl;
@useResult
$Res call({
 String? message, String? code, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$InfraFailureCopyWithImpl<$Res>
    implements $InfraFailureCopyWith<$Res> {
  _$InfraFailureCopyWithImpl(this._self, this._then);

  final InfraFailure _self;
  final $Res Function(InfraFailure) _then;

/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? code = freezed,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}

}


/// Adds pattern-matching-related methods to [InfraFailure].
extension InfraFailurePatterns on InfraFailure {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TimeoutFailure value)?  timeout,TResult Function( NetworkFailure value)?  network,TResult Function( UnauthorizedFailure value)?  unauthorized,TResult Function( ForbiddenFailure value)?  forbidden,TResult Function( NotFoundFailure value)?  notFound,TResult Function( ConflictFailure value)?  conflict,TResult Function( ValidationFailure value)?  validation,TResult Function( BadResponseFailure value)?  badResponse,TResult Function( ServerErrorFailure value)?  serverError,TResult Function( CancelledFailure value)?  cancelled,TResult Function( ParsingFailure value)?  parsing,TResult Function( DefectFailure value)?  defect,TResult Function( UnknownFailure value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TimeoutFailure() when timeout != null:
return timeout(_that);case NetworkFailure() when network != null:
return network(_that);case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that);case ForbiddenFailure() when forbidden != null:
return forbidden(_that);case NotFoundFailure() when notFound != null:
return notFound(_that);case ConflictFailure() when conflict != null:
return conflict(_that);case ValidationFailure() when validation != null:
return validation(_that);case BadResponseFailure() when badResponse != null:
return badResponse(_that);case ServerErrorFailure() when serverError != null:
return serverError(_that);case CancelledFailure() when cancelled != null:
return cancelled(_that);case ParsingFailure() when parsing != null:
return parsing(_that);case DefectFailure() when defect != null:
return defect(_that);case UnknownFailure() when unknown != null:
return unknown(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TimeoutFailure value)  timeout,required TResult Function( NetworkFailure value)  network,required TResult Function( UnauthorizedFailure value)  unauthorized,required TResult Function( ForbiddenFailure value)  forbidden,required TResult Function( NotFoundFailure value)  notFound,required TResult Function( ConflictFailure value)  conflict,required TResult Function( ValidationFailure value)  validation,required TResult Function( BadResponseFailure value)  badResponse,required TResult Function( ServerErrorFailure value)  serverError,required TResult Function( CancelledFailure value)  cancelled,required TResult Function( ParsingFailure value)  parsing,required TResult Function( DefectFailure value)  defect,required TResult Function( UnknownFailure value)  unknown,}){
final _that = this;
switch (_that) {
case TimeoutFailure():
return timeout(_that);case NetworkFailure():
return network(_that);case UnauthorizedFailure():
return unauthorized(_that);case ForbiddenFailure():
return forbidden(_that);case NotFoundFailure():
return notFound(_that);case ConflictFailure():
return conflict(_that);case ValidationFailure():
return validation(_that);case BadResponseFailure():
return badResponse(_that);case ServerErrorFailure():
return serverError(_that);case CancelledFailure():
return cancelled(_that);case ParsingFailure():
return parsing(_that);case DefectFailure():
return defect(_that);case UnknownFailure():
return unknown(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TimeoutFailure value)?  timeout,TResult? Function( NetworkFailure value)?  network,TResult? Function( UnauthorizedFailure value)?  unauthorized,TResult? Function( ForbiddenFailure value)?  forbidden,TResult? Function( NotFoundFailure value)?  notFound,TResult? Function( ConflictFailure value)?  conflict,TResult? Function( ValidationFailure value)?  validation,TResult? Function( BadResponseFailure value)?  badResponse,TResult? Function( ServerErrorFailure value)?  serverError,TResult? Function( CancelledFailure value)?  cancelled,TResult? Function( ParsingFailure value)?  parsing,TResult? Function( DefectFailure value)?  defect,TResult? Function( UnknownFailure value)?  unknown,}){
final _that = this;
switch (_that) {
case TimeoutFailure() when timeout != null:
return timeout(_that);case NetworkFailure() when network != null:
return network(_that);case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that);case ForbiddenFailure() when forbidden != null:
return forbidden(_that);case NotFoundFailure() when notFound != null:
return notFound(_that);case ConflictFailure() when conflict != null:
return conflict(_that);case ValidationFailure() when validation != null:
return validation(_that);case BadResponseFailure() when badResponse != null:
return badResponse(_that);case ServerErrorFailure() when serverError != null:
return serverError(_that);case CancelledFailure() when cancelled != null:
return cancelled(_that);case ParsingFailure() when parsing != null:
return parsing(_that);case DefectFailure() when defect != null:
return defect(_that);case UnknownFailure() when unknown != null:
return unknown(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)?  timeout,TResult Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)?  network,TResult Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)?  unauthorized,TResult Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)?  forbidden,TResult Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)?  notFound,TResult Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)?  conflict,TResult Function( String? message,  String? code,  Map<String, String>? fieldErrors,  Object? cause,  StackTrace? stackTrace)?  validation,TResult Function( int statusCode,  String? message,  String? code,  Object? cause,  StackTrace? stackTrace)?  badResponse,TResult Function( int? statusCode,  String? message,  String? code,  Object? cause,  StackTrace? stackTrace)?  serverError,TResult Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)?  cancelled,TResult Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)?  parsing,TResult Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)?  defect,TResult Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TimeoutFailure() when timeout != null:
return timeout(_that.message,_that.code,_that.cause,_that.stackTrace);case NetworkFailure() when network != null:
return network(_that.message,_that.code,_that.cause,_that.stackTrace);case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that.message,_that.code,_that.cause,_that.stackTrace);case ForbiddenFailure() when forbidden != null:
return forbidden(_that.message,_that.code,_that.cause,_that.stackTrace);case NotFoundFailure() when notFound != null:
return notFound(_that.message,_that.code,_that.cause,_that.stackTrace);case ConflictFailure() when conflict != null:
return conflict(_that.message,_that.code,_that.cause,_that.stackTrace);case ValidationFailure() when validation != null:
return validation(_that.message,_that.code,_that.fieldErrors,_that.cause,_that.stackTrace);case BadResponseFailure() when badResponse != null:
return badResponse(_that.statusCode,_that.message,_that.code,_that.cause,_that.stackTrace);case ServerErrorFailure() when serverError != null:
return serverError(_that.statusCode,_that.message,_that.code,_that.cause,_that.stackTrace);case CancelledFailure() when cancelled != null:
return cancelled(_that.message,_that.code,_that.cause,_that.stackTrace);case ParsingFailure() when parsing != null:
return parsing(_that.message,_that.code,_that.cause,_that.stackTrace);case DefectFailure() when defect != null:
return defect(_that.message,_that.code,_that.cause,_that.stackTrace);case UnknownFailure() when unknown != null:
return unknown(_that.message,_that.code,_that.cause,_that.stackTrace);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)  timeout,required TResult Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)  network,required TResult Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)  unauthorized,required TResult Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)  forbidden,required TResult Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)  notFound,required TResult Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)  conflict,required TResult Function( String? message,  String? code,  Map<String, String>? fieldErrors,  Object? cause,  StackTrace? stackTrace)  validation,required TResult Function( int statusCode,  String? message,  String? code,  Object? cause,  StackTrace? stackTrace)  badResponse,required TResult Function( int? statusCode,  String? message,  String? code,  Object? cause,  StackTrace? stackTrace)  serverError,required TResult Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)  cancelled,required TResult Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)  parsing,required TResult Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)  defect,required TResult Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)  unknown,}) {final _that = this;
switch (_that) {
case TimeoutFailure():
return timeout(_that.message,_that.code,_that.cause,_that.stackTrace);case NetworkFailure():
return network(_that.message,_that.code,_that.cause,_that.stackTrace);case UnauthorizedFailure():
return unauthorized(_that.message,_that.code,_that.cause,_that.stackTrace);case ForbiddenFailure():
return forbidden(_that.message,_that.code,_that.cause,_that.stackTrace);case NotFoundFailure():
return notFound(_that.message,_that.code,_that.cause,_that.stackTrace);case ConflictFailure():
return conflict(_that.message,_that.code,_that.cause,_that.stackTrace);case ValidationFailure():
return validation(_that.message,_that.code,_that.fieldErrors,_that.cause,_that.stackTrace);case BadResponseFailure():
return badResponse(_that.statusCode,_that.message,_that.code,_that.cause,_that.stackTrace);case ServerErrorFailure():
return serverError(_that.statusCode,_that.message,_that.code,_that.cause,_that.stackTrace);case CancelledFailure():
return cancelled(_that.message,_that.code,_that.cause,_that.stackTrace);case ParsingFailure():
return parsing(_that.message,_that.code,_that.cause,_that.stackTrace);case DefectFailure():
return defect(_that.message,_that.code,_that.cause,_that.stackTrace);case UnknownFailure():
return unknown(_that.message,_that.code,_that.cause,_that.stackTrace);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)?  timeout,TResult? Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)?  network,TResult? Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)?  unauthorized,TResult? Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)?  forbidden,TResult? Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)?  notFound,TResult? Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)?  conflict,TResult? Function( String? message,  String? code,  Map<String, String>? fieldErrors,  Object? cause,  StackTrace? stackTrace)?  validation,TResult? Function( int statusCode,  String? message,  String? code,  Object? cause,  StackTrace? stackTrace)?  badResponse,TResult? Function( int? statusCode,  String? message,  String? code,  Object? cause,  StackTrace? stackTrace)?  serverError,TResult? Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)?  cancelled,TResult? Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)?  parsing,TResult? Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)?  defect,TResult? Function( String? message,  String? code,  Object? cause,  StackTrace? stackTrace)?  unknown,}) {final _that = this;
switch (_that) {
case TimeoutFailure() when timeout != null:
return timeout(_that.message,_that.code,_that.cause,_that.stackTrace);case NetworkFailure() when network != null:
return network(_that.message,_that.code,_that.cause,_that.stackTrace);case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that.message,_that.code,_that.cause,_that.stackTrace);case ForbiddenFailure() when forbidden != null:
return forbidden(_that.message,_that.code,_that.cause,_that.stackTrace);case NotFoundFailure() when notFound != null:
return notFound(_that.message,_that.code,_that.cause,_that.stackTrace);case ConflictFailure() when conflict != null:
return conflict(_that.message,_that.code,_that.cause,_that.stackTrace);case ValidationFailure() when validation != null:
return validation(_that.message,_that.code,_that.fieldErrors,_that.cause,_that.stackTrace);case BadResponseFailure() when badResponse != null:
return badResponse(_that.statusCode,_that.message,_that.code,_that.cause,_that.stackTrace);case ServerErrorFailure() when serverError != null:
return serverError(_that.statusCode,_that.message,_that.code,_that.cause,_that.stackTrace);case CancelledFailure() when cancelled != null:
return cancelled(_that.message,_that.code,_that.cause,_that.stackTrace);case ParsingFailure() when parsing != null:
return parsing(_that.message,_that.code,_that.cause,_that.stackTrace);case DefectFailure() when defect != null:
return defect(_that.message,_that.code,_that.cause,_that.stackTrace);case UnknownFailure() when unknown != null:
return unknown(_that.message,_that.code,_that.cause,_that.stackTrace);case _:
  return null;

}
}

}

/// @nodoc


class TimeoutFailure extends InfraFailure {
  const TimeoutFailure({this.message, this.code, this.cause, this.stackTrace}): super._();
  

@override final  String? message;
@override final  String? code;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeoutFailureCopyWith<TimeoutFailure> get copyWith => _$TimeoutFailureCopyWithImpl<TimeoutFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeoutFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,code,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'InfraFailure.timeout(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $TimeoutFailureCopyWith<$Res> implements $InfraFailureCopyWith<$Res> {
  factory $TimeoutFailureCopyWith(TimeoutFailure value, $Res Function(TimeoutFailure) _then) = _$TimeoutFailureCopyWithImpl;
@override @useResult
$Res call({
 String? message, String? code, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$TimeoutFailureCopyWithImpl<$Res>
    implements $TimeoutFailureCopyWith<$Res> {
  _$TimeoutFailureCopyWithImpl(this._self, this._then);

  final TimeoutFailure _self;
  final $Res Function(TimeoutFailure) _then;

/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? code = freezed,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(TimeoutFailure(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class NetworkFailure extends InfraFailure {
  const NetworkFailure({this.message, this.code, this.cause, this.stackTrace}): super._();
  

@override final  String? message;
@override final  String? code;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkFailureCopyWith<NetworkFailure> get copyWith => _$NetworkFailureCopyWithImpl<NetworkFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,code,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'InfraFailure.network(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $NetworkFailureCopyWith<$Res> implements $InfraFailureCopyWith<$Res> {
  factory $NetworkFailureCopyWith(NetworkFailure value, $Res Function(NetworkFailure) _then) = _$NetworkFailureCopyWithImpl;
@override @useResult
$Res call({
 String? message, String? code, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$NetworkFailureCopyWithImpl<$Res>
    implements $NetworkFailureCopyWith<$Res> {
  _$NetworkFailureCopyWithImpl(this._self, this._then);

  final NetworkFailure _self;
  final $Res Function(NetworkFailure) _then;

/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? code = freezed,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(NetworkFailure(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class UnauthorizedFailure extends InfraFailure {
  const UnauthorizedFailure({this.message, this.code, this.cause, this.stackTrace}): super._();
  

@override final  String? message;
@override final  String? code;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnauthorizedFailureCopyWith<UnauthorizedFailure> get copyWith => _$UnauthorizedFailureCopyWithImpl<UnauthorizedFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnauthorizedFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,code,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'InfraFailure.unauthorized(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $UnauthorizedFailureCopyWith<$Res> implements $InfraFailureCopyWith<$Res> {
  factory $UnauthorizedFailureCopyWith(UnauthorizedFailure value, $Res Function(UnauthorizedFailure) _then) = _$UnauthorizedFailureCopyWithImpl;
@override @useResult
$Res call({
 String? message, String? code, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$UnauthorizedFailureCopyWithImpl<$Res>
    implements $UnauthorizedFailureCopyWith<$Res> {
  _$UnauthorizedFailureCopyWithImpl(this._self, this._then);

  final UnauthorizedFailure _self;
  final $Res Function(UnauthorizedFailure) _then;

/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? code = freezed,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(UnauthorizedFailure(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class ForbiddenFailure extends InfraFailure {
  const ForbiddenFailure({this.message, this.code, this.cause, this.stackTrace}): super._();
  

@override final  String? message;
@override final  String? code;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForbiddenFailureCopyWith<ForbiddenFailure> get copyWith => _$ForbiddenFailureCopyWithImpl<ForbiddenFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForbiddenFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,code,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'InfraFailure.forbidden(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $ForbiddenFailureCopyWith<$Res> implements $InfraFailureCopyWith<$Res> {
  factory $ForbiddenFailureCopyWith(ForbiddenFailure value, $Res Function(ForbiddenFailure) _then) = _$ForbiddenFailureCopyWithImpl;
@override @useResult
$Res call({
 String? message, String? code, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$ForbiddenFailureCopyWithImpl<$Res>
    implements $ForbiddenFailureCopyWith<$Res> {
  _$ForbiddenFailureCopyWithImpl(this._self, this._then);

  final ForbiddenFailure _self;
  final $Res Function(ForbiddenFailure) _then;

/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? code = freezed,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(ForbiddenFailure(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class NotFoundFailure extends InfraFailure {
  const NotFoundFailure({this.message, this.code, this.cause, this.stackTrace}): super._();
  

@override final  String? message;
@override final  String? code;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotFoundFailureCopyWith<NotFoundFailure> get copyWith => _$NotFoundFailureCopyWithImpl<NotFoundFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotFoundFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,code,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'InfraFailure.notFound(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $NotFoundFailureCopyWith<$Res> implements $InfraFailureCopyWith<$Res> {
  factory $NotFoundFailureCopyWith(NotFoundFailure value, $Res Function(NotFoundFailure) _then) = _$NotFoundFailureCopyWithImpl;
@override @useResult
$Res call({
 String? message, String? code, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$NotFoundFailureCopyWithImpl<$Res>
    implements $NotFoundFailureCopyWith<$Res> {
  _$NotFoundFailureCopyWithImpl(this._self, this._then);

  final NotFoundFailure _self;
  final $Res Function(NotFoundFailure) _then;

/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? code = freezed,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(NotFoundFailure(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class ConflictFailure extends InfraFailure {
  const ConflictFailure({this.message, this.code, this.cause, this.stackTrace}): super._();
  

@override final  String? message;
@override final  String? code;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConflictFailureCopyWith<ConflictFailure> get copyWith => _$ConflictFailureCopyWithImpl<ConflictFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConflictFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,code,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'InfraFailure.conflict(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $ConflictFailureCopyWith<$Res> implements $InfraFailureCopyWith<$Res> {
  factory $ConflictFailureCopyWith(ConflictFailure value, $Res Function(ConflictFailure) _then) = _$ConflictFailureCopyWithImpl;
@override @useResult
$Res call({
 String? message, String? code, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$ConflictFailureCopyWithImpl<$Res>
    implements $ConflictFailureCopyWith<$Res> {
  _$ConflictFailureCopyWithImpl(this._self, this._then);

  final ConflictFailure _self;
  final $Res Function(ConflictFailure) _then;

/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? code = freezed,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(ConflictFailure(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class ValidationFailure extends InfraFailure {
  const ValidationFailure({this.message, this.code, final  Map<String, String>? fieldErrors, this.cause, this.stackTrace}): _fieldErrors = fieldErrors,super._();
  

@override final  String? message;
@override final  String? code;
 final  Map<String, String>? _fieldErrors;
 Map<String, String>? get fieldErrors {
  final value = _fieldErrors;
  if (value == null) return null;
  if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidationFailureCopyWith<ValidationFailure> get copyWith => _$ValidationFailureCopyWithImpl<ValidationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidationFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other._fieldErrors, _fieldErrors)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,code,const DeepCollectionEquality().hash(_fieldErrors),const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'InfraFailure.validation(message: $message, code: $code, fieldErrors: $fieldErrors, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $ValidationFailureCopyWith<$Res> implements $InfraFailureCopyWith<$Res> {
  factory $ValidationFailureCopyWith(ValidationFailure value, $Res Function(ValidationFailure) _then) = _$ValidationFailureCopyWithImpl;
@override @useResult
$Res call({
 String? message, String? code, Map<String, String>? fieldErrors, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$ValidationFailureCopyWithImpl<$Res>
    implements $ValidationFailureCopyWith<$Res> {
  _$ValidationFailureCopyWithImpl(this._self, this._then);

  final ValidationFailure _self;
  final $Res Function(ValidationFailure) _then;

/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? code = freezed,Object? fieldErrors = freezed,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(ValidationFailure(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,fieldErrors: freezed == fieldErrors ? _self._fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class BadResponseFailure extends InfraFailure {
  const BadResponseFailure({required this.statusCode, this.message, this.code, this.cause, this.stackTrace}): super._();
  

 final  int statusCode;
@override final  String? message;
@override final  String? code;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BadResponseFailureCopyWith<BadResponseFailure> get copyWith => _$BadResponseFailureCopyWithImpl<BadResponseFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BadResponseFailure&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,statusCode,message,code,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'InfraFailure.badResponse(statusCode: $statusCode, message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $BadResponseFailureCopyWith<$Res> implements $InfraFailureCopyWith<$Res> {
  factory $BadResponseFailureCopyWith(BadResponseFailure value, $Res Function(BadResponseFailure) _then) = _$BadResponseFailureCopyWithImpl;
@override @useResult
$Res call({
 int statusCode, String? message, String? code, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$BadResponseFailureCopyWithImpl<$Res>
    implements $BadResponseFailureCopyWith<$Res> {
  _$BadResponseFailureCopyWithImpl(this._self, this._then);

  final BadResponseFailure _self;
  final $Res Function(BadResponseFailure) _then;

/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusCode = null,Object? message = freezed,Object? code = freezed,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(BadResponseFailure(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class ServerErrorFailure extends InfraFailure {
  const ServerErrorFailure({this.statusCode, this.message, this.code, this.cause, this.stackTrace}): super._();
  

 final  int? statusCode;
@override final  String? message;
@override final  String? code;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerErrorFailureCopyWith<ServerErrorFailure> get copyWith => _$ServerErrorFailureCopyWithImpl<ServerErrorFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerErrorFailure&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,statusCode,message,code,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'InfraFailure.serverError(statusCode: $statusCode, message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $ServerErrorFailureCopyWith<$Res> implements $InfraFailureCopyWith<$Res> {
  factory $ServerErrorFailureCopyWith(ServerErrorFailure value, $Res Function(ServerErrorFailure) _then) = _$ServerErrorFailureCopyWithImpl;
@override @useResult
$Res call({
 int? statusCode, String? message, String? code, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$ServerErrorFailureCopyWithImpl<$Res>
    implements $ServerErrorFailureCopyWith<$Res> {
  _$ServerErrorFailureCopyWithImpl(this._self, this._then);

  final ServerErrorFailure _self;
  final $Res Function(ServerErrorFailure) _then;

/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusCode = freezed,Object? message = freezed,Object? code = freezed,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(ServerErrorFailure(
statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class CancelledFailure extends InfraFailure {
  const CancelledFailure({this.message, this.code, this.cause, this.stackTrace}): super._();
  

@override final  String? message;
@override final  String? code;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CancelledFailureCopyWith<CancelledFailure> get copyWith => _$CancelledFailureCopyWithImpl<CancelledFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelledFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,code,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'InfraFailure.cancelled(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $CancelledFailureCopyWith<$Res> implements $InfraFailureCopyWith<$Res> {
  factory $CancelledFailureCopyWith(CancelledFailure value, $Res Function(CancelledFailure) _then) = _$CancelledFailureCopyWithImpl;
@override @useResult
$Res call({
 String? message, String? code, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$CancelledFailureCopyWithImpl<$Res>
    implements $CancelledFailureCopyWith<$Res> {
  _$CancelledFailureCopyWithImpl(this._self, this._then);

  final CancelledFailure _self;
  final $Res Function(CancelledFailure) _then;

/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? code = freezed,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(CancelledFailure(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class ParsingFailure extends InfraFailure {
  const ParsingFailure({this.message, this.code, this.cause, this.stackTrace}): super._();
  

@override final  String? message;
@override final  String? code;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParsingFailureCopyWith<ParsingFailure> get copyWith => _$ParsingFailureCopyWithImpl<ParsingFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParsingFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,code,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'InfraFailure.parsing(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $ParsingFailureCopyWith<$Res> implements $InfraFailureCopyWith<$Res> {
  factory $ParsingFailureCopyWith(ParsingFailure value, $Res Function(ParsingFailure) _then) = _$ParsingFailureCopyWithImpl;
@override @useResult
$Res call({
 String? message, String? code, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$ParsingFailureCopyWithImpl<$Res>
    implements $ParsingFailureCopyWith<$Res> {
  _$ParsingFailureCopyWithImpl(this._self, this._then);

  final ParsingFailure _self;
  final $Res Function(ParsingFailure) _then;

/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? code = freezed,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(ParsingFailure(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class DefectFailure extends InfraFailure {
  const DefectFailure({this.message, this.code, this.cause, this.stackTrace}): super._();
  

@override final  String? message;
@override final  String? code;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DefectFailureCopyWith<DefectFailure> get copyWith => _$DefectFailureCopyWithImpl<DefectFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DefectFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,code,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'InfraFailure.defect(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $DefectFailureCopyWith<$Res> implements $InfraFailureCopyWith<$Res> {
  factory $DefectFailureCopyWith(DefectFailure value, $Res Function(DefectFailure) _then) = _$DefectFailureCopyWithImpl;
@override @useResult
$Res call({
 String? message, String? code, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$DefectFailureCopyWithImpl<$Res>
    implements $DefectFailureCopyWith<$Res> {
  _$DefectFailureCopyWithImpl(this._self, this._then);

  final DefectFailure _self;
  final $Res Function(DefectFailure) _then;

/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? code = freezed,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(DefectFailure(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class UnknownFailure extends InfraFailure {
  const UnknownFailure({this.message, this.code, this.cause, this.stackTrace}): super._();
  

@override final  String? message;
@override final  String? code;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnknownFailureCopyWith<UnknownFailure> get copyWith => _$UnknownFailureCopyWithImpl<UnknownFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnknownFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,code,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'InfraFailure.unknown(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $UnknownFailureCopyWith<$Res> implements $InfraFailureCopyWith<$Res> {
  factory $UnknownFailureCopyWith(UnknownFailure value, $Res Function(UnknownFailure) _then) = _$UnknownFailureCopyWithImpl;
@override @useResult
$Res call({
 String? message, String? code, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$UnknownFailureCopyWithImpl<$Res>
    implements $UnknownFailureCopyWith<$Res> {
  _$UnknownFailureCopyWithImpl(this._self, this._then);

  final UnknownFailure _self;
  final $Res Function(UnknownFailure) _then;

/// Create a copy of InfraFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? code = freezed,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(UnknownFailure(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

// dart format on
