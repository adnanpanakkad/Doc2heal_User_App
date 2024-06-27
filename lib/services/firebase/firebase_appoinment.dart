import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc2heal/model/appoinment_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppoinmentServices {
  String appointments = "appointment";
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late CollectionReference<AppointmentModel> appointment;
  List<AppointmentModel> allAppointmentList = [];
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  AppoinmentServices() {
    appointment = firebaseFirestore
        .collection(appointments)
        .withConverter<AppointmentModel>(fromFirestore: (snapshot, options) {
      return AppointmentModel.fromJson(snapshot.id, snapshot.data()!);
    }, toFirestore: (value, options) {
      return value.toJson();
    });
  }

  Future<List<AppointmentModel>> getUserAppointments(String userId) async {
    final querySnapshot =
        await appointment.where('uid', isEqualTo: userId).get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<void> addAppointment(AppointmentModel data) async {
    try {
      DocumentReference docRef = await appointment.add(data);
      data.id = docRef.id;
      await docRef.set(data);
    } catch (error) {
      log('Error during adding appointment: $error');
      rethrow;
    }
  }

  Future<void> deleteAppointment(String id) async {
    try {
      await appointment.doc(id).delete();
    } catch (error) {
      log('error during deleting appointment :$error');
    }
  }

  Future<void> allapoinments() async {
    allAppointmentList = await getAllAppointments();
    if (allAppointmentList.isEmpty) {
      log('empty');
    } else {
      log('not empty');
    }
  }

  Future<List<AppointmentModel>> getAllAppointments() async {
    final snapshot = await appointment.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<void> updateAppointment(String id, AppointmentModel data) async {
    try {
      await appointment.doc(id).update(
            data.toJson(),
          );
    } catch (e) {
      log("error in updating appointment : $e");
    }
  }

  Future<List<AppointmentModel>> getCanceledAppointments(String userId) async {
    final querySnapshot = await appointment
        .where('userId', isEqualTo: userId)
        .where('status', isEqualTo: 'canceled')
        .get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }
}
