import 'package:flutter/material.dart';

import '../globals.dart' as globals;

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  Widget _box(var index) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(100, 100),
          // maximumSize: const Size(00, 50),
        ),
        onPressed: () {
          setState(() {
            if (globals.isOTurn) {
              globals.oList.add(index);
              globals.boxText[index - 1] = "O";
            } else {
              globals.xList.add(index);
              globals.boxText[index - 1] = "X";
            }
            globals.isOTurn = !globals.isOTurn;
          });
          globals.checkWin();
          print(globals.oList);
          print(globals.xList);
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(globals.boxText[index - 1]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Tic Tac Toe'),
        ),
      ),
      body: Center(
          child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(9, (index) {
          index++;
          return Center(
            child: _box(index),
          );
        }),
      )),
    );
  }
}
