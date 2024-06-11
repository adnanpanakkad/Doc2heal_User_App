part of 'profile_bloc.dart';

abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class SucessfullyPicimageEvent extends ProfileState {
  final String profilepath;
  SucessfullyPicimageEvent({required this.profilepath});
}


final class DatePickedState extends ProfileState {
  final String pickedDate;
  DatePickedState({required this.pickedDate});
}