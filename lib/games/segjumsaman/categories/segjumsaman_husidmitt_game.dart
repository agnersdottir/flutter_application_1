import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/components/set_background.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../segjumsaman_game.dart';

class SegjumHusidGame extends StatefulWidget {
  @override
  _SegjumHusidState createState() => _SegjumHusidState();
}

class SegjumHusidOption {
  String name;
  AssetImage image;
  String displayText;

  SegjumHusidOption(
      {required this.name, required this.image, required this.displayText});
}

class _SegjumHusidState extends State<SegjumHusidGame> {
  List<SegjumHusidOption> segjumHusidOption = [
    SegjumHusidOption(
        name: "bill",
        image: AssetImage("assets/segjumsaman/farataeki/bill.jpeg"),
        displayText: "Allir Litir"),
    SegjumHusidOption(
        name: "flugvel",
        image: AssetImage("assets/segjumsaman/farataeki/flugvel.png"),
        displayText: "Blár"),
    SegjumHusidOption(
        name: "lest",
        image: AssetImage("assets/segjumsaman/farataeki/lest.jpeg"),
        displayText: "Grænn"),
    SegjumHusidOption(
        name: "hjol",
        image: AssetImage("assets/segjumsaman/farataeki/hjol.jpg"),
        displayText: "Gulur"),
    SegjumHusidOption(
        name: "skemmtiferdaskip",
        image: AssetImage("assets/segjumsaman/farataeki/skip.jpg"),
        displayText: "Rauður"),
    SegjumHusidOption(
        name: "traktor",
        image: AssetImage("assets/segjumsaman/farataeki/traktor.jpeg"),
        displayText: "Grænn"),
  ];
  String _currentHusid = "traktor";
  AssetImage _currentHusidImage =
      AssetImage("assets/segjumsaman/farataeki/traktor.jpg");
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
  }

  selectHusid(String husid, AssetImage husidImage, String displayText) async {
    await player.stop();
    await player.play(AssetSource("segjumsaman/sounds/$husid.wav"));

    setState(() {
      _currentHusid = displayText;
      _currentHusidImage = husidImage;
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
            for (var item in segjumHusidOption)
              GestureDetector(
                  onTap: () =>
                      {selectHusid(item.name, item.image, item.displayText)},
                  child: Image(image: item.image)),
          ])),
    ])));
  }
}
