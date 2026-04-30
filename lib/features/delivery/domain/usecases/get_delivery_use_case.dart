import 'package:delivery_live_tracking/features/delivery/domain/entities/delivery_entity.dart';
import 'package:delivery_live_tracking/features/delivery/domain/repositories/delivery_repository.dart';

class GetDeliveryUseCase {
  final DeliveryRepository repository;

  GetDeliveryUseCase(this.repository);

  Future<DeliveryEntity> call(String orderId) =>
      repository.getDelivery(orderId);
}
