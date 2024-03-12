class AgencyModel {
  final String id;
  final String firstName;
  final String lastName;
  final String phone;
  final String address;
  final String type;
  final String email;
  final String password;
  final String status;
  final String description;
  final String logo;

  AgencyModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.address,
    required this.type,
    required this.email,
    required this.password,
    required this.status,
    required this.description,
    required this.logo,
  });

  factory AgencyModel.fromJson(Map<String, dynamic> json) {
    return AgencyModel(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phone: json['phone'],
      address: json['address'],
      type: json['type'],
      email: json['email'],
      password: json['password'],
      status: json['status'],
      description: json['description'],
      logo: json['logo'],
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
      'status': status,
      'description': description,
      'logo': logo,
    };
  }
}
