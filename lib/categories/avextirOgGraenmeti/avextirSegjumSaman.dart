import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/components/set_background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:namer_app/games/segjumsaman/categories/segjumsaman_avextir_game.dart';

class SegjumAvexOgGraenmetiGame extends StatefulWidget {
  @override
  _SegjumGraenmetiState createState() => _SegjumGraenmetiState();
}

class SegjumGraenmetiOption {
  String name;
  AssetImage image;
  String displayText;

  SegjumGraenmetiOption(
      {required this.name, required this.image, required this.displayText});
}

class _SegjumGraenmetiState extends State<SegjumAvexOgGraenmetiGame> {
  List<SegjumGraenmetiOption> segjumGraenmetiOption = [
    SegjumGraenmetiOption(
        name: "agurka",
        image: AssetImage("assets/segjumsaman/graenmeti/agurka.jpg"),
        displayText: "Agúrka"),
    SegjumGraenmetiOption(
        name: "epli",
        image: AssetImage("assets/segjumsaman/graenmeti/epli.jpg"),
        displayText: "Epli"),
    SegjumGraenmetiOption(
        name: "blomkal",
        image: AssetImage("assets/segjumsaman/graenmeti/blomkal.jpg"),
        displayText: "Blómkál"),
    SegjumGraenmetiOption(
        name: "appelsina",
        image: AssetImage("assets/segjumsaman/graenmeti/appelsina.jpg"),
        displayText: "Appelsína"),
    SegjumGraenmetiOption(
        name: "banani",
        image: AssetImage("assets/segjumsaman/graenmeti/banani.jpg"),
        displayText: "Banani"),
    SegjumGraenmetiOption(
        name: "brokkoli",
        image: AssetImage("assets/segjumsaman/graenmeti/broccoli.jpg"),
        displayText: "Brokkólí"),
    SegjumGraenmetiOption(
        name: "kiwi",
        image: AssetImage("assets/segjumsaman/graenmeti/kiwi.jpg"),
        displayText: "Kíví"),
    SegjumGraenmetiOption(
        name: "avakado",
        image: AssetImage("assets/segjumsaman/graenmeti/avakado.jpg"),
        displayText: "Avakadó"),
    SegjumGraenmetiOption(
        name: "gulraetur",
        image: AssetImage("assets/segjumsaman/graenmeti/gulraetur.jpg"),
        displayText: "Gulrætur"),
    SegjumGraenmetiOption(
        name: "paprika",
        image: AssetImage("assets/segjumsaman/graenmeti/paprika.jpg"),
        displayText: "Paprika"),
    SegjumGraenmetiOption(
        name: "tomatur",
        image: AssetImage("assets/segjumsaman/graenmeti/tomatur.jpg"),
        displayText: "Tómatur"),
    SegjumGraenmetiOption(
        name: "jardaber",
        image: AssetImage("assets/segjumsaman/graenmeti/jardaber.jpg"),
        displayText: "Jarðaber"),
  ];
  String _currentGraenmeti = "tomatur";
  AssetImage _currentGraenmetiImage =
      AssetImage("assets/segjumsaman/graenmeti/tomatur.jpg");
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
  }

  selectGraenmeti(
      String graenmeti, AssetImage graenmetiImage, String displayText) async {
    await player.stop();
    await player.play(AssetSource("segjumsaman/sounds/$graenmeti.wav"));

    setState(() {
      _currentGraenmeti = displayText;
      _currentGraenmetiImage = graenmetiImage;
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
              crossAxisSpacing: 90,
              childAspectRatio: 3 / 2,
              children: [
            for (var item in segjumGraenmetiOption)
              GestureDetector(
                  onTap: () => {
                        selectGraenmeti(item.name, item.image, item.displayText)
                      },
                  child: Image(image: item.image)),
          ])),
    ])));
  }
}
