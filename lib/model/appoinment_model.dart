class AppointmentModel {
  String? id;
  String? date;
  String? time;
  String? reason;
  String? uid;
  bool? status;
  String? docid;

  AppointmentModel({
    this.id,
    this.date,
    this.time,
    this.reason,
    this.uid,
    this.docid,
    this.status = false,
  });

  factory AppointmentModel.fromJson(String id, Map<String, dynamic> json) {
    return AppointmentModel(
      date: json['date'],
      time: json['time'],
      reason: json['reason'],
      id: id,
      uid: json['uid'],
      docid: json['docid'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'time': time,
      'reason': reason,
      'id': id,
      'uid': uid,
      'docid': docid,
      'status': status,
    };
  }
}
