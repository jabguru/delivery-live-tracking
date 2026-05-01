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
  const LiveTracking({super.key});

  @override
  ConsumerState<LiveTracking> createState() => _LiveTrackingState();
}

class _LiveTrackingState extends ConsumerState<LiveTracking> {
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
    // Initialize map to delivery location
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _mapController.move(const LatLng(6.5244, 3.3792), 15);
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
            initialZoom: 15,
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
            initialZoom: 15,
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
                    // Smooth map camera follow
                    Future.microtask(() {
                      _mapController.move(
                        LatLng(location.latitude, location.longitude),
                        15,
                      );
                    });

                    return Marker(
                      point: LatLng(location.latitude, location.longitude),
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
  const _RiderIcon({super.key});

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
