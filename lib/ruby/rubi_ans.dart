import 'rubi_home.dart';
import 'rubi_questions.dart';

class Brain {
  int _tracker = 0;
  final List<Question> _questionBank = [
    Question('The Old Testament is bigger than the New Testament', true),
    Question('The Old Testament was written in Greek', false),
    Question('The final book in the Old Testament is Malachi', true),
    Question('The  Gospel According to Luke was written by a doctor', true),
    Question(' Jesus teach the Lords Prayer to the pharasees', false),
    Question('There are 36 books in the New Testament ', false),
    Question('The gospel of John is the fouth book of the new testament', true),
    Question(
        'The Last Supper was the final meal Jesus shared with his disciples before his crucifixion',
        true),
    Question('Jesus was born in Jerusalem', false),
    Question('King Solomon was known for his wisdom and wealth', true),
    Question('Joshua led the Israelites out of Egypt', false),
  ];

  void nextQuestion() {
    if (_tracker < _questionBank.length - 1) {
      _tracker++;
    }
  }

  String getQuestions() {
    return _questionBank[_tracker].questionText;
  }

  bool getAnswer() {
    return _questionBank[_tracker].questionAnswer;
  }

  bool isFinished() {
    if (_tracker >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _tracker = 0;
    markss = 0;
  }
}
