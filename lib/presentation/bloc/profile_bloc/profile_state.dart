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
