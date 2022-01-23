import 'package:flutter_test/flutter_test.dart';
import 'package:popquiz/app/modules/quiz/store/quiz_store.dart';
 
void main() {
  late QuizStore store;

  setUpAll(() {
    store = QuizStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}