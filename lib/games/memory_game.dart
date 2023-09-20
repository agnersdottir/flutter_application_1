import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/components/set_background.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MemoryGame extends StatefulWidget {
  @override
  _MemoryGameState createState() => _MemoryGameState();
}

class _MemoryGameState extends State<MemoryGame> {
  String _currentAnimal = "HESTUR";
  AssetImage _currentAnimalImage = AssetImage("assets/animals/horse.jpg");
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
  }

  selectAnimal(String animal) async {
    await player.stop();
    await player.play(AssetSource("animals/sounds/horse.wav"));
    /* await player.setSource(AssetSource("assets/animals/sounds/horse.wav"));
    await player.resume(); */
    setState(() {
      _currentAnimal = animal;
      _currentAnimalImage = AssetImage("assets/animals/$animal.jpg");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SetBackground(
            child: Column(children: [
      Row(
        children: [Container(padding: EdgeInsets.all(32), child: BackButton())],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
              image: _currentAnimalImage,
              height: 400,
              width: MediaQuery.of(context).size.width * 0.75),
        ],
      ),
      Container(
        margin: EdgeInsets.all(100),
        child: Text(_currentAnimal),
      ),
      Expanded(
          child: GridView.extent(
              maxCrossAxisExtent: 200,
              padding: EdgeInsets.all(32),
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 3 / 3,
              children: [
            GestureDetector(
                onTap: () => {selectAnimal("SVÍN")},
                child: Image(image: AssetImage("assets/animals/pig.jpg"))),
            GestureDetector(
                onTap: () => {selectAnimal("KÖTTUR")},
                child: Image(
                    image: AssetImage(
                  "assets/animals/cat.jpg",
                ))),
            GestureDetector(
                onTap: () => {selectAnimal("HESTUR")},
                child: Image(image: AssetImage("assets/animals/horse.jpg"))),
            GestureDetector(
                onTap: () => {selectAnimal("FUGL")},
                child: Image(image: AssetImage("assets/animals/bird.jpg"))),
            Image(image: AssetImage("assets/animals/horse.jpg")),
            Image(image: AssetImage("assets/animals/horse.jpg")),
            Image(image: AssetImage("assets/animals/horse.jpg")),
            Image(image: AssetImage("assets/animals/horse.jpg")),
          ])),
    ])));
  }
}
