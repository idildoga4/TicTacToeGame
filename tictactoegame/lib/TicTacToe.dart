import 'package:flutter/material.dart';

class TicTacToeGame extends StatefulWidget
{
  const TicTacToeGame({super.key});
  @override
  State<TicTacToeGame> createState()=>_TicTacToeGameState();
}
class _TicTacToeGameState extends State<TicTacToeGame>
{
  List<List<String>>? _board;
  bool? _isXNext;
  bool _isDarkModeEnabled=false;
  final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    
  );
  final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    
  );

   @override
  void initState()
  {
      super.initState();
      _initializeBoard();
    
  }

  void _initializeBoard()
  {
    setState(() {
      _board =List.generate(3, (i) => List.generate(3,(j)=>''));
      _isXNext=true;
    });
  }

  void _showDialog(String title, String message)
  {
    showDialog(
      context:context,
      builder:(BuildContext context)
      {
        return AlertDialog(
          title: Text(title),
          content:Text(message),
          actions:[
            TextButton(
              onPressed: ()
              {
                Navigator.of(context).pop();
              },
              child:const Text('OK'),
            ),
          ]
        );
      }
    );
  }
  bool _checkWinner(int row,int col)
  {
    if(_board![row][0]== _board![row][1] && 
    _board![row][1]==_board![row][2]&&
    _board![row][0].isNotEmpty)
    {
      return true;
    }
    if(_board![0][col]==_board![1][col]&&
    _board![1][col]==_board![2][col]&&
     _board![0][col].isNotEmpty)
    {
      return true;
    }
    if((row==col || row+col==2) &&
    ((_board![0][0] == _board![1][1] && _board![1][1]==_board![2][2])||
    (_board![0][2]==_board![1][1] && _board![1][1]==_board![2][0])) &&
    _board![1][1].isNotEmpty
    )
    {
      return true;
    }
    return false;
  }
  bool _isBoardFull()
  {
    for(var i=0;i<3;i++)
    {
      for(var j=0;j<3;j++)
      {
        if(_board![i][j].isEmpty)
        {
          return false;
        }
      }
    }
    return true;
  }
  void _handleTap(int row,int col)
  {
    if(_board![row][col].isEmpty)
    {
      setState(() {

      
      if(_isXNext!)
      {
        _board![row][col]='X';
      }
      else{
        _board![row][col]='0';
      }
      _isXNext=!_isXNext!;
    });
    if(_checkWinner(row, col))
    {
      _showDialog('${_board![row][col]} Wins!', 'Congratulations');
      _initializeBoard();
    }
    else if(_isBoardFull())
    {
      _showDialog('It\'s a draw', 'Try again');
      _initializeBoard();
    }
    
  }
  }

 
  
  
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
          child:Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children:[
             Text(
            _isXNext!=null? (_isXNext!?'Player X\'s turn' : 'Player 0\'s turn' ):'',
            style: const TextStyle(fontSize:20.0),
            textAlign:TextAlign.center,
             
          ),
          const SizedBox(height:16.0),
          AspectRatio(aspectRatio: 1.0,
          child:GridView.builder( 
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: 9,
            itemBuilder: (context,index)
            {
              int row=index~/3;
              int col=index%3;
              return GestureDetector(
                onTap:()=>_handleTap(row, col),
                child:Container(
                  decoration: BoxDecoration(border: Border.all(color:Colors.black),
                  ),
                  child: Center(
                    child:Text(
                      _board!=null&&_board![row][col]!= null?_board![row][col]:' ',
                      style:const TextStyle(fontSize:40.0),
                    ),
                  ),
                )
              );
            }
          ),
          ),
          ],
          ),
  

        ),
      ),
  
    );
  }
}
