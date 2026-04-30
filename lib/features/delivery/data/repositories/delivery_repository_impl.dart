import 'package:delivery_live_tracking/features/delivery/data/models/delivery_model.dart';
import 'package:delivery_live_tracking/features/delivery/data/models/location_model.dart';
import 'package:delivery_live_tracking/features/delivery/domain/entities/delivery_entity.dart';
import 'package:delivery_live_tracking/features/delivery/domain/entities/location_entity.dart';
import 'package:delivery_live_tracking/features/delivery/domain/repositories/delivery_repository.dart';
import 'package:latlong2/latlong.dart';

class DeliveryRepositoryImpl implements DeliveryRepository {
  // Mock delivery data
  static const Duration _updateInterval = Duration(milliseconds: 500);
  static const Duration _waypointDuration = Duration(seconds: 3);

  @override
  Future<DeliveryEntity> getDelivery(String orderId) async {
    // Simulate API call delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Mock delivery data with route waypoints
    final pickupLocation = const LatLng(6.5244, 3.3792); // Pickup
    final destinationLocation = const LatLng(6.5400, 3.3600); // Destination

    // Create a simulated route with waypoints
    final routeWaypoints = _generateRouteWaypoints(
      pickupLocation,
      destinationLocation,
    );

    return DeliveryModel(
      orderId: 'ORD-682834513',
      courierName: 'Presley Williams',
      courierImage: 'assets/images/presley.png',
      deliveryStatus: 'on_delivery',
      etaMinutes: 25,
      pickupLocation: pickupLocation,
      destinationLocation: destinationLocation,
      routeWaypoints: routeWaypoints,
      createdAt: DateTime.now(),
    );
  }

  @override
  Stream<LocationEntity> watchLiveLocation(String orderId) async* {
    final delivery = await getDelivery(orderId);
    final waypoints = delivery.routeWaypoints;

    if (waypoints.isEmpty) {
      yield LocationModel(
        latitude: delivery.pickupLocation.latitude,
        longitude: delivery.pickupLocation.longitude,
        timestamp: DateTime.now(),
      );
      return;
    }

    int currentWaypointIndex = 0;
    DateTime lastUpdateTime = DateTime.now();

    while (true) {
      final now = DateTime.now();
      final elapsedTime = now.difference(lastUpdateTime);

      // Calculate progress between current and next waypoint
      if (currentWaypointIndex < waypoints.length - 1) {
        final currentPoint = waypoints[currentWaypointIndex];
        final nextPoint = waypoints[currentWaypointIndex + 1];

        // Progress as a fraction (0.0 to 1.0) with smooth easing
        double progress =
            elapsedTime.inMilliseconds / _waypointDuration.inMilliseconds;

        // Apply ease-out curve for smoother motion
        progress = _easeOutCubic(progress.clamp(0.0, 1.0));

        // Interpolate between waypoints
        final interpolatedLat =
            currentPoint.latitude +
            (nextPoint.latitude - currentPoint.latitude) * progress;
        final interpolatedLng =
            currentPoint.longitude +
            (nextPoint.longitude - currentPoint.longitude) * progress;

        yield LocationModel(
          latitude: interpolatedLat,
          longitude: interpolatedLng,
          timestamp: now,
        );

        // Move to next waypoint when progress completes
        if (progress >= 1.0) {
          currentWaypointIndex++;
          lastUpdateTime = now;
        }
      } else {
        // Stay at destination
        yield LocationModel(
          latitude: waypoints.last.latitude,
          longitude: waypoints.last.longitude,
          timestamp: now,
        );
      }

      await Future.delayed(_updateInterval);
    }
  }

  /// Generate route waypoints between pickup and destination
  List<LatLng> _generateRouteWaypoints(LatLng start, LatLng end) {
    final waypoints = <LatLng>[start];

    // Add intermediate points for a realistic route
    // This simulates a delivery route with several turns
    final midLatitude = start.latitude + (end.latitude - start.latitude) * 0.5;
    final midLongitude =
        start.longitude + (end.longitude - start.longitude) * 0.5;

    waypoints.add(LatLng(start.latitude, midLongitude));
    waypoints.add(LatLng(midLatitude, midLongitude));
    waypoints.add(LatLng(midLatitude, end.longitude));
    waypoints.add(end);

    return waypoints;
  }

  /// Ease-out cubic easing function for smooth animation
  /// Returns a value between 0 and 1 with smooth acceleration out
  double _easeOutCubic(double t) {
    return 1.0 - pow(1.0 - t, 3.0);
  }

  /// Helper for pow operation
  double pow(double base, double exp) {
    return base * base * base;
  }
}
