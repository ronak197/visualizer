import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

class BarVisualizer extends StatefulWidget{

  final double barWidth;
  final Color barColor;

  //TODO: barWidth and barColor are required values
  BarVisualizer({@required this.barWidth, @required this.barColor});

  @override
  _BarVisualizerState createState() => _BarVisualizerState();
}

class _BarVisualizerState extends State<BarVisualizer> with SingleTickerProviderStateMixin{

  int numberOfBars;

  List<double> barLengths = List<double>();
  // Animation<int> animation;
  // AnimationController animationController;
  // Tween<int> barTween;

  StreamController<bool> changeStreamController = StreamController<bool>();

  Timer timer;

  static final List<Bar> bars = List<Bar>();

  static int preValue = 0;

  @override
  void initState() {

    //TODO: Change the number of bars from here
    numberOfBars = 40;
    // barTween = IntTween(begin: 0, end: 1);

    for(int i=0; i<numberOfBars; i++){
      barLengths.add(Random().nextDouble());
      bars.add(Bar(color: widget.barColor, height: Random().nextDouble()*100, width: widget.barWidth,));
    }

    // animationController = AnimationController(
    //   duration: Duration(milliseconds: 250), //TODO: Change the speed by changing duration
    //   vsync: this,
    // );
    //
    //
    // animation = barTween.animate(animationController)
    // ..addListener(() {
    //
    // })
    //   ..addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     animationController.reset();
    //     } else if (status == AnimationStatus.dismissed) {
    //     animationController.forward();
    //     }
    // });
    //
    //
    // animationController.stop();

    timer = Timer.periodic(Duration(milliseconds: 200), (timer){
      changeStreamController.sink.add(true);
    });

    super.initState();
  }

  @override
  void dispose() {
    // animationController.dispose();
    changeStreamController.close();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: changeStreamController.stream,
      builder: (context, snapshot) {
        return SizedBox(
          height: 150.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(barLengths.length, (index) {
              return Bar(color: widget.barColor, height: Random().nextDouble()*100, width: widget.barWidth,);
            }),
          ),
        );
      }
    );
  }
}

class Bar extends StatelessWidget {

  final double width;
  final double height;
  final Color color;

  Bar({this.color,this.height,this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.0),
          color: color,
          // gradient: LinearGradient(
          //     begin: Alignment.bottomCenter,
          //     end: Alignment.topCenter,
          //     stops: [0.0,1.0],
          //     colors: [Color(0xffFC5C7D), Color(0xff6A82FB)]
          // )
        ),
        width: width,
        height: height,
      ),
    );
  }
}