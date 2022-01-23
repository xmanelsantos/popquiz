import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popquiz/app/animation/fade_animation.dart';
import 'package:popquiz/app/modules/quiz/models/quiz.dart';
import 'package:popquiz/app/modules/quiz/models/quiz_manager.dart';
import 'package:popquiz/constants/constants.dart';
import 'package:provider/provider.dart';

class NewQuizPage extends StatefulWidget {
  const NewQuizPage({Key? key}) : super(key: key);

  @override
  NewQuizPageState createState() => NewQuizPageState();
}

class NewQuizPageState extends State<NewQuizPage> {
  List<Quiz> quizzes = [
    Quiz(
      id: 0,
      title: 'Quiz 1',
      questions: [
        Question(
          id: 1,
          question: 'Qual seu filme favorito ?',
          description: 'Filme favorito',
        ),
        Question(
          id: 2,
          question: 'Qual seu livro favorito ?',
          description: 'Livro favorito',
        ),
        Question(
          id: 1,
          question: 'Qual seu filme favorito ?',
          description: 'Filme favorito',
        ),
        Question(
          id: 2,
          question: 'Qual seu livro favorito ?',
          description: 'Livro favorito',
        ),
        Question(
          id: 1,
          question: 'Qual seu filme favorito ?',
          description: 'Filme favorito',
        ),
        Question(
          id: 2,
          question: 'Qual seu livro favorito ?',
          description: 'Livro favorito',
        ),
        Question(
          id: 1,
          question: 'Qual seu filme favorito ?',
          description: 'Filme favorito',
        ),
        Question(
          id: 2,
          question: 'Qual seu livro favorito ?',
          description: 'Livro favorito',
        ),
        Question(
          id: 1,
          question: 'Qual seu filme favorito ?',
          description: 'Filme favorito',
        ),
        Question(
          id: 2,
          question: 'Qual seu livro favorito ?',
          description: 'Livro favorito',
        ),
      ],
    ),
    Quiz(
      id: 1,
      title: 'Quiz 2',
      questions: [
        Question(
          id: 1,
          question: 'Qual seu filme favorito ?',
          description: 'Filme favorito',
        ),
        Question(
          id: 2,
          question: 'Qual seu livro favorito ?',
          description: 'Livro favorito',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Consumer<QuizManager>(builder: (_, quizManager, __) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: kSecondaryColor,
          iconTheme: const IconThemeData(color: kBgLightColor),
          title: Text(
            'Novos Questionários',
            style: GoogleFonts.lato(fontSize: 20, color: kBgLightColor),
          ),
        ),
        body: quizzes.isEmpty || quizzes == null
            ? Center(
                child: Text(
                  'Nenhum quiz disponível',
                  style: GoogleFonts.lato(
                      fontSize: size.width * 0.05, color: Colors.black54),
                ),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: quizzes.length,
                itemBuilder: (context, index) => FadeAnimation(
                  delay: 1 + index * 0.2,
                  child: InkWell(
                    onTap: () {
                      quizManager.setQuizSelect(quizzes[index]);
                      Modular.to.pushNamed('/quiz/');
                    },
                    child: Container(
                      margin: const EdgeInsets.all(kDefaultPadding),
                      padding: const EdgeInsets.all(kDefaultPadding),
                      width: size.width * 0.9,
                      height: size.height * 0.15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 5),
                            blurRadius: 10,
                            color: kPrimaryColor.withOpacity(0.23),
                          ),
                          const BoxShadow(
                            offset: Offset(-2, -5),
                            blurRadius: 10,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const CircleAvatar(
                            backgroundColor: kSecondaryColor,
                            child: Icon(
                              Icons.pending_actions,
                              color: kBgLightColor,
                            ),
                          ),
                          const SizedBox(height: kDefaultPadding * 0.5),
                          Text(
                            quizzes[index].title,
                            style: GoogleFonts.lato(
                              fontSize: size.width * 0.05,
                              color: kPrimaryColor,
                            ),
                          ),
                          const SizedBox(height: kDefaultPadding * 0.5),
                          Text(
                            quizzes[index].questions.length > 1
                                ? '${quizzes[index].questions.length} perguntas'
                                : '${quizzes[index].questions.length} pergunta',
                            style: GoogleFonts.lato(
                              fontSize: size.width * 0.04,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      );
    });
  }
}
