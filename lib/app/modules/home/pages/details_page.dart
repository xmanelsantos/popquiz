import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:popquiz/app/modules/quiz/models/result.dart';
import 'package:popquiz/app/modules/quiz/models/result_manager.dart';
import 'package:popquiz/constants/constants.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    String formatDate(DateTime date) {
      return '${date.day}/${date.month}/${date.year}, ${date.hour}:${date.minute}';
    }

    final Size size = MediaQuery.of(context).size;
    return Consumer<ResultManager>(builder: (_, resultManager, __) {
      Result result = resultManager.selectedResult;
      return Scaffold(
        appBar: _appBarDetails(),
        body: Column(
          children: [
            _headerWithTitle(size, result),
            SizedBox(height: size.height * 0.02),
            Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: result.answers.length,
                  itemBuilder: (_, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                          const BoxShadow(
                            color: Colors.white,
                            blurRadius: 7,
                            offset: Offset(0, -3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(kDefaultPadding * 1.5),
                      margin: const EdgeInsets.symmetric(
                          vertical: kDefaultPadding * 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '${index + 1}. ${result.questions[index]}',
                            style: GoogleFonts.roboto(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w500,
                              color: kPrimaryColor,
                            ),
                          ),
                          Text(
                            result.answers[index],
                            style: GoogleFonts.roboto(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w500,
                              color: kSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: size.height * 0.02),
                Text(
                  'Respondido em ${formatDate(result.createdAt)}',
                  style: GoogleFonts.roboto(
                    fontSize: size.width * 0.03,
                    color: Colors.black38,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
              ],
            )
          ],
        ),
      );
    });
  }

  Container _headerWithTitle(Size size, Result result) {
    return Container(
      width: size.width,
      height: size.height * 0.2,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quiz:',
              style: GoogleFonts.lato(
                fontSize: size.height * 0.03,
                color: kBgLightColor,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              result.title,
              style: GoogleFonts.lato(
                fontSize: size.height * 0.05,
                color: kBgLightColor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBarDetails() {
    return AppBar(
      title: Text(
        'Histórico de respostas',
        style: GoogleFonts.lato(color: kBgLightColor, fontSize: 25),
      ),
      elevation: 0,
      iconTheme: const IconThemeData(color: kBgLightColor),
      centerTitle: true,
      backgroundColor: kSecondaryColor,
    );
  }
}
