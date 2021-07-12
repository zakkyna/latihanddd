// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'weather_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeatherItem _$WeatherItemFromJson(Map<String, dynamic> json) {
  return _WeatherItem.fromJson(json);
}

/// @nodoc
class _$WeatherItemTearOff {
  const _$WeatherItemTearOff();

  _WeatherItem call(
      {@JsonKey(name: 'id') required int id,
      required String cityName,
      required String iconUrl,
      required String temperature,
      required String description,
      required String feelsLike}) {
    return _WeatherItem(
      id: id,
      cityName: cityName,
      iconUrl: iconUrl,
      temperature: temperature,
      description: description,
      feelsLike: feelsLike,
    );
  }

  WeatherItem fromJson(Map<String, Object> json) {
    return WeatherItem.fromJson(json);
  }
}

/// @nodoc
const $WeatherItem = _$WeatherItemTearOff();

/// @nodoc
mixin _$WeatherItem {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  String get cityName => throw _privateConstructorUsedError;
  String get iconUrl => throw _privateConstructorUsedError;
  String get temperature => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get feelsLike => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherItemCopyWith<WeatherItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherItemCopyWith<$Res> {
  factory $WeatherItemCopyWith(
          WeatherItem value, $Res Function(WeatherItem) then) =
      _$WeatherItemCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') int id,
      String cityName,
      String iconUrl,
      String temperature,
      String description,
      String feelsLike});
}

/// @nodoc
class _$WeatherItemCopyWithImpl<$Res> implements $WeatherItemCopyWith<$Res> {
  _$WeatherItemCopyWithImpl(this._value, this._then);

  final WeatherItem _value;
  // ignore: unused_field
  final $Res Function(WeatherItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? cityName = freezed,
    Object? iconUrl = freezed,
    Object? temperature = freezed,
    Object? description = freezed,
    Object? feelsLike = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cityName: cityName == freezed
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: iconUrl == freezed
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: temperature == freezed
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      feelsLike: feelsLike == freezed
          ? _value.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$WeatherItemCopyWith<$Res>
    implements $WeatherItemCopyWith<$Res> {
  factory _$WeatherItemCopyWith(
          _WeatherItem value, $Res Function(_WeatherItem) then) =
      __$WeatherItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') int id,
      String cityName,
      String iconUrl,
      String temperature,
      String description,
      String feelsLike});
}

/// @nodoc
class __$WeatherItemCopyWithImpl<$Res> extends _$WeatherItemCopyWithImpl<$Res>
    implements _$WeatherItemCopyWith<$Res> {
  __$WeatherItemCopyWithImpl(
      _WeatherItem _value, $Res Function(_WeatherItem) _then)
      : super(_value, (v) => _then(v as _WeatherItem));

  @override
  _WeatherItem get _value => super._value as _WeatherItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? cityName = freezed,
    Object? iconUrl = freezed,
    Object? temperature = freezed,
    Object? description = freezed,
    Object? feelsLike = freezed,
  }) {
    return _then(_WeatherItem(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cityName: cityName == freezed
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: iconUrl == freezed
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: temperature == freezed
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      feelsLike: feelsLike == freezed
          ? _value.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherItem implements _WeatherItem {
  const _$_WeatherItem(
      {@JsonKey(name: 'id') required this.id,
      required this.cityName,
      required this.iconUrl,
      required this.temperature,
      required this.description,
      required this.feelsLike});

  factory _$_WeatherItem.fromJson(Map<String, dynamic> json) =>
      _$_$_WeatherItemFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  final String cityName;
  @override
  final String iconUrl;
  @override
  final String temperature;
  @override
  final String description;
  @override
  final String feelsLike;

  @override
  String toString() {
    return 'WeatherItem(id: $id, cityName: $cityName, iconUrl: $iconUrl, temperature: $temperature, description: $description, feelsLike: $feelsLike)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WeatherItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.cityName, cityName) ||
                const DeepCollectionEquality()
                    .equals(other.cityName, cityName)) &&
            (identical(other.iconUrl, iconUrl) ||
                const DeepCollectionEquality()
                    .equals(other.iconUrl, iconUrl)) &&
            (identical(other.temperature, temperature) ||
                const DeepCollectionEquality()
                    .equals(other.temperature, temperature)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.feelsLike, feelsLike) ||
                const DeepCollectionEquality()
                    .equals(other.feelsLike, feelsLike)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(cityName) ^
      const DeepCollectionEquality().hash(iconUrl) ^
      const DeepCollectionEquality().hash(temperature) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(feelsLike);

  @JsonKey(ignore: true)
  @override
  _$WeatherItemCopyWith<_WeatherItem> get copyWith =>
      __$WeatherItemCopyWithImpl<_WeatherItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_WeatherItemToJson(this);
  }
}

abstract class _WeatherItem implements WeatherItem {
  const factory _WeatherItem(
      {@JsonKey(name: 'id') required int id,
      required String cityName,
      required String iconUrl,
      required String temperature,
      required String description,
      required String feelsLike}) = _$_WeatherItem;

  factory _WeatherItem.fromJson(Map<String, dynamic> json) =
      _$_WeatherItem.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @override
  String get cityName => throw _privateConstructorUsedError;
  @override
  String get iconUrl => throw _privateConstructorUsedError;
  @override
  String get temperature => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get feelsLike => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WeatherItemCopyWith<_WeatherItem> get copyWith =>
      throw _privateConstructorUsedError;
}
