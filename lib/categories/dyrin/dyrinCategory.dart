import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:namer_app/games/memory/memory_game.dart';

import '../../background3.dart';
import 'dyrinMemory/memory/memory_game_dyr.dart';
import 'dyrinSegjumSaman.dart';

class DyrinCategory extends StatelessWidget {
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
                          builder: (context) => SegjumDyrinGame()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    //color: Colors.green[100],
                    child: SvgPicture.asset(
                      "assets/segjahlusta.svg",
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MemoryGameDyrin()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    // color: Colors.green[100],
                    child: SvgPicture.asset(
                      "assets/minnisleikurnyr.svg",
                    ),
                  ),
                ),
//                GestureDetector(
                //                onTap: () {
                //                Navigator.push(
                //                context,
                //              MaterialPageRoute(builder: (context) => MemoryGame()),
                //          );
                //      },
                //  child: Container(
                //      padding: const EdgeInsets.all(8),
                //color: Colors.green[100],
                //  child: SvgPicture.asset(
                //  "assets/gettudyrid.svg",
                // height: 400,
                //          ),
                //      ),
                //  ),
              ],
            ),
          ),
        ],
      )
    ]));
  }
}
