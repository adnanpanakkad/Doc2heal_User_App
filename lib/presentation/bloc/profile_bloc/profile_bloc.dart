import 'dart:async';
import 'package:bloc/bloc.dart';

part  'profile_event.dart';
part  'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GenderPickEvent>(genderPickEvent);
  }

  FutureOr<void> genderPickEvent(
      GenderPickEvent event, Emitter<ProfileState> emit) {
    emit(GenderPickState(selectGender: event.selectGender));
  }
  
}
