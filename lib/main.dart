import 'package:flutter/material.dart';
import 'package:hello/screen/home_screen.dart';

void main() => runApp(Application());

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData.light()
          .copyWith(accentColor: Colors.white, primaryColor: Colors.teal[900]),
    );
  }
}
