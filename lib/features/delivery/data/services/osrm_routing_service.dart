import 'package:latlong2/latlong.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

/// Service for fetching real road routes from OSRM (Open Source Routing Machine)
class OsrmRoutingService {
  static const String _baseUrl = 'https://router.project-osrm.org/route/v1/driving';
  static const Duration _timeout = Duration(seconds: 30);

  /// Fetch route waypoints from OSRM API
  /// Returns list of LatLng points that follow actual roads
  /// Falls back to simple interpolation if API call fails
  Future<List<LatLng>> getRoute(LatLng start, LatLng end) async {
    try {
      final coordinates = '${start.longitude},${start.latitude};${end
          .longitude},${end.latitude}';
      final url = Uri.parse(
        '$_baseUrl/$coordinates?geometries=geojson&overview=full&steps=false',
      );

      final response = await http
          .get(url)
          .timeout(_timeout);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;

        // Check if route was found
        if (json['code'] == 'Ok' && json['routes'] != null &&
            (json['routes'] as List).isNotEmpty) {
          final route = json['routes'][0];
          final geometry = route['geometry'];

          if (geometry != null && geometry['coordinates'] != null) {
            final coordinates = geometry['coordinates'] as List;
            final waypoints = coordinates
                .map((coord) =>
                LatLng(
                  coord[1] as double, // latitude
                  coord[0] as double, // longitude
                ))
                .toList();

            return waypoints.isNotEmpty ? waypoints : _getFallbackRoute(
                start, end);
          }
        }
      }

      // Fallback if API response is invalid
      return _getFallbackRoute(start, end);
    } catch (e) {
      // Fallback on network error or timeout
      print('OSRM routing error: $e');
      return _getFallbackRoute(start, end);
    }
  }

  /// Fallback route generation if OSRM fails
  /// Creates a simple interpolated path with intermediate points
  List<LatLng> _getFallbackRoute(LatLng start, LatLng end) {
    final waypoints = <LatLng>[start];

    // Create intermediate waypoints for smoother animation
    for (int i = 1; i < 10; i++) {
      final t = i / 10;
      final lat = start.latitude + (end.latitude - start.latitude) * t;
      final lng = start.longitude + (end.longitude - start.longitude) * t;
      waypoints.add(LatLng(lat, lng));
    }

    waypoints.add(end);
    return waypoints;
  }
}

