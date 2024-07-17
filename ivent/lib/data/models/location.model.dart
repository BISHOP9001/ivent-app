class Location {
  final int id;
  final String address;
  final String city;
  final String country;
  final String coordinates;

  Location({
    required this.id,
    required this.address,
    required this.city,
    required this.country,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      address: json['address'],
      city: json['city'],
      country: json['country'],
      coordinates: json['coordinates'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'address': address,
      'city': city,
      'country': country,
      'coordinates': coordinates,
    };
  }
}
