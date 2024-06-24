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
class TimeSlotSelectedEvent extends ProfileEvent {
  final String timeSlot;

  TimeSlotSelectedEvent({required this.timeSlot});
}