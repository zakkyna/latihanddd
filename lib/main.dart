import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihanddd/application/core/app_bloc/app_bloc.dart';
import 'package:latihanddd/presentation/core/app_widget.dart';
import 'package:latihanddd/application/core/bloc_observer.dart';
import 'package:latihanddd/infrastructure/repositories/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await Firebase.initializeApp();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      create: (context) =>
          AppBloc(userRepository: userRepository)..add(AppStarted()),
      child: AppWidget(userRepository: userRepository),
    ),
  );
}
