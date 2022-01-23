import 'package:flutter_modular/flutter_modular.dart';
import 'package:popquiz/app/modules/home/pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomePage()),
  ];
}
