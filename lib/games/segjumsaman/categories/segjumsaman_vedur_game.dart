import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/components/set_background.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../segjumsaman_game.dart';

class SegjumVedurGame extends StatefulWidget {
  @override
  _SegjumVedurState createState() => _SegjumVedurState();
}

class SegjumVedurOption {
  String name;
  AssetImage image;
  String displayText;

  SegjumVedurOption(
      {required this.name, required this.image, required this.displayText});
}

class _SegjumVedurState extends State<SegjumVedurGame> {
  List<SegjumVedurOption> segjumVedurOption = [
    SegjumVedurOption(
        name: "grass",
        image: AssetImage("assets/segjumsaman/vedur/grass.jpeg"),
        displayText: "Allir Litir"),
    SegjumVedurOption(
        name: "regnbogi",
        image: AssetImage("assets/segjumsaman/vedur/regnbogi.jpeg"),
        displayText: "Blár"),
    SegjumVedurOption(
        name: "sky",
        image: AssetImage("assets/segjumsaman/vedur/sky.jpg"),
        displayText: "Grænn"),
    SegjumVedurOption(
        name: "snjor",
        image: AssetImage("assets/segjumsaman/vedur/snjor.jpg"),
        displayText: "Gulur"),
    SegjumVedurOption(
        name: "sol",
        image: AssetImage("assets/segjumsaman/vedur/sol.jpeg"),
        displayText: "Rauður"),
    SegjumVedurOption(
        name: "rigning",
        image: AssetImage("assets/segjumsaman/vedur/rigning.jpg"),
        displayText: "Grænn"),
  ];
  String _currentVedur = "sol";
  AssetImage _currentVedurImage =
      AssetImage("assets/segjumsaman/vedur/sol.jpeg");
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
  }

  selectHusid(String vedur, AssetImage vedurImage, String displayText) async {
    await player.stop();
    await player.play(AssetSource("segjumsaman/sounds/$vedur.wav"));

    setState(() {
      _currentVedur = displayText;
      _currentVedurImage = vedurImage;
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
            for (var item in segjumVedurOption)
              GestureDetector(
                  onTap: () =>
                      {selectHusid(item.name, item.image, item.displayText)},
                  child: Image(image: item.image)),
          ])),
    ])));
  }
}
