import 'package:flutter/material.dart';

class GameHardAvextir {
  final Color hiddenCard = Colors.red;
  List<Color>? gameColors;
  List<String>? gameImg;
  List<Color> cards = [
    Colors.green,
    Colors.yellow,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.blue
  ];
  final String hiddenCardpath = "assets/memory/memorygamehard.png";
  // ignore: non_constant_identifier_names
  List<String> cards_list = [
    "assets/segjumsaman/islenskdyr/lundi.jpg",
    "assets/segjumsaman/islenskdyr/hakarl.jpg",
    "assets/segjumsaman/islenskdyr/hundur2.jpg",
    "assets/segjumsaman/islenskdyr/ugla.jpg",
    "assets/segjumsaman/islenskdyr/selur.jpg",
    "assets/segjumsaman/islenskdyr/hakarl.jpg",
    "assets/segjumsaman/islenskdyr/kyr.jpg",
    "assets/segjumsaman/islenskdyr/ugla.jpg",
    "assets/segjumsaman/islenskdyr/hundur2.jpg",
    "assets/segjumsaman/islenskdyr/kyr.jpg",
    "assets/segjumsaman/islenskdyr/lundi.jpg",
    "assets/segjumsaman/islenskdyr/selur.jpg",
  ];

  final int cardCount = 16;
  List<Map<int, String>> matchCheck = [];

  //methods
  void initGameHard() {
    gameColors = List.generate(cardCount, (index) => hiddenCard);
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}
