import 'package:flutter/material.dart';
import 'package:namer_app/components/set_background.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../segjumsaman/categories/segjumsaman_islenskudyrin_game.dart';
import '../segjumsaman/categories/segjumsaman_litir_game.dart';
import '../segjumsaman/categories/segjumsaman_utivera_game.dart';

class MemoryGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SetBackground(
            child: CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 50,
            crossAxisCount: 3,
            children: <Widget>[
              Row(
                children: [
                  Container(
                      padding: EdgeInsetsDirectional.symmetric(),
                      child: BackButton())
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SegjumLitirGame()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  //color: Colors.green[100],
                  child: SvgPicture.asset(
                    "assets/litirnir.svg",
                    // height: 400,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SegjumUtiveraGame()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  //color: Colors.green[100],
                  child: SvgPicture.asset(
                    "assets/utivera02.svg",
                    // height: 400,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SegjumIslenskuDyrGame()),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    )));
  }
}
