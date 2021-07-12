import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:latihanddd/application/auth/auth_bloc.dart';
import 'package:latihanddd/domain/core/theme.dart';
import 'package:latihanddd/injection.dart';
import 'package:latihanddd/presentation/router/router.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
        )
      ],
      child: GetMaterialApp(
        title: 'Flutter Dev Showcase',
        smartManagement: SmartManagement.full,
        enableLog: false,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        getPages: Routers().routers,
        initialRoute: Routers.splash,
      ),
    );
  }
}
