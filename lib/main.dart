import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:namer_app/components/set_background.dart';

import 'pages/spilaleikur.dart';
import 'pages/talnaleikur.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SetBackground(child: MyHomePage()));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(),
                  Container(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Spilaleikur()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      //color: Colors.green[100],
                      child: SvgPicture.asset(
                        "assets/spilaleiki.ai-01.svg",
                        // height: 400,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Talnaleikur()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      //color: Colors.green[100],
                      child: SvgPicture.asset(
                        "assets/talnaleikir_ai-01.svg",
                        // height: 400,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    // color: Colors.green[500],
                    // child: VideoPlayer(controller)
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    //color: Colors.green[600],
                    //child: const Text('Revolution, they...'),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
