import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/components/set_background.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../segjumsaman_game.dart';

class SegjumAvextirGame extends StatefulWidget {
  @override
  _SegjumAvextirState createState() => _SegjumAvextirState();
}

class SegjumAvextirOption {
  String name;
  AssetImage image;
  String displayText;

  SegjumAvextirOption(
      {required this.name, required this.image, required this.displayText});
}

class _SegjumAvextirState extends State<SegjumAvextirGame> {
  List<SegjumAvextirOption> segjumLitirOption = [
    SegjumAvextirOption(
        name: "Avacado",
        image: AssetImage("assets/segjumsaman/avextir/avacado.jpg"),
        displayText: "Allir Litir"),
    SegjumAvextirOption(
        name: "banani",
        image: AssetImage("assets/segjumsaman/avextir/banani.jpg"),
        displayText: "Blár"),
    SegjumAvextirOption(
        name: "rauttepli",
        image: AssetImage("assets/segjumsaman/avextir/epli.jpg"),
        displayText: "Grænn"),
    SegjumAvextirOption(
        name: "jardaber",
        image: AssetImage("assets/segjumsaman/avextir/jardaber.jpg"),
        displayText: "Gulur"),
    SegjumAvextirOption(
        name: "vatnsmelona",
        image: AssetImage("assets/segjumsaman/avextir/melona.jpg"),
        displayText: "Rauður"),
    SegjumAvextirOption(
        name: "raudvinber",
        image: AssetImage("assets/segjumsaman/avextir/vinber.jpg"),
        displayText: "Grænn"),
  ];
  String _currentAvextir = "raudvinber";
  AssetImage _currentAvextirImage =
      AssetImage("assets/segjumsaman/avextir/vinber.jpg");
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
  }

  selectAvextir(
      String avextir, AssetImage avextirImage, String displayText) async {
    await player.stop();
    await player.play(AssetSource("segjumsaman/sounds/$avextir.wav"));

    setState(() {
      _currentAvextir = displayText;
      _currentAvextirImage = avextirImage;
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
                      {selectAvextir(item.name, item.image, item.displayText)},
                  child: Image(image: item.image)),
          ])),
    ])));
  }
}
