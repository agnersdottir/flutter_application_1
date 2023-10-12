import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:namer_app/components/set_background.dart';

//import 'package:namer_app/components/home_button.dart';
//import '../components/back_button.dart';

class LitirnirLeikur extends StatefulWidget {
  @override
  _LitirnirLeikurState createState() => _LitirnirLeikurState();
}

class LitirnirLeikurOption {
  String name;
  SvgPicture image;
  String displayText;

  LitirnirLeikurOption(
      {required this.name, required this.image, required this.displayText});
}

class _LitirnirLeikurState extends State<LitirnirLeikur> {
  List<LitirnirLeikurOption> litirnirLeikurOption = [
    LitirnirLeikurOption(
        name: "gulur",
        image: SvgPicture.asset("assets/litablanda/gulur.svg"),
        displayText: "Allir Litir"),
    LitirnirLeikurOption(
        name: "raudur",
        image: SvgPicture.asset("assets/litablanda/raudur.svg"),
        displayText: "Blár"),
    LitirnirLeikurOption(
        name: "blar",
        image: SvgPicture.asset("assets/litablanda/blar.svg"),
        displayText: "Grænn"),
    LitirnirLeikurOption(
        name: "hvitur",
        image: SvgPicture.asset("assets/litablanda/hviturbland.svg"),
        displayText: "Gulur"),
    LitirnirLeikurOption(
        name: "svartur",
        image: SvgPicture.asset("assets/litablanda/svartur.svg"),
        displayText: "Rauður"),
    LitirnirLeikurOption(
        name: "emptybox",
        image: SvgPicture.asset("assets/litablanda/emptybox.svg"),
        displayText: "Rauður"),
    LitirnirLeikurOption(
        name: "graennbland",
        image: SvgPicture.asset("assets/litablanda/graennbland.svg"),
        displayText: "Grænn"),
    LitirnirLeikurOption(
        name: "fjolublarbland",
        image: SvgPicture.asset("assets/litablanda/fjolubarbland.svg"),
        displayText: "Allir Litir"),
    LitirnirLeikurOption(
        name: "appelsinugulur",
        image: SvgPicture.asset("assets/litablanda/appelsinugulurbland.svg"),
        displayText: "Blár"),
    LitirnirLeikurOption(
        name: "bleikurbland",
        image: SvgPicture.asset("assets/litablanda/bleikurbland.svg"),
        displayText: "Allir Litir"),
    LitirnirLeikurOption(
        name: "brunnbland",
        image: SvgPicture.asset("assets/litablanda/brunnblandad.svg"),
        displayText: "Blár"),
  ];
  String _currentLitir = "bleikurbland";
  SvgPicture _currentLitirImage =
      SvgPicture.asset("assets/litablanda/bleikur.svg");
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
  }

  selectLitir(String litir, SvgPicture litirImage, String displayText) async {
    await player.stop();
    await player.play(AssetSource("segjumsaman/sounds/$litir.wav"));

    setState(() {
      _currentLitir = displayText;
      _currentLitirImage = litirImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SetBackground(
            child: Column(children: [
      Row(
        children: [Container(padding: EdgeInsets.all(20), child: BackButton())],
      ),
      Expanded(
          child: GridView.extent(
              maxCrossAxisExtent: 200,
              padding:
                  EdgeInsets.only(left: 100, right: 100, top: 0, bottom: 0),
              mainAxisSpacing: 90,
              crossAxisSpacing: 50,
              childAspectRatio: 3 / 3,
              children: [
            for (var item in litirnirLeikurOption)
              GestureDetector(
                  onTap: () =>
                      {selectLitir(item.name, item.image, item.displayText)},
                  child: item.image),
          ])),
    ])));
  }
}
