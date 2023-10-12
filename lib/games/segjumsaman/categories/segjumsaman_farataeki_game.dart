import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/components/set_background.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../segjumsaman_game.dart';

class SegjumFarataekiGame extends StatefulWidget {
  @override
  _SegjumFarataekiState createState() => _SegjumFarataekiState();
}

class SegjumFarataekiOption {
  String name;
  AssetImage image;
  String displayText;

  SegjumFarataekiOption(
      {required this.name, required this.image, required this.displayText});
}

class _SegjumFarataekiState extends State<SegjumFarataekiGame> {
  List<SegjumFarataekiOption> segjumFarataekiOption = [
    SegjumFarataekiOption(
        name: "bill",
        image: AssetImage("assets/segjumsaman/farataeki/bill.jpg"),
        displayText: "Bíll"),
    SegjumFarataekiOption(
        name: "flugvel",
        image: AssetImage("assets/segjumsaman/farataeki/flugvel.jpg"),
        displayText: "Flugvél"),
    SegjumFarataekiOption(
        name: "lest",
        image: AssetImage("assets/segjumsaman/farataeki/lest.jpg"),
        displayText: "Lest"),
    SegjumFarataekiOption(
        name: "hjol",
        image: AssetImage("assets/segjumsaman/farataeki/hjol.jpg"),
        displayText: "Hjól"),
    SegjumFarataekiOption(
        name: "skemmtiferdaskip",
        image: AssetImage("assets/segjumsaman/farataeki/skip.jpg"),
        displayText: "Skemmtiferðarskip"),
    SegjumFarataekiOption(
        name: "traktor",
        image: AssetImage("assets/segjumsaman/farataeki/traktor.jpg"),
        displayText: "Traktor"),
  ];
  String _currentFarataeki = "traktor";
  AssetImage _currentFarataekiImage =
      AssetImage("assets/segjumsaman/farataeki/traktor.jpg");
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
  }

  selectFarataeki(
      String farataeki, AssetImage farataekiImage, String displayText) async {
    await player.stop();
    await player.play(AssetSource("segjumsaman/sounds/$farataeki.wav"));

    setState(() {
      _currentFarataeki = displayText;
      _currentFarataekiImage = farataekiImage;
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
            for (var item in segjumFarataekiOption)
              GestureDetector(
                  onTap: () => {
                        selectFarataeki(item.name, item.image, item.displayText)
                      },
                  child: Image(image: item.image)),
          ])),
    ])));
  }
}
