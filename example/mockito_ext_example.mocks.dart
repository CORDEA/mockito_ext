// Mocks generated by Mockito 5.0.10 from annotations
// in mockito_ext/example/mockito_ext_example.dart.
// Do not manually edit this file.

import 'package:mockito/mockito.dart' as _i1;

import 'mockito_ext_example.dart' as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [A].
///
/// See the documentation for Mockito's code generation for more information.
class MockA extends _i1.Mock implements _i2.A {
  MockA() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get a =>
      (super.noSuchMethod(Invocation.getter(#a), returnValue: '') as String);
  @override
  String get b =>
      (super.noSuchMethod(Invocation.getter(#b), returnValue: '') as String);
}
