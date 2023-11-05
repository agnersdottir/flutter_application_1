import 'package:flutter/material.dart';
import 'package:namer_app/components/set_background.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../segjumsaman/categories/segjumsaman_islenskudyrin_game.dart';
import 'memory_form_game.dart';

class MemoryFormGameCategories extends StatelessWidget {
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
                    //Form memory leikur
                    MaterialPageRoute(builder: (context) => MemoryFormGame()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  //color: Colors.green[100],
                  child: SvgPicture.asset(
                    "/Users/berglind/development/flutter_application_1/assets/memoryForm/memoryform.svg",
                    height: 40,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        //talna memory leikur
                        builder: (context) => SegjumDyrGame()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  //color: Colors.green[100],
                  child: SvgPicture.asset(
                    "/Users/berglind/development/flutter_application_1/assets/memoryForm/123.svg",
                    height: 40,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        //talna memory leikur
                        builder: (context) => SegjumDyrGame()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  //color: Colors.green[100],
                  child: SvgPicture.asset(
                    "/Users/berglind/development/flutter_application_1/assets/memoryForm/123.svg",
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
