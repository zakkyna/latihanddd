import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather_item.freezed.dart';
part 'weather_item.g.dart';

@freezed
class WeatherItem with _$WeatherItem {
  const factory WeatherItem({
    @JsonKey(name: 'id') required int id,
    required String cityName,
    required String iconUrl,
    required String temperature,
    required String description,
    required String feelsLike,
  }) = _WeatherItem;

  factory WeatherItem.fromJson(Map<String, dynamic> json) =>
      _$WeatherItemFromJson(json);
}
