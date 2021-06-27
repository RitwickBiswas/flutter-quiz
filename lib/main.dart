import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion(){
    setState(() {
      if(_questionIndex >= 1) {
        _questionIndex = 0;
      } else {
        _questionIndex += 1;
      }
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    List questions = [
      {
        'question': 'What\'s your favorite color ?',
        'answer': ['Black', 'Red', 'Green', 'White'],
      },
      {
        'question': 'What\'s your favorite animal ?',
        'answer': ['Rabbit', 'Cat', 'Dog', 'Wolf'],
      },
    ] ;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personality Quiz'),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]['question'],),
          ...(questions[_questionIndex]['answer'] as List<String>).map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}