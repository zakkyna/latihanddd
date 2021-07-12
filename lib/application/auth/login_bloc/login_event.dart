part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.emailChanged(String emailStr) = _EmailChanged;
  const factory LoginEvent.passwordChanged(String passwordStr) =
      _PasswordChanged;
  const factory LoginEvent.toggleShowPasswordPressed() =
      _ToggleShowPasswordPressed;
  const factory LoginEvent.loginPressed() = _LoginPressed;
  const factory LoginEvent.signInWithGooglePressed() = _SignInWithGooglePressed;
}
