import 'package:flutter/material.dart';
import 'package:fluttertesttype/bloc/button_bloc.dart';
import 'package:fluttertesttype/bloc/coordinate_bloc.dart';
import 'package:fluttertesttype/pages/Coordinate.dart';
import 'package:provider/provider.dart';
import 'pages/my_home_page.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          Provider(
            create: (context) => ButtonBloc(),
            dispose: (context, value) => value.dispose(),
          ),
          ChangeNotifierProvider(
            create: (context) => CoordinateBloc(),
          )
        ],
          child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
//        '/'←これを設定する時はhomeを記述しなくても、初期ページが設定される。
        '/' : (BuildContext context) => MyHomePage(),
        '/1' : (BuildContext context) => Coordinate(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
//      home: MyHomePage(),
    );
  }
}
