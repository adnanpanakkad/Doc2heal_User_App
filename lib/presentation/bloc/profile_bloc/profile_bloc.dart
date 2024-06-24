import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc2heal/services/firebase/firesbase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  ProfileBloc() : super(ProfileInitial()) {
    on<PicUserImgEvent>(picUserImgEvent);
    on<DatePickedEvent>(datePickEvent);
    on<TimeSlotSelectedEvent>(timeSlotSelectedEvent);
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

  FutureOr<void> datePickEvent(
      DatePickedEvent event, Emitter<ProfileState> emit) async {
    emit(DatePickedState(pickedDate: event.pickedDate));
  }

  FutureOr<void> timeSlotSelectedEvent(
      TimeSlotSelectedEvent event, Emitter<ProfileState> emit) async {
    emit(TimeSlotSelectedState(selectedTimeSlot: event.timeSlot));
  }
}
