import 'package:flutter/material.dart';
import 'pages/tabs/Tabs.dart';

//引入路由组件
import 'routers/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Tabs(),
      //初始路由
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
    );
  }
}