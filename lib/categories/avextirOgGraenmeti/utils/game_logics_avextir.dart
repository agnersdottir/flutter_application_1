import 'package:flutter/material.dart';

class Game {
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
  final String hiddenCardpath = "assets/memory/memorygamemedium.png";
  // ignore: non_constant_identifier_names
  List<String> cards_list = [
    "assets/segjumsaman/graenmeti/blaber.jpg",
    "assets/segjumsaman/graenmeti/tomatur.jpg",
    "assets/segjumsaman/graenmeti/epli.jpg",
    "assets/segjumsaman/graenmeti/tomatur.jpg",
    "assets/segjumsaman/graenmeti/blaber.jpg",
    "assets/segjumsaman/graenmeti/epli.jpg",
  ];
  final int cardCount = 6;
  List<Map<int, String>> matchCheck = [];

  //methods
  void initGame() {
    gameColors = List.generate(cardCount, (index) => hiddenCard);
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}
