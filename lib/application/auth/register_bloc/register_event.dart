part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.fullNameChanged(String fullNameStr) =
      FullNameChanged;
  const factory RegisterEvent.emailChanged(String emailStr) = EmailChanged;
  const factory RegisterEvent.passwordChanged(String passwordStr) =
      PasswordChanged;
  const factory RegisterEvent.retypePasswordChanged(String retypePasswordStr) =
      RetypePasswordChanged;
  const factory RegisterEvent.registerPressed() = RegisterPressed;
}
