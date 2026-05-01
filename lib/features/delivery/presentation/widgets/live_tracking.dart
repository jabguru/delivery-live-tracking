import 'dart:math' as math;

import 'package:delivery_live_tracking/features/delivery/presentation/viewmodel/delivery_provider.dart';
import 'package:delivery_live_tracking/gen/assets.gen.dart';
import 'package:delivery_live_tracking/global/extensions/color_extension.dart';
import 'package:delivery_live_tracking/global/theme/colors.dart';
import 'package:delivery_live_tracking/global/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class LiveTracking extends ConsumerStatefulWidget {
  const LiveTracking({super.key, this.bottomOverlayHeight});

  /// Height (in logical pixels) of the bottom overlay that covers the map.
  /// When provided, the map camera is shifted upward so the tracked point stays
  /// in the visible area above the overlay.
  final double? bottomOverlayHeight;

  @override
  ConsumerState<LiveTracking> createState() => _LiveTrackingState();
}

class _LiveTrackingState extends ConsumerState<LiveTracking> {
  final MapController _mapController = MapController();

  static const double _defaultZoom = 15;

  /// How much extra breathing room we want between the tracked point and the sheet.
  static const double _extraTopSpacingPx = 16;

  LatLng _applyVerticalScreenOffsetToLatLng({
    required LatLng target,
    required double zoom,
  }) {
    final overlay = widget.bottomOverlayHeight;
    if (overlay == null || overlay <= 0) return target;

    // Shift the *visual* center upward by ~half the overlay height.
    // Negative dy means “move target up on screen”, which requires moving the
    // camera center downward in world space.
    final dy = (overlay / 2) + _extraTopSpacingPx;

    // Approximation (good enough for small offsets): convert pixels -> meters
    // at this zoom and latitude, then meters -> degrees.
    // This avoids relying on internal flutter_map projection APIs.
    final metersPerPixel =
        156543.03392 * math.cos(target.latitudeInRad) / math.pow(2.0, zoom);
    final metersToShift = dy * metersPerPixel;

    // Move camera center south by metersToShift (so target appears higher).
    final deltaLat = -(metersToShift / 111320.0);
    return LatLng(target.latitude + deltaLat, target.longitude);
  }

  void _moveCameraKeepingPointVisible(
    LatLng target, {
    double zoom = _defaultZoom,
  }) {
    final adjusted = _applyVerticalScreenOffsetToLatLng(
      target: target,
      zoom: zoom,
    );
    _mapController.move(adjusted, zoom);
  }

  @override
  void initState() {
    super.initState();

    // Initialize map to delivery location
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _moveCameraKeepingPointVisible(const LatLng(6.5244, 3.3792));
    });
  }

  @override
  Widget build(BuildContext context) {
    final deliveryAsync = ref.watch(deliveryProvider);
    final liveLocationAsync = ref.watch(liveLocationProvider);

    return deliveryAsync.when(
      loading: () {
        return FlutterMap(
          mapController: _mapController,
          options: const MapOptions(
            initialCenter: LatLng(6.5244, 3.3792),
            initialZoom: _defaultZoom,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.jabguru.livetracking',
            ),
            const Center(child: LoadingIndicator()),
          ],
        );
      },
      error: (error, stack) {
        return Center(child: Text('Error: $error'));
      },
      data: (delivery) {
        return FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: delivery.pickupLocation,
            initialZoom: _defaultZoom,
            onPositionChanged: (mapPosition, hasGesture) {
              // Handle map position changes
            },
          ),
          children: [
            // Base map layer
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.jabguru.livetracking',
            ),

            // Route polyline layer
            PolylineLayer(
              polylines: [
                Polyline(
                  points: delivery.routeWaypoints,
                  color: AppColors.orange2,
                  strokeWidth: 7.86,
                ),
              ],
            ),

            // Markers layer (destination and rider)
            MarkerLayer(
              markers: [
                // Destination marker
                Marker(
                  point: delivery.destinationLocation,
                  width: 40,
                  height: 40,
                  child: Assets.images.locationPin.svg(),
                ),

                // Rider marker with live location
                liveLocationAsync.when(
                  data: (location) {
                    final rider = LatLng(location.latitude, location.longitude);

                    // Smooth map camera follow
                    Future.microtask(() {
                      _moveCameraKeepingPointVisible(rider);
                    });

                    return Marker(
                      point: rider,
                      width: 40,
                      height: 40,
                      child: _RiderIcon(),
                    );
                  },
                  loading: () {
                    // Show loading marker at pickup location
                    return Marker(
                      point: delivery.pickupLocation,
                      width: 40,
                      height: 40,
                      child: _RiderIcon(),
                    );
                  },
                  error: (error, stack) {
                    return Marker(
                      point: delivery.pickupLocation,
                      width: 40,
                      height: 40,
                      child: _RiderIcon(),
                    );
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _RiderIcon extends StatelessWidget {
  const _RiderIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(spreadRadius: 9.07, color: AppColors.orange2.o(30)),
        ],
      ),
      height: 38.57,
      width: 38.57,
      child: CircleAvatar(
        radius: 16.0,
        backgroundColor: AppColors.orange2,
        child: Assets.images.bike.svg(),
      ),
    );
  }
}
