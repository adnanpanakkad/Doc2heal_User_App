import 'package:doc2heal/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DatePickerFun {
  List<String> items = ['None', 'Male', 'Female'];
  String selectGender = 'None';
  DateTime selectedDate = DateTime.now();

  getTimeFromUser(BuildContext context) async {
    final DateTime? pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(), // Start date is today
        lastDate: DateTime(2123));

    if (pickerDate != null) {
      selectedDate = pickerDate;
      context.read<ProfileBloc>().add(
          DatePickedEvent(pickedDate: DateFormat.yMd().format(selectedDate)));
    }
  }
}
