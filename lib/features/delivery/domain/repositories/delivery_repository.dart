import 'package:delivery_live_tracking/features/delivery/domain/entities/delivery_entity.dart';
import 'package:delivery_live_tracking/features/delivery/domain/entities/location_entity.dart';

abstract class DeliveryRepository {
  /// Get initial delivery data
  Future<DeliveryEntity> getDelivery(String orderId);

  /// Watch live location updates with smooth interpolation
  /// Returns a stream of location updates
  Stream<LocationEntity> watchLiveLocation(String orderId);
}
