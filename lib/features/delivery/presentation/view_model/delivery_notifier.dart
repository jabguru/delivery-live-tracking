import 'package:delivery_live_tracking/features/delivery/domain/entities/delivery_entity.dart';
import 'package:delivery_live_tracking/features/delivery/domain/entities/location_entity.dart';
import 'package:delivery_live_tracking/features/delivery/domain/usecases/get_delivery_use_case.dart';
import 'package:delivery_live_tracking/features/delivery/domain/usecases/watch_live_location_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delivery_notifier.g.dart';

const _orderId = 'ORD-682834513';

// Fetch initial delivery data
@riverpod
class DeliveryNotifier extends _$DeliveryNotifier {
  @override
  FutureOr<DeliveryEntity> build() async {
    final useCase = ref.watch(getDeliveryUseCaseProvider);
    return useCase(_orderId);
  }
}

// Stream live location updates
@riverpod
class LiveLocationNotificationNotifier
    extends _$LiveLocationNotificationNotifier {
  @override
  Stream<LocationEntity> build() {
    final useCase = ref.watch(watchLiveLocationUseCaseProvider);
    return useCase(_orderId);
  }
}

// Computed ETA provider that updates based on progress
@riverpod
class ETANotifier extends _$ETANotifier {
  @override
  Stream<int> build() async* {
    final initialDelivery = await ref.watch(deliveryProvider.future);
    final startTime = DateTime.now();
    final totalEtaSeconds = initialDelivery.etaMinutes * 60;

    yield initialDelivery.etaMinutes;

    // Update ETA every second
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      final elapsedSeconds = DateTime.now().difference(startTime).inSeconds;
      final remainingSeconds = totalEtaSeconds - elapsedSeconds;
      final remainingMinutes = (remainingSeconds / 60).ceil().clamp(0, 999);

      yield remainingMinutes;
    }
  }
}

// // Fetch initial delivery data
// @riverpod
// Future<DeliveryEntity> delivery(Ref ref) async {
//   final useCase = ref.watch(getDeliveryUseCaseProvider);
//   return useCase(_orderId);
// }
//
// // Stream live location updates
// @riverpod
// Stream<LocationEntity> liveLocation(Ref ref) {
//   final useCase = ref.watch(watchLiveLocationUseCaseProvider);
//   return useCase(_orderId);
// }
//
// // Computed ETA provider that updates based on progress
// @riverpod
// Stream<int> eta(Ref ref) async* {
//   final initialDelivery = await ref.watch(deliveryProvider.future);
//   final startTime = DateTime.now();
//   final totalEtaSeconds = initialDelivery.etaMinutes * 60;
//
//   yield initialDelivery.etaMinutes;
//
//   // Update ETA every second
//   while (true) {
//     await Future.delayed(const Duration(seconds: 1));
//     final elapsedSeconds = DateTime.now().difference(startTime).inSeconds;
//     final remainingSeconds = totalEtaSeconds - elapsedSeconds;
//     final remainingMinutes = (remainingSeconds / 60).ceil().clamp(0, 999);
//
//     yield remainingMinutes;
//   }
// }
//
