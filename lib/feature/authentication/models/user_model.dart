class UserModel {
  final String id;
  final String name;
  final String email;
  final String password;
  final List<String> favList;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.favList,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'favList': favList,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      favList: List<String>.from(map['favList'] ?? []),
    );
  }
}
