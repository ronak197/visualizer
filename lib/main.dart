import 'package:flutter/material.dart';
import 'dart:math';
import 'package:visualizer/bar_visualizer.dart';
import 'package:visualizer/mic_visualizer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(

        child: MicVisualizer(
          pulseColor: Colors.blue,
        ),

        // child: BarVisualizer(
        //   barWidth: 5.0,
        //   barColor: Colors.blue,
        // ),

      )
    );
  }
}