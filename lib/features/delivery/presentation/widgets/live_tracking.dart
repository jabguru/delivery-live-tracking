import 'package:delivery_live_tracking/features/delivery/presentation/viewmodel/delivery_provider.dart';
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
                  color: Colors.blue.withOpacity(0.7),
                  strokeWidth: 4,
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
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withOpacity(0.5),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
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
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green.withOpacity(0.5),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.two_wheeler,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    );
                  },
                  loading: () {
                    // Show loading marker at pickup location
                    return Marker(
                      point: delivery.pickupLocation,
                      width: 40,
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: LoadingIndicator(),
                          ),
                        ),
                      ),
                    );
                  },
                  error: (error, stack) {
                    return Marker(
                      point: delivery.pickupLocation,
                      width: 40,
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.error, color: Colors.white),
                      ),
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
