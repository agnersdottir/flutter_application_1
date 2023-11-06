import 'package:flutter/material.dart';

class GameHardDyr {
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
    "assets/segjumsaman/islenskdyr/hahyrningur1.jpg",
    "assets/segjumsaman/islenskdyr/fulg.jpg",
    "assets/segjumsaman/islenskdyr/kyr.jpg",
    "assets/segjumsaman/islenskdyr/isbjorn.jpg",
    "assets/segjumsaman/islenskdyr/api.jpg",
    "assets/segjumsaman/islenskdyr/fulg.jpg",
    "assets/segjumsaman/islenskdyr/ljon.jpg",
    "assets/segjumsaman/islenskdyr/kottur.jpg",
    "assets/segjumsaman/islenskdyr/hahyrningur1.jpg",
    "assets/segjumsaman/islenskdyr/pig.jpg",
    "assets/segjumsaman/islenskdyr/kyr.jpg",
    "assets/segjumsaman/islenskdyr/pig.jpg",
    "assets/segjumsaman/islenskdyr/api.jpg",
    "assets/segjumsaman/islenskdyr/isbjorn.jpg",
    "assets/segjumsaman/islenskdyr/ljon.jpg",
    "assets/segjumsaman/islenskdyr/kottur.jpg",
  ];

  final int cardCount = 16;
  List<Map<int, String>> matchCheck = [];

  //methods
  void initGameHard() {
    gameColors = List.generate(cardCount, (index) => hiddenCard);
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}
