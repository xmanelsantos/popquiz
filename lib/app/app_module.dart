import 'package:flutter_modular/flutter_modular.dart';
import 'package:popquiz/app/modules/quiz/quiz_module.dart';

import 'modules/home/home_module.dart';
import 'modules/new/new_module.dart';
import 'modules/welcome/welcome_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => HomeModule()),
    Bind.factory((i) => WelcomeModule()),
    Bind.factory((i) => QuizModule()),
    Bind.factory((i) => NewModule())
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: WelcomeModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/quiz', module: QuizModule()),
    ModuleRoute('/new', module: NewModule()),
  ];
}
