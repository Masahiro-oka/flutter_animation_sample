import 'package:flutter/material.dart';

class AnimateControl extends StatelessWidget {
//  コンストラクタの生成。名前付きコンストラクタとAutomatic field initializationとRedirecting Constructorsが使われている。
//　Automatic field initializationとは、thisでそのまま引数に値を持ってこれること。
//　名前付きコンストラクタとは{}で囲んだ引数に対して、必ず代入しないといけない値ではない。任意。
//  Redirecting Constructorsとはコンストラクタの後に:をつけて他のコンストラクタを指定することでリダイレクトすることができる。こうしないとfinalに値を代入できない。(Initializerと言う機能)
  AnimateControl({this.controller}) :
        sizeAnimation = Tween<double>(begin: 0.0,end: 300.0).animate(CurvedAnimation(parent: controller,curve: Interval(0,0.9,curve: Curves.ease))),
        colorAnimation = ColorTween(begin: Colors.blue,end: Colors.green).animate(CurvedAnimation(parent: controller,curve: Interval(0.1,0.1,curve: Curves.ease)));

  final Animation<double> controller;
  final Animation<double> sizeAnimation;
  final Animation<Color> colorAnimation;

  Widget _buildAnimation(BuildContext context,Widget child){
    return Center(
        child: Container(
          width: sizeAnimation.value,
          height: sizeAnimation.value,
          decoration: BoxDecoration(color: colorAnimation.value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}
