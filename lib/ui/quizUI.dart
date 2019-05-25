import 'package:flutter/material.dart';
import 'package:questions/model/quizModel.dart';
import 'package:questions/utils/margin_utils.dart';
import 'package:questions/widget/radioWidgets.dart';

class QuizUI extends StatefulWidget {
  final Questions question;
  final length;
  final currentNumber;
  final score;

  QuizUI({Key key, @required this.question, @required this.currentNumber, @required this.length, this.score})
      : super(key: key);

  _QuizUIState createState() => _QuizUIState();
}

class _QuizUIState extends State<QuizUI> {
  List<RadioModel> sampleData = new List<RadioModel>();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App')
      ),
      body: _buildUI(),
    );
  }

  _buildUI() {
    return Padding(
      padding: const EdgeInsets.all(38.0),
      child: Column(
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Score: ${widget.score}'),
                      customYMargin(5),
                      Text('Question: ${widget.currentNumber}/${widget.length}'),
                    ]),
                customXMargin(20),
                Text('00:30', style: Theme.of(context).textTheme.display1),
              ]),
          customYMargin(20),
          _buildQuestion(),
          customYMargin(20),
          Container(
            height: (MediaQuery.of(context).size.height * 0.45),
            child: Column(
              children: <Widget>[
                Flexible(child: _buildOptions()),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildQuestion() {
    return Container(
      child: Text(widget.question != null ? '${widget.question.question}' : '',
          style: TextStyle(fontSize: 22, color: Colors.black)),
    );
  }

  _buildOptions() {
    return ListView.builder(
      itemCount: sampleData.length,
      itemBuilder: (BuildContext context, int index) {
        return new InkWell(
          //highlightColor: Colors.red,
          splashColor: Colors.blueAccent,
          onTap: () {
            setState(() {
              sampleData.forEach((element) => element.isSelected = false);
              sampleData[index].isSelected = true;
            });
          },
          child: new RadioItem(sampleData[index]),
        );
      },
    );
  }

  loadData() async {
    sampleData.add(new RadioModel(false, 'A', '${widget.question.options.a}'));
    sampleData.add(new RadioModel(false, 'B', '${widget.question.options.b}'));
    sampleData.add(new RadioModel(false, 'C', '${widget.question.options.c}'));
    sampleData.add(new RadioModel(false, 'D', '${widget.question.options.d}'));
  }
}
