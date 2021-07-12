import 'package:get/route_manager.dart';
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
      page: () => WeatherPage(),
    ),
    GetPage(
      name: Routers.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routers.register,
      page: () => RegisterPage(),
    ),
  ];
}
