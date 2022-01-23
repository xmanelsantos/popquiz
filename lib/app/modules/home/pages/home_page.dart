import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popquiz/app/animation/fade_animation.dart';
import 'package:popquiz/app/modules/quiz/models/quiz_manager.dart';
import 'package:popquiz/app/modules/quiz/models/result.dart';
import 'package:popquiz/app/modules/quiz/models/result_manager.dart';
import 'package:popquiz/constants/constants.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Consumer<ResultManager>(
        builder: (_, resultManager, __) => Scaffold(
              appBar: _appBarHome(),
              body: _bodyHome(size, resultManager),
            ));
  }

  SingleChildScrollView _bodyHome(Size size, ResultManager resultManager) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _headerHome(size, resultManager),
          const SizedBox(height: kDefaultPadding * 3),
          FadeAnimation(
              delay: 1.4,
              child: _titleWithBackground('Histórico de Questionários')),
          const SizedBox(height: kDefaultPadding * 3),
          FadeAnimation(
            delay: 1.6,
            child: SizedBox(
              height: size.height * 0.35,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return historicCard(
                      onPressed: () {
                        resultManager
                            .setSelectResult(resultManager.allResults[index]);
                        Modular.to.pushNamed('details');
                      },
                      result: resultManager.allResults[index],
                    );
                  },
                  itemCount: resultManager.allResults.length),
            ),
          ),
          FadeAnimation(delay: 1.8, child: _lengthResults(resultManager, size)),
          const SizedBox(height: kDefaultPadding / 2),
          FadeAnimation(
            delay: 2,
            child: Text(
              'Agradecemos a sua participação!',
              style: GoogleFonts.roboto(
                fontSize: size.width * 0.035,
                color: Colors.black38,
              ),
            ),
          ),
          const SizedBox(height: kDefaultPadding * 3),
        ],
      ),
    );
  }

  Text _lengthResults(ResultManager resultManager, Size size) {
    return Text(
      resultManager.allResults.isEmpty
          ? 'Nenhum resultado encontrado'
          : resultManager.allResults.length == 1
              ? '1 resultado encontrado'
              : '${resultManager.allResults.length} resultados encontrados',
      textAlign: TextAlign.center,
      style: GoogleFonts.lato(
        fontSize: size.width * 0.035,
        color: Colors.black38,
      ),
    );
  }

  Consumer historicCard(
      {required Function() onPressed, required Result result}) {
    final Size size = MediaQuery.of(context).size;
    return Consumer<ResultManager>(builder: (_, resultManager, __) {
      return InkWell(
        onTap: onPressed,
        child: Container(
          height: size.height * 0.3,
          width: size.width * 0.5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: const Offset(3, 5),
                blurRadius: 10,
                color: kPrimaryColor.withOpacity(0.3),
              ),
              const BoxShadow(
                offset: Offset(-3, -5),
                blurRadius: 10,
                color: Colors.white,
              ),
            ],
          ),
          margin: const EdgeInsets.all(kDefaultPadding * 2),
          padding: const EdgeInsets.all(kDefaultPadding * 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: kAlternativeColor,
                radius: size.width * 0.1,
                child: Icon(
                  Icons.history,
                  color: kPrimaryColor,
                  size: size.width * 0.1,
                ),
              ),
              Text(
                result.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _titleWithBackground('Mais detalhes'),
            ],
          ),
        ),
      );
    });
  }

  Container _titleWithBackground(String title) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 2, vertical: kDefaultPadding),
      decoration: BoxDecoration(
        color: kAlternativeColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 50,
            color: kPrimaryColor.withOpacity(0.23),
          ),
        ],
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          fontSize: size.width * 0.04,
          fontWeight: FontWeight.w600,
          color: kPrimaryColor,
        ),
      ),
    );
  }

  Stack _headerHome(Size size, ResultManager resultManager) {
    return Stack(
      children: [
        Container(
          height: size.height * 0.4,
          width: size.width,
          decoration: BoxDecoration(
            color: kSecondaryColor,
            boxShadow: [
              BoxShadow(
                color: kPrimaryColor.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.elliptical(200, 100),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.2,
                backgroundColor: kPrimaryColor,
                child: Icon(
                  Icons.person,
                  size: size.width * 0.2,
                  color: kAlternativeColor,
                ),
              ),
              const SizedBox(height: kDefaultPadding * 2),
              Text('Olá, ${resultManager.allResults.first.answers[1]} !',
                  maxLines: 1,
                  style: GoogleFonts.lato(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: kBgLightColor,
                  )),
            ],
          ),
        ),
        Positioned(
            bottom: 0,
            left: kDefaultPadding,
            child: Consumer<QuizManager>(builder: (_, quizManager, __) {
              return InkWell(
                onTap: () {
                  quizManager.loadQuizzes();
                  Modular.to.pushNamed('/new/');
                },
                child: Container(
                  height: size.width * 0.18,
                  width: size.width * 0.18,
                  decoration: const BoxDecoration(
                    color: kAlternativeColor,
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                    boxShadow: [
                      BoxShadow(
                        color: kPrimaryColor,
                        offset: Offset(2, -2),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.add_rounded,
                    size: size.width * 0.1,
                    color: kPrimaryColor,
                  ),
                ),
              );
            }))
      ],
    );
  }

  AppBar _appBarHome() {
    return AppBar(
      elevation: 0,
      backgroundColor: kSecondaryColor,
      centerTitle: true,
      iconTheme: const IconThemeData(color: kBgLightColor),
      title: Text(
        'Pop Quiz',
        style: GoogleFonts.lato(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          color: kBgLightColor,
        ),
      ),
    );
  }
}
