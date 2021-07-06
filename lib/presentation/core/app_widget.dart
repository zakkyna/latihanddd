import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihanddd/application/core/route.dart';
import 'package:latihanddd/domain/core/theme.dart';
import 'package:latihanddd/infrastructure/repositories/user_repository.dart';
import 'package:latihanddd/presentation/auth/unauthenticated.dart';
import 'package:latihanddd/presentation/weather/weather_page.dart';
import '../../application/core/app_bloc/app_bloc.dart';

class AppWidget extends StatelessWidget {
  final UserRepository _userRepository;

  const AppWidget({Key? key, required UserRepository userRepository})
      : _userRepository = userRepository,
        super(key: key);

  Widget buildWaitingScreen() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: mainColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state is Uninitialized) {
            return buildWaitingScreen();
          }
          if (state is Unauthenticated) {
            return UnauthenticatedPage(userRepository: _userRepository);
          }
          if (state is Authenticated) {
            return const WeatherPage();
          }
          return buildWaitingScreen();
        },
      ),
    );
  }
}
