import 'package:test/expect.dart' as e;

ExpectLater<T> verifyStream<T>(
  Stream<T> actual, {
  String? reason,
  dynamic skip,
}) =>
    ExpectLater._(actual, reason, skip);

class ExpectLater<T> {
  ExpectLater._(this._actual, this._reason, this._skip);

  final Stream<T> _actual;
  final String? _reason;
  final dynamic _skip;

  Future<void> emits(e.Matcher matcher) => e.expectLater(
        _actual,
        e.emits(matcher),
        reason: _reason,
        skip: _skip,
      );

  Future<void> emitsValue(T expected) => e.expectLater(
        _actual,
        e.emits(expected),
        reason: _reason,
        skip: _skip,
      );

  Future<void> emitsInOrder(List<e.Matcher> matchers) => e.expectLater(
        _actual,
        e.emitsInOrder(matchers.map((v) => e.emits(v))),
        reason: _reason,
        skip: _skip,
      );

  Future<void> emitsValuesInOrder(List<T> expected) => e.expectLater(
        _actual,
        e.emitsInOrder(expected.map((v) => e.emits(v))),
        reason: _reason,
        skip: _skip,
      );

  Future<void> emitsInAnyOrder(List<e.Matcher> matchers) => e.expectLater(
        _actual,
        e.emitsInAnyOrder(matchers.map((v) => e.emits(v))),
        reason: _reason,
        skip: _skip,
      );

  Future<void> emitsValuesInAnyOrder(List<T> expected) => e.expectLater(
        _actual,
        e.emitsInAnyOrder(expected.map((v) => e.emits(v))),
        reason: _reason,
        skip: _skip,
      );
}
