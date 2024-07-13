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

  Future<List<AppointmentModel>> getUpcomingAppointments(String userId) async {
    try {
      final querySnapshot = await appointment
          .where('uid', isEqualTo: userId)
          .where('status', isEqualTo: false)
          .get();
      List<AppointmentModel> expiredAppointments = [];
      for (var doc in querySnapshot.docs) {
        AppointmentModel appointment = doc.data();
        if (isAppointmentOngoing(appointment.date!, appointment.time!)) {
          expiredAppointments.add(appointment);
        }
      }

      return expiredAppointments;
    } catch (e) {
      log('Error fetching expired appointments: $e');
      rethrow;
    }
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
        .where('uid', isEqualTo: userId)
        .where('status', isEqualTo: true)
        .get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<List<AppointmentModel>> getAppointmentsByDoctorId(
      String doctorId) async {
    final querySnapshot =
        await appointment.where('docid', isEqualTo: doctorId).get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<void> updateAppointmentStatus(
      String appointmentId, bool? newValue) async {
    try {
      await appointment.doc(appointmentId).update({'status': newValue!});
      print("Appointment field updated successfully");
    } catch (e) {
      print("Error updating appointment field: $e");
    }
  }

  Future<List<AppointmentModel>> getExpiredAppointments(String? userId) async {
    try {
      final querySnapshot = await appointment
          .where('uid', isEqualTo: userId)
          .where('status', isEqualTo: false)
          .get();
      List<AppointmentModel> expiredAppointments = [];
      for (var doc in querySnapshot.docs) {
        AppointmentModel appointment = doc.data();
        if (isAppointmentCompleted(appointment.date!, appointment.time!)) {
          expiredAppointments.add(appointment);
        }
      }

      return expiredAppointments;
    } catch (e) {
      log('Error fetching expired appointments: $e');
      rethrow;
    }
  }

  bool isAppointmentCompleted(String appointmentDate, String appointmentTime) {
    // Split the time string into its components
    List<String> timeParts = appointmentTime.split(RegExp(r'[:\s]'));
    int appointmentHour = int.parse(timeParts[0]);
    int appointmentMinute = int.parse(timeParts[1]);
    bool isPM = timeParts[2].toUpperCase() == 'PM';

    // Adjust the hour for AM/PM
    if (isPM && appointmentHour != 12) {
      appointmentHour += 12;
    } else if (!isPM && appointmentHour == 12) {
      appointmentHour = 0;
    }
    // Split the date string into its components (MM/DD/YYYY)
    List<String> dateParts = appointmentDate.split('/');
    int month = int.parse(dateParts[0]);
    int day = int.parse(dateParts[1]);
    int year = int.parse(dateParts[2]);

    // Create a DateTime object for the appointment date and time
    DateTime appointmentDateTime =
        DateTime(year, month, day, appointmentHour, appointmentMinute);

    // Compare the appointment date and time with the current date and time
    DateTime now = DateTime.now();
    return appointmentDateTime.isBefore(now);
  }

  bool isAppointmentOngoing(String appointmentDate, String appointmentTime) {
    // Split the time string into its components
    List<String> timeParts = appointmentTime.split(RegExp(r'[:\s]'));
    int appointmentHour = int.parse(timeParts[0]);
    int appointmentMinute = int.parse(timeParts[1]);
    bool isPM = timeParts[2].toUpperCase() == 'PM';

    // Adjust the hour for AM/PM
    if (isPM && appointmentHour != 12) {
      appointmentHour += 12;
    } else if (!isPM && appointmentHour == 12) {
      appointmentHour = 0;
    }
    // Split the date string into its components (MM/DD/YYYY)
    List<String> dateParts = appointmentDate.split('/');
    int month = int.parse(dateParts[0]);
    int day = int.parse(dateParts[1]);
    int year = int.parse(dateParts[2]);

    // Create a DateTime object for the appointment date and time
    DateTime appointmentDateTime =
        DateTime(year, month, day, appointmentHour, appointmentMinute);

    // Compare the appointment date and time with the current date and time
    DateTime now = DateTime.now();
    return appointmentDateTime.isAfter(now);
  }
}
