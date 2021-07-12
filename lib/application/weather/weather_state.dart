part of 'weather_bloc.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = _Initial;
  const factory WeatherState.loading() = _Loading;
  const factory WeatherState.loaded(
      {required Option<Either<WeatherFailure, WeatherData>>
          optionFailureOrSuccess}) = _Loaded;
}
