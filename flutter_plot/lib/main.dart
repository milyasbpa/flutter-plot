import 'package:flutter/material.dart';
import 'package:flutter_plot/homepage.dart';
import 'package:flutter_plot/routes.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(GetMaterialApp(getPages: routes()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
