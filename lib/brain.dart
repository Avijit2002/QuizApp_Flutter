import 'question.dart';

int _question_num = 0;

class Brain {
  List<Question> _questionbank = [    //private property
    Question('ab', true),
    Question('abc', false),
    Question('abcd', false),
    Question('abcde', false)
  ];

  String get_ques(){                // used to get data from private property and send it to main.dart
    return _questionbank[_question_num].q;
    //bool ans = _questionbank[question_num].a;
  }

  bool get_ans(){               // used to get data from private property and send it to main.dart
    return _questionbank[_question_num].a;
    //bool ans = questionbank[question_num].a;
  }


  change_ques()
  {
    _question_num++;
  }
  bool alert = false;
  is_finish(){
    if(_question_num == _questionbank.length)
      {
        alert = true;
      }
  }
  reset()
  {
    _question_num=0;
  }

  bool ans_check(bool user_ans){
    if(user_ans == get_ans())
    {
      change_ques();
      is_finish();
      return true;
    }
    else{
      change_ques();
      is_finish();
      return false;
    }


  }
}