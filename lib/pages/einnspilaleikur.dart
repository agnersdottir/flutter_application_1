import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:namer_app/categories/dyrin/dyrinCategory.dart';
import 'package:namer_app/categories/vedur/vedurCategory.dart';

import '../background3.dart';
import '../categories/avextirOgGraenmeti/avextirCategory.dart';
import '../games/memory/memory_game.dart';

//import 'package:namer_app/components/home_button.dart';
//import '../components/back_button.dart';

class EinnSpilaleikur extends StatelessWidget {
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
                          builder: (context) => AvextirCategory()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    //color: Colors.green[100],
                    child: SvgPicture.asset(
                      "assets/12avxoggr.svg",
                      // height: 400,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DyrinCategory()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    //color: Colors.green[100],
                    child: SvgPicture.asset(
                      "assets/2dyrin.svg",
                      // height: 400,
                    ),
                  ),
                ),
//                GestureDetector(
                //                onTap: () {
                //                Navigator.push(
                //                 context,
                //                MaterialPageRoute(builder: (context) => VedurCategory()),
                //            );
                //        },
                //      child: Container(
                //      padding: const EdgeInsets.all(8),
                //    //color: Colors.green[100],
                //  child: SvgPicture.asset(
                //  "assets/1solcat.svg",
                // height: 400,
                //      ),
                //  ),
                //  ),
              ],
            ),
          ),
        ],
      )
    ]));
  }
}
