import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _box(var index) {
    return ElevatedButton(
      onPressed: (){}, 
      child: Text("$index")
      );
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
          return Center(
            child: _box(index),
          );
        }),
      )),
    );
  }
}
