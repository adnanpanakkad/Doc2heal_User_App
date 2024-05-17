part of 'profile_bloc.dart';

class ProfileEvent {}

class GenderPickEvent extends ProfileEvent {
  String selectGender;
  GenderPickEvent({required this.selectGender});
}

class PicUserImgEvent extends ProfileEvent {
  String profilepath;
  PicUserImgEvent({required this.profilepath});
}
