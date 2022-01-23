import 'package:flutter_modular/flutter_modular.dart';
import 'package:popquiz/app/modules/new/pages/new_quiz_page.dart';

class NewModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const NewQuizPage()),
  ];
}
