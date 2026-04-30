import 'package:delivery_live_tracking/features/delivery/data/repositories/delivery_repository_impl.dart';
import 'package:delivery_live_tracking/features/delivery/domain/entities/location_entity.dart';
import 'package:delivery_live_tracking/features/delivery/domain/repositories/delivery_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'watch_live_location_use_case.g.dart';

@riverpod
WatchLiveLocationUseCase watchLiveLocationUseCase(Ref ref) {
  return WatchLiveLocationUseCase(ref.watch(deliveryRepositoryProvider));
}

class WatchLiveLocationUseCase {
  final DeliveryRepository repository;

  WatchLiveLocationUseCase(this.repository);

  Stream<LocationEntity> call(String orderId) =>
      repository.watchLiveLocation(orderId);
}
