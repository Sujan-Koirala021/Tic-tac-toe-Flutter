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
      onPressed: () {
        if (buttonText == 'Exit Game') {
          exitGame();
        } else {
          startGame();
        }
        globals.resetGlobals();
      },

      child :Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
        child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      ),

      
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red[200],
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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green[400],
      ),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _button('Start Game'),
            const SizedBox(height : 30),
            _button('Exit'),
          ],
        ),
      ),
    );
  }
}
