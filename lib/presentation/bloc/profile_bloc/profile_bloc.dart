import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc2heal/services/firebase/firestore.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  ProfileBloc() : super(ProfileInitial()) {
    on<PicUserImgEvent>(picUserImgEvent);
  }

  FutureOr<void> picUserImgEvent(
      PicUserImgEvent event, Emitter<ProfileState> emit) async {
    String url = await UserRepository().getImageUrl(File(event.profilepath));
    if (url.isNotEmpty) {
      emit(SucessfullyPicimageEvent(profilepath: url));
    }
  }
}