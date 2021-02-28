import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class MicVisualizer extends StatefulWidget {

  final Color pulseColor;
  final String iconPath;

  MicVisualizer({this.pulseColor, this.iconPath});

  @override
  _MicVisualizerState createState() => _MicVisualizerState();
}

class _MicVisualizerState extends State<MicVisualizer> with TickerProviderStateMixin{

  Animation<double> circleRadius1;
  Animation<double> circleRadius2;
  Animation<double> circleRadius3;
  Animation<double> circleRadius4;
  Animation<double> circleRadius5;

  AnimationController animationController;

  runAnimation() async{
    animationController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        animationController.reverse();
      } else if(status == AnimationStatus.dismissed){
        animationController.forward();
      }
    });

    animationController.forward();
    // animationController.repeat();

    // Example pitch for 10 seconds
    // uncomment below to test it

    //...

    // var  timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
    //   feed(Random().nextDouble());
    // });
    //
    // await Future.delayed(Duration(seconds: 20));
    //
    // timer.cancel();

    //....
  }

  feed(double pitch){
    animationController.reverse(from: pitch);
  }

  @override
  void initState() {

    animationController = AnimationController(
        duration: const Duration(milliseconds: 1500),
        reverseDuration: const Duration(milliseconds: 1500),
        vsync: this,

    );

    circleRadius1 = Tween<double>(begin: 27.0, end: 35.0).animate(
        CurvedAnimation(curve: Curves.easeInOutSine, reverseCurve: Curves.easeInOutSine, parent: animationController)
    );
    circleRadius2 = Tween<double>(begin: 27.0, end: 42.0).animate(
        CurvedAnimation(curve: Curves.easeInOutSine, reverseCurve: Curves.easeInOutSine,parent: animationController)
    );
    circleRadius3 = Tween<double>(begin: 27.0, end: 45.0).animate(
        CurvedAnimation(curve: Curves.easeInOutSine, reverseCurve: Curves.easeInOutSine,parent: animationController)
    );
    circleRadius4 = Tween<double>(begin: 27.0, end: 50.0).animate(
        CurvedAnimation(curve: Curves.easeInOutSine,reverseCurve: Curves.easeInOutSine, parent: animationController)
    );
    circleRadius5 = Tween<double>(begin: 27.0, end: 53.0).animate(
        CurvedAnimation(curve: Curves.easeInOutSine,reverseCurve: Curves.easeInOutSine, parent: animationController)
    );


    runAnimation();


    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context,child){
        return Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: circleRadius5?.value ?? 28.0,
              // backgroundColor: Color(0xff043b58).withOpacity(0.2),
              backgroundColor: HSLColor.fromColor(widget.pulseColor).withLightness(0.1).toColor().withOpacity(0.2),
            ),
            CircleAvatar(
              radius: circleRadius4?.value ?? 28.0,
              // backgroundColor: Color(0xff034567).withOpacity(0.2),
              backgroundColor: HSLColor.fromColor(widget.pulseColor).withLightness(0.2).toColor().withOpacity(0.2),
            ),
            CircleAvatar(
              radius: circleRadius3?.value ?? 28.0,
              // backgroundColor: Color(0xff026295).withOpacity(0.2),
              backgroundColor: HSLColor.fromColor(widget.pulseColor).withLightness(0.3).toColor().withOpacity(0.2),
            ),
            CircleAvatar(
              radius: circleRadius2?.value ?? 28.0,
              // backgroundColor: Color(0xff0185ca).withOpacity(0.2),
              backgroundColor: HSLColor.fromColor(widget.pulseColor).withLightness(0.5).toColor().withOpacity(0.2),
            ),
            CircleAvatar(
              radius: circleRadius1?.value ?? 28.0,
              // backgroundColor: Color(0xff2b9cd8).withOpacity(0.2),
              backgroundColor: HSLColor.fromColor(widget.pulseColor).withLightness(0.7).toColor().withOpacity(0.2),
            ),
            FloatingActionButton(
              onPressed: (){},
              elevation: 0.0,
              child: Icon(Icons.mic_none, color: Colors.white,),
              // backgroundColor: Color(0xff2b9cd8),
              backgroundColor: widget.pulseColor,
            ),
          ],
        );
      },
    );
  }
}

