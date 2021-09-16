import 'package:flutter/material.dart';
import 'game_painter.dart';
import 'nought_mark.dart';
import 'mark.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TicTacToe(),
    );
  }
}

class TicTacToe extends StatefulWidget {
  const TicTacToe({Key? key}) : super(key: key);

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  Map<int, Mark> _gameMarks = Map();
  Mark _currentMark = NoughtMark();

  bool _addMark(
      {required double x,
      required double y,
      required BoxConstraints constraints}) {
    bool wasVacant = false;  

    if (_gameMarks.length >= 9) {
    } else {
      double _dividedSize = constraints.maxWidth / 3.0;
      int index = (x ~/ _dividedSize + (y ~/ _dividedSize) * 3).toInt();

      if (_gameMarks.containsKey(index) == false) {
        wasVacant = true;
        _gameMarks[index] = _currentMark;
      }
    }

    return wasVacant;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1.0,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return GestureDetector(
                onTapUp: (TapUpDetails details) {
                  setState(() {
                    _addMark(
                        x: details.localPosition.dx,
                        y: details.localPosition.dy,
                        constraints: constraints);
                  });
                },
                child: CustomPaint(
                  painter: GamePainter(_gameMarks),
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
