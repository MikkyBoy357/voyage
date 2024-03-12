class DestinationModel {
  final String id;
  final String title;
  final String description;
  final String location;
  final List<DestinationAgencyModel> agencies;

  DestinationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.agencies,
  });

  factory DestinationModel.fromJson(Map<String, dynamic> json) {
    var agencyList = json['agencies'] as List;
    List<DestinationAgencyModel> agencies = agencyList
        .map((agency) => DestinationAgencyModel.fromJson(agency))
        .toList();
    return DestinationModel(
      id: json['_id'],
      title: json['title'],
      description: json['Description'],
      location: json['location'],
      agencies: agencies,
    );
  }
}

class DestinationAgencyModel {
  final String name;
  final String address;
  final String description;

  DestinationAgencyModel({
    required this.name,
    required this.address,
    required this.description,
  });

  factory DestinationAgencyModel.fromJson(Map<String, dynamic> json) {
    return DestinationAgencyModel(
      name: json['name'],
      address: json['address'],
      description: json['description'],
    );
  }
}
