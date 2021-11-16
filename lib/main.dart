import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> ScoreKeeper = [];
  List<String> QuestionPaper = [
    'Pakistan is an Islamic country?',
    'Quaid-e-Azam is the founder of Pakistan',
    'ML has no role in future prediction.',
    'CS field is never gonna end?',
    'NTU is the best university in Fsd for CS',
     'Quiz Finished!'
  ];
  List<bool> solution = [
    true,
    true,
    false,
    true,
    true,
  ];

  int questionNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                QuestionPaper[questionNumber],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: FlatButton(
            color: Colors.green,
            child: Text(
              'True',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            onPressed: () {
              if (questionNumber < QuestionPaper.length - 1) {
                bool correctAnwer = solution[questionNumber];
                if (correctAnwer == true) {
                  setState(() {
                    ScoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                    questionNumber++;
                  });
                } else {
                  setState(() {
                    ScoreKeeper.add(Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                    questionNumber++;
                  });
                }
              }
            },
            ),
        ),
        SizedBox(height: 5),
        Expanded(
          child: FlatButton(
            color: Colors.red,
            child: Text(
              'False',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            onPressed: () {
              if (questionNumber < QuestionPaper.length - 1) {
                bool correctAnwer = solution[questionNumber];
                if (correctAnwer == false) {
                  setState(() {
                    ScoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                    questionNumber++;
                  });
                } else {
                  setState(() {
                    ScoreKeeper.add(Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                    questionNumber++;
                  });
                }
              }
            },
          ),
        ),
        Row(children: ScoreKeeper),
        SizedBox(height: 10),
      ],
    );
  }
}
