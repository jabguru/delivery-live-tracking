import 'package:latlong2/latlong.dart';

class DeliveryEntity {
  final String orderId;
  final String courierName;
  final String courierImage;
  final String deliveryStatus; // 'on_delivery', 'arrived', etc.
  final int etaMinutes;
  final LatLng pickupLocation;
  final LatLng destinationLocation;
  final List<LatLng> routeWaypoints; // Full route from pickup to destination
  final DateTime createdAt;

  DeliveryEntity({
    required this.orderId,
    required this.courierName,
    required this.courierImage,
    required this.deliveryStatus,
    required this.etaMinutes,
    required this.pickupLocation,
    required this.destinationLocation,
    required this.routeWaypoints,
    required this.createdAt,
  });

  // Copy with method for immutability
  DeliveryEntity copyWith({
    String? orderId,
    String? courierName,
    String? courierImage,
    String? deliveryStatus,
    int? etaMinutes,
    LatLng? pickupLocation,
    LatLng? destinationLocation,
    List<LatLng>? routeWaypoints,
    DateTime? createdAt,
  }) {
    return DeliveryEntity(
      orderId: orderId ?? this.orderId,
      courierName: courierName ?? this.courierName,
      courierImage: courierImage ?? this.courierImage,
      deliveryStatus: deliveryStatus ?? this.deliveryStatus,
      etaMinutes: etaMinutes ?? this.etaMinutes,
      pickupLocation: pickupLocation ?? this.pickupLocation,
      destinationLocation: destinationLocation ?? this.destinationLocation,
      routeWaypoints: routeWaypoints ?? this.routeWaypoints,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
