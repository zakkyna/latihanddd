import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihanddd/application/weather/weather_bloc.dart';
import 'package:latihanddd/injection.dart';
import 'package:latihanddd/presentation/weather/weather_form.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) => getIt<WeatherBloc>()..add(WeatherEvent.started()),
      child: WeatherForm(),
    );
  }
}
