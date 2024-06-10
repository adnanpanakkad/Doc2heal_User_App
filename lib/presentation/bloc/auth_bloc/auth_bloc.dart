import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc2heal/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

String authuserId = '';
Future<String> getUserId() async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    throw FirebaseAuthException(
      code: 'user-not-authenticated',
      message: 'User not authenticated',
    );
  }
  return user.uid;
}

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  AuthBloc() : super(AuthBlocInitial()) {
    on<Checklogin>((event, emit) async {
      User? user;
      try {
        await Future.delayed(const Duration(seconds: 3));
        user = _auth.currentUser;
        if (user != null) {
          emit(Authenticated(user.uid));
        } else {
          emit(UnAuthenticated());
        }
      } catch (e) {
        emit(AuthenticateError(e.toString()));
      }
    });
    on<Logoutevent>((event, emit) async {
      try {
        await FirebaseAuth.instance.signOut();
        emit(UnAuthenticated());
      } catch (e) {
        emit(AuthenticateError(e.toString()));
      }
    });

    on<Loginevent>((event, emit) async {
      emit(Authloading());
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        final User? user = userCredential.user;
        if (user != null) {
          emit(Authenticated(user.uid));
        } else {
          emit(UnAuthenticated());
        }
      } catch (e) {
        emit(AuthenticateError(e.toString()));
      }
    });

    on<Singupevent>((event, emit) async {
      emit(Authloading());
      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: event.usermodel.email.toString(),
          password: event.usermodel.password.toString(),
        );
        final User? user = userCredential.user;
        if (user != null) {
          authuserId = user.uid;
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .set({
            'coverimag': event.usermodel.coverimag,
            'name': event.usermodel.name,
            'phone': event.usermodel.phone,
            'gender': event.usermodel.gender,
            'age': event.usermodel.age,
            'email': event.usermodel.email,
            'password': event.usermodel.password,
            'id': user.uid,
          });
        }
        emit(Authenticated(userCredential.user!.uid));
      } catch (e) {
        emit(AuthenticateError(e.toString()));
      }
    });

    on<FetchUserEvent>((event, emit) async {
      emit(Userdataloading());

      try {
        final String userId = await getUserId();

        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(userId).get();
        if (userDoc.exists) {
          emit(UserFetched(userDoc as Map<String, dynamic>));
        } else {
          emit(AuthenticateError('User not found'));
        }
      } catch (e) {
        emit(AuthenticateError(e.toString()));
      }
    });
  }
}
