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

class AddUserData extends ProfileEvent {
  final Map<String, dynamic> data;

  AddUserData(this.data);
}
