import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito_ext/mockito_ext.dart';
import 'package:test/test.dart';

import 'mockito_ext_example.mocks.dart';

class A {
  A(this.a, this.b);

  final String a;
  final String b;
}

class B {
  B(this.a);

  final A a;

  String c() => a.a + a.b;
}

@GenerateMocks([A])
void main() {
  late MockA a;
  late B b;

  setUp(() {
    a = MockA();
    b = B(a);
  });

  test('test', () {
    when(a.a).thenReturns([
      'a',
      'b',
      'c',
    ]);
    when(a.b).thenAnswers([
      (_) => 'a',
      (_) => 'b',
    ]);

    expect(b.c(), 'aa');
    expect(b.c(), 'bb');
    expect(b.c(), 'cb');
  });
}
