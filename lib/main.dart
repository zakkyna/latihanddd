import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:latihanddd/injection.dart';
import 'package:latihanddd/presentation/core/app_widget.dart';
import 'package:latihanddd/application/core/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  Bloc.observer = AppBlocObserver();
  await Firebase.initializeApp();
  runApp(AppWidget());
}
