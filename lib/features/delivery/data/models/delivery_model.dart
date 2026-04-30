import 'package:delivery_live_tracking/features/delivery/domain/entities/delivery_entity.dart';
import 'package:latlong2/latlong.dart';

class DeliveryModel extends DeliveryEntity {
  DeliveryModel({
    required super.orderId,
    required super.courierName,
    required super.courierImage,
    required super.deliveryStatus,
    required super.etaMinutes,
    required super.pickupLocation,
    required super.destinationLocation,
    required super.routeWaypoints,
    required super.createdAt,
  });

  factory DeliveryModel.fromJson(Map<String, dynamic> json) {
    return DeliveryModel(
      orderId: json['orderId'] ?? '',
      courierName: json['courierName'] ?? '',
      courierImage: json['courierImage'] ?? '',
      deliveryStatus: json['deliveryStatus'] ?? 'on_delivery',
      etaMinutes: json['etaMinutes'] ?? 25,
      pickupLocation: LatLng(
        json['pickupLatitude'] ?? 6.5244,
        json['pickupLongitude'] ?? 3.3792,
      ),
      destinationLocation: LatLng(
        json['destLatitude'] ?? 6.5400,
        json['destLongitude'] ?? 3.3600,
      ),
      routeWaypoints:
          (json['routeWaypoints'] as List?)
              ?.map<LatLng>((point) => LatLng(point['lat'], point['lng']))
              .toList() ??
          [],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'courierName': courierName,
      'courierImage': courierImage,
      'deliveryStatus': deliveryStatus,
      'etaMinutes': etaMinutes,
      'pickupLatitude': pickupLocation.latitude,
      'pickupLongitude': pickupLocation.longitude,
      'destLatitude': destinationLocation.latitude,
      'destLongitude': destinationLocation.longitude,
      'routeWaypoints': routeWaypoints
          .map((p) => {'lat': p.latitude, 'lng': p.longitude})
          .toList(),
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
