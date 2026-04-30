import 'package:latlong2/latlong.dart';

class LocationEntity {
  final double latitude;
  final double longitude;
  final DateTime timestamp;

  LocationEntity({
    required this.latitude,
    required this.longitude,
    required this.timestamp,
  });

  LatLng toLatLng() => LatLng(latitude, longitude);

  @override
  String toString() => 'LocationEntity(lat: $latitude, lng: $longitude)';
}
