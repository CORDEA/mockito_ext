import 'dart:async';

import 'package:mockito_ext/mockito_ext.dart';
import 'package:test/test.dart';

void main() {
  late StreamController<String> controller;

  setUp(() {
    controller = StreamController();
  });

  tearDown(() {
    controller.close();
  });

  test('emits', () {
    verifyStream(controller.stream).emits(isNotEmpty);

    controller.add('event');
  });

  test('emitsValue', () {
    verifyStream(controller.stream).emitsValue('event');

    controller.add('event');
  });

  test('emitsInOrder', () {
    verifyStream(controller.stream).emitsInOrder([isEmpty, isNotEmpty]);

    controller.add('');
    controller.add('event');
  });

  test('emitsValuesInOrder', () {
    verifyStream(controller.stream).emitsValuesInOrder(['', 'event']);

    controller.add('');
    controller.add('event');
  });

  test('emitsInAnyOrder', () {
    verifyStream(controller.stream).emitsInAnyOrder([isNotEmpty, isEmpty]);

    controller.add('');
    controller.add('event');
  });

  test('emitsValuesInAnyOrder', () {
    verifyStream(controller.stream).emitsValuesInAnyOrder(['event', '']);

    controller.add('');
    controller.add('event');
  });
}
