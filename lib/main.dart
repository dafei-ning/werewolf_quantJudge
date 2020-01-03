import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'category/catergories.dart';

import 'behavior/behaviorHomePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '湾区狼人杀',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 255, 255, 1),
        fontFamily: 'Quicksand',
        errorColor: Colors.red,
        textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: 'OpenSans',
              fontSize: 13,
            ),
            // body1: TextStyle(
            //   fontWeight: FontWeight.w400,
            //   fontFamily: 'OpenSans',
            //   fontSize: 13,
            // ),
            // body2: TextStyle(
            //   fontWeight: FontWeight.w400,
            //   fontFamily: 'OpenSans',
            //   fontSize: 20,
            // ),
            // 目前只应用在 Category
            display1: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: 'OpenSans',
              fontSize: 20,
            ),

            button: TextStyle(color: Colors.amber)),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      //home: BehaviorHomePage('狼人杀玩家行为量化记录'),
      home: CatergoriesScreen('湾区狼人杀'),
    );
  }
}
