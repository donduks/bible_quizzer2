import 'rubi_home.dart';
import 'rubi_questions.dart';

class Brain {
  int _tracker = 0;
  final List<Question> _questionBank = [
    Question('God is good', true),
    Question('Solomond killed Goliath', false),
    Question('Jesus has 16 disciples', false),
    Question('Jesus is the saviour of the world', true),
    Question(' God hate sinners', false),
    Question('Baby Moses was found floating in a basket in the river ', true),
    Question(
        'The most important commandment is to love God and love our neighbors as ourselves',
        true),
    Question('The first man and woman on earth were named Noah and Eve', false),
    Question('Jesus prayed in the garden of eden', false),
    Question('Jesus died for the whole world', true),
    Question('I am a child of God', true),
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
