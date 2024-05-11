part of 'profile_bloc.dart';

abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class GenderPickState extends ProfileState {
  String selectGender;
  GenderPickState({required this.selectGender});
}
