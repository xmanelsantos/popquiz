import 'package:popquiz/app/modules/welcome/pages/welcome_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WelcomeModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const WelcomePage()),
  ];
}
