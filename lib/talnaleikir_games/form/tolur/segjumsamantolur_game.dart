import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:namer_app/components/set_background.dart';

//import 'package:namer_app/components/home_button.dart';
//import '../components/back_button.dart';
class SegjumTolurGame extends StatefulWidget {
  @override
  _SegjumTolurGameState createState() => _SegjumTolurGameState();
}

class SegjumTolurGameOption {
  String name;
  SvgPicture image;
  String displayText;

  SegjumTolurGameOption(
      {required this.name, required this.image, required this.displayText});
}

class _SegjumTolurGameState extends State<SegjumTolurGame> {
  List<SegjumTolurGameOption> segjumTolurGameOption = [
    SegjumTolurGameOption(
        name: "1",
        image: SvgPicture.asset(
            "/Users/berglind/development/flutter_application_1/assets/tolur/1.svg"),
        displayText: "Allir Litir"),
    SegjumTolurGameOption(
        name: "2",
        image: SvgPicture.asset(
            "/Users/berglind/development/flutter_application_1/assets/tolur/2.svg"),
        displayText: "Blár"),
    SegjumTolurGameOption(
        name: "3",
        image: SvgPicture.asset(
            "/Users/berglind/development/flutter_application_1/assets/tolur/3.svg"),
        displayText: "Grænn"),
    SegjumTolurGameOption(
        name: "4",
        image: SvgPicture.asset(
            "/Users/berglind/development/flutter_application_1/assets/tolur/4.svg"),
        displayText: "Gulur"),
    SegjumTolurGameOption(
        name: "5",
        image: SvgPicture.asset(
            "/Users/berglind/development/flutter_application_1/assets/tolur/5.svg"),
        displayText: "Rauður"),
    SegjumTolurGameOption(
        name: "6",
        image: SvgPicture.asset(
            "/Users/berglind/development/flutter_application_1/assets/tolur/6.svg"),
        displayText: "Grænn"),
    SegjumTolurGameOption(
        name: "7",
        image: SvgPicture.asset(
            "/Users/berglind/development/flutter_application_1/assets/tolur/7.svg"),
        displayText: "Allir Litir"),
    SegjumTolurGameOption(
        name: "8",
        image: SvgPicture.asset(
            "/Users/berglind/development/flutter_application_1/assets/tolur/8.svg"),
        displayText: "Blár"),
    SegjumTolurGameOption(
        name: "9",
        image: SvgPicture.asset(
            "/Users/berglind/development/flutter_application_1/assets/tolur/9.svg"),
        displayText: "Grænn"),
    SegjumTolurGameOption(
        name: "10",
        image: SvgPicture.asset(
            "/Users/berglind/development/flutter_application_1/assets/tolur/10.svg"),
        displayText: "Gulur"),
    SegjumTolurGameOption(
        name: "20",
        image: SvgPicture.asset(
            "/Users/berglind/development/flutter_application_1/assets/tolur/20.svg"),
        displayText: "Rauður"),
    SegjumTolurGameOption(
        name: "30",
        image: SvgPicture.asset(
            "/Users/berglind/development/flutter_application_1/assets/tolur/30.svg"),
        displayText: "Grænn"),
    SegjumTolurGameOption(
        name: "40",
        image: SvgPicture.asset(
            "/Users/berglind/development/flutter_application_1/assets/tolur/40.svg"),
        displayText: "Allir Litir"),
    SegjumTolurGameOption(
        name: "50",
        image: SvgPicture.asset(
            "/Users/berglind/development/flutter_application_1/assets/tolur/50.svg"),
        displayText: "Blár"),
    SegjumTolurGameOption(
        name: "60",
        image: SvgPicture.asset(
            "/Users/berglind/development/flutter_application_1/assets/tolur/60.svg"),
        displayText: "Grænn"),
    SegjumTolurGameOption(
        name: "70",
        image: SvgPicture.asset(
            "/Users/berglind/development/flutter_application_1/assets/tolur/70.svg"),
        displayText: "Gulur"),
    SegjumTolurGameOption(
        name: "80",
        image: SvgPicture.asset(
            "/Users/berglind/development/flutter_application_1/assets/tolur/80.svg"),
        displayText: "Rauður"),
    SegjumTolurGameOption(
        name: "90",
        image: SvgPicture.asset(
            "/Users/berglind/development/flutter_application_1/assets/tolur/90.svg"),
        displayText: "Grænn"),
    SegjumTolurGameOption(
        name: "100",
        image: SvgPicture.asset(
            "/Users/berglind/development/flutter_application_1/assets/tolur/100.svg"),
        displayText: "Grænn"),
  ];
  String _currentTala = "traktor";
  SvgPicture _currentTalaImage = SvgPicture.asset(
      "/Users/berglind/development/flutter_application_1/assets/tolur/1.svg");
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
  }

  selectTala(String tala, SvgPicture talaImage, String displayText) async {
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
              maxCrossAxisExtent: 180,
              padding:
                  EdgeInsets.only(left: 100, right: 100, top: 0, bottom: 10),
              mainAxisSpacing: 25,
              crossAxisSpacing: 90,
              childAspectRatio: 1,
              children: [
            for (var item in segjumTolurGameOption)
              GestureDetector(
                  onTap: () =>
                      {selectTala(item.name, item.image, item.displayText)},
                  child: item.image),
          ])),
    ])));
  }
}
