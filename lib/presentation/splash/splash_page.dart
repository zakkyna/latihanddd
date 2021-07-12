import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihanddd/application/auth/auth_bloc.dart';
import 'package:latihanddd/presentation/auth/unauthenticated.dart';
import 'package:latihanddd/presentation/weather/weather_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return state.map(
        initial: (_) => Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        authenticated: (_) => WeatherPage(),
        unauthenticated: (_) => UnauthenticatedPage(),
      );
    });
  }
}
