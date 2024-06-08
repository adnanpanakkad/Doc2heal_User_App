part of 'auth_bloc.dart';

@immutable
sealed class AuthBlocEvent {}

class Checklogin extends AuthBlocEvent {}

// Login event
class Loginevent extends AuthBlocEvent {
  final String email;
  final String password;
  Loginevent({required this.email, required this.password});
}

// Sign up event
class Singupevent extends AuthBlocEvent {
  final UserModel usermodel;
  Singupevent(UserModel user, {required this.usermodel});
}

// Logout event
class Logoutevent extends AuthBlocEvent {}
