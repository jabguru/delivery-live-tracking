import 'package:delivery_live_tracking/features/delivery/domain/entities/location_entity.dart';

class LocationModel extends LocationEntity {
  LocationModel({
    required super.latitude,
    required super.longitude,
    required super.timestamp,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      latitude: json['latitude'] ?? 0.0,
      longitude: json['longitude'] ?? 0.0,
      timestamp: json['timestamp'] != null
          ? DateTime.parse(json['timestamp'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
