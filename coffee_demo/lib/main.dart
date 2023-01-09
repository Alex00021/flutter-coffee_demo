import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screens/MyHomePage.dart';

void main() {
  runApp(const MyApp());

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  SystemUiOverlayStyle systemUiOverlayStyle =
  const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }

}