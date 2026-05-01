// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(delivery)
const deliveryProvider = DeliveryProvider._();

final class DeliveryProvider
    extends
        $FunctionalProvider<
          AsyncValue<DeliveryEntity>,
          DeliveryEntity,
          FutureOr<DeliveryEntity>
        >
    with $FutureModifier<DeliveryEntity>, $FutureProvider<DeliveryEntity> {
  const DeliveryProvider._()
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
  String debugGetCreateSourceHash() => _$deliveryHash();

  @$internal
  @override
  $FutureProviderElement<DeliveryEntity> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<DeliveryEntity> create(Ref ref) {
    return delivery(ref);
  }
}

String _$deliveryHash() => r'41adcfe9fe25a42f40448affcdd3ba078fa7204b';

@ProviderFor(liveLocation)
const liveLocationProvider = LiveLocationProvider._();

final class LiveLocationProvider
    extends
        $FunctionalProvider<
          AsyncValue<LocationEntity>,
          LocationEntity,
          Stream<LocationEntity>
        >
    with $FutureModifier<LocationEntity>, $StreamProvider<LocationEntity> {
  const LiveLocationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'liveLocationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$liveLocationHash();

  @$internal
  @override
  $StreamProviderElement<LocationEntity> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<LocationEntity> create(Ref ref) {
    return liveLocation(ref);
  }
}

String _$liveLocationHash() => r'44b07d7f25ed335feb56b5f1acf02d7cfe765b12';

@ProviderFor(eta)
const etaProvider = EtaProvider._();

final class EtaProvider
    extends $FunctionalProvider<AsyncValue<int>, int, Stream<int>>
    with $FutureModifier<int>, $StreamProvider<int> {
  const EtaProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'etaProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$etaHash();

  @$internal
  @override
  $StreamProviderElement<int> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<int> create(Ref ref) {
    return eta(ref);
  }
}

String _$etaHash() => r'03370c4dfd4af5d22a199abe58b9916cb4c5c141';
