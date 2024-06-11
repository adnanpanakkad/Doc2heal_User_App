part of 'profile_bloc.dart';

class ProfileEvent {}

class PicUserImgEvent extends ProfileEvent {
  String profilepath;
  PicUserImgEvent({required this.profilepath});
}

class DatePickedEvent extends ProfileEvent {
  String pickedDate;
  DatePickedEvent({required this.pickedDate});
}