import 'package:flutter/material.dart';
import 'package:namer_app/utils/game_logics_hard.dart';

import '../../../../../components/set_background.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HardMemoryGameDyrin(),
    );
  }
}

class HardMemoryGameDyrin extends StatefulWidget {
  const HardMemoryGameDyrin({Key? key}) : super(key: key);

  @override
  _HardMemoryGameDyrinState createState() => _HardMemoryGameDyrinState();
}

class _HardMemoryGameDyrinState extends State<HardMemoryGameDyrin> {
  //setting text style
  TextStyle whiteText = TextStyle(color: Colors.black);
  bool hideTest = true;
  GameHard _game = GameHard();

  //game stats
  int tries = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _game.initGameHard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SetBackground(
        child: Column(
          children: [
            Row(
              children: [
                Container(padding: EdgeInsets.all(24), child: BackButton())
              ],
            ),
            SizedBox(
              height: 24.0,
            ),
            SizedBox(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                    itemCount: _game.gameImg!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    padding: EdgeInsets.all(10.0),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          print(_game.matchCheck);
                          setState(() {
                            //incrementing the clicks
                            tries++;
                            _game.gameImg![index] = _game.cards_list[index];
                            _game.matchCheck
                                .add({index: _game.cards_list[index]});
                            print(_game.matchCheck.first);
                          });
                          if (_game.matchCheck.length == 2) {
                            if (_game.matchCheck[0].values.first ==
                                _game.matchCheck[1].values.first) {
                              print("true");
                              //incrementing the score
                              score += 100;
                              _game.matchCheck.clear();
                            } else {
                              print("false");

                              Future.delayed(Duration(milliseconds: 500), () {
                                print(_game.gameColors);
                                setState(() {
                                  _game.gameImg![_game.matchCheck[0].keys
                                      .first] = _game.hiddenCardpath;
                                  _game.gameImg![_game.matchCheck[1].keys
                                      .first] = _game.hiddenCardpath;
                                  _game.matchCheck.clear();
                                });
                              });
                            }
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 253, 253, 252),
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage(_game.gameImg![index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
