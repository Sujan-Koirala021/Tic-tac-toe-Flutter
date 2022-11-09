import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tik_tac_toe/pages/game_page.dart';

import '../globals.dart' as globals;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  //  Route to GamePage
  void startGame() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => GamePage()));
  }

  void exitGame() {
    //  Exit the app
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  Widget _button(String buttonText) {
    return ElevatedButton(
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      onPressed: () {
        if (buttonText == 'Exit Game') {
          exitGame();
        } else {
          startGame();
        }
        globals.resetGlobals();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber[800],
        shape: StadiumBorder(),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Tic Tac Toe'),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            _button('Start Game'),
            _button('Exit Game'),
          ],
        ),
      ),
    );
  }
}
