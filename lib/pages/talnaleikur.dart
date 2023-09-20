import 'package:flutter/material.dart';
import '../components/home_button.dart';
import '../components/back_button.dart';

class Talnaleikur extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        MyBackButton(),
        MyHomeButton(),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.green[100],
          child: Image.network('https://picsum.photos/250?image=9'),
        ),
      ]),
    );
  }
}
