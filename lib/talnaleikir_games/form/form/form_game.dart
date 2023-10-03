import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:namer_app/components/set_background.dart';

//import 'package:namer_app/components/home_button.dart';
//import '../components/back_button.dart';

class FormLeikur extends StatefulWidget {
  @override
  _FormLeikurState createState() => _FormLeikurState();
}

class FormLeikurOption {
  String name;
  SvgPicture image;
  String displayText;

  FormLeikurOption(
      {required this.name, required this.image, required this.displayText});
}

class _FormLeikurState extends State<FormLeikur> {
  List<FormLeikurOption> formLeikurOption = [
    FormLeikurOption(
        name: "ferningur",
        image: SvgPicture.asset("assets/form/Ferningur.svg"),
        displayText: "Allir Litir"),
    FormLeikurOption(
        name: "hringur",
        image: SvgPicture.asset("assets/form/hringur.svg"),
        displayText: "Blár"),
    FormLeikurOption(
        name: "halfhringur",
        image: SvgPicture.asset("assets/form/halfhringur.svg"),
        displayText: "Grænn"),
    FormLeikurOption(
        name: "stjarna",
        image: SvgPicture.asset("assets/form/stjarna.svg"),
        displayText: "Gulur"),
    FormLeikurOption(
        name: "tigull",
        image: SvgPicture.asset("assets/form/tigull.svg"),
        displayText: "Rauður"),
    FormLeikurOption(
        name: "þrihyrningur",
        image: SvgPicture.asset("assets/form/þrihyrningur.svg"),
        displayText: "Grænn"),
  ];
  String _currentForm = "ferningur";
  SvgPicture _currentFormImage = SvgPicture.asset("assets/form/Ferningur.svg");
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
  }

  selectForm(String form, SvgPicture formImage, String displayText) async {
    await player.stop();
    await player.play(AssetSource("segjumsaman/sounds/$form.wav"));

    setState(() {
      _currentForm = displayText;
      _currentFormImage = formImage;
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
              padding:
                  EdgeInsets.only(left: 100, right: 100, top: 60, bottom: 0),
              mainAxisSpacing: 60,
              crossAxisSpacing: 90,
              childAspectRatio: 2 / 2,
              children: [
            for (var item in formLeikurOption)
              GestureDetector(
                  onTap: () =>
                      {selectForm(item.name, item.image, item.displayText)},
                  child: item.image),
          ])),
    ])));
  }
}
