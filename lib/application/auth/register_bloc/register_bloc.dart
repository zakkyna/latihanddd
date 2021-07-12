import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:latihanddd/domain/auth/auth_failure.dart';
import 'package:latihanddd/domain/auth/i_auth_facade.dart';
import 'package:latihanddd/domain/auth/value_objects.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final IAuthFacade _authFacade;

  RegisterBloc(this._authFacade) : super(RegisterState.initial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    yield* event.map(
      fullNameChanged: (e) async* {
        yield state.copyWith(
          fullName: FullName(e.fullNameStr),
          authFailureOrSuccessOption: none(),
        );
      },
      emailChanged: (e) async* {
        yield state.copyWith(
          emailAddress: EmailAddress(e.emailStr),
          authFailureOrSuccessOption: none(),
        );
      },
      passwordChanged: (e) async* {
        yield state.copyWith(
          password: Password(e.passwordStr),
          authFailureOrSuccessOption: none(),
        );
      },
      retypePasswordChanged: (e) async* {
        final passwordStr = state.password.getOrCrash();
        yield state.copyWith(
          retypePassword: RetypePassword(e.retypePasswordStr, passwordStr),
          authFailureOrSuccessOption: none(),
        );
      },
      registerPressed: (e) async* {
        yield* _performActionOnAuthFacadeWithEmailAndPassword(
          _authFacade.registerWithEmailAndPassword,
        );
      },
    );
  }

  Stream<RegisterState> _performActionOnAuthFacadeWithEmailAndPassword(
    Future<Either<AuthFailure, Unit>> Function({
      required FullName fullName,
      required EmailAddress emailAddress,
      required Password password,
    })
        forwardedCall,
  ) async* {
    Either<AuthFailure, Unit>? failureOrSuccess;
    final isFullNameValid = state.fullName.isValid();
    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    final isRetypePasswordValid = state.retypePassword.isValid();
    if (isFullNameValid &&
        isEmailValid &&
        isPasswordValid &&
        isRetypePasswordValid) {
      yield state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      );

      failureOrSuccess = await forwardedCall(
        fullName: state.fullName,
        emailAddress: state.emailAddress,
        password: state.password,
      );
    }

    yield state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    );
  }
}
