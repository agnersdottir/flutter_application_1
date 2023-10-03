import 'package:flutter/material.dart';

class GameMedium {
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
  final String hiddenCardpath =
      "/Users/berglind/development/flutter_application_1/assets/memory/memorygameeasy.png";
  // ignore: non_constant_identifier_names
  List<String> cards_list = [
    "/Users/berglind/development/flutter_application_1/assets/memory/regnbogi.png",
    "/Users/berglind/development/flutter_application_1/assets/memory/mushroom.png",
    "/Users/berglind/development/flutter_application_1/assets/memory/regnbogi.png",
    "/Users/berglind/development/flutter_application_1/assets/memory/mushroom.png",
  ];
  final int cardCount = 4;
  List<Map<int, String>> matchCheck = [];

  //methods
  void initGameMedium() {
    gameColors = List.generate(cardCount, (index) => hiddenCard);
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}
