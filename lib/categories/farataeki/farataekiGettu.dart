import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:namer_app/background2.dart';
import 'package:namer_app/components/set_background.dart';
import 'package:namer_app/games/memory/memory_game.dart';
import 'package:namer_app/games/rutina/rutina_game.dart';
import 'package:namer_app/games/segjumsaman/einn_segjumsaman.dart';

import '../../background3.dart';

class AvextirCategory extends StatelessWidget {
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
                      MaterialPageRoute(builder: (context) => MemoryGame()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    //color: Colors.green[100],
                    child: SvgPicture.asset(
                      "assets/minnisleikur.svg",
                      // height: 400,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EinnSegjumSamanGame()),
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
                      MaterialPageRoute(builder: (context) => MemoryGame()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    //color: Colors.green[100],
                    child: SvgPicture.asset(
                      "assets/1solcat.svg",
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
