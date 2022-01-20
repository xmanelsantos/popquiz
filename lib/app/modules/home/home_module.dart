import 'package:flutter_modular/flutter_modular.dart';
import 'package:popquiz/app/modules/home/pages/home_page.dart';
import 'package:popquiz/app/modules/home/store/home_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage()),
  ];
}
