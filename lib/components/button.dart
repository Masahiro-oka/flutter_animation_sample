import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/button_bloc.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {

  final AnimationController controller;
//  名前付き引数を入力必須に。
  const Button({@required this.controller});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ButtonBloc>(context);
//    一応実装できるけど、これはよくないか…。rxdartを使うべきやな。
    return StreamBuilder(
        initialData: 'STOP',
        stream: bloc.text,
        builder: (context, snapshot1) {
          return StreamBuilder(
              initialData: true,
              stream: bloc.flag,
              builder: (context, snapshot2) {
                return RaisedButton(
                  child: Text(snapshot1.data),
                  onPressed: () {
                    bloc.increment.add(null);
                    if (snapshot2.data) {
                      controller.reset();
                    } else {
                      controller.stop();
                    }
                  }
                );
              }
          );
        }
    );
  }
}
