import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:questions/utils/margin_utils.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'model/quizModel.dart';
import 'ui/quizUI.dart';
import 'widget/radioWidgets.dart';

class QuizPage extends StatefulWidget {
  QuizPage({Key key}) : super(key: key);
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var score = 0;
  QuizModel questions;
  List<Questions> questionList = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Swiper(
        loop: false,
         autoplay: false,
        itemBuilder: (BuildContext context, int i) {
          return QuizUI(
              length: questionList.length,
              currentNumber: i + 1,
              question: questionList[i]);
        },
        itemWidth: screenWidth,
         control: new SwiperControl(),
        pagination: new SwiperPagination(
            builder: FractionPaginationBuilder(
                activeColor: Colors.green,
                color: Colors.grey.withOpacity(0.8),
               )),
        itemCount: questionList.length,
      ),
    );
  }

  loadData() async {
    try {
      String data =
          await DefaultAssetBundle.of(context).loadString("assets/quiz.json");

      setState(() {
        questions = QuizModel.fromJson(json.decode(data));
        questionList = questions.questions;
      });
      /* for (var i = 0; i < questionsList.length; i++) {
                 
               } */

      // print('${questionList.toString()}');
    } catch (e) {
      print('${e.toString()}');
    }
  }
}
