import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/components/set_background.dart';

class AnimalGame extends StatefulWidget {
  @override
  _AnimalGameState createState() => _AnimalGameState();
}

class AnimalOption {
  String name;
  AssetImage image;
  String displayText;

  AnimalOption(
      {required this.name, required this.image, required this.displayText});
}

class _AnimalGameState extends State<AnimalGame> {
  List<AnimalOption> animalOptions = [
    AnimalOption(
        name: "cow",
        image: AssetImage("assets/animals/cow.jpg"),
        displayText: "Kýr"),
    AnimalOption(
        name: "cat",
        image: AssetImage("assets/animals/cat.jpg"),
        displayText: "Köttur"),
    AnimalOption(
        name: "bird",
        image: AssetImage("assets/animals/bird.jpg"),
        displayText: "Önd"),
    AnimalOption(
        name: "calfs",
        image: AssetImage("assets/animals/calfs.jpg"),
        displayText: "Kálfar"),
    AnimalOption(
        name: "cows",
        image: AssetImage("assets/animals/cows.jpg"),
        displayText: "Kusur"),
    AnimalOption(
        name: "sheep",
        image: AssetImage("assets/animals/sheep.jpg"),
        displayText: "Lamb"),
    AnimalOption(
        name: "horse1",
        image: AssetImage("assets/animals/horse1.jpg"),
        displayText: "Hestar"),
    AnimalOption(
        name: "horse",
        image: AssetImage("assets/animals/horse.jpg"),
        displayText: "Hestar"),
  ];
  String _currentAnimal = "Hestur";
  AssetImage _currentAnimalImage = AssetImage("assets/animals/horse.jpg");
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
  }

  selectAnimal(
      String animal, AssetImage animalImage, String displayText) async {
    await player.stop();
    await player.play(AssetSource("animals/sounds/$animal.wav"));
    /* await player.setSource(AssetSource("assets/animals/sounds/horse.wav"));
    await player.resume(); */
    setState(() {
      _currentAnimal = displayText;
      _currentAnimalImage = animalImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SetBackground(
            child: Column(children: [
      Row(
        children: [Container(padding: EdgeInsets.all(16), child: BackButton())],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
              image: _currentAnimalImage,
              height: 550,
              width: MediaQuery.of(context).size.width * 0.75),
        ],
      ),
      Container(
        margin: EdgeInsets.all(30),
        child: Text(_currentAnimal, style: TextStyle(fontSize: 25)),
      ),
      Expanded(
          child: GridView.extent(
              maxCrossAxisExtent: 200,
              padding: EdgeInsets.all(16),
              mainAxisSpacing: 7,
              crossAxisSpacing: 7,
              childAspectRatio: 3 / 3,
              children: [
            for (var item in animalOptions)
              GestureDetector(
                  onTap: () =>
                      {selectAnimal(item.name, item.image, item.displayText)},
                  child: Image(image: item.image)),
          ])),
    ])));
  }
}
