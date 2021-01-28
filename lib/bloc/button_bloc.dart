import 'dart:async';

import '../components/button_components.dart';

class ButtonBloc{

  ButtonComponents components = ButtonComponents();

  // ignore: close_sinks
  final _actionController = StreamController<String>();
//  入力だからSinkで値を受け取る。
  Sink<void> get increment=> _actionController.sink;

  // ignore: close_sinks
  final _stringController = StreamController<String>();
//  出力だからstreamで値を出力。
  Stream<String> get text => _stringController.stream;

  final _boolController = StreamController<bool>();
//  出力だからstreamで値を出力。
  Stream<bool> get flag => _boolController.stream;

  ButtonBloc(){
    _actionController.stream.listen((_) {
      if(components.text == 'STOP' && components.isMove == false){
        components.text = 'START';
        components.isMove = true;
        _stringController.sink.add(components.text);
        _boolController.sink.add(components.isMove);
      } else {
        components.text = 'STOP';
        components.isMove = false;
        _stringController.sink.add(components.text);
        _boolController.sink.add(components.isMove);
        print(flag);
      }
    });
  }

  void dispose() {
    _actionController.close();
    _stringController.close();
    _boolController.close();
  }

}