import 'package:flutter/material.dart';
import 'package:namer_app/components/set_background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:namer_app/games/segjumsaman/categories/segjumsaman_fot_game.dart';
import './categories/segjumsaman_litir_game.dart';
import './categories/segjumsaman_utivera_game.dart';
import './categories/segjumsaman_islenskudyrin_game.dart';
import './categories/segjumsaman_farataeki_game.dart';
import './categories/segjumsaman_avextir_game.dart';
import 'categories/segjumsaman_dot_game.dart';
import 'categories/segjumsaman_gaeludyr_game.dart';
import 'categories/segjumsaman_graenmeti_game.dart';
import 'categories/segjumsaman_husidmitt_game.dart';
import 'categories/segjumsaman_vedur_game.dart';

class SegjumSamanGame extends StatelessWidget {
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
                child: Container(
                  padding: const EdgeInsets.all(8),
                  //color: Colors.green[100],
                  child: SvgPicture.asset(
                    "assets/segjumsamanislenskudyr.svg",
                    // height: 400,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SegjumFarataekiGame()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  //color: Colors.green[100],
                  child: SvgPicture.asset(
                    "assets/farataeki2svg.svg",
                    // height: 400,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SegjumAvextirGame()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  //color: Colors.green[100],
                  child: SvgPicture.asset(
                    "assets/3avextir.svg",
                    // height: 400,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SegjumGraenmetiGame()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  //color: Colors.green[100],
                  child: SvgPicture.asset(
                    "assets/graenmeti.svg",
                    // height: 400,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SegjumFotGame()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  //color: Colors.green[100],
                  child: SvgPicture.asset(
                    "assets/fot.svg",
                    // height: 400,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SegjumDotGame()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  //color: Colors.green[100],
                  child: SvgPicture.asset(
                    "assets/dot.svg",
                    // height: 400,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SegjumVedurGame()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  //color: Colors.green[100],
                  child: SvgPicture.asset(
                    "assets/vedur.svg",
                    // height: 400,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SegjumHusidGame()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  //color: Colors.green[100],
                  child: SvgPicture.asset(
                    "assets/husidmitt.svg",
                    // height: 400,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SegjumGaeludyrGame()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  //color: Colors.green[100],
                  child: SvgPicture.asset(
                    "assets/gaeludyr.svg",
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
