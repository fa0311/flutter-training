// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeatherParameterModel _$WeatherParameterModelFromJson(
    Map<String, dynamic> json) {
  return _WeatherParameterModel.fromJson(json);
}

/// @nodoc
mixin _$WeatherParameterModel {
  String get area => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherParameterModelCopyWith<WeatherParameterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherParameterModelCopyWith<$Res> {
  factory $WeatherParameterModelCopyWith(WeatherParameterModel value,
          $Res Function(WeatherParameterModel) then) =
      _$WeatherParameterModelCopyWithImpl<$Res, WeatherParameterModel>;
  @useResult
  $Res call({String area, DateTime date});
}

/// @nodoc
class _$WeatherParameterModelCopyWithImpl<$Res,
        $Val extends WeatherParameterModel>
    implements $WeatherParameterModelCopyWith<$Res> {
  _$WeatherParameterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? area = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherParameterModelImplCopyWith<$Res>
    implements $WeatherParameterModelCopyWith<$Res> {
  factory _$$WeatherParameterModelImplCopyWith(
          _$WeatherParameterModelImpl value,
          $Res Function(_$WeatherParameterModelImpl) then) =
      __$$WeatherParameterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String area, DateTime date});
}

/// @nodoc
class __$$WeatherParameterModelImplCopyWithImpl<$Res>
    extends _$WeatherParameterModelCopyWithImpl<$Res,
        _$WeatherParameterModelImpl>
    implements _$$WeatherParameterModelImplCopyWith<$Res> {
  __$$WeatherParameterModelImplCopyWithImpl(_$WeatherParameterModelImpl _value,
      $Res Function(_$WeatherParameterModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? area = null,
    Object? date = null,
  }) {
    return _then(_$WeatherParameterModelImpl(
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$WeatherParameterModelImpl implements _WeatherParameterModel {
  const _$WeatherParameterModelImpl({required this.area, required this.date});

  factory _$WeatherParameterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherParameterModelImplFromJson(json);

  @override
  final String area;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'WeatherParameterModel(area: $area, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherParameterModelImpl &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, area, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherParameterModelImplCopyWith<_$WeatherParameterModelImpl>
      get copyWith => __$$WeatherParameterModelImplCopyWithImpl<
          _$WeatherParameterModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherParameterModelImplToJson(
      this,
    );
  }
}

abstract class _WeatherParameterModel implements WeatherParameterModel {
  const factory _WeatherParameterModel(
      {required final String area,
      required final DateTime date}) = _$WeatherParameterModelImpl;

  factory _WeatherParameterModel.fromJson(Map<String, dynamic> json) =
      _$WeatherParameterModelImpl.fromJson;

  @override
  String get area;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$WeatherParameterModelImplCopyWith<_$WeatherParameterModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WeatherResponseModel _$WeatherResponseModelFromJson(Map<String, dynamic> json) {
  return _WeatherResponseModel.fromJson(json);
}

/// @nodoc
mixin _$WeatherResponseModel {
  WeatherType get weatherCondition => throw _privateConstructorUsedError;
  int get maxTemperature => throw _privateConstructorUsedError;
  int get minTemperature => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherResponseModelCopyWith<WeatherResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherResponseModelCopyWith<$Res> {
  factory $WeatherResponseModelCopyWith(WeatherResponseModel value,
          $Res Function(WeatherResponseModel) then) =
      _$WeatherResponseModelCopyWithImpl<$Res, WeatherResponseModel>;
  @useResult
  $Res call(
      {WeatherType weatherCondition,
      int maxTemperature,
      int minTemperature,
      DateTime date});
}

/// @nodoc
class _$WeatherResponseModelCopyWithImpl<$Res,
        $Val extends WeatherResponseModel>
    implements $WeatherResponseModelCopyWith<$Res> {
  _$WeatherResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherCondition = null,
    Object? maxTemperature = null,
    Object? minTemperature = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      weatherCondition: null == weatherCondition
          ? _value.weatherCondition
          : weatherCondition // ignore: cast_nullable_to_non_nullable
              as WeatherType,
      maxTemperature: null == maxTemperature
          ? _value.maxTemperature
          : maxTemperature // ignore: cast_nullable_to_non_nullable
              as int,
      minTemperature: null == minTemperature
          ? _value.minTemperature
          : minTemperature // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherResponseModelImplCopyWith<$Res>
    implements $WeatherResponseModelCopyWith<$Res> {
  factory _$$WeatherResponseModelImplCopyWith(_$WeatherResponseModelImpl value,
          $Res Function(_$WeatherResponseModelImpl) then) =
      __$$WeatherResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WeatherType weatherCondition,
      int maxTemperature,
      int minTemperature,
      DateTime date});
}

/// @nodoc
class __$$WeatherResponseModelImplCopyWithImpl<$Res>
    extends _$WeatherResponseModelCopyWithImpl<$Res, _$WeatherResponseModelImpl>
    implements _$$WeatherResponseModelImplCopyWith<$Res> {
  __$$WeatherResponseModelImplCopyWithImpl(_$WeatherResponseModelImpl _value,
      $Res Function(_$WeatherResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherCondition = null,
    Object? maxTemperature = null,
    Object? minTemperature = null,
    Object? date = null,
  }) {
    return _then(_$WeatherResponseModelImpl(
      weatherCondition: null == weatherCondition
          ? _value.weatherCondition
          : weatherCondition // ignore: cast_nullable_to_non_nullable
              as WeatherType,
      maxTemperature: null == maxTemperature
          ? _value.maxTemperature
          : maxTemperature // ignore: cast_nullable_to_non_nullable
              as int,
      minTemperature: null == minTemperature
          ? _value.minTemperature
          : minTemperature // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$WeatherResponseModelImpl implements _WeatherResponseModel {
  const _$WeatherResponseModelImpl(
      {required this.weatherCondition,
      required this.maxTemperature,
      required this.minTemperature,
      required this.date});

  factory _$WeatherResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherResponseModelImplFromJson(json);

  @override
  final WeatherType weatherCondition;
  @override
  final int maxTemperature;
  @override
  final int minTemperature;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'WeatherResponseModel(weatherCondition: $weatherCondition, maxTemperature: $maxTemperature, minTemperature: $minTemperature, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherResponseModelImpl &&
            (identical(other.weatherCondition, weatherCondition) ||
                other.weatherCondition == weatherCondition) &&
            (identical(other.maxTemperature, maxTemperature) ||
                other.maxTemperature == maxTemperature) &&
            (identical(other.minTemperature, minTemperature) ||
                other.minTemperature == minTemperature) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, weatherCondition, maxTemperature, minTemperature, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherResponseModelImplCopyWith<_$WeatherResponseModelImpl>
      get copyWith =>
          __$$WeatherResponseModelImplCopyWithImpl<_$WeatherResponseModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherResponseModelImplToJson(
      this,
    );
  }
}

abstract class _WeatherResponseModel implements WeatherResponseModel {
  const factory _WeatherResponseModel(
      {required final WeatherType weatherCondition,
      required final int maxTemperature,
      required final int minTemperature,
      required final DateTime date}) = _$WeatherResponseModelImpl;

  factory _WeatherResponseModel.fromJson(Map<String, dynamic> json) =
      _$WeatherResponseModelImpl.fromJson;

  @override
  WeatherType get weatherCondition;
  @override
  int get maxTemperature;
  @override
  int get minTemperature;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$WeatherResponseModelImplCopyWith<_$WeatherResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
