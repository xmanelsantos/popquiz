import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popquiz/app/animation/fade_animation.dart';
import 'package:popquiz/app/modules/quiz/models/result.dart';
import 'package:popquiz/app/modules/quiz/models/result_manager.dart';
import 'package:popquiz/constants/constants.dart';
import 'package:provider/provider.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Result result = Modular.get<Result>();
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: _appBarQuiz(),
      body: Column(
        children: [
          const SizedBox(height: kDefaultPadding * 2),
          FadeAnimation(
            delay: 1.4,
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Text(
                'Esse é seu primeiro quiz, a estrutura dos quiz sempre serão a mesma, um enunciado e para respondê-lo basta clicar nele. Ao responder todas as perguntas clique em finalizar.',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    fontSize: size.width * 0.045, color: kPrimaryColor),
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding * 3),
              child: Form(
                key: _formKey,
                child: FadeAnimation(
                  delay: 1.8,
                  child: Column(
                    children: [
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Por favor, preencha o campo';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          result.answers.add(newValue!.trim().toString());
                          result.questions.add('Qual o seu primeiro nome ?');
                        },
                        maxLength: 16,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          fontSize: size.width * 0.05,
                          color: kSecondaryColor,
                          fontStyle: FontStyle.italic,
                        ),
                        decoration: _inputDecorationQuiz(
                            hint: 'Nome', label: 'Qual o seu primeiro nome ?'),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Por favor, preencha o campo';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          result.answers.add(newValue!.trim().toString());
                          result.questions.add('Qual o seu apelido ?');
                        },
                        maxLength: 16,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          fontSize: size.width * 0.05,
                          color: kSecondaryColor,
                          fontStyle: FontStyle.italic,
                        ),
                        decoration: _inputDecorationQuiz(
                            hint: 'Apelido', label: 'Qual o seu apelido ?'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
          _bottomButtonsQuiz(size, _formKey, result)
        ],
      ),
    );
  }

// ? Input decoration for quiz
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

  AppBar _appBarQuiz() {
    return AppBar(
      elevation: 0,
      backgroundColor: kBgLightColor,
      centerTitle: true,
      iconTheme: const IconThemeData(color: kSecondaryColor),
      title: Text(
        'Quiz',
        style: GoogleFonts.lato(
          fontSize: 30,
          color: kSecondaryColor,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Container _bottomButtonsQuiz(
      Size size, GlobalKey<FormState> formkey, Result result) {
    return Container(
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
                    fontSize: size.width * 0.05, color: kBgLightColor),
              ),
            ),
            InkWell(
              autofocus: true,
              onTap: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                  result.title = 'Apelido e Nome';
                  result.id = '0';
                  result.createdAt = DateTime.now();
                  resultManager.addResult(result);
                  Modular.to.navigate('/home');
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 2, vertical: kDefaultPadding),
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
    );
  }
}
