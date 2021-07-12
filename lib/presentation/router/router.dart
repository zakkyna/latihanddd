import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:latihanddd/application/auth/login_bloc/login_bloc.dart';
import 'package:latihanddd/application/auth/register_bloc/register_bloc.dart';
import 'package:latihanddd/application/weather/weather_bloc.dart';
import 'package:latihanddd/injection.dart';
import 'package:latihanddd/presentation/auth/unauthenticated.dart';
import 'package:latihanddd/presentation/splash/splash_page.dart';
import 'package:latihanddd/presentation/weather/weather_page.dart';

class Routers {
  static final String splash = '/';
  static final String weather = '/weather';
  static final String unauthenticated = '/unauthenticated';
  static final String login = '/login';
  static final String register = '/register';

  final List<GetPage> routers = [
    GetPage(
      name: Routers.splash,
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routers.unauthenticated,
      page: () => UnauthenticatedPage(),
    ),
    GetPage(
      name: Routers.weather,
      page: () => BlocProvider<WeatherBloc>(
        create: (context) => getIt<WeatherBloc>(),
        child: WeatherPage(),
      ),
    ),
    GetPage(
      name: Routers.login,
      page: () => BlocProvider<LoginBloc>(
        create: (context) => getIt<LoginBloc>(),
        child: LoginPage(),
      ),
    ),
    GetPage(
      name: Routers.login,
      page: () => BlocProvider<RegisterBloc>(
        create: (context) => getIt<RegisterBloc>(),
        child: LoginPage(),
      ),
    ),
  ];
}
