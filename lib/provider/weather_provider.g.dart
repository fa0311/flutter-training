// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'weather_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weatherServiceHash() => r'7fa4ce0cfdf7441c83b1a7685c591048cd17835b';

/// See also [weatherService].
@ProviderFor(weatherService)
final weatherServiceProvider = Provider<WeatherService>.internal(
  weatherService,
  name: r'weatherServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$weatherServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WeatherServiceRef = ProviderRef<WeatherService>;
String _$fetchWeatherHash() => r'357281ae2bc05a3764da092e24ccafc26cc0a975';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [fetchWeather].
@ProviderFor(fetchWeather)
const fetchWeatherProvider = FetchWeatherFamily();

/// See also [fetchWeather].
class FetchWeatherFamily extends Family<WeatherResponseModel> {
  /// See also [fetchWeather].
  const FetchWeatherFamily();

  /// See also [fetchWeather].
  FetchWeatherProvider call(
    WeatherParameterModel param,
  ) {
    return FetchWeatherProvider(
      param,
    );
  }

  @override
  FetchWeatherProvider getProviderOverride(
    covariant FetchWeatherProvider provider,
  ) {
    return call(
      provider.param,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchWeatherProvider';
}

/// See also [fetchWeather].
class FetchWeatherProvider extends Provider<WeatherResponseModel> {
  /// See also [fetchWeather].
  FetchWeatherProvider(
    WeatherParameterModel param,
  ) : this._internal(
          (ref) => fetchWeather(
            ref as FetchWeatherRef,
            param,
          ),
          from: fetchWeatherProvider,
          name: r'fetchWeatherProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchWeatherHash,
          dependencies: FetchWeatherFamily._dependencies,
          allTransitiveDependencies:
              FetchWeatherFamily._allTransitiveDependencies,
          param: param,
        );

  FetchWeatherProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.param,
  }) : super.internal();

  final WeatherParameterModel param;

  @override
  Override overrideWith(
    WeatherResponseModel Function(FetchWeatherRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchWeatherProvider._internal(
        (ref) => create(ref as FetchWeatherRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        param: param,
      ),
    );
  }

  @override
  ProviderElement<WeatherResponseModel> createElement() {
    return _FetchWeatherProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchWeatherProvider && other.param == param;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, param.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchWeatherRef on ProviderRef<WeatherResponseModel> {
  /// The parameter `param` of this provider.
  WeatherParameterModel get param;
}

class _FetchWeatherProviderElement extends ProviderElement<WeatherResponseModel>
    with FetchWeatherRef {
  _FetchWeatherProviderElement(super.provider);

  @override
  WeatherParameterModel get param => (origin as FetchWeatherProvider).param;
}

String _$weatherResponseStateHash() =>
    r'e26989e9bdf21a4c0dc2f69de3cf9c360af8d503';

/// See also [WeatherResponseState].
@ProviderFor(WeatherResponseState)
final weatherResponseStateProvider = AutoDisposeNotifierProvider<
    WeatherResponseState, WeatherResponseModel?>.internal(
  WeatherResponseState.new,
  name: r'weatherResponseStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$weatherResponseStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WeatherResponseState = AutoDisposeNotifier<WeatherResponseModel?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
