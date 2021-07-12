import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:latihanddd/domain/weather/i_weather_repository.dart';
import 'package:latihanddd/domain/weather/weather_failure.dart';
import 'package:latihanddd/infrastructure/weather/weather_data.dart';

part 'weather_event.dart';
part 'weather_state.dart';
part 'weather_bloc.freezed.dart';

@injectable
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(this.weatherRepository) : super(_Initial());
  final IWeatherRepository weatherRepository;

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    yield* event.map(started: (_) async* {
      yield WeatherState.loading();
      var response = await weatherRepository.getWeather();
      yield WeatherState.loaded(optionFailureOrSuccess: optionOf(response));
    });
  }
}
