import 'package:delivery_live_tracking/features/delivery/data/repositories/delivery_repository_impl.dart';
import 'package:delivery_live_tracking/features/delivery/domain/entities/delivery_entity.dart';
import 'package:delivery_live_tracking/features/delivery/domain/entities/location_entity.dart';
import 'package:delivery_live_tracking/features/delivery/domain/repositories/delivery_repository.dart';
import 'package:delivery_live_tracking/features/delivery/domain/usecases/get_delivery_use_case.dart';
import 'package:delivery_live_tracking/features/delivery/domain/usecases/watch_live_location_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Repository provider
final deliveryRepositoryProvider = Provider<DeliveryRepository>((ref) {
  return DeliveryRepositoryImpl();
});

// Use case providers
final getDeliveryUseCaseProvider = Provider((ref) {
  final repository = ref.watch(deliveryRepositoryProvider);
  return GetDeliveryUseCase(repository);
});

final watchLiveLocationUseCaseProvider = Provider((ref) {
  final repository = ref.watch(deliveryRepositoryProvider);
  return WatchLiveLocationUseCase(repository);
});

// State providers
const _orderId = 'ORD-682834513';

// Fetch initial delivery data
final deliveryProvider = FutureProvider<DeliveryEntity>((ref) async {
  final useCase = ref.watch(getDeliveryUseCaseProvider);
  return useCase(_orderId);
});

// Stream live location updates
final liveLocationProvider = StreamProvider<LocationEntity>((ref) {
  final useCase = ref.watch(watchLiveLocationUseCaseProvider);
  return useCase(_orderId);
});

// Computed ETA provider that updates based on progress
final etaProvider = StreamProvider<int>((ref) async* {
  final initialDelivery = await ref.watch(deliveryProvider.future);
  final startTime = DateTime.now();
  final totalEtaSeconds = initialDelivery.etaMinutes * 60;

  yield initialDelivery.etaMinutes;

  // Update ETA every second
  while (true) {
    await Future.delayed(const Duration(seconds: 1));
    final elapsedSeconds = DateTime
        .now()
        .difference(startTime)
        .inSeconds;
    final remainingSeconds = totalEtaSeconds - elapsedSeconds;
    final remainingMinutes = (remainingSeconds / 60).ceil().clamp(0, 999);

    yield remainingMinutes;
  }
});
