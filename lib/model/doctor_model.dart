import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorsModel {
  final String? doctorimg;
  final String? expcerft;
  final String? name;
  final String? phone;
  final String? gender;
  final String? birthday;
  final String? specialization;
  final String? email;
  final String? password;
  final String? fees;
  final String? starttime;
  final String? endtime;
  final String? uid;

  DoctorsModel({
    required this.doctorimg,
    this.expcerft,
    required this.name,
    required this.phone,
    required this.gender,
    required this.birthday,
    required this.specialization,
    required this.email,
    required this.password,
    required this.fees,
    this.starttime,
    this.endtime,
    this.uid,
  });

  // Factory constructor to create UserModel from JSON data

  factory DoctorsModel.fromSnapshot(DocumentSnapshot<Object?> snapshot) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

    return DoctorsModel(
      doctorimg: data?['doctorimg'] ?? '',
      expcerft: data?['expcerft'] ?? '',
      name: data?['name'] ?? '',
      phone: data?['phone'] ?? '',
      gender: data?['gender'] ?? '',
      birthday: data?['birthday'] ?? '',
      specialization: data?['specialization'] ?? '',
      email: data?['email'] ?? '',
      password: data?['password'] ?? '',
      fees: data?['fees'] ?? '',
      starttime: data?['starttime'] ?? '',
      endtime: data?['endtime'] ?? '',
      uid: data?['uid'] ?? '',
    );
  }

  factory DoctorsModel.emptyDoctorModel() {
    return DoctorsModel(
      doctorimg: '',
      name: '',
      phone: '',
      gender: '',
      birthday: '',
      specialization: '',
      email: '',
      password: '',
      fees: '',
      starttime: '',
      endtime: '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'doctorimg': doctorimg,
      'expcerft': expcerft,
      'name': name,
      'phone': phone,
      'gender': gender,
      'birthday': birthday,
      'specialization': specialization,
      'email': email,
      'password': password,
      'fees': fees,
      'starttime': starttime,
      'endtime': endtime,
      'uid': uid,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'doctorimg': doctorimg,
      'expcerft': expcerft,
      'name': name,
      'phone': phone,
      'gender': gender,
      'birthday': birthday,
      'specialization': specialization,
      'email': email,
      'password': password,
      'fees': fees,
      'starttime': starttime,
      'endtime': endtime,
      'uid': uid,
    };
  }
}
