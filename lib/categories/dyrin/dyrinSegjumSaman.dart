import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/components/set_background.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SegjumDyrinGame extends StatefulWidget {
  @override
  _SegjumDyrinState createState() => _SegjumDyrinState();
}

class SegjumDyrinOption {
  String name;
  AssetImage image;
  String displayText;

  SegjumDyrinOption(
      {required this.name, required this.image, required this.displayText});
}

class _SegjumDyrinState extends State<SegjumDyrinGame> {
  List<SegjumDyrinOption> segjumDyrinOption = [
    SegjumDyrinOption(
        name: "ljon",
        image: AssetImage("assets/segjumsaman/islenskdyr/ljon.jpg"),
        displayText: "Svín"),
    SegjumDyrinOption(
        name: "gris",
        image: AssetImage("assets/segjumsaman/islenskdyr/pig.jpg"),
        displayText: "Svín"),
    SegjumDyrinOption(
        name: "isbjorn",
        image: AssetImage("assets/segjumsaman/islenskdyr/isbjorn.jpg"),
        displayText: "Selur"),
    SegjumDyrinOption(
        name: "kyr",
        image: AssetImage("assets/segjumsaman/islenskdyr/kyr.jpg"),
        displayText: "Kýr"),
    SegjumDyrinOption(
        name: "ugla",
        image: AssetImage("assets/segjumsaman/islenskdyr/ugla.jpg"),
        displayText: "Lundi"),
    SegjumDyrinOption(
        name: "hesturr",
        image: AssetImage("assets/segjumsaman/islenskdyr/hestur.jpg"),
        displayText: "Hestur"),
    SegjumDyrinOption(
        name: "api",
        image: AssetImage("assets/segjumsaman/islenskdyr/api.jpg"),
        displayText: "Api"),
    SegjumDyrinOption(
        name: "hundurr",
        image: AssetImage("assets/segjumsaman/islenskdyr/hundur.jpg"),
        displayText: "hundur"),
    SegjumDyrinOption(
        name: "kottur",
        image: AssetImage("assets/segjumsaman/islenskdyr/kottur.jpg"),
        displayText: "Köttur"),
    SegjumDyrinOption(
        name: "fugl",
        image: AssetImage("assets/segjumsaman/islenskdyr/fulg.jpg"),
        displayText: "Fugl"),
    SegjumDyrinOption(
        name: "hakarl",
        image: AssetImage("assets/segjumsaman/islenskdyr/hakarl.jpg"),
        displayText: "Hákarl"),
    SegjumDyrinOption(
        name: "hahyrningur",
        image: AssetImage("assets/segjumsaman/islenskdyr/hahyrningur.jpg"),
        displayText: "Háhyrningur"),
  ];
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
  }

  selectIslenskDyr(
      String islenskdyr, AssetImage IslenskDyrImage, String displayText) async {
    await player.stop();
    await player.play(AssetSource("segjumsaman/sounds/$islenskdyr.wav"));
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
            for (var item in segjumDyrinOption)
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
