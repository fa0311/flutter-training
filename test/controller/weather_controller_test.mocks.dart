// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_training/test/controller/weather_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_training/domain/weather_service.dart' as _i3;
import 'package:flutter_training/model/weather_model.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeWeatherResponseModel_0 extends _i1.SmartFake
    implements _i2.WeatherResponseModel {
  _FakeWeatherResponseModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [WeatherService].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherService extends _i1.Mock implements _i3.WeatherService {
  @override
  _i2.WeatherResponseModel fetch(_i2.WeatherParameterModel? model) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetch,
          [model],
        ),
        returnValue: _FakeWeatherResponseModel_0(
          this,
          Invocation.method(
            #fetch,
            [model],
          ),
        ),
        returnValueForMissingStub: _FakeWeatherResponseModel_0(
          this,
          Invocation.method(
            #fetch,
            [model],
          ),
        ),
      ) as _i2.WeatherResponseModel);
}
