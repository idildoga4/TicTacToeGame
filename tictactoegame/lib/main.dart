import 'package:flutter/material.dart';
import 'package:tictactoegame/TicTacToe.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'Tic Tac Toe',
      
      
      
      home:TicTacToeGame(),
    );
  }
}