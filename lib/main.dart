import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/home_page.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        //  App theme
        brightness: Brightness.dark,
        primaryColor: Colors.lightGreen[800],// Colors.amber[800]
      ),
    );
  }
}
