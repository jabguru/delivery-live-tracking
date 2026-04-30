// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_remote_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(deliveryRemoteDataSource)
const deliveryRemoteDataSourceProvider = DeliveryRemoteDataSourceProvider._();

final class DeliveryRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          DeliveryRemoteDataSource,
          DeliveryRemoteDataSource,
          DeliveryRemoteDataSource
        >
    with $Provider<DeliveryRemoteDataSource> {
  const DeliveryRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deliveryRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deliveryRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<DeliveryRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeliveryRemoteDataSource create(Ref ref) {
    return deliveryRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeliveryRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeliveryRemoteDataSource>(value),
    );
  }
}

String _$deliveryRemoteDataSourceHash() =>
    r'3f3479046d302904194aa6e7b7ba270014de59bc';
