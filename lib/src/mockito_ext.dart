import 'package:mockito/mockito.dart';

extension PostExpectationExt<T> on PostExpectation<T> {
  void thenReturns(List<T> answers) {
    final returns = _MultiReturn(answers);
    return thenAnswer((_) => returns.answer());
  }

  void thenAnswers(List<Answering<T>> answers) {
    final provider = _MultiAnswering(answers);
    return thenAnswer((realInvocation) => provider.answer(realInvocation));
  }
}

class _MultiAnswering<T> {
  _MultiAnswering(this._answers);

  final List<Answering<T>> _answers;
  int _index = -1;

  T answer(Invocation realInvocation) {
    _index += 1;
    if (_index < _answers.length) {
      return _answers[_index].call(realInvocation);
    }
    return _answers.last.call(realInvocation);
  }
}

class _MultiReturn<T> {
  _MultiReturn(this._answers);

  final List<T> _answers;
  int _index = -1;

  T answer() {
    _index += 1;
    if (_index < _answers.length) {
      return _answers[_index];
    }
    return _answers.last;
  }
}
