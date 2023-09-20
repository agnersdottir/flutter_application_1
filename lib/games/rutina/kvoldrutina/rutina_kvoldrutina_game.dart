import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/components/set_background.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../rutina_game.dart';

class KvoldRutinaGame extends StatefulWidget {
  @override
  _KvoldRutinaState createState() => _KvoldRutinaState();
}

class KvoldRutinaOption {
  String name;
  AssetImage image;
  String displayText;

  KvoldRutinaOption(
      {required this.name, required this.image, required this.displayText});
}

class _KvoldRutinaState extends State<KvoldRutinaGame> {
  List<KvoldRutinaOption> kvoldRutinaOption = [
    KvoldRutinaOption(
        name: "Avacado",
        image: AssetImage("assets/segjumsaman/avextir/avacado.jpg"),
        displayText: "Allir Litir"),
    KvoldRutinaOption(
        name: "banani",
        image: AssetImage("assets/segjumsaman/avextir/banani.jpg"),
        displayText: "Blár"),
    KvoldRutinaOption(
        name: "rauttepli",
        image: AssetImage("assets/segjumsaman/avextir/epli.jpg"),
        displayText: "Grænn"),
    KvoldRutinaOption(
        name: "jardaber",
        image: AssetImage("assets/segjumsaman/avextir/jardaber.jpg"),
        displayText: "Gulur"),
    KvoldRutinaOption(
        name: "vatnsmelona",
        image: AssetImage("assets/segjumsaman/avextir/melona.jpg"),
        displayText: "Rauður"),
    KvoldRutinaOption(
        name: "raudvinber",
        image: AssetImage("assets/segjumsaman/avextir/vinber.jpg"),
        displayText: "Grænn"),
  ];
  String _currentKvoldRutina = "raudvinber";
  AssetImage _currentKvoldRutinaImage =
      AssetImage("assets/segjumsaman/avextir/vinber.jpg");
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
  }

  selectKvoldRutina(String kvoldrutina, AssetImage kvoldRutinaImage,
      String displayText) async {
    await player.stop();
    await player.play(AssetSource("segjumsaman/sounds/$kvoldrutina.wav"));

    setState(() {
      _currentKvoldRutina = displayText;
      _currentKvoldRutinaImage = kvoldRutinaImage;
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
            for (var item in kvoldRutinaOption)
              GestureDetector(
                  onTap: () => {
                        selectKvoldRutina(
                            item.name, item.image, item.displayText)
                      },
                  child: Image(image: item.image)),
          ])),
    ])));
  }
}
