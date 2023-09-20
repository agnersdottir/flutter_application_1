import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/components/set_background.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../segjumsaman_game.dart';

class SegjumLitirGame extends StatefulWidget {
  @override
  _SegjumLitirState createState() => _SegjumLitirState();
}

class SegjumLitirOption {
  String name;
  AssetImage image;
  String displayText;

  SegjumLitirOption(
      {required this.name, required this.image, required this.displayText});
}

class _SegjumLitirState extends State<SegjumLitirGame> {
  List<SegjumLitirOption> segjumLitirOption = [
    SegjumLitirOption(
        name: "allColors",
        image: AssetImage("assets/segjumsaman/litir/allirlitir.jpg"),
        displayText: "Allir Litir"),
    SegjumLitirOption(
        name: "blue",
        image: AssetImage("assets/segjumsaman/litir/blar.jpg"),
        displayText: "Blár"),
    SegjumLitirOption(
        name: "green",
        image: AssetImage("assets/segjumsaman/litir/graenn.jpg"),
        displayText: "Grænn"),
    SegjumLitirOption(
        name: "yellow",
        image: AssetImage("assets/segjumsaman/litir/gulur.jpg"),
        displayText: "Gulur"),
    SegjumLitirOption(
        name: "red",
        image: AssetImage("assets/segjumsaman/litir/gulur.jpg"),
        displayText: "Rauður"),
    SegjumLitirOption(
        name: "green",
        image: AssetImage("assets/segjumsaman/litir/graenn.jpg"),
        displayText: "Grænn"),
  ];
  String _currentLitir = "allirlitir";
  AssetImage _currentLitirImage =
      AssetImage("assets/segjumsaman/litir/allirlitir.jpg");
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
  }

  selectLitir(String litir, AssetImage litirImage, String displayText) async {
    await player.stop();
    await player.play(AssetSource("segjumsaman/sounds/$litir.wav"));

    setState(() {
      _currentLitir = displayText;
      _currentLitirImage = litirImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SetBackground(
            child: Column(children: [
      Row(
        children: [Container(padding: EdgeInsets.all(24), child: BackButton())],
      ),
      Expanded(
          child: GridView.extent(
              maxCrossAxisExtent: 400,
              padding: EdgeInsets.only(left: 50, right: 50, top: 0, bottom: 0),
              mainAxisSpacing: 60,
              crossAxisSpacing: 90,
              childAspectRatio: 2 / 2,
              children: [
            for (var item in segjumLitirOption)
              GestureDetector(
                  onTap: () =>
                      {selectLitir(item.name, item.image, item.displayText)},
                  child: Image(image: item.image)),
          ])),
    ])));
  }
}
