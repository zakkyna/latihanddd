import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:latihanddd/infrastructure/repositories/user_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final UserRepository _userRepository;

  AppBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(
          userRepository.isSignedIn()
              ? Authenticated(userRepository.getUser())
              : Unauthenticated(),
        );

  AppState get initialState => Uninitialized();

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AppState> _mapAppStartedToState() async* {
    final isSignedIn = _userRepository.isSignedIn();
    if (isSignedIn) {
      final user = _userRepository.getUser();
      yield Authenticated(user);
    } else {
      yield Unauthenticated();
    }
  }

  Stream<AppState> _mapLoggedInToState() async* {
    yield Authenticated(_userRepository.getUser());
  }

  Stream<AppState> _mapLoggedOutToState() async* {
    yield Unauthenticated();
    _userRepository.signOut();
  }
}
