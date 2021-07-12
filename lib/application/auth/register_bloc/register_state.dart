part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    required FullName fullName,
    required EmailAddress emailAddress,
    required Password password,
    required RetypePassword retypePassword,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _RegisterState;

  factory RegisterState.initial() => RegisterState(
        fullName: FullName(''),
        emailAddress: EmailAddress(''),
        password: Password(''),
        retypePassword: RetypePassword('', ''),
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}
