part of 'auth_bloc.dart';

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

class UserFetched extends AuthBlocState {
  final Map<String, dynamic> userData;
  UserFetched(this.userData);
}
class Userdataloading extends AuthBlocState {}

