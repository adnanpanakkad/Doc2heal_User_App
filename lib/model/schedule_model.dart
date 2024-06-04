class ScheduleModel {
  String name;
  String specialization;
  DateTime date;
  DateTime time;
  

  ScheduleModel({
    required this.name,
    required this.specialization,
    required this.date,
    required this.time,
  });

  factory ScheduleModel.fromMap(Map<String, dynamic> map) {
    return ScheduleModel(
      name: map['name'],
      specialization: map['specialization'],
      date: DateTime.parse(map['date']),
      time: DateTime.parse(map['time']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'specialization': specialization,
      'date': date.toIso8601String(),
      'Time': date.toIso8601String(),
    };
  }
}
