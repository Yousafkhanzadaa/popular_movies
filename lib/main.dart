import 'package:flutter/material.dart';
import 'package:popular_movies/screens/movies_screen.dart';

void main() {
  runApp(const MobieApp());
}

class MobieApp extends StatelessWidget {
  const MobieApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightBlue[800],
      ),
      home: const MovieScreen(),
    );
  }
}
