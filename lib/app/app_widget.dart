import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:popquiz/constants/constants.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: kSecondaryColor,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pop Quiz',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBgColor,
        colorScheme: const ColorScheme(
          primary: kPrimaryColor,
          primaryVariant: kPrimaryColor,
          secondary: kSecondaryColor,
          secondaryVariant: kSecondaryColor,
          surface: kBgColor,
          background: kBgColor,
          error: Colors.red,
          onPrimary: kPrimaryColor,
          onSecondary: kPrimaryColor,
          onSurface: kPrimaryColor,
          onBackground: kPrimaryColor,
          onError: kPrimaryColor,
          brightness: Brightness.light,
        ),
      ),
    ).modular();
  }
}
