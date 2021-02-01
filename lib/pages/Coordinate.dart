import 'package:flutter/material.dart';
import 'package:fluttertesttype/bloc/coordinate_bloc.dart';
import 'package:provider/provider.dart';

class Coordinate extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final coordinate = Provider.of<CoordinateBloc>(context);
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${coordinate.positionX.round()}', style: TextStyle(fontSize: 60.0),),
                Icon(Icons.close),
                Text('${coordinate.positionY.round()}', style: TextStyle(fontSize: 60.0),),
              ],
            ),
          ),
          GestureDetector(
            onPanUpdate: (DragUpdateDetails details) {
              coordinate.increment(details.localPosition.dx, details.localPosition.dy);
            },
            child: Container(width: double.infinity, height: double.infinity, color: Colors.transparent,),
          ),
        ],
      ),
    );
  }
}