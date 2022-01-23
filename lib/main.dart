import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:popquiz/app/modules/quiz/models/result.dart';
import 'package:provider/provider.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';
import 'app/modules/quiz/models/result_manager.dart';
import 'app/repositories/config/hive_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveConfig.start();
  Hive.registerAdapter(ResultAdapter());

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ResultManager(), lazy: false),
    ], child: ModularApp(module: AppModule(), child: const AppWidget())),
  );
}
