import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/components/set_background.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../segjumsaman_game.dart';

class SegjumDotGame extends StatefulWidget {
  @override
  _SegjumDotState createState() => _SegjumDotState();
}

class SegjumDotOption {
  String name;
  AssetImage image;
  String displayText;

  SegjumDotOption(
      {required this.name, required this.image, required this.displayText});
}

class _SegjumDotState extends State<SegjumDotGame> {
  List<SegjumDotOption> segjumDotOption = [
    SegjumDotOption(
        name: "budakassi",
        image: AssetImage("assets/segjumsaman/dot/budarkassi.jpeg"),
        displayText: "Allir Litir"),
    SegjumDotOption(
        name: "Dukkukerra",
        image: AssetImage("assets/segjumsaman/dot/dukkukerra.jpeg"),
        displayText: "Blár"),
    SegjumDotOption(
        name: "einhyrningur",
        image: AssetImage("assets/segjumsaman/dot/einhyrningur.jpg"),
        displayText: "Grænn"),
    SegjumDotOption(
        name: "seglar",
        image: AssetImage("assets/segjumsaman/dot/seglar.jpeg"),
        displayText: "Gulur"),
    SegjumDotOption(
        name: "risaedl",
        image: AssetImage("assets/segjumsaman/dot/risaeðlur.jpg"),
        displayText: "Rauður"),
    SegjumDotOption(
        name: "pusluspil",
        image: AssetImage("assets/segjumsaman/dot/pusl.jpg"),
        displayText: "Grænn"),
  ];
  String _currentDot = "pusluspil";
  AssetImage _currentDotImage = AssetImage("assets/segjumsaman/dot/pusl.jpg");
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
  }

  selectDot(String dot, AssetImage dotImage, String displayText) async {
    await player.stop();
    await player.play(AssetSource("segjumsaman/sounds/$dot.wav"));

    setState(() {
      _currentDot = displayText;
      _currentDotImage = dotImage;
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
            for (var item in segjumDotOption)
              GestureDetector(
                  onTap: () =>
                      {selectDot(item.name, item.image, item.displayText)},
                  child: Image(image: item.image)),
          ])),
    ])));
  }
}
