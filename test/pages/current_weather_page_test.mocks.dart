// Mocks generated by Mockito 5.2.0 from annotations
// in local_weather/test/pages/current_weather_page_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;
import 'dart:ui' as _i6;

import 'package:local_weather/models/condition.dart' as _i2;
import 'package:local_weather/models/current_location.dart' as _i4;
import 'package:local_weather/models/daily_forecast.dart' as _i8;
import 'package:local_weather/models/uv_condition.dart' as _i3;
import 'package:local_weather/models/weather.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeCondition_0 extends _i1.Fake implements _i2.Condition {}

class _FakeUVCondition_1 extends _i1.Fake implements _i3.UVCondition {}

/// A class which mocks [CurrentLocation].
///
/// See the documentation for Mockito's code generation for more information.
class MockCurrentLocation extends _i1.Mock implements _i4.CurrentLocation {
  MockCurrentLocation() {
    _i1.throwOnMissingStub(this);
  }

  @override
  double get latitude =>
      (super.noSuchMethod(Invocation.getter(#latitude), returnValue: 0.0)
          as double);
  @override
  double get longitude =>
      (super.noSuchMethod(Invocation.getter(#longitude), returnValue: 0.0)
          as double);
  @override
  String get locationName =>
      (super.noSuchMethod(Invocation.getter(#locationName), returnValue: '')
          as String);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  _i5.Future<void> refresh() =>
      (super.noSuchMethod(Invocation.method(#refresh, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  void addListener(_i6.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i6.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
}

/// A class which mocks [Weather].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeather extends _i1.Mock implements _i7.Weather {
  MockWeather() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Condition get condition =>
      (super.noSuchMethod(Invocation.getter(#condition),
          returnValue: _FakeCondition_0()) as _i2.Condition);
  @override
  double get temperature =>
      (super.noSuchMethod(Invocation.getter(#temperature), returnValue: 0.0)
          as double);
  @override
  _i3.UVCondition get uvCondition =>
      (super.noSuchMethod(Invocation.getter(#uvCondition),
          returnValue: _FakeUVCondition_1()) as _i3.UVCondition);
  @override
  List<_i8.DailyForecast> get dailyForecasts =>
      (super.noSuchMethod(Invocation.getter(#dailyForecasts),
          returnValue: <_i8.DailyForecast>[]) as List<_i8.DailyForecast>);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  _i5.Future<void> load(double? latitude, double? longitude) =>
      (super.noSuchMethod(Invocation.method(#load, [latitude, longitude]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  void addListener(_i6.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i6.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
}