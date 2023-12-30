import 'question.dart';
import 'brain.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const Quiz());
}

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25),
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
  //int question_num = 0;
  //List<String> question = ['a','b'];
  //List<bool> answer = [true,false];

  //Question q1 = Question('ab', true);
  //Question q2 = Question('abc', false);

  //List<Question> questionbank = [Question('ab', true),
  //Question('abc', false)];

  Brain brain = Brain();
  List<Icon> marker = [];

  if_finish(){
    if(brain.alert == true) {

      marker=[];
      brain.reset();
      brain.alert = false;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Container(
            child: Center(
              child: Text(
                brain.get_ques(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: TextButton(
              onPressed: () {
                //here
                setState(() {
                  bool check = brain.ans_check(true);
                  if (check == true) {
                    marker.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  }
                  else{
                    marker.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  }
                  if_finish();
                });
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'TRUE',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: TextButton(
              onPressed: () {
                setState(() {
                  bool check = brain.ans_check(false);
                  if (check == true) {
                    marker.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  }
                  else{
                    marker.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  }
                  if_finish();
                });
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'FALSE',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: marker,
        ),
      ],
    );
  }
}

