// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_delivery_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
    r'409502c56d94e2db02256134db15c11a83e52549';
