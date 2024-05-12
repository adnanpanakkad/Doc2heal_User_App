part of 'profile_bloc.dart';

abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

class GenderPickState extends ProfileState {
  String selectGender;
  GenderPickState({required this.selectGender});
}

class ImagePickState extends ProfileState {
  String selectedImage;
  ImagePickState({required this.selectedImage});
}
