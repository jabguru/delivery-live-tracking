// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_live_location_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
    r'5327b8a4f0cccd4ad1a6443bdfe39813cbccff68';
