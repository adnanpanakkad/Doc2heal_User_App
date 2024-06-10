part of 'profile_bloc.dart';

abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class SucessfullyPicimageEvent extends ProfileState {
  final String profilepath;
  SucessfullyPicimageEvent({required this.profilepath});
}

