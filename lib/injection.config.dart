// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:dio/dio.dart' as _i12;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_bloc.dart' as _i11;
import 'application/auth/login_bloc/login_bloc.dart' as _i8;
import 'application/auth/register_bloc/register_bloc.dart' as _i9;
import 'application/weather/weather_bloc.dart' as _i10;
import 'domain/auth/i_auth_facade.dart' as _i6;
import 'infrastructure/auth/firebase_auth_facade.dart' as _i7;
import 'infrastructure/core/firebase_injectable_module.dart' as _i14;
import 'infrastructure/core/network_injectable_module.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final networkInjectableModule = _$NetworkInjectableModule();
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<_i3.Connectivity>(
      () => networkInjectableModule.connectivity);
  gh.lazySingleton<_i4.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i5.GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  gh.lazySingleton<_i6.IAuthFacade>(() =>
      _i7.FirebaseAuthFacade(get<_i4.FirebaseAuth>(), get<_i5.GoogleSignIn>()));
  gh.factory<_i8.LoginBloc>(() => _i8.LoginBloc(get<_i6.IAuthFacade>()));
  gh.factory<_i9.RegisterBloc>(() => _i9.RegisterBloc(get<_i6.IAuthFacade>()));
  gh.factory<String>(() => networkInjectableModule.baseUrl,
      instanceName: 'baseUrl');
  gh.factory<_i10.WeatherBloc>(() => _i10.WeatherBloc());
  gh.factory<_i11.AuthBloc>(() => _i11.AuthBloc(get<_i6.IAuthFacade>()));
  gh.lazySingleton<_i12.Dio>(
      () => networkInjectableModule.dio(get<String>(instanceName: 'baseUrl')));
  return get;
}

class _$NetworkInjectableModule extends _i13.NetworkInjectableModule {}

class _$FirebaseInjectableModule extends _i14.FirebaseInjectableModule {}
