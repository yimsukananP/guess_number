import 'package:flutter/material.dart';
import 'package:guess_number/game.dart';

// ignore_for_file: prefer_const_constructors
class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _controller = TextEditingController();
  final _game = Game(maxRandom: 100);
  var _feedbackText = '';
  var space = 10.0;

  // static const space = 10.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          // remove this widget
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            title: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.rectangle,
                  ),
                  child: const Icon(
                    // const ไม่ได้ถูกกำหนดเป็นตัวเเปร เเต่เป็นค่าคงที่
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
                //SizedBox(width:10),   // Container()
                Padding(
                  padding: EdgeInsets.all(space),
                  child: Text('GUESS THE NUMBER'),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Center(
                          child: Text(
                            'Please quess the number between 1 and 100',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center, // center text
                          ),
                        ),
                      ),
                      TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter guess',
                        ),
                      ),
                      //Expanded(flex:1, child:Button);  อัตราส่วน flex
                      OutlinedButton(
                        onPressed: () {
                          // การทำงานเมื่อปุ่มถูกกด
                          var input = _controller.text;
                          var guess = int.tryParse(input);

                          var result = _game.doGuess(guess!);
                          if (result == GuessResult.correct) {
                            setState(() {
                              _feedbackText = 'Correct!';
                            });
                          } else if (result == GuessResult.tooHigh) {
                            setState(() {
                              _feedbackText = 'Too hight,please try again!';
                            });
                          } else {
                            setState(() {
                              _feedbackText = 'Too low,please try again!';
                            });
                          }
                        },
                        child: Text('GUESS'),
                      )
                    ]),
              ),
              Text(_feedbackText),
            ],
          ),
        ));
  }
}
