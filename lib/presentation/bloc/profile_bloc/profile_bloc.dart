import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:doc2heal/services/firebase/firestore.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
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
  Future<void> fecthUserData()async {
           
  }
}
