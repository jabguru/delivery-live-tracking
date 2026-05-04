// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DeliveryNotifier)
const deliveryProvider = DeliveryNotifierProvider._();

final class DeliveryNotifierProvider
    extends $AsyncNotifierProvider<DeliveryNotifier, DeliveryEntity> {
  const DeliveryNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deliveryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deliveryNotifierHash();

  @$internal
  @override
  DeliveryNotifier create() => DeliveryNotifier();
}

String _$deliveryNotifierHash() => r'4fd5374bf01d2613f16860ba2637e839d0015c19';

abstract class _$DeliveryNotifier extends $AsyncNotifier<DeliveryEntity> {
  FutureOr<DeliveryEntity> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<DeliveryEntity>, DeliveryEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<DeliveryEntity>, DeliveryEntity>,
              AsyncValue<DeliveryEntity>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(LiveLocationNotificationNotifier)
const liveLocationNotificationProvider =
    LiveLocationNotificationNotifierProvider._();

final class LiveLocationNotificationNotifierProvider
    extends
        $StreamNotifierProvider<
          LiveLocationNotificationNotifier,
          LocationEntity
        > {
  const LiveLocationNotificationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'liveLocationNotificationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$liveLocationNotificationNotifierHash();

  @$internal
  @override
  LiveLocationNotificationNotifier create() =>
      LiveLocationNotificationNotifier();
}

String _$liveLocationNotificationNotifierHash() =>
    r'dcf1480f05d66c4bf37941eb8a48e97626bf9df6';

abstract class _$LiveLocationNotificationNotifier
    extends $StreamNotifier<LocationEntity> {
  Stream<LocationEntity> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<LocationEntity>, LocationEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LocationEntity>, LocationEntity>,
              AsyncValue<LocationEntity>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ETANotifier)
const eTAProvider = ETANotifierProvider._();

final class ETANotifierProvider
    extends $StreamNotifierProvider<ETANotifier, int> {
  const ETANotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'eTAProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$eTANotifierHash();

  @$internal
  @override
  ETANotifier create() => ETANotifier();
}

String _$eTANotifierHash() => r'e0e7d73f96ce1300130eba20ee7cd909b4055cc3';

abstract class _$ETANotifier extends $StreamNotifier<int> {
  Stream<int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<int>, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<int>, int>,
              AsyncValue<int>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
