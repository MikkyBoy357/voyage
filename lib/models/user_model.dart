class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String phone;
  final String address;
  final String type;
  final String email;
  final String password;
  final List<String> permissions;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.address,
    required this.type,
    required this.email,
    required this.password,
    required this.permissions,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phone: json['phone'],
      address: json['address'],
      type: json['type'],
      email: json['email'],
      password: json['password'],
      permissions: List<String>.from(json['permissions']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'address': address,
      'type': type,
      'email': email,
      'password': password,
      'permissions': permissions,
    };
  }
}
