import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:namer_app/components/set_background.dart';
import 'package:namer_app/games/memory/memory_game.dart';
import 'package:namer_app/games/rutina/rutina_game.dart';
import 'package:namer_app/games/segjumsaman/segjumsaman_game.dart';

import '../games/animal_game.dart';

//import 'package:namer_app/components/home_button.dart';
//import '../components/back_button.dart';

class Spilaleikur extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SetBackground(
            child: CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverAppBar(backgroundColor: Colors.transparent),
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AnimalGame()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  //color: Colors.green[100],
                  child: SvgPicture.asset(
                    "assets/islenskudyrinpigsvg.svg",
                    // height: 400,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MemoryGame()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  //color: Colors.green[100],
                  child: SvgPicture.asset(
                    "assets/minnisleikur1.svg",
                    // height: 400,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SegjumSamanGame()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  //color: Colors.green[100],
                  child: SvgPicture.asset(
                    "assets/segjumsaman.svg",
                    // height: 400,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RutinaGame()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  //color: Colors.green[100],
                  child: SvgPicture.asset(
                    "assets/5rutina.svg",
                    // height: 400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    )));
  }
}
