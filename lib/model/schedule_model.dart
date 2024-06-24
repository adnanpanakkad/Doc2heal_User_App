class ScheduleModel {
  String docImg;
  String name;
  String specialization;
  String date;
  String time;
  String reason;

  ScheduleModel({
    required this.docImg,
    required this.name,
    required this.specialization,
    required this.date,
    required this.time,
    required this.reason,
  });

  factory ScheduleModel.fromMap(Map<String, dynamic> map) {
    return ScheduleModel(
      docImg: map['docImg'],
      name: map['name'],
      specialization: map['specialization'],
      date: map['date'],
      time: map['time'],
      reason: map['reason'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'docImg': docImg,
      'name': name,
      'specialization': specialization,
      'date': date,
      'time': time,
      'reason': reason,
    };
  }
}
