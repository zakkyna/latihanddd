part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends AppState {}

class Authenticated extends AppState {
  final User user;

  const Authenticated(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'Authenticated { displayName: ${user.displayName} }';
}

class Unauthenticated extends AppState {}

class FirstTimeInstall extends AppState {}
