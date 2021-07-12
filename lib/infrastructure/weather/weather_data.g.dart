// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherData _$_$_WeatherDataFromJson(Map<String, dynamic> json) {
  return _$_WeatherData(
    id: json['id'] as int,
    cityName: json['name'] as String,
    weather: (json['weather'] as List<dynamic>)
        .map((e) => WeatherItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    main: WeatherMain.fromJson(json['main'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_WeatherDataToJson(_$_WeatherData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.cityName,
      'weather': instance.weather,
      'main': instance.main,
    };

_$_WeatherItem _$_$_WeatherItemFromJson(Map<String, dynamic> json) {
  return _$_WeatherItem(
    id: json['id'] as int,
    main: json['main'] as String,
    description: json['description'] as String,
    icon: json['icon'] as String,
  );
}

Map<String, dynamic> _$_$_WeatherItemToJson(_$_WeatherItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

_$_WeatherMain _$_$_WeatherMainFromJson(Map<String, dynamic> json) {
  return _$_WeatherMain(
    temp: json['temp'] as num,
    feels_like: json['feels_like'] as num,
    temp_min: json['temp_min'] as num,
    temp_max: json['temp_max'] as num,
    pressure: json['pressure'] as num,
    humidity: json['humidity'] as num,
  );
}

Map<String, dynamic> _$_$_WeatherMainToJson(_$_WeatherMain instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feels_like,
      'temp_min': instance.temp_min,
      'temp_max': instance.temp_max,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
