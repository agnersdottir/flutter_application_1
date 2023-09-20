import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/components/set_background.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SegjumFotGame extends StatefulWidget {
  @override
  _SegjumFotState createState() => _SegjumFotState();
}

class SegjumFotOption {
  String name;
  AssetImage image;
  String displayText;

  SegjumFotOption(
      {required this.name, required this.image, required this.displayText});
}

class _SegjumFotState extends State<SegjumFotGame> {
  List<SegjumFotOption> segjumFotOption = [
    SegjumFotOption(
        name: "bolur",
        image: AssetImage("assets/segjumsaman/fot/bolur.jpeg"),
        displayText: "Allir Litir"),
    SegjumFotOption(
        name: "buxur",
        image: AssetImage("assets/segjumsaman/fot/buxur.jpeg"),
        displayText: "Blár"),
    SegjumFotOption(
        name: "jakki",
        image: AssetImage("assets/segjumsaman/fot/jakki.jpg"),
        displayText: "Grænn"),
    SegjumFotOption(
        name: "snjogalli",
        image: AssetImage("assets/segjumsaman/fot/snjogalli.jpeg"),
        displayText: "Gulur"),
    SegjumFotOption(
        name: "sokkar",
        image: AssetImage("assets/segjumsaman/fot/socks.jpg"),
        displayText: "Rauður"),
    SegjumFotOption(
        name: "kjoll",
        image: AssetImage("assets/segjumsaman/fot/kjoll.jpg"),
        displayText: "Grænn"),
  ];
  String _currentFot = "kjoll";
  AssetImage _currentFotImage = AssetImage("assets/segjumsaman/fot/kjoll.jpg");
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
  }

  selectFot(String fot, AssetImage fotImage, String displayText) async {
    await player.stop();
    await player.play(AssetSource("segjumsaman/sounds/$fot.wav"));

    setState(() {
      _currentFot = displayText;
      _currentFotImage = fotImage;
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
            for (var item in segjumFotOption)
              GestureDetector(
                  onTap: () =>
                      {selectFot(item.name, item.image, item.displayText)},
                  child: Image(image: item.image)),
          ])),
    ])));
  }
}
