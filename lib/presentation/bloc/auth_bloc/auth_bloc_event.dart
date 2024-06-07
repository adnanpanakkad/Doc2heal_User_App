part of 'auth_bloc_bloc.dart';

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
class singupevent extends AuthBlocEvent {
  final UserModel usermodel;
  singupevent(UserModel user, {required this.usermodel});
}

// Logout event
class logoutevent extends AuthBlocEvent {}
