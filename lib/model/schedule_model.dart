class ScheduleModel {
  String docImg;
  String name;
  String specialization;
  String date;
  String time;

  ScheduleModel({
    required this.name,
    required this.specialization,
    required this.date,
    required this.time,
    required this.docImg,
  });

  factory ScheduleModel.fromMap(Map<String, dynamic> map) {
    return ScheduleModel(
      name: map['name'],
      specialization: map['specialization'],
      date: map['date'],
      time: map['time'],
      docImg: map['docImg'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'specialization': specialization,
      'date': date,
      'time': time,
      'docImg': docImg,
    };
  }
}
