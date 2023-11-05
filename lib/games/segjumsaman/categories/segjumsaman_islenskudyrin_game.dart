import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/components/set_background.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../segjumsaman_game.dart';

class SegjumDyrGame extends StatefulWidget {
  @override
  _SegjumIslenskuDyrState createState() => _SegjumIslenskuDyrState();
}

class SegjumIslenskuDyrOption {
  String name;
  AssetImage image;
  String displayText;

  SegjumIslenskuDyrOption(
      {required this.name, required this.image, required this.displayText});
}

class _SegjumIslenskuDyrState extends State<SegjumDyrGame> {
  List<SegjumIslenskuDyrOption> segjumIslenskuDyrOption = [
    SegjumIslenskuDyrOption(
        name: "Hestur",
        image: AssetImage("assets/segjumsaman/islenskdyr/hestur.jpg"),
        displayText: "Allir Litir"),
    SegjumIslenskuDyrOption(
        name: "Hundur",
        image: AssetImage("assets/segjumsaman/islenskdyr/hundur.jpg"),
        displayText: "Blár"),
    SegjumIslenskuDyrOption(
        name: "hundur",
        image: AssetImage("assets/segjumsaman/islenskdyr/kyr.jpg"),
        displayText: "Grænn"),
    SegjumIslenskuDyrOption(
        name: "lomb",
        image: AssetImage("assets/segjumsaman/islenskdyr/lamb.jpg"),
        displayText: "Gulur"),
    SegjumIslenskuDyrOption(
        name: "lundi",
        image: AssetImage("assets/segjumsaman/islenskdyr/lundi.jpg"),
        displayText: "Rauður"),
    SegjumIslenskuDyrOption(
        name: "gris",
        image: AssetImage("assets/segjumsaman/islenskdyr/svin2.png"),
        displayText: "Grænn"),
  ];
  String _currentIslenskDyr = "allirlitir";
  AssetImage _currentIslenskDyrImage =
      AssetImage("assets/segjumsaman/litir/allirlitir.jpg");
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
  }

  selectIslenskDyr(
      String islenskdyr, AssetImage IslenskDyrImage, String displayText) async {
    await player.stop();
    await player.play(AssetSource("segjumsaman/sounds/$islenskdyr.wav"));

    setState(() {
      _currentIslenskDyr = displayText;
      _currentIslenskDyrImage = IslenskDyrImage;
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
            for (var item in segjumIslenskuDyrOption)
              GestureDetector(
                  onTap: () => {
                        selectIslenskDyr(
                            item.name, item.image, item.displayText)
                      },
                  child: Image(image: item.image)),
          ])),
    ])));
  }
}
