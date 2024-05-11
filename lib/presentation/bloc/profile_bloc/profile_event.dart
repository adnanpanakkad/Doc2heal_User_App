part of 'profile_bloc.dart';

class ProfileEvent {}

class GenderPickEvent extends ProfileEvent {
  String selectGender;
  GenderPickEvent({required this.selectGender});
}
