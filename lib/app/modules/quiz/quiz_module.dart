import 'package:popquiz/app/modules/quiz/models/result.dart';
import 'package:popquiz/app/modules/quiz/pages/more_quiz_page.dart';
import 'package:popquiz/app/modules/quiz/pages/quiz_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class QuizModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => Result()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const MoreQuizPage()),
    ChildRoute('/first', child: (_, args) => const QuizPage()),
  ];
}
