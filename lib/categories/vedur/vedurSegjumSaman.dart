import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/components/set_background.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SegjumVedurOgUtiveraGame extends StatefulWidget {
  @override
  _SegjumVedurState createState() => _SegjumVedurState();
}

class SegjumVedurOgUtiveraOption {
  String name;
  AssetImage image;
  String displayText;

  SegjumVedurOgUtiveraOption(
      {required this.name, required this.image, required this.displayText});
}

class _SegjumVedurState extends State<SegjumVedurOgUtiveraGame> {
  List<SegjumVedurOgUtiveraOption> segjumVedurOption = [
    SegjumVedurOgUtiveraOption(
        name: "gras",
        image: AssetImage("assets/segjumsaman/vedur/gras.jpg"),
        displayText: "Gras"),
    SegjumVedurOgUtiveraOption(
        name: "hust",
        image: AssetImage("assets/segjumsaman/vedur/haust.jpg"),
        displayText: "Regnbogi"),
    SegjumVedurOgUtiveraOption(
        name: "sky",
        image: AssetImage("assets/segjumsaman/vedur/sky.jpg"),
        displayText: "Ský"),
    SegjumVedurOgUtiveraOption(
        name: "snjor",
        image: AssetImage("assets/segjumsaman/vedur/snjor.jpg"),
        displayText: "Snjór"),
    SegjumVedurOgUtiveraOption(
        name: "sol",
        image: AssetImage("assets/segjumsaman/vedur/sol.jpg"),
        displayText: "Sól"),
    SegjumVedurOgUtiveraOption(
        name: "rigning",
        image: AssetImage("assets/segjumsaman/vedur/rigning.jpg"),
        displayText: "Rigning"),
    SegjumVedurOgUtiveraOption(
        name: "solblom",
        image: AssetImage("assets/segjumsaman/vedur/sunflower.jpg"),
        displayText: "Sandkassi"),
    SegjumVedurOgUtiveraOption(
        name: "Sólblóm",
        image: AssetImage("assets/segjumsaman/vedur/regnbogi.jpg"),
        displayText: "Trampólín"),
    SegjumVedurOgUtiveraOption(
        name: "tungl",
        image: AssetImage("assets/segjumsaman/vedur/tungl.jpg"),
        displayText: "Tungl"),
    SegjumVedurOgUtiveraOption(
        name: "haust",
        image: AssetImage("assets/segjumsaman/vedur/haust.jpg"),
        displayText: "Haust"),
    SegjumVedurOgUtiveraOption(
        name: "regnhlyf",
        image: AssetImage("assets/segjumsaman/vedur/regnhlyf.jpg"),
        displayText: "Skóflur"),
    SegjumVedurOgUtiveraOption(
        name: "sandkassi",
        image: AssetImage("assets/segjumsaman/vedur/sandkassi.jpg"),
        displayText: "Fötur"),
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
              maxCrossAxisExtent: 300,
              padding: EdgeInsets.only(left: 50, right: 50, top: 0, bottom: 0),
              mainAxisSpacing: 60,
              crossAxisSpacing: 60,
              childAspectRatio: 3 / 2,
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
