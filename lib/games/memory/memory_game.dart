import 'package:flutter/material.dart';
import 'package:namer_app/components/set_background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:namer_app/games/memory/categories/medium_memory_game.dart';
import 'categories/easy_memory_game.dart';
import 'categories/hard_memory_game.dart';

class MemoryGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SetBackground(
            child: CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverAppBar(backgroundColor: Colors.transparent),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(250, 80, 250, 100),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 1,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MediumMemoryGame()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  //color: Colors.green[100],
                  child: SvgPicture.asset(
                    "/Users/berglind/development/flutter_application_1/assets/memory/audveltmemory.svg",
                    height: 40,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EasyMemoryGame()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  //color: Colors.green[100],
                  child: SvgPicture.asset(
                    "/Users/berglind/development/flutter_application_1/assets/memory/midlungsmemory.svg",
                    height: 40,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HardMemoryGame()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  //color: Colors.green[100],
                  child: SvgPicture.asset(
                    "/Users/berglind/development/flutter_application_1/assets/memory/erfittmemory.svg",
                    height: 40,
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
