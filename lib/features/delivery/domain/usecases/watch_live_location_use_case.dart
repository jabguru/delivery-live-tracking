import 'package:delivery_live_tracking/features/delivery/domain/entities/location_entity.dart';
import 'package:delivery_live_tracking/features/delivery/domain/repositories/delivery_repository.dart';

class WatchLiveLocationUseCase {
  final DeliveryRepository repository;

  WatchLiveLocationUseCase(this.repository);

  Stream<LocationEntity> call(String orderId) =>
      repository.watchLiveLocation(orderId);
}
