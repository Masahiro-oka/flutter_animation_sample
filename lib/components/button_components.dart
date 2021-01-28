// ignore: must_be_immutable
class ButtonComponents {

  // ignore: non_constant_identifier_names
  Button(){
    _isMove = true;
    _text = 'STOP';
  }

  bool _isMove;
  String _text;

  // ignore: unnecessary_getters_setters
  get isMove => _isMove;
  // ignore: unnecessary_getters_setters
  get text => _text;

  // ignore: unnecessary_getters_setters
  set isMove(bool b){
    _isMove = b;
  }
  // ignore: unnecessary_getters_setters
  set text(String text){
    _text = text;
  }
}