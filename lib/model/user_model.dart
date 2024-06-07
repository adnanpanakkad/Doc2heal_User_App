class UserModel {
  String? profilepath;
  final String name;
  final String phone;
  final String gender;
  final String age;
  final String email;
  final String password;
  final String id;

  UserModel({
    required this.profilepath,
    required this.name,
    required this.phone,
    required this.gender,
    required this.age,
    required this.email,
    required this.password,
    required this.id,
  });

  // Factory constructor to create UserModel from JSON data
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      profilepath: json['imagepath'],
      name: json['name'],
      phone: json['phone'],
      gender: json['gender'],
      age: json['age'],
      email: json['email'],
      password: json['password'],
      id: json['id'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'imagepath': profilepath,
      'name': name,
      'phone': phone,
      'gender': gender,
      'age': age,
      'email': email,
      'password': password,
      'id': id,
    };
  }
}
