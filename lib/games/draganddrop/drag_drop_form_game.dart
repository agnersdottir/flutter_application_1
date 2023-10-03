import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:namer_app/components/back_button.dart';
import 'package:namer_app/components/set_background.dart';

class DraggableWidget extends StatefulWidget {
  const DraggableWidget({Key? key}) : super(key: key);

  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class CorrectPair {
  SvgPicture sourceImage;
  SvgPicture targetImage;
  String id;

  CorrectPair(
      {required this.sourceImage, required this.targetImage, required this.id});
}

class Pair {
  SvgPicture sourceImage;
  SvgPicture targetImage;
  String sourceId;
  String targetId;
  bool isComplete;
  Pair(
      {required this.sourceImage,
      required this.targetImage,
      required this.sourceId,
      required this.targetId,
      required this.isComplete});
}

class _DraggableWidgetState extends State<DraggableWidget> {
  List<CorrectPair> correctPairs = [
    CorrectPair(
        sourceImage: SvgPicture.asset("assets/segjumsamanislenskudyr.svg"),
        targetImage: SvgPicture.asset("assets/segjumsamanislenskudyr.svg"),
        id: "sheep"),
    CorrectPair(
        sourceImage: SvgPicture.asset("assets/blandalitirnir.svg"),
        targetImage: SvgPicture.asset("assets/blandalitirnir.svg"),
        id: "horse"),
    CorrectPair(
        sourceImage: SvgPicture.asset("assets/vedur.svg"),
        targetImage: SvgPicture.asset("assets/vedur.svg"),
        id: "dog")
  ];
  Color caughtColor = Colors.red;

  List<Pair> pairs = [];
  @override
  void initState() {
    super.initState();
    pairs = [
      Pair(
          sourceImage: correctPairs[0].sourceImage,
          targetImage: correctPairs[1].targetImage,
          sourceId: correctPairs[0].id,
          targetId: correctPairs[1].id,
          isComplete: false),
      Pair(
          sourceImage: correctPairs[1].sourceImage,
          targetImage: correctPairs[2].targetImage,
          sourceId: correctPairs[1].id,
          targetId: correctPairs[2].id,
          isComplete: false),
      Pair(
          sourceImage: correctPairs[2].sourceImage,
          targetImage: correctPairs[0].targetImage,
          sourceId: correctPairs[2].id,
          targetId: correctPairs[0].id,
          isComplete: false)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SetBackground(
            child: Column(children: [
      Row(
        children: [Container(padding: EdgeInsets.all(24), child: BackButton())],
      ),
      Expanded(
        child: GridView.extent(
          maxCrossAxisExtent: 400,
          padding: EdgeInsets.only(left: 50, right: 50, top: 0, bottom: 0),
          mainAxisSpacing: 60,
          crossAxisSpacing: 90,
          physics: NeverScrollableScrollPhysics(),
          childAspectRatio: 2 / 2,
          children: [
            for (var item in pairs) ...{
              Draggable(
                data: item.sourceId,
                onDraggableCanceled: (velocity, offset) => {},
                feedback: Container(
                    color: Colors.grey.shade200.withOpacity(0.5),
                    height: 300,
                    width: 300,
                    child: item.sourceImage),
                child: Container(
                    color: item.isComplete
                        ? Colors.grey.shade200.withOpacity(0.01)
                        : Colors.grey.shade200,
                    child: Opacity(
                      opacity: item.isComplete ? 0.4 : 1,
                      child: item.sourceImage,
                    )),
              ),
              DragTarget(onAccept: (String sourceId) {
                if (sourceId == item.targetId) {
                  var e = pairs
                      .singleWhere((element) => element.sourceId == sourceId);
                  setState(() {
                    e.isComplete = true;
                  });
                }
                print(pairs[0].isComplete);
              }, builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) {
                return Container(
                    color: Colors.grey.shade200, child: item.targetImage);
              })
            }
          ],
        ),
      )
    ])));
  }
}
