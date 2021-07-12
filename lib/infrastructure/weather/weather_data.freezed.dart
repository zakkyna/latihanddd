// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'weather_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) {
  return _WeatherData.fromJson(json);
}

/// @nodoc
class _$WeatherDataTearOff {
  const _$WeatherDataTearOff();

  _WeatherData call(
      {required int id,
      @JsonKey(name: 'name') required String cityName,
      required List<WeatherItem> weather,
      required WeatherMain main}) {
    return _WeatherData(
      id: id,
      cityName: cityName,
      weather: weather,
      main: main,
    );
  }

  WeatherData fromJson(Map<String, Object> json) {
    return WeatherData.fromJson(json);
  }
}

/// @nodoc
const $WeatherData = _$WeatherDataTearOff();

/// @nodoc
mixin _$WeatherData {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get cityName => throw _privateConstructorUsedError;
  List<WeatherItem> get weather => throw _privateConstructorUsedError;
  WeatherMain get main => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherDataCopyWith<WeatherData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDataCopyWith<$Res> {
  factory $WeatherDataCopyWith(
          WeatherData value, $Res Function(WeatherData) then) =
      _$WeatherDataCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: 'name') String cityName,
      List<WeatherItem> weather,
      WeatherMain main});

  $WeatherMainCopyWith<$Res> get main;
}

/// @nodoc
class _$WeatherDataCopyWithImpl<$Res> implements $WeatherDataCopyWith<$Res> {
  _$WeatherDataCopyWithImpl(this._value, this._then);

  final WeatherData _value;
  // ignore: unused_field
  final $Res Function(WeatherData) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? cityName = freezed,
    Object? weather = freezed,
    Object? main = freezed,
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
      weather: weather == freezed
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<WeatherItem>,
      main: main == freezed
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as WeatherMain,
    ));
  }

  @override
  $WeatherMainCopyWith<$Res> get main {
    return $WeatherMainCopyWith<$Res>(_value.main, (value) {
      return _then(_value.copyWith(main: value));
    });
  }
}

/// @nodoc
abstract class _$WeatherDataCopyWith<$Res>
    implements $WeatherDataCopyWith<$Res> {
  factory _$WeatherDataCopyWith(
          _WeatherData value, $Res Function(_WeatherData) then) =
      __$WeatherDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: 'name') String cityName,
      List<WeatherItem> weather,
      WeatherMain main});

  @override
  $WeatherMainCopyWith<$Res> get main;
}

/// @nodoc
class __$WeatherDataCopyWithImpl<$Res> extends _$WeatherDataCopyWithImpl<$Res>
    implements _$WeatherDataCopyWith<$Res> {
  __$WeatherDataCopyWithImpl(
      _WeatherData _value, $Res Function(_WeatherData) _then)
      : super(_value, (v) => _then(v as _WeatherData));

  @override
  _WeatherData get _value => super._value as _WeatherData;

  @override
  $Res call({
    Object? id = freezed,
    Object? cityName = freezed,
    Object? weather = freezed,
    Object? main = freezed,
  }) {
    return _then(_WeatherData(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cityName: cityName == freezed
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      weather: weather == freezed
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<WeatherItem>,
      main: main == freezed
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as WeatherMain,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherData implements _WeatherData {
  const _$_WeatherData(
      {required this.id,
      @JsonKey(name: 'name') required this.cityName,
      required this.weather,
      required this.main});

  factory _$_WeatherData.fromJson(Map<String, dynamic> json) =>
      _$_$_WeatherDataFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'name')
  final String cityName;
  @override
  final List<WeatherItem> weather;
  @override
  final WeatherMain main;

  @override
  String toString() {
    return 'WeatherData(id: $id, cityName: $cityName, weather: $weather, main: $main)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WeatherData &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.cityName, cityName) ||
                const DeepCollectionEquality()
                    .equals(other.cityName, cityName)) &&
            (identical(other.weather, weather) ||
                const DeepCollectionEquality()
                    .equals(other.weather, weather)) &&
            (identical(other.main, main) ||
                const DeepCollectionEquality().equals(other.main, main)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(cityName) ^
      const DeepCollectionEquality().hash(weather) ^
      const DeepCollectionEquality().hash(main);

  @JsonKey(ignore: true)
  @override
  _$WeatherDataCopyWith<_WeatherData> get copyWith =>
      __$WeatherDataCopyWithImpl<_WeatherData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_WeatherDataToJson(this);
  }
}

abstract class _WeatherData implements WeatherData {
  const factory _WeatherData(
      {required int id,
      @JsonKey(name: 'name') required String cityName,
      required List<WeatherItem> weather,
      required WeatherMain main}) = _$_WeatherData;

  factory _WeatherData.fromJson(Map<String, dynamic> json) =
      _$_WeatherData.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'name')
  String get cityName => throw _privateConstructorUsedError;
  @override
  List<WeatherItem> get weather => throw _privateConstructorUsedError;
  @override
  WeatherMain get main => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WeatherDataCopyWith<_WeatherData> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherItem _$WeatherItemFromJson(Map<String, dynamic> json) {
  return _WeatherItem.fromJson(json);
}

/// @nodoc
class _$WeatherItemTearOff {
  const _$WeatherItemTearOff();

  _WeatherItem call(
      {required int id,
      required String main,
      required String description,
      required String icon}) {
    return _WeatherItem(
      id: id,
      main: main,
      description: description,
      icon: icon,
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
  int get id => throw _privateConstructorUsedError;
  String get main => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;

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
  $Res call({int id, String main, String description, String icon});
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
    Object? main = freezed,
    Object? description = freezed,
    Object? icon = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      main: main == freezed
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
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
  $Res call({int id, String main, String description, String icon});
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
    Object? main = freezed,
    Object? description = freezed,
    Object? icon = freezed,
  }) {
    return _then(_WeatherItem(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      main: main == freezed
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherItem implements _WeatherItem {
  const _$_WeatherItem(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});

  factory _$_WeatherItem.fromJson(Map<String, dynamic> json) =>
      _$_$_WeatherItemFromJson(json);

  @override
  final int id;
  @override
  final String main;
  @override
  final String description;
  @override
  final String icon;

  @override
  String toString() {
    return 'WeatherItem(id: $id, main: $main, description: $description, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WeatherItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.main, main) ||
                const DeepCollectionEquality().equals(other.main, main)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(main) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(icon);

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
      {required int id,
      required String main,
      required String description,
      required String icon}) = _$_WeatherItem;

  factory _WeatherItem.fromJson(Map<String, dynamic> json) =
      _$_WeatherItem.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get main => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get icon => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WeatherItemCopyWith<_WeatherItem> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherMain _$WeatherMainFromJson(Map<String, dynamic> json) {
  return _WeatherMain.fromJson(json);
}

/// @nodoc
class _$WeatherMainTearOff {
  const _$WeatherMainTearOff();

  _WeatherMain call(
      {required num temp,
      required num feels_like,
      required num temp_min,
      required num temp_max,
      required num pressure,
      required num humidity}) {
    return _WeatherMain(
      temp: temp,
      feels_like: feels_like,
      temp_min: temp_min,
      temp_max: temp_max,
      pressure: pressure,
      humidity: humidity,
    );
  }

  WeatherMain fromJson(Map<String, Object> json) {
    return WeatherMain.fromJson(json);
  }
}

/// @nodoc
const $WeatherMain = _$WeatherMainTearOff();

/// @nodoc
mixin _$WeatherMain {
  num get temp => throw _privateConstructorUsedError;
  num get feels_like => throw _privateConstructorUsedError;
  num get temp_min => throw _privateConstructorUsedError;
  num get temp_max => throw _privateConstructorUsedError;
  num get pressure => throw _privateConstructorUsedError;
  num get humidity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherMainCopyWith<WeatherMain> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherMainCopyWith<$Res> {
  factory $WeatherMainCopyWith(
          WeatherMain value, $Res Function(WeatherMain) then) =
      _$WeatherMainCopyWithImpl<$Res>;
  $Res call(
      {num temp,
      num feels_like,
      num temp_min,
      num temp_max,
      num pressure,
      num humidity});
}

/// @nodoc
class _$WeatherMainCopyWithImpl<$Res> implements $WeatherMainCopyWith<$Res> {
  _$WeatherMainCopyWithImpl(this._value, this._then);

  final WeatherMain _value;
  // ignore: unused_field
  final $Res Function(WeatherMain) _then;

  @override
  $Res call({
    Object? temp = freezed,
    Object? feels_like = freezed,
    Object? temp_min = freezed,
    Object? temp_max = freezed,
    Object? pressure = freezed,
    Object? humidity = freezed,
  }) {
    return _then(_value.copyWith(
      temp: temp == freezed
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as num,
      feels_like: feels_like == freezed
          ? _value.feels_like
          : feels_like // ignore: cast_nullable_to_non_nullable
              as num,
      temp_min: temp_min == freezed
          ? _value.temp_min
          : temp_min // ignore: cast_nullable_to_non_nullable
              as num,
      temp_max: temp_max == freezed
          ? _value.temp_max
          : temp_max // ignore: cast_nullable_to_non_nullable
              as num,
      pressure: pressure == freezed
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as num,
      humidity: humidity == freezed
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
abstract class _$WeatherMainCopyWith<$Res>
    implements $WeatherMainCopyWith<$Res> {
  factory _$WeatherMainCopyWith(
          _WeatherMain value, $Res Function(_WeatherMain) then) =
      __$WeatherMainCopyWithImpl<$Res>;
  @override
  $Res call(
      {num temp,
      num feels_like,
      num temp_min,
      num temp_max,
      num pressure,
      num humidity});
}

/// @nodoc
class __$WeatherMainCopyWithImpl<$Res> extends _$WeatherMainCopyWithImpl<$Res>
    implements _$WeatherMainCopyWith<$Res> {
  __$WeatherMainCopyWithImpl(
      _WeatherMain _value, $Res Function(_WeatherMain) _then)
      : super(_value, (v) => _then(v as _WeatherMain));

  @override
  _WeatherMain get _value => super._value as _WeatherMain;

  @override
  $Res call({
    Object? temp = freezed,
    Object? feels_like = freezed,
    Object? temp_min = freezed,
    Object? temp_max = freezed,
    Object? pressure = freezed,
    Object? humidity = freezed,
  }) {
    return _then(_WeatherMain(
      temp: temp == freezed
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as num,
      feels_like: feels_like == freezed
          ? _value.feels_like
          : feels_like // ignore: cast_nullable_to_non_nullable
              as num,
      temp_min: temp_min == freezed
          ? _value.temp_min
          : temp_min // ignore: cast_nullable_to_non_nullable
              as num,
      temp_max: temp_max == freezed
          ? _value.temp_max
          : temp_max // ignore: cast_nullable_to_non_nullable
              as num,
      pressure: pressure == freezed
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as num,
      humidity: humidity == freezed
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherMain implements _WeatherMain {
  const _$_WeatherMain(
      {required this.temp,
      required this.feels_like,
      required this.temp_min,
      required this.temp_max,
      required this.pressure,
      required this.humidity});

  factory _$_WeatherMain.fromJson(Map<String, dynamic> json) =>
      _$_$_WeatherMainFromJson(json);

  @override
  final num temp;
  @override
  final num feels_like;
  @override
  final num temp_min;
  @override
  final num temp_max;
  @override
  final num pressure;
  @override
  final num humidity;

  @override
  String toString() {
    return 'WeatherMain(temp: $temp, feels_like: $feels_like, temp_min: $temp_min, temp_max: $temp_max, pressure: $pressure, humidity: $humidity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WeatherMain &&
            (identical(other.temp, temp) ||
                const DeepCollectionEquality().equals(other.temp, temp)) &&
            (identical(other.feels_like, feels_like) ||
                const DeepCollectionEquality()
                    .equals(other.feels_like, feels_like)) &&
            (identical(other.temp_min, temp_min) ||
                const DeepCollectionEquality()
                    .equals(other.temp_min, temp_min)) &&
            (identical(other.temp_max, temp_max) ||
                const DeepCollectionEquality()
                    .equals(other.temp_max, temp_max)) &&
            (identical(other.pressure, pressure) ||
                const DeepCollectionEquality()
                    .equals(other.pressure, pressure)) &&
            (identical(other.humidity, humidity) ||
                const DeepCollectionEquality()
                    .equals(other.humidity, humidity)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(temp) ^
      const DeepCollectionEquality().hash(feels_like) ^
      const DeepCollectionEquality().hash(temp_min) ^
      const DeepCollectionEquality().hash(temp_max) ^
      const DeepCollectionEquality().hash(pressure) ^
      const DeepCollectionEquality().hash(humidity);

  @JsonKey(ignore: true)
  @override
  _$WeatherMainCopyWith<_WeatherMain> get copyWith =>
      __$WeatherMainCopyWithImpl<_WeatherMain>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_WeatherMainToJson(this);
  }
}

abstract class _WeatherMain implements WeatherMain {
  const factory _WeatherMain(
      {required num temp,
      required num feels_like,
      required num temp_min,
      required num temp_max,
      required num pressure,
      required num humidity}) = _$_WeatherMain;

  factory _WeatherMain.fromJson(Map<String, dynamic> json) =
      _$_WeatherMain.fromJson;

  @override
  num get temp => throw _privateConstructorUsedError;
  @override
  num get feels_like => throw _privateConstructorUsedError;
  @override
  num get temp_min => throw _privateConstructorUsedError;
  @override
  num get temp_max => throw _privateConstructorUsedError;
  @override
  num get pressure => throw _privateConstructorUsedError;
  @override
  num get humidity => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WeatherMainCopyWith<_WeatherMain> get copyWith =>
      throw _privateConstructorUsedError;
}
