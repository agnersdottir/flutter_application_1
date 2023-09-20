import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/components/set_background.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../segjumsaman_game.dart';

class SegjumUtiveraGame extends StatefulWidget {
  @override
  _SegjumUtiveraState createState() => _SegjumUtiveraState();
}

class SegjumUtiveraOption {
  String name;
  AssetImage image;
  String displayText;

  SegjumUtiveraOption(
      {required this.name, required this.image, required this.displayText});
}

class _SegjumUtiveraState extends State<SegjumUtiveraGame> {
  List<SegjumUtiveraOption> segjumUtiveraOption = [
    SegjumUtiveraOption(
        name: "sandkassi",
        image: AssetImage("assets/segjumsaman/utivera/sandkassi.jpeg"),
        displayText: "Allir Litir"),
    SegjumUtiveraOption(
        name: "trampolin",
        image: AssetImage("assets/segjumsaman/utivera/trampolin.jpg"),
        displayText: "Blár"),
    SegjumUtiveraOption(
        name: "rolur",
        image: AssetImage("assets/segjumsaman/utivera/rolur.jpg"),
        displayText: "Grænn"),
    SegjumUtiveraOption(
        name: "hoppukastali",
        image: AssetImage("assets/segjumsaman/utivera/hoppukastali.jpg"),
        displayText: "Gulur"),
    SegjumUtiveraOption(
        name: "skoflur",
        image: AssetImage("assets/segjumsaman/utivera/skofla.jpeg"),
        displayText: "Rauður"),
    SegjumUtiveraOption(
        name: "fotur",
        image: AssetImage("assets/segjumsaman/utivera/fata.jpeg"),
        displayText: "Grænn"),
  ];
  String _currentUtivera = "fotur";
  AssetImage _currentUtiveraImage =
      AssetImage("assets/segjumsaman/litir/fata.jpg");
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
  }

  selectUtivera(
      String utivera, AssetImage UtiveraImage, String displayText) async {
    await player.stop();
    await player.play(AssetSource("segjumsaman/sounds/$utivera.wav"));

    setState(() {
      _currentUtivera = displayText;
      _currentUtiveraImage = UtiveraImage;
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
            for (var item in segjumUtiveraOption)
              GestureDetector(
                  onTap: () =>
                      {selectUtivera(item.name, item.image, item.displayText)},
                  child: Image(image: item.image)),
          ])),
    ])));
  }
}
