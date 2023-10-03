import 'package:flutter/material.dart';
import 'package:namer_app/components/set_background.dart';

import '../../../utils/game_logics_medium.dart';
import 'info_card_medium.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MediumMemoryGame(),
    );
  }
}

class MediumMemoryGame extends StatefulWidget {
  const MediumMemoryGame({Key? key}) : super(key: key);

  @override
  _MediumMemoryGameState createState() => _MediumMemoryGameState();
}

class _MediumMemoryGameState extends State<MediumMemoryGame> {
  //setting text style
  TextStyle whiteText = TextStyle(color: Colors.black);
  bool hideTest = true;
  GameMedium _game = GameMedium();

  //game stats
  int tries = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _game.initGameMedium();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(padding: EdgeInsets.all(5), child: BackButton())
            ],
          ),
          // Center(
          //     child: Text(
          //         "Memory Game",
          //           style: TextStyle(
          //    fontSize: 48.0,
          //      fontWeight: FontWeight.bold,
          //        color: Color.fromARGB(255, 0, 0, 0),
          //        ),
          //        ),
          // ),
          SizedBox(
            height: 24.0,
          ),
          SizedBox(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                  itemCount: _game.gameImg!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 60.0,
                    mainAxisSpacing: 60.0,
                  ),
                  padding: EdgeInsets.all(60.0),
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
                                _game.gameImg![_game.matchCheck[0].keys.first] =
                                    _game.hiddenCardpath;
                                _game.gameImg![_game.matchCheck[1].keys.first] =
                                    _game.hiddenCardpath;
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
    );
  }
}
