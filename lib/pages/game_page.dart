import 'package:flutter/material.dart';
import 'package:tik_tac_toe/pages/home_page.dart';

import '../globals.dart' as globals;

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  void _showDialog(String dialogText) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text('Game Over'),
          content: Text(dialogText),
          actions: <Widget>[
            TextButton(
              child: Text("Home"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            // usually buttons at the bottom of the dialog
            TextButton(
              child: Text("Play Again"),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  globals.resetGlobals();
                });
              },
            ),
          ],
        );
      },
    );
  }

  Widget _displayTurn(String turnText) {
    return Container(
      child: Text(
        turnText,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      height: 100,
      padding: EdgeInsets.all(4),
    );
  }

  Widget _box(var index) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(100, 100),
          // maximumSize: const Size(00, 50),
        ),
        onPressed: () {
          setState(() {
            if (globals.isOTurn && globals.isValid(index)) {
              globals.oList.add(index);
              globals.boxText[index - 1] = "O";
              globals.availableButtonList.remove(index);
              globals.isOTurn = !globals.isOTurn;
            }
            if (!globals.isOTurn && globals.isValid(index)) {
              {
                globals.xList.add(index);
                globals.boxText[index - 1] = "X";
                globals.availableButtonList.remove(index);
                globals.isOTurn = !globals.isOTurn;
              }
            }
          });
          globals.checkWin();
          if (globals.oWins) _showDialog('O Wins');
          if (globals.xWins) _showDialog('X Wins');
          if (!globals.oWins &&
              !globals.xWins &&
              globals.availableButtonList.isEmpty) _showDialog('Draw');

          print(globals.oList);
          print(globals.xList);
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            globals.boxText[index - 1],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40), //  To maintain spacing

            ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 20.0,
                  maxHeight: 40.0,
                ),
                child: globals.isOTurn
                    ? _displayTurn('O turn')
                    : _displayTurn('X turn')),
            const SizedBox(height: 20), //  To maintain spacing
            SizedBox(
              height: 350,
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(9, (index) {
                  index++;
                  return Center(
                    child: _box(index),
                  );
                }),
              ),
            ),
            Row(
              children: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              icon: Icon(
                Icons.home,
                size: 40.0,
                textDirection: TextDirection.ltr,
                semanticLabel: 'Home',
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  globals.resetGlobals();
                });
              },
              icon: Icon(
                Icons.restart_alt_rounded,
                size: 40.0,
                textDirection: TextDirection.ltr,
                semanticLabel: 'Restart',
              ),
            ),

              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
  
          ],
        ),
      ),
    );
  }
}
