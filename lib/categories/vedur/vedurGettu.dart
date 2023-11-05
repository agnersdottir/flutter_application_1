import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/components/set_background.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VedurGettu extends StatefulWidget {
  @override
  VedurGettuState createState() => VedurGettuState();
}

class VedurGettuOption {
  String name;
  AssetImage image;
  String displayText;

  VedurGettuOption(
      {required this.name, required this.image, required this.displayText});
}

class VedurGettuState extends State<VedurGettu> {
  List<VedurGettuOption> segjumVedurOption = [
    VedurGettuOption(
        name: "grass",
        image: AssetImage("assets/segjumsaman/vedur/grass.jpeg"),
        displayText: "Allir Litir"),
    VedurGettuOption(
        name: "regnbogi",
        image: AssetImage("assets/segjumsaman/vedur/regnbogi.jpeg"),
        displayText: "Blár"),
    VedurGettuOption(
        name: "sky",
        image: AssetImage("assets/segjumsaman/vedur/sky.jpg"),
        displayText: "Grænn"),
    VedurGettuOption(
        name: "snjor",
        image: AssetImage("assets/segjumsaman/vedur/snjor.jpg"),
        displayText: "Gulur"),
    VedurGettuOption(
        name: "sol",
        image: AssetImage("assets/segjumsaman/vedur/sol.jpeg"),
        displayText: "Rauður"),
    VedurGettuOption(
        name: "rigning",
        image: AssetImage("assets/segjumsaman/vedur/rigning.jpg"),
        displayText: "Grænn"),
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
              maxCrossAxisExtent: 400,
              padding: EdgeInsets.only(left: 50, right: 50, top: 0, bottom: 0),
              mainAxisSpacing: 60,
              crossAxisSpacing: 90,
              childAspectRatio: 2 / 2,
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
