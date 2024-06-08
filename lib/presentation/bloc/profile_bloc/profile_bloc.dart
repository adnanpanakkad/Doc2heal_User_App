import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc2heal/services/firebase/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String collectionid = '';

  ProfileBloc() : super(ProfileInitial()) {
    on<GenderPickEvent>(genderPickEvent);
    on<PicUserImgEvent>(picUserImgEvent);
  }

  FutureOr<void> genderPickEvent(
      GenderPickEvent event, Emitter<ProfileState> emit) {
    emit(GenderPickState(selectGender: event.selectGender));
  }

  FutureOr<void> picUserImgEvent(
      PicUserImgEvent event, Emitter<ProfileState> emit) async {
    String url = await UserRepository().getImageUrl(File(event.profilepath));
    if (url.isNotEmpty) {
      emit(SucessfullyPicimageEvent(profilepath: url));
    }
  }

  Future<String> getuserId() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw FirebaseAuthException(
        code: 'user-not-authenticated',
        message: 'User not authenticated',
      );
    }
    return user.uid;
  }

  Future<void> addUserData(
      Map<String, dynamic> data, Emitter<ProfileState> emit) async {
    try {
      emit(Userdataloading());
      final String userId = await getuserId();
      final reference =
          firestore.collection('user').doc(userId).collection('userdata');
      final docRef = await reference.add(data);
      collectionid = docRef.id;
      emit(UserDataAdded(id: docRef.id));
    } catch (e) {
      log('Firebase error: ${e.toString()}');
      emit(UserDataError(error: e.toString()));
    }
  }
}