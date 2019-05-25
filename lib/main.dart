import 'package:flutter/material.dart';

import 'utils/margin_utils.dart';
import 'quizPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Awesome Quiz'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            customYMargin(50),
            Text('My Awesome Quiz',
                style: Theme.of(context).textTheme.headline),
            customYMargin(170),
            Text('High Score: $_counter',
                style: Theme.of(context).textTheme.body2),
                customYMargin(60),
                  _button() 
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _button() {
    return RaisedButton(
      child: Text('START QUIZ'),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizPage(),
          ),
        );
      },
    );
  }
}
