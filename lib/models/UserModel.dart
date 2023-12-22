class UserModel {
  final int id;
  final String name;
  String? email;
  String? password;
  String? authToken;

  UserModel({
    required this.id,
    required this.name,
    this.email,
    this.password,
    this.authToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
