import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:latihanddd/domain/core/validators.dart';
import 'package:latihanddd/infrastructure/repositories/user_repository.dart';
import 'package:meta/meta.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;

  LoginBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(LoginState.empty());

  LoginState get initialState => LoginState.empty();

  @override
  Stream<Transition<LoginEvent, LoginState>> transformEvents(
    Stream<LoginEvent> events,
    TransitionFunction<LoginEvent, LoginState> transitionFn,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! LoginEmailChanged && event is! LoginPasswordChanged);
    });
    final debounceStream = events.where((event) {
      return (event is LoginEmailChanged || event is LoginPasswordChanged);
    }).debounceTime(const Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginEmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is LoginPasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is LoginWithCredentialsPressed) {
      yield* _mapLoginWithCredentialsPressedToState(
        event.email,
        event.password,
      );
    }
  }

  Stream<LoginState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validators.isValidEmail(email),
    );
  }

  Stream<LoginState> _mapPasswordChangedToState(String password) async* {
    yield state.update(
      isPasswordValid: Validators.isValidPassword(password),
    );
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState(
    String email,
    String password,
  ) async* {
    yield LoginState.loading();
    try {
      await _userRepository.signInWithCredentials(email, password);
      yield LoginState.success();
    } on FirebaseAuthException catch (e) {
      String message;

      // e.code :
      // invalid-email:
      // Thrown if the email address is not valid.
      // user-disabled:
      // Thrown if the user corresponding to the given email has been disabled.
      // user-not-found:
      // Thrown if there is no user corresponding to the given email.
      // wrong-password:
      // Thrown if the password is invalid for the given email, or the account corresponding to the email does not have a password set
      switch (e.code) {
        case 'invalid-email':
          message = 'Wrong email address !';
          break;
        case 'user-disabled':
          message = 'User suspended !';
          break;
        case 'user-not-found':
          message = 'User not found !';
          break;
        case 'wrong-password':
          message = 'Wrong password !';
          break;
        default:
          message = 'Login Failure';
      }
      yield LoginState.failure(message);
    } catch (e) {
      yield LoginState.failure('Login Failure');
    }
  }
}
