import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/components/set_background.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../segjumsaman_game.dart';

class SegjumGaeludyrGame extends StatefulWidget {
  @override
  _SegjumGaeludyrState createState() => _SegjumGaeludyrState();
}

class SegjumGaeludyrOption {
  String name;
  AssetImage image;
  String displayText;

  SegjumGaeludyrOption(
      {required this.name, required this.image, required this.displayText});
}

class _SegjumGaeludyrState extends State<SegjumGaeludyrGame> {
  List<SegjumGaeludyrOption> segjumGaeludyrOption = [
    SegjumGaeludyrOption(
        name: "gullfiskur",
        image: AssetImage("assets/segjumsaman/gaeludyr/gullfiskur.jpeg"),
        displayText: "Allir Litir"),
    SegjumGaeludyrOption(
        name: "hundur",
        image: AssetImage("assets/segjumsaman/gaeludyr/hundur.jpg"),
        displayText: "Blár"),
    SegjumGaeludyrOption(
        name: "kanina",
        image: AssetImage("assets/segjumsaman/gaeludyr/kanina.jpg"),
        displayText: "Grænn"),
    SegjumGaeludyrOption(
        name: "kottur",
        image: AssetImage("assets/segjumsaman/gaeludyr/kottur.jpg"),
        displayText: "Gulur"),
    SegjumGaeludyrOption(
        name: "idapafagaukur",
        image: AssetImage("assets/segjumsaman/gaeludyr/pafagaukur.jpg"),
        displayText: "Rauður"),
    SegjumGaeludyrOption(
        name: "hamstur",
        image: AssetImage("assets/segjumsaman/gaeludyr/hamstur.jpg"),
        displayText: "Grænn"),
  ];
  String _currentGaeludyr = "hamstur";
  AssetImage _currentGaeludyrImage =
      AssetImage("assets/segjumsaman/gaeludyr/hamstur.jpg");
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
  }

  selectGaeludyr(
      String gaeludyr, AssetImage gaeludyrImage, String displayText) async {
    await player.stop();
    await player.play(AssetSource("segjumsaman/sounds/$gaeludyr.wav"));

    setState(() {
      _currentGaeludyr = displayText;
      _currentGaeludyrImage = gaeludyrImage;
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
            for (var item in segjumGaeludyrOption)
              GestureDetector(
                  onTap: () =>
                      {selectGaeludyr(item.name, item.image, item.displayText)},
                  child: Image(image: item.image)),
          ])),
    ])));
  }
}
