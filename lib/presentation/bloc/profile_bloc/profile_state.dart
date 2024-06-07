part of 'profile_bloc.dart';

abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

class GenderPickState extends ProfileState {
  String selectGender;
  GenderPickState({required this.selectGender});
}

final class SucessfullyPicimageEvent extends ProfileState {
  final String profilepath;
  SucessfullyPicimageEvent({required this.profilepath});
}

class Userdataloading extends ProfileState {}

class UserDataAdded extends ProfileState {
  String id;
  UserDataAdded({required this.id});
}

class UserDataError extends ProfileState {
  final String error;

  UserDataError({required this.error});
}
