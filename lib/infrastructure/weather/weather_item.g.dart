// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherItem _$_$_WeatherItemFromJson(Map<String, dynamic> json) {
  return _$_WeatherItem(
    id: json['id'] as int,
    cityName: json['cityName'] as String,
    iconUrl: json['iconUrl'] as String,
    temperature: json['temperature'] as String,
    description: json['description'] as String,
    feelsLike: json['feelsLike'] as String,
  );
}

Map<String, dynamic> _$_$_WeatherItemToJson(_$_WeatherItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cityName': instance.cityName,
      'iconUrl': instance.iconUrl,
      'temperature': instance.temperature,
      'description': instance.description,
      'feelsLike': instance.feelsLike,
    };
