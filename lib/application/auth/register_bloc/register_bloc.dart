import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:latihanddd/domain/core/validators.dart';
import 'package:latihanddd/infrastructure/repositories/user_repository.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository _userRepository;

  RegisterBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(RegisterState.empty());

  RegisterState get initialState => RegisterState.empty();

  @override
  Stream<Transition<RegisterEvent, RegisterState>> transformEvents(
    Stream<RegisterEvent> events,
    TransitionFunction<RegisterEvent, RegisterState> transitionFn,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! RegisterEmailChanged &&
          event is! RegisterPasswordChanged);
    });
    final debounceStream = events.where((event) {
      return (event is RegisterEmailChanged ||
          event is RegisterPasswordChanged);
    }).debounceTime(const Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterFirstNameChanged) {
      yield* _mapFirstNameChangedToState(event.firstName);
    } else if (event is RegisterLastNameChanged) {
      yield* _mapLastNameChangedToState(event.lastName);
    } else if (event is RegisterEmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is RegisterPasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is RegisterSubmitted) {
      yield* _mapFormSubmittedToState(event.email, event.password, event.name);
    }
  }

  Stream<RegisterState> _mapFirstNameChangedToState(String firstName) async* {
    yield state.update(
      isFirstNameValid: firstName.length > 2,
    );
  }

  Stream<RegisterState> _mapLastNameChangedToState(String lastName) async* {
    yield state.update(
      isLastNameValid: lastName.length > 1,
    );
  }

  Stream<RegisterState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validators.isValidEmail(email),
    );
  }

  Stream<RegisterState> _mapPasswordChangedToState(String password) async* {
    yield state.update(
      isPasswordValid: Validators.isValidPassword(password),
    );
  }

  Stream<RegisterState> _mapFormSubmittedToState(
    String email,
    String password,
    String name,
  ) async* {
    yield RegisterState.loading();
    try {
      await _userRepository.signUp(email, password, name);
      yield RegisterState.success();
    } on FirebaseAuthException catch (e) {
      String message;
      // email-already-in-use:
      // Thrown if there already exists an account with the given email address.
      // invalid-email:
      // Thrown if the email address is not valid.
      // operation-not-allowed:
      // Thrown if email/password accounts are not enabled. Enable email/password accounts in the Firebase Console, under the Auth tab.
      // weak-password:
      // Thrown if the password is not strong enough.
      switch (e.code) {
        case 'email-already-in-use':
          message = 'Email already in use !';
          break;
        case 'invalid-email':
          message = 'Email invalid !';
          break;
        case 'weak-password':
          message = 'Password too weak !';
          break;
        default:
          message = 'Register Failure';
      }
      yield RegisterState.failure(message);
    } catch (_) {
      yield RegisterState.failure('Register Failure');
    }
  }
}
