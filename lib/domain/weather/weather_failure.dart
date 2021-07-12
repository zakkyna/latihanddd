import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather_failure.freezed.dart';

@freezed
class WeatherFailure with _$WeatherFailure {
  const factory WeatherFailure.noInternet() = _NoInternet;
  const factory WeatherFailure.noData() = _NoData;
  const factory WeatherFailure.serverError() = _ServerError;
}
