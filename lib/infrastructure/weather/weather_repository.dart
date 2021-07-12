import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:latihanddd/domain/core/i_location_service.dart';
import 'package:latihanddd/domain/core/i_network_service.dart';
import 'package:latihanddd/domain/core/location_exception.dart';
import 'package:latihanddd/domain/core/network_exceptions.dart';
import 'package:latihanddd/domain/weather/i_weather_repository.dart';
import 'package:latihanddd/infrastructure/weather/weather_data.dart';
import 'package:latihanddd/domain/weather/weather_failure.dart';

@LazySingleton(as: IWeatherRepository)
class WeatherRepository implements IWeatherRepository {
  final INetworkService _networkService;
  final ILocationService _locationService;
  WeatherRepository(this._networkService, this._locationService);

  String apikey = '84cd69656059a599127289effb9826d7';
  @override
  Future<Either<WeatherFailure, WeatherData>> getWeather() async {
    try {
      var position = await _locationService.determinePosition();
      double latitude = position.latitude;
      double longitude = position.longitude;
      var response = await _networkService.getHttp(
        path:
            '?appid=$apikey&lat=$latitude&lon=$longitude&units=metric&lang=id',
      );
      print(response.toString());
      Map<String, dynamic> datas = response.data as Map<String, dynamic>;
      if (datas.isNotEmpty) {
        WeatherData items = WeatherData.fromJson(datas);
        return right(items);
      }
      return left(WeatherFailure.noData());
    } on LocationServiceDisabled {
      return left(WeatherFailure.locationServiceDisabled());
    } on LocationPermissionDeniedForever {
      return left(WeatherFailure.locationPermisionDeniedForever());
    } on NoLocationPermissionException {
      return left(WeatherFailure.noLocationPermission());
    } on NoInternetException {
      return left(WeatherFailure.noInternet());
    } on ServerException {
      return left(WeatherFailure.serverError());
    } catch (e, stactrace) {
      print(stactrace.toString());
      return left(WeatherFailure.serverError());
    }
  }
}
