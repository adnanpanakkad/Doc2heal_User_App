part of 'auth_bloc_bloc.dart';

@immutable
sealed class AuthBlocState {}

final class AuthBlocInitial extends AuthBlocState {}

class Authloading extends AuthBlocState {}

// ignore: must_be_immutable
class Authenticated extends AuthBlocState {
  String user;
  Authenticated(this.user);

  get usermodel => null;
}

class AuthenticateError extends AuthBlocState {
  final String messege;
  AuthenticateError(this.messege);
}

class UnAuthenticated extends AuthBlocState {}
