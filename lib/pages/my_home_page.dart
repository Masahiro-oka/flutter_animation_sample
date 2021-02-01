import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/animate_controller.dart';
import '../components/button.dart';
import 'package:fluttertesttype/bloc/button_bloc.dart';
import 'package:fluttertesttype/components/button_components.dart';


class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
//  SingleTickerProviderStateMixinはアニメーション時の無駄な描画を防ぐ。これを下のvsyncでthisと記述することで渡せる。（対象のstateにTickerProviderを渡す）

  ButtonComponents components = ButtonComponents();
  AnimationController controller;
//  Animation animation;

//  Tweenでanimationさせたい対象物の始まりと終わりの値を指定できる。
//  final tweenSize = Tween(begin: 0.0, end: 300.0);
//  final tweenColor = ColorTween(begin: Colors.blue, end: Colors.green);
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000,))
//    下記の説明。AnimationControllerが作られるたびに、状態変化を再描画する必要があるので、addListener内でsetstateする必要がある。provider使って管理した方が良いかな。AnimatedBuilderを使うことでaddListenerは必要なくなる。
//      ..addListener(() {setState(() {});})
//    controller.addListener(() { });←上でカスケード表記（..）で記述することで左のように書かなくても続けて記入することができる。

//     addStatusListenerは開始、停止、方向の反転など、アニメーションの状態の変化を通知するために使用する。
      ..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
//    animation = CurvedAnimation(parent: controller, curve: Curves.ease);
//    forward()はアニメーション開始。init内なので、アプリの立ち上がりと共に動き出す。
    controller.forward();
    super.initState();
  }

//  animationでは下記のdisposeを記述しないと、メモリリークを起こす。
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ButtonBloc>(context);
//    速度をdefoltのspeed/代入している値になる。下だったらデフォルト/2の速さになっている。
//    timeDilation = 2.0;
    return Container(
      height: double.infinity,
      child: Column(
            children: [
              Expanded(child: Container(),),
              Center(
                  child: AnimateControl(controller: controller)
              ),
              Expanded(child: Container(),),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 70,
                  color: Colors.white,
                  child: Material(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button(controller: controller),
                        RaisedButton(
                          child: Text('Go to Coordinate'),
                          onPressed: () => Navigator.of(context).pushNamed('/1'),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
    );
  }
}
