import 'package:flutter/cupertino.dart';

class CoordinateBloc extends ChangeNotifier {

  double positionX = 0;
  double positionY = 0;

  void increment(x,y){
    positionX = x;
    positionY = y;
    notifyListeners();
  }
}