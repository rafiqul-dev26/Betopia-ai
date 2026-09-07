// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BusinessFailure {

 String? get message; Object? get cause; StackTrace? get stackTrace;
/// Create a copy of BusinessFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusinessFailureCopyWith<BusinessFailure> get copyWith => _$BusinessFailureCopyWithImpl<BusinessFailure>(this as BusinessFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BusinessFailure&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'BusinessFailure(message: $message, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $BusinessFailureCopyWith<$Res>  {
  factory $BusinessFailureCopyWith(BusinessFailure value, $Res Function(BusinessFailure) _then) = _$BusinessFailureCopyWithImpl;
@useResult
$Res call({
 String? message, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$BusinessFailureCopyWithImpl<$Res>
    implements $BusinessFailureCopyWith<$Res> {
  _$BusinessFailureCopyWithImpl(this._self, this._then);

  final BusinessFailure _self;
  final $Res Function(BusinessFailure) _then;

/// Create a copy of BusinessFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}

}


/// Adds pattern-matching-related methods to [BusinessFailure].
extension BusinessFailurePatterns on BusinessFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Unauthenticated value)?  unauthenticated,TResult Function( PermissionDenied value)?  permissionDenied,TResult Function( Unreachable value)?  unreachable,TResult Function( InvalidInput value)?  invalidInput,TResult Function( NotFound value)?  notFound,TResult Function( Conflict value)?  conflict,TResult Function( Cancelled value)?  cancelled,TResult Function( Unexpected value)?  unexpected,TResult Function( Defect value)?  defect,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case PermissionDenied() when permissionDenied != null:
return permissionDenied(_that);case Unreachable() when unreachable != null:
return unreachable(_that);case InvalidInput() when invalidInput != null:
return invalidInput(_that);case NotFound() when notFound != null:
return notFound(_that);case Conflict() when conflict != null:
return conflict(_that);case Cancelled() when cancelled != null:
return cancelled(_that);case Unexpected() when unexpected != null:
return unexpected(_that);case Defect() when defect != null:
return defect(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Unauthenticated value)  unauthenticated,required TResult Function( PermissionDenied value)  permissionDenied,required TResult Function( Unreachable value)  unreachable,required TResult Function( InvalidInput value)  invalidInput,required TResult Function( NotFound value)  notFound,required TResult Function( Conflict value)  conflict,required TResult Function( Cancelled value)  cancelled,required TResult Function( Unexpected value)  unexpected,required TResult Function( Defect value)  defect,}){
final _that = this;
switch (_that) {
case Unauthenticated():
return unauthenticated(_that);case PermissionDenied():
return permissionDenied(_that);case Unreachable():
return unreachable(_that);case InvalidInput():
return invalidInput(_that);case NotFound():
return notFound(_that);case Conflict():
return conflict(_that);case Cancelled():
return cancelled(_that);case Unexpected():
return unexpected(_that);case Defect():
return defect(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Unauthenticated value)?  unauthenticated,TResult? Function( PermissionDenied value)?  permissionDenied,TResult? Function( Unreachable value)?  unreachable,TResult? Function( InvalidInput value)?  invalidInput,TResult? Function( NotFound value)?  notFound,TResult? Function( Conflict value)?  conflict,TResult? Function( Cancelled value)?  cancelled,TResult? Function( Unexpected value)?  unexpected,TResult? Function( Defect value)?  defect,}){
final _that = this;
switch (_that) {
case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case PermissionDenied() when permissionDenied != null:
return permissionDenied(_that);case Unreachable() when unreachable != null:
return unreachable(_that);case InvalidInput() when invalidInput != null:
return invalidInput(_that);case NotFound() when notFound != null:
return notFound(_that);case Conflict() when conflict != null:
return conflict(_that);case Cancelled() when cancelled != null:
return cancelled(_that);case Unexpected() when unexpected != null:
return unexpected(_that);case Defect() when defect != null:
return defect(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? message,  Object? cause,  StackTrace? stackTrace)?  unauthenticated,TResult Function( String? message,  Object? cause,  StackTrace? stackTrace)?  permissionDenied,TResult Function( String? message,  Object? cause,  StackTrace? stackTrace)?  unreachable,TResult Function( String? message,  Map<String, String>? fieldErrors,  Object? cause,  StackTrace? stackTrace)?  invalidInput,TResult Function( String? message,  Object? cause,  StackTrace? stackTrace)?  notFound,TResult Function( String? message,  Object? cause,  StackTrace? stackTrace)?  conflict,TResult Function( String? message,  Object? cause,  StackTrace? stackTrace)?  cancelled,TResult Function( String? message,  Object? cause,  StackTrace? stackTrace)?  unexpected,TResult Function( String? message,  Object? cause,  StackTrace? stackTrace)?  defect,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that.message,_that.cause,_that.stackTrace);case PermissionDenied() when permissionDenied != null:
return permissionDenied(_that.message,_that.cause,_that.stackTrace);case Unreachable() when unreachable != null:
return unreachable(_that.message,_that.cause,_that.stackTrace);case InvalidInput() when invalidInput != null:
return invalidInput(_that.message,_that.fieldErrors,_that.cause,_that.stackTrace);case NotFound() when notFound != null:
return notFound(_that.message,_that.cause,_that.stackTrace);case Conflict() when conflict != null:
return conflict(_that.message,_that.cause,_that.stackTrace);case Cancelled() when cancelled != null:
return cancelled(_that.message,_that.cause,_that.stackTrace);case Unexpected() when unexpected != null:
return unexpected(_that.message,_that.cause,_that.stackTrace);case Defect() when defect != null:
return defect(_that.message,_that.cause,_that.stackTrace);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? message,  Object? cause,  StackTrace? stackTrace)  unauthenticated,required TResult Function( String? message,  Object? cause,  StackTrace? stackTrace)  permissionDenied,required TResult Function( String? message,  Object? cause,  StackTrace? stackTrace)  unreachable,required TResult Function( String? message,  Map<String, String>? fieldErrors,  Object? cause,  StackTrace? stackTrace)  invalidInput,required TResult Function( String? message,  Object? cause,  StackTrace? stackTrace)  notFound,required TResult Function( String? message,  Object? cause,  StackTrace? stackTrace)  conflict,required TResult Function( String? message,  Object? cause,  StackTrace? stackTrace)  cancelled,required TResult Function( String? message,  Object? cause,  StackTrace? stackTrace)  unexpected,required TResult Function( String? message,  Object? cause,  StackTrace? stackTrace)  defect,}) {final _that = this;
switch (_that) {
case Unauthenticated():
return unauthenticated(_that.message,_that.cause,_that.stackTrace);case PermissionDenied():
return permissionDenied(_that.message,_that.cause,_that.stackTrace);case Unreachable():
return unreachable(_that.message,_that.cause,_that.stackTrace);case InvalidInput():
return invalidInput(_that.message,_that.fieldErrors,_that.cause,_that.stackTrace);case NotFound():
return notFound(_that.message,_that.cause,_that.stackTrace);case Conflict():
return conflict(_that.message,_that.cause,_that.stackTrace);case Cancelled():
return cancelled(_that.message,_that.cause,_that.stackTrace);case Unexpected():
return unexpected(_that.message,_that.cause,_that.stackTrace);case Defect():
return defect(_that.message,_that.cause,_that.stackTrace);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? message,  Object? cause,  StackTrace? stackTrace)?  unauthenticated,TResult? Function( String? message,  Object? cause,  StackTrace? stackTrace)?  permissionDenied,TResult? Function( String? message,  Object? cause,  StackTrace? stackTrace)?  unreachable,TResult? Function( String? message,  Map<String, String>? fieldErrors,  Object? cause,  StackTrace? stackTrace)?  invalidInput,TResult? Function( String? message,  Object? cause,  StackTrace? stackTrace)?  notFound,TResult? Function( String? message,  Object? cause,  StackTrace? stackTrace)?  conflict,TResult? Function( String? message,  Object? cause,  StackTrace? stackTrace)?  cancelled,TResult? Function( String? message,  Object? cause,  StackTrace? stackTrace)?  unexpected,TResult? Function( String? message,  Object? cause,  StackTrace? stackTrace)?  defect,}) {final _that = this;
switch (_that) {
case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that.message,_that.cause,_that.stackTrace);case PermissionDenied() when permissionDenied != null:
return permissionDenied(_that.message,_that.cause,_that.stackTrace);case Unreachable() when unreachable != null:
return unreachable(_that.message,_that.cause,_that.stackTrace);case InvalidInput() when invalidInput != null:
return invalidInput(_that.message,_that.fieldErrors,_that.cause,_that.stackTrace);case NotFound() when notFound != null:
return notFound(_that.message,_that.cause,_that.stackTrace);case Conflict() when conflict != null:
return conflict(_that.message,_that.cause,_that.stackTrace);case Cancelled() when cancelled != null:
return cancelled(_that.message,_that.cause,_that.stackTrace);case Unexpected() when unexpected != null:
return unexpected(_that.message,_that.cause,_that.stackTrace);case Defect() when defect != null:
return defect(_that.message,_that.cause,_that.stackTrace);case _:
  return null;

}
}

}

/// @nodoc


class Unauthenticated extends BusinessFailure {
  const Unauthenticated({this.message, this.cause, this.stackTrace}): super._();
  

@override final  String? message;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of BusinessFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnauthenticatedCopyWith<Unauthenticated> get copyWith => _$UnauthenticatedCopyWithImpl<Unauthenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Unauthenticated&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'BusinessFailure.unauthenticated(message: $message, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $UnauthenticatedCopyWith<$Res> implements $BusinessFailureCopyWith<$Res> {
  factory $UnauthenticatedCopyWith(Unauthenticated value, $Res Function(Unauthenticated) _then) = _$UnauthenticatedCopyWithImpl;
@override @useResult
$Res call({
 String? message, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$UnauthenticatedCopyWithImpl<$Res>
    implements $UnauthenticatedCopyWith<$Res> {
  _$UnauthenticatedCopyWithImpl(this._self, this._then);

  final Unauthenticated _self;
  final $Res Function(Unauthenticated) _then;

/// Create a copy of BusinessFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(Unauthenticated(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class PermissionDenied extends BusinessFailure {
  const PermissionDenied({this.message, this.cause, this.stackTrace}): super._();
  

@override final  String? message;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of BusinessFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PermissionDeniedCopyWith<PermissionDenied> get copyWith => _$PermissionDeniedCopyWithImpl<PermissionDenied>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermissionDenied&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'BusinessFailure.permissionDenied(message: $message, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $PermissionDeniedCopyWith<$Res> implements $BusinessFailureCopyWith<$Res> {
  factory $PermissionDeniedCopyWith(PermissionDenied value, $Res Function(PermissionDenied) _then) = _$PermissionDeniedCopyWithImpl;
@override @useResult
$Res call({
 String? message, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$PermissionDeniedCopyWithImpl<$Res>
    implements $PermissionDeniedCopyWith<$Res> {
  _$PermissionDeniedCopyWithImpl(this._self, this._then);

  final PermissionDenied _self;
  final $Res Function(PermissionDenied) _then;

/// Create a copy of BusinessFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(PermissionDenied(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class Unreachable extends BusinessFailure {
  const Unreachable({this.message, this.cause, this.stackTrace}): super._();
  

@override final  String? message;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of BusinessFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnreachableCopyWith<Unreachable> get copyWith => _$UnreachableCopyWithImpl<Unreachable>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Unreachable&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'BusinessFailure.unreachable(message: $message, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $UnreachableCopyWith<$Res> implements $BusinessFailureCopyWith<$Res> {
  factory $UnreachableCopyWith(Unreachable value, $Res Function(Unreachable) _then) = _$UnreachableCopyWithImpl;
@override @useResult
$Res call({
 String? message, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$UnreachableCopyWithImpl<$Res>
    implements $UnreachableCopyWith<$Res> {
  _$UnreachableCopyWithImpl(this._self, this._then);

  final Unreachable _self;
  final $Res Function(Unreachable) _then;

/// Create a copy of BusinessFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(Unreachable(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class InvalidInput extends BusinessFailure {
  const InvalidInput({this.message, final  Map<String, String>? fieldErrors, this.cause, this.stackTrace}): _fieldErrors = fieldErrors,super._();
  

@override final  String? message;
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

/// Create a copy of BusinessFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidInputCopyWith<InvalidInput> get copyWith => _$InvalidInputCopyWithImpl<InvalidInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidInput&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._fieldErrors, _fieldErrors)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_fieldErrors),const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'BusinessFailure.invalidInput(message: $message, fieldErrors: $fieldErrors, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $InvalidInputCopyWith<$Res> implements $BusinessFailureCopyWith<$Res> {
  factory $InvalidInputCopyWith(InvalidInput value, $Res Function(InvalidInput) _then) = _$InvalidInputCopyWithImpl;
@override @useResult
$Res call({
 String? message, Map<String, String>? fieldErrors, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$InvalidInputCopyWithImpl<$Res>
    implements $InvalidInputCopyWith<$Res> {
  _$InvalidInputCopyWithImpl(this._self, this._then);

  final InvalidInput _self;
  final $Res Function(InvalidInput) _then;

/// Create a copy of BusinessFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? fieldErrors = freezed,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(InvalidInput(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,fieldErrors: freezed == fieldErrors ? _self._fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class NotFound extends BusinessFailure {
  const NotFound({this.message, this.cause, this.stackTrace}): super._();
  

@override final  String? message;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of BusinessFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotFoundCopyWith<NotFound> get copyWith => _$NotFoundCopyWithImpl<NotFound>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotFound&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'BusinessFailure.notFound(message: $message, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $NotFoundCopyWith<$Res> implements $BusinessFailureCopyWith<$Res> {
  factory $NotFoundCopyWith(NotFound value, $Res Function(NotFound) _then) = _$NotFoundCopyWithImpl;
@override @useResult
$Res call({
 String? message, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$NotFoundCopyWithImpl<$Res>
    implements $NotFoundCopyWith<$Res> {
  _$NotFoundCopyWithImpl(this._self, this._then);

  final NotFound _self;
  final $Res Function(NotFound) _then;

/// Create a copy of BusinessFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(NotFound(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class Conflict extends BusinessFailure {
  const Conflict({this.message, this.cause, this.stackTrace}): super._();
  

@override final  String? message;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of BusinessFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConflictCopyWith<Conflict> get copyWith => _$ConflictCopyWithImpl<Conflict>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Conflict&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'BusinessFailure.conflict(message: $message, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $ConflictCopyWith<$Res> implements $BusinessFailureCopyWith<$Res> {
  factory $ConflictCopyWith(Conflict value, $Res Function(Conflict) _then) = _$ConflictCopyWithImpl;
@override @useResult
$Res call({
 String? message, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$ConflictCopyWithImpl<$Res>
    implements $ConflictCopyWith<$Res> {
  _$ConflictCopyWithImpl(this._self, this._then);

  final Conflict _self;
  final $Res Function(Conflict) _then;

/// Create a copy of BusinessFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(Conflict(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class Cancelled extends BusinessFailure {
  const Cancelled({this.message, this.cause, this.stackTrace}): super._();
  

@override final  String? message;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of BusinessFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CancelledCopyWith<Cancelled> get copyWith => _$CancelledCopyWithImpl<Cancelled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cancelled&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'BusinessFailure.cancelled(message: $message, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $CancelledCopyWith<$Res> implements $BusinessFailureCopyWith<$Res> {
  factory $CancelledCopyWith(Cancelled value, $Res Function(Cancelled) _then) = _$CancelledCopyWithImpl;
@override @useResult
$Res call({
 String? message, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$CancelledCopyWithImpl<$Res>
    implements $CancelledCopyWith<$Res> {
  _$CancelledCopyWithImpl(this._self, this._then);

  final Cancelled _self;
  final $Res Function(Cancelled) _then;

/// Create a copy of BusinessFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(Cancelled(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class Unexpected extends BusinessFailure {
  const Unexpected({this.message, this.cause, this.stackTrace}): super._();
  

@override final  String? message;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of BusinessFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnexpectedCopyWith<Unexpected> get copyWith => _$UnexpectedCopyWithImpl<Unexpected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Unexpected&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'BusinessFailure.unexpected(message: $message, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $UnexpectedCopyWith<$Res> implements $BusinessFailureCopyWith<$Res> {
  factory $UnexpectedCopyWith(Unexpected value, $Res Function(Unexpected) _then) = _$UnexpectedCopyWithImpl;
@override @useResult
$Res call({
 String? message, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$UnexpectedCopyWithImpl<$Res>
    implements $UnexpectedCopyWith<$Res> {
  _$UnexpectedCopyWithImpl(this._self, this._then);

  final Unexpected _self;
  final $Res Function(Unexpected) _then;

/// Create a copy of BusinessFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(Unexpected(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class Defect extends BusinessFailure {
  const Defect({this.message, this.cause, this.stackTrace}): super._();
  

@override final  String? message;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of BusinessFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DefectCopyWith<Defect> get copyWith => _$DefectCopyWithImpl<Defect>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Defect&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'BusinessFailure.defect(message: $message, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $DefectCopyWith<$Res> implements $BusinessFailureCopyWith<$Res> {
  factory $DefectCopyWith(Defect value, $Res Function(Defect) _then) = _$DefectCopyWithImpl;
@override @useResult
$Res call({
 String? message, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$DefectCopyWithImpl<$Res>
    implements $DefectCopyWith<$Res> {
  _$DefectCopyWithImpl(this._self, this._then);

  final Defect _self;
  final $Res Function(Defect) _then;

/// Create a copy of BusinessFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(Defect(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

// dart format on
