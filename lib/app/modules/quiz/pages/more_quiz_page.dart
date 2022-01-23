import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popquiz/app/modules/quiz/models/quiz.dart';
import 'package:popquiz/app/modules/quiz/models/quiz_manager.dart';
import 'package:popquiz/app/modules/quiz/models/result.dart';
import 'package:popquiz/app/modules/quiz/models/result_manager.dart';
import 'package:popquiz/constants/constants.dart';
import 'package:provider/provider.dart';

class MoreQuizPage extends StatefulWidget {
  const MoreQuizPage({Key? key}) : super(key: key);

  @override
  _MoreQuizPageState createState() => _MoreQuizPageState();
}

class _MoreQuizPageState extends State<MoreQuizPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Result result = Result();
    Size size = MediaQuery.of(context).size;
    return Consumer<QuizManager>(builder: (_, quizManager, __) {
      Quiz quiz = quizManager.selectedQuiz;

      return Scaffold(
        appBar: AppBar(
          backgroundColor: kSecondaryColor,
          iconTheme: const IconThemeData(color: kBgLightColor),
          title: Text(
            quiz.title,
            style: GoogleFonts.lato(
              fontSize: 20,
              color: kBgLightColor,
            ),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: quiz.questions.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding * 3,
                        vertical: kDefaultPadding,
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.toString().trim().isEmpty) {
                            return 'Por favor, preencha o campo';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          result.answers.add(newValue as String);

                          result.questions.add(quiz.questions[index].question);
                        },
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          fontSize: size.width * 0.05,
                          color: kSecondaryColor,
                          fontStyle: FontStyle.italic,
                        ),
                        decoration: _inputDecorationQuiz(
                          label: quiz.questions[index].question,
                          hint: quiz.questions[index].description,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: size.width,
                height: size.height * 0.1,
                decoration: const BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Consumer<ResultManager>(builder: (_, resultManager, __) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          Modular.to.pop();
                        },
                        child: Text(
                          'Voltar',
                          style: GoogleFonts.lato(
                              fontSize: size.width * 0.05,
                              color: kBgLightColor),
                        ),
                      ),
                      InkWell(
                        autofocus: true,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            result.title = quiz.title;
                            result.id = quiz.id.toString();
                            result.createdAt = DateTime.now();
                            resultManager.addResult(result);
                            Modular.to.navigate('/home/');
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding * 2,
                              vertical: kDefaultPadding),
                          decoration: BoxDecoration(
                            color: kBgLightColor,
                            boxShadow: [
                              BoxShadow(
                                color: kPrimaryColor.withOpacity(0.3),
                                offset: const Offset(0, 5),
                                blurRadius: 10,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Finalizar',
                            style: GoogleFonts.lato(
                              color: kSecondaryColor,
                              fontSize: size.width * 0.05,
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      );
    });
  }

  InputDecoration _inputDecorationQuiz(
      {required String label, required String hint}) {
    final Size size = MediaQuery.of(context).size;
    return InputDecoration(
      border: InputBorder.none,
      hintText: hint,
      hintStyle: GoogleFonts.lato(
        fontSize: size.width * 0.05,
        color: Colors.black38,
        fontStyle: FontStyle.italic,
      ),
      labelText: label,
      labelStyle: GoogleFonts.lato(
        fontSize: size.width * 0.05,
        color: kSecondaryColor,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
