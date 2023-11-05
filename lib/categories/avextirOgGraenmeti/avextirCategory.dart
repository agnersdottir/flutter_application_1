import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:namer_app/categories/avextirOgGraenmeti/avexMemory/memory/memory_game_avextir.dart';
import 'package:namer_app/categories/avextirOgGraenmeti/avextirSegjumSaman.dart';
import 'package:namer_app/games/memory/memory_game.dart';

import '../../background3.dart';

class AvextirCategory extends StatelessWidget {
  final player = AudioCache();
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
            padding: const EdgeInsets.fromLTRB(250, 170, 250, 100),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 60,
              crossAxisCount: 1,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SegjumAvexOgGraenmetiGame()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    //color: Colors.green[100],
                    child: SvgPicture.asset("assets/segjahlusta.svg"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MemoryGameAvextir()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    //color: Colors.green[100],
                    child: SvgPicture.asset(
                      "assets/minnisleikurnyr.svg",
                    ),
                  ),
                ),
                //               GestureDetector(
                //               onTap: () {
                //               Navigator.push(
                //               context,
                //             MaterialPageRoute(builder: (context) => MemoryGame()),
                //         );
                //     },
                //   child: Container(
                //   padding: const EdgeInsets.all(8),
                //color: Colors.green[100],
                //             child: SvgPicture.asset(
                //                 "assets/gettuAvoxtin.svg",
                // height: 400,
                //           ),
                //       ),
                //   ),
              ],
            ),
          ),
        ],
      )
    ]));
  }
}
