import 'package:delivery_live_tracking/features/delivery/data/repositories/delivery_repository_impl.dart';
import 'package:delivery_live_tracking/features/delivery/domain/entities/delivery_entity.dart';
import 'package:delivery_live_tracking/features/delivery/domain/repositories/delivery_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_delivery_use_case.g.dart';

@riverpod
GetDeliveryUseCase getDeliveryUseCase(Ref ref) {
  return GetDeliveryUseCase(ref.watch(deliveryRepositoryProvider));
}

class GetDeliveryUseCase {
  final DeliveryRepository repository;

  GetDeliveryUseCase(this.repository);

  Future<DeliveryEntity> call(String orderId) =>
      repository.getDelivery(orderId);
}
