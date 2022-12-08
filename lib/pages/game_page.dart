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
      barrierDismissible: false,  //  make AlertDialog not closable by clicking outside.
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
          // fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      // height: 50,
      padding: EdgeInsets.all(4),
    );
  }

  Widget _box(var index) {
    return Container(
      width: 10,
      height: 10,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey[600],
        ),
        onPressed: () {
          setState(() {
            if (globals.isOTurn && globals.isValid(index)) {
              globals.oList.add(index);
              globals.boxText[index - 1] = "O";
              globals.availableButtonList.remove(index);
              globals.isOTurn = !globals.isOTurn;
              globals.checkWin();
            }
            if (!globals.isOTurn && globals.isValid(index)) {
              {
                globals.xList.add(index);
                globals.boxText[index - 1] = "X";
                globals.availableButtonList.remove(index);
                globals.isOTurn = !globals.isOTurn;
                globals.checkWin();
              }
            }
          });
          if (globals.oWins) {
            _showDialog('O Wins');
          }

          if (globals.xWins) {
            _showDialog('x Wins');
          }

          if (globals.availableButtonList.isEmpty &&
              !globals.oWins &&
              !globals.xWins) {
            _showDialog('Draw');
          }
        },
        child: Text(
          globals.boxText[index - 1],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ConstrainedBox(
              // constraints: BoxConstraints.expand(height: 200, width: 200),

              constraints: const BoxConstraints(
                minHeight: 50.0,
                // maxHeight: 40.0,
              ),
              child: globals.isOTurn
                  ? _displayTurn('O turn')
                  : _displayTurn('X turn')),
          // const SizedBox(height: 5), //  To maintain spacing
          Container(
            width: 400,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              // height: MediaQuery.of(context).size.height - 69,
              child: GridView.count(
                // childAspectRatio: 3 / 2,

                // physics: NeverScrollableScrollPhysics(),
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: List.generate(9, (index) {
                  index++;
                  return _box(index);
                }),
              ),
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
                  size: 30.0,
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
                  size: 30.0,
                  textDirection: TextDirection.ltr,
                  semanticLabel: 'Restart',
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        ],
      ),
    );
  }
}
