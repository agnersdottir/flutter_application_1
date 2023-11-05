import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:namer_app/categories/vedur/vedurSegjumSaman.dart';
import 'package:namer_app/games/memory/memory_game.dart';

import '../../background3.dart';
import 'memory/memory_game_vedur.dart';

class VedurCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Background3(),
      CustomScrollView(
        primary: true,
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
                      MaterialPageRoute(
                          builder: (context) => SegjumVedurOgUtiveraGame()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    //color: Colors.green[100],
                    child: SvgPicture.asset(
                      "assets/segjahlusta.svg",
                      // height: 400,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MemoryGameVedur()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    //color: Colors.green[100],
                    child: SvgPicture.asset(
                      "assets/minnisleikurnyr.svg",
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
                      "assets/gettuveðrattuna.svg",
                      // height: 400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    ]));
  }
}
