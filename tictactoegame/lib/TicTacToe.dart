import 'package:flutter/material.dart';

class TicTacToeGame extends StatefulWidget
{
  const TicTacToeGame({super.key});
  @override
  State<TicTacToeGame> createState()=>_TicTacToeGameState();
}
class _TicTacToeGameState extends State<TicTacToeGame>
{
  bool _isDarkModeEnabled=false;
  final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    
  );

  // Define dark theme
  final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkModeEnabled ? _darkTheme : _lightTheme,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(_isDarkModeEnabled ? Icons.light_mode : Icons.dark_mode),
              onPressed: () {
                setState(() {
                  _isDarkModeEnabled = !_isDarkModeEnabled;
                });
              },
            ),
          ],
        ),
        body: Center(
          child: Text('Your Content Here'),
        ),
      ),
    );
  }
}
