import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/components/set_background.dart';

//import 'package:namer_app/components/home_button.dart';
//import '../components/back_button.dart';
class TengjumSamanGame extends StatefulWidget {
  @override
  _TengjumSamanGameState createState() => _TengjumSamanGameState();
}

class SegjumTolurGameOption {
  String name;
  AssetImage image;
  String displayText;

  SegjumTolurGameOption(
      {required this.name, required this.image, required this.displayText});
}

class _TengjumSamanGameState extends State<TengjumSamanGame> {
  List<SegjumTolurGameOption> segjumTolurGameOption = [
    SegjumTolurGameOption(
        name: "bill",
        image: AssetImage("assets/segjumsaman/farataeki/bill.jpeg"),
        displayText: "Allir Litir"),
    SegjumTolurGameOption(
        name: "flugvel",
        image: AssetImage("assets/segjumsaman/farataeki/flugvel.png"),
        displayText: "Blár"),
    SegjumTolurGameOption(
        name: "lest",
        image: AssetImage("assets/segjumsaman/farataeki/lest.jpeg"),
        displayText: "Grænn"),
    SegjumTolurGameOption(
        name: "hjol",
        image: AssetImage("assets/segjumsaman/farataeki/hjol.jpg"),
        displayText: "Gulur"),
    SegjumTolurGameOption(
        name: "skemmtiferdaskip",
        image: AssetImage("assets/segjumsaman/farataeki/skip.jpg"),
        displayText: "Rauður"),
    SegjumTolurGameOption(
        name: "traktor",
        image: AssetImage("assets/segjumsaman/farataeki/traktor.jpeg"),
        displayText: "Grænn"),
  ];
  String _currentTala = "traktor";
  AssetImage _currentTalaImage =
      AssetImage("assets/segjumsaman/farataeki/traktor.jpg");
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
  }

  selectTala(String tala, AssetImage talaImage, String displayText) async {
    await player.stop();
    await player.play(AssetSource("segjumsaman/sounds/$tala.wav"));

    setState(() {
      _currentTala = displayText;
      _currentTalaImage = talaImage;
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
            for (var item in segjumTolurGameOption)
              GestureDetector(
                  onTap: () =>
                      {selectTala(item.name, item.image, item.displayText)},
                  child: Image(image: item.image)),
          ])),
    ])));
  }
}
