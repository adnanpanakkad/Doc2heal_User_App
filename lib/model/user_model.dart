class UserModel {
  String? profilepath;
  final String name;
  final String phone;
  final String gender;
  final String age;
  final String address;
  final String place;
  final bool isUser;

  UserModel({
    required this.profilepath,
    required this.name,
    required this.phone,
    required this.gender,
    required this.age,
    required this.address,
    required this.place,
    required this.isUser,
  });

  // Factory constructor to create UserModel from JSON data
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      profilepath: json['imagepath'],
      name: json['name'],
      phone: json['phone'],
      gender: json['gender'],
      age: json['age'],
      address: json['address'],
      place: json['place'],
      isUser: json['isUser'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'imagepath': profilepath,
      'name': name,
      'phone': phone,
      'gender': gender,
      'age': age,
      'address': address,
      'place': place,
      'isUser': isUser,
    };
  }
}
