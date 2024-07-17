import 'package:google_maps_flutter/google_maps_flutter.dart';

class Address {
  final int? id;
  final String? name;
  final double? lat;
  final double? lng;

  int locationId;

  LatLng? busPosition;

  LatLng get position => LatLng(lat ?? 0.0, lng ?? 0.0);

  Address({
    this.id = 0,
    required this.name,
    this.lat = 0,
    this.lng = 0,
    this.locationId = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "lat": lat,
      "lng": lng,
      "location_id": locationId,
    };
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      name: json['name'] ?? "",
      lat: double.parse(json['lat'] ?? "0"),
      lng: double.parse(json['lng'] ?? "0"),
      locationId: json['location_id'] ?? 0,
    );
  }
}
