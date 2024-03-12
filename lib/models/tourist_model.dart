class TouristModel {
  final String id;
  final String firstName;
  final String lastName;
  final String phone;
  final String address;
  final String type;
  final String email;
  final String password;
  final DateTime createdAt;
  final DateTime updatedAt;

  TouristModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.address,
    required this.type,
    required this.email,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TouristModel.fromJson(Map<String, dynamic> json) {
    return TouristModel(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phone: json['phone'],
      address: json['address'],
      type: json['type'],
      email: json['email'],
      password: json['password'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
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
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
