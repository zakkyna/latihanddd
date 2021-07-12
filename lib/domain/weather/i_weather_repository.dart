import 'package:dartz/dartz.dart';
import 'package:latihanddd/domain/weather/weather_failure.dart';
import 'package:latihanddd/infrastructure/weather/weather_data.dart';

abstract class IWeatherRepository {
  Future<Either<WeatherFailure, WeatherData>> getWeather();
}
