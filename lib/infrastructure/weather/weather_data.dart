import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_data.freezed.dart';
part 'weather_data.g.dart';

@freezed
class WeatherData with _$WeatherData {
  const factory WeatherData({
    required int id,
    @JsonKey(name: 'name') required String cityName,
    required List<WeatherItem> weather,
    required WeatherMain main,
  }) = _WeatherData;
  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);
}

@freezed
class WeatherItem with _$WeatherItem {
  const factory WeatherItem({
    required int id,
    required String main,
    required String description,
    required String icon,
  }) = _WeatherItem;

  factory WeatherItem.fromJson(Map<String, dynamic> json) =>
      _$WeatherItemFromJson(json);
}

@freezed
class WeatherMain with _$WeatherMain {
  const factory WeatherMain({
    required num temp,
    required num feels_like,
    required num temp_min,
    required num temp_max,
    required num pressure,
    required num humidity,
  }) = _WeatherMain;

  factory WeatherMain.fromJson(Map<String, dynamic> json) =>
      _$WeatherMainFromJson(json);
}
