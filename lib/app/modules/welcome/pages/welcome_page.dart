import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popquiz/app/animation/fade_animation.dart';
import 'package:popquiz/app/modules/quiz/models/result_manager.dart';
import 'package:popquiz/constants/constants.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  WelcomePageState createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Consumer<ResultManager>(builder: (_, resultManager, __) {
      return Scaffold(
        body: Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  kBgLightColor,
                  kBgLightColor,
                  kSecondaryColor,
                ],
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  FadeAnimation(
                    delay: 1.2,
                    child: Text(
                      'Bem vindo ao',
                      style: GoogleFonts.lato(
                        fontSize: 40,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  FadeAnimation(
                    delay: 1.4,
                    child: Text(
                      'Pop Quiz',
                      style: GoogleFonts.lato(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  FadeAnimation(
                    delay: 1.6,
                    child: SizedBox(
                      width: size.width * 0.8,
                      height: size.height * 0.5,
                      child: Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/3d%20icons%2Ftext-dynamic-color.png?alt=media&token=8b150ad7-c1fd-457f-bf84-0c3a0ea9fb7e",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  FadeAnimation(
                    delay: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        resultManager.allResults.isEmpty ||
                                resultManager.allResults == null
                            ? Text(
                                'Bora começar?',
                                style: GoogleFonts.lato(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                'Vamos de novo?',
                                style: GoogleFonts.lato(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                        SizedBox(
                          width: size.width * 0.1,
                        ),
                        InkWell(
                          onTap: () {
                            if (resultManager.allResults.isEmpty ||
                                resultManager.allResults == null) {
                              Modular.to.pushNamed('/quiz');
                            } else {
                              Modular.to.pushNamed('/home/');
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding * 2,
                              vertical: kDefaultPadding,
                            ),
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 10),
                                  blurRadius: 20,
                                  color: kPrimaryColor.withOpacity(0.4),
                                ),
                                BoxShadow(
                                  offset: const Offset(-3, -4),
                                  blurRadius: 20,
                                  color: Colors.white.withOpacity(0.35),
                                ),
                              ],
                            ),
                            child: Text(
                              'Vamos lá!',
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
      );
    });
  }
}
