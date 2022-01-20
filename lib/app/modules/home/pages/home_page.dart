import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popquiz/constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBarHome(),
      body: _bodyHome(size, 'Manel'),
    );
  }

  Column _bodyHome(Size size, String nome) {
    return Column(
      children: [
        _headerHome(size, nome),
        const SizedBox(height: kDefaultPadding * 3),
        _titleWithBackground('Histórico de Questionários'),
        const SizedBox(height: kDefaultPadding * 3),
        historicCard(title: 'Informações pessoais', onPressed: () {}),
      ],
    );
  }

  Container historicCard({required String title, required Function onPressed}) {
    final Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.3,
        width: size.width * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: const Offset(3, 10),
              blurRadius: 15,
              color: kPrimaryColor.withOpacity(0.23),
            ),
            const BoxShadow(
              offset: Offset(-3, -10),
              blurRadius: 20,
              color: Colors.white,
            ),
          ],
        ),
        margin: const EdgeInsets.all(kDefaultPadding * 2),
        padding: const EdgeInsets.all(kDefaultPadding * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              backgroundColor: kAlternativeColor,
              radius: 80,
              child: Icon(
                Icons.history,
                color: kPrimaryColor,
                size: 40,
              ),
            ),
            Text(
              'Informações pessoais',
              style: GoogleFonts.lato(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            _titleWithBackground('Mais detalhes')
          ],
        ));
  }

  Container _titleWithBackground(String title) {
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
        style: GoogleFonts.lato(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: kPrimaryColor,
        ),
      ),
    );
  }

  Stack _headerHome(Size size, String nome) {
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
              const CircleAvatar(
                radius: 100,
                backgroundColor: kPrimaryColor,
                child: Icon(
                  Icons.person,
                  size: 100,
                  color: kAlternativeColor,
                ),
              ),
              const SizedBox(height: kDefaultPadding * 2),
              Text('Olá, $nome !',
                  style: GoogleFonts.lato(
                    fontSize: 26,
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
            child: InkWell(
              onTap: () {
                // TODO: IR PARA PÁGINA DE NOVO QUESTIONÁRIO
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
            ))
      ],
    );
  }

  AppBar _appBarHome() {
    return AppBar(
      elevation: 0,
      backgroundColor: kSecondaryColor,
      centerTitle: true,
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
