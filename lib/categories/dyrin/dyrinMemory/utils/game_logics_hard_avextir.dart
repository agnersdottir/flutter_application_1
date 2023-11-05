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
    "assets/segjumsaman/graenmeti/kiwi.jpg",
    "assets/segjumsaman/graenmeti/tomatur.jpg",
    "assets/segjumsaman/graenmeti/epli.jpg",
    "assets/segjumsaman/graenmeti/agurka.jpg",
    "assets/segjumsaman/graenmeti/kiwi.jpg",
    "assets/segjumsaman/graenmeti/avakado.jpg",
    "assets/segjumsaman/graenmeti/jardaber.jpg",
    "assets/segjumsaman/graenmeti/agurka.jpg",
    "assets/segjumsaman/graenmeti/tomatur.jpg",
    "assets/segjumsaman/graenmeti/epli.jpg",
    "assets/segjumsaman/graenmeti/appelsina.jpg",
    "assets/segjumsaman/graenmeti/blaber.jpg",
    "assets/segjumsaman/graenmeti/jardaber.jpg",
    "assets/segjumsaman/graenmeti/appelsina.jpg",
    "assets/segjumsaman/graenmeti/avakado.jpg",
    "assets/segjumsaman/graenmeti/blaber.jpg",
  ];
  final int cardCount = 16;
  List<Map<int, String>> matchCheck = [];

  //methods
  void initGameHard() {
    gameColors = List.generate(cardCount, (index) => hiddenCard);
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}
