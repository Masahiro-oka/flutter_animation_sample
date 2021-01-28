import 'package:flutter/material.dart';
import 'package:fluttertesttype/bloc/button_bloc.dart';
import 'package:provider/provider.dart';
import 'pages/my_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Provider(
          create: (context) => ButtonBloc(),
          dispose: (context, value) => value.dispose(),
          child: MyHomePage()
      ),
    );
  }
}
