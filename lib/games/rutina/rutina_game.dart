import 'package:flutter/material.dart';
import 'package:namer_app/components/set_background.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../segjumsaman/categories/segjumsaman_islenskudyrin_game.dart';
import 'morgunrutina/rutina_morgunrutina_game.dart';

class RutinaGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SetBackground(
            child: CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverAppBar(backgroundColor: Colors.transparent),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(200, 100, 200, 100),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 1,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MorgunRutinaGame()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  //color: Colors.green[100],
                  child: SvgPicture.asset(
                    "assets/2morgunrutina.svg",
                    height: 40,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SegjumDyrGame()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  //color: Colors.green[100],
                  child: SvgPicture.asset(
                    "assets/kvoldrutina.svg",
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
