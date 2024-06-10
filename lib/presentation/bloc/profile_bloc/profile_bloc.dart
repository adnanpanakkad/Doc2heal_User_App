import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc2heal/services/firebase/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  ProfileBloc() : super(ProfileInitial()) {
    on<PicUserImgEvent>(picUserImgEvent);
  }
  Future getUserId() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw FirebaseAuthException(
        code: 'user-not-authenticated',
        message: 'User not authenticated',
      );
    }
    return user.uid;
  }

  FutureOr<void> picUserImgEvent(
      PicUserImgEvent event, Emitter<ProfileState> emit) async {
    String url = await UserRepository().getImageUrl(File(event.profilepath));
    if (url.isNotEmpty) {
      emit(SucessfullyPicimageEvent(profilepath: url));
    }
  }
}
