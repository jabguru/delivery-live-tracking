// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(deliveryRepository)
const deliveryRepositoryProvider = DeliveryRepositoryProvider._();

final class DeliveryRepositoryProvider
    extends
        $FunctionalProvider<
          DeliveryRepository,
          DeliveryRepository,
          DeliveryRepository
        >
    with $Provider<DeliveryRepository> {
  const DeliveryRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deliveryRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deliveryRepositoryHash();

  @$internal
  @override
  $ProviderElement<DeliveryRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeliveryRepository create(Ref ref) {
    return deliveryRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeliveryRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeliveryRepository>(value),
    );
  }
}

String _$deliveryRepositoryHash() =>
    r'448c2d859ba8c9e9727a883ead8b7e0c287c651f';

@ProviderFor(getDeliveryUseCase)
const getDeliveryUseCaseProvider = GetDeliveryUseCaseProvider._();

final class GetDeliveryUseCaseProvider
    extends
        $FunctionalProvider<
          GetDeliveryUseCase,
          GetDeliveryUseCase,
          GetDeliveryUseCase
        >
    with $Provider<GetDeliveryUseCase> {
  const GetDeliveryUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getDeliveryUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getDeliveryUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetDeliveryUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetDeliveryUseCase create(Ref ref) {
    return getDeliveryUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetDeliveryUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetDeliveryUseCase>(value),
    );
  }
}

String _$getDeliveryUseCaseHash() =>
    r'cb8ea3d4e0ca7e65130e0f13e3ac81ad24098a0b';

@ProviderFor(watchLiveLocationUseCase)
const watchLiveLocationUseCaseProvider = WatchLiveLocationUseCaseProvider._();

final class WatchLiveLocationUseCaseProvider
    extends
        $FunctionalProvider<
          WatchLiveLocationUseCase,
          WatchLiveLocationUseCase,
          WatchLiveLocationUseCase
        >
    with $Provider<WatchLiveLocationUseCase> {
  const WatchLiveLocationUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchLiveLocationUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchLiveLocationUseCaseHash();

  @$internal
  @override
  $ProviderElement<WatchLiveLocationUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WatchLiveLocationUseCase create(Ref ref) {
    return watchLiveLocationUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WatchLiveLocationUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WatchLiveLocationUseCase>(value),
    );
  }
}

String _$watchLiveLocationUseCaseHash() =>
    r'acb94d00c8394a4246c8140eacaaeeed1a4e857b';

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
