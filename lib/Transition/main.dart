// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:hello_world/PageView/test_page_1.dart';
import 'package:hello_world/PageView/test_page_2.dart';
import 'package:hello_world/PageView/test_page_3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationDouble;
  final Tween<double> _tweenDouble = Tween(begin: 0.0, end: 200.0);
  late Animation<Color?> _animationColor;
  final ColorTween _tweenColor =
      ColorTween(begin: Colors.green, end: Colors.blue);
  late Animation _animation;

  _play() async {
    setState(() {
      _animationController.forward();
    });
  }

  _stop() async {
    setState(() {
      _animationController.stop();
    });
  }

  _reverse() async {
    setState(() {
      _animationController.reverse();
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animationDouble = _tweenDouble.animate(_animationController);
    _animationDouble.addListener(() {
      setState(() {});
    });
    _animationColor = _tweenColor.animate(_animationController);
    _animationColor.addListener(() {
      setState(() {});
    });
    _animation = _animationController.drive(Tween(begin: 0.0, end: 2.0 * pi));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[

          // AnimationContoroller

          // SizeTransition(
          //   sizeFactor: _animationController,
          //   child: Center(
          //     child: SizedBox(
          //       child: Container(
          //         color: Colors.green,
          //       ),
          //       width: 50,
          //       height: 50,
          //     ),
          //   ),
          // ),

          // Animation/Tween

          //       Text("AnimationController:${_animationController.value}"),
          //       Text("AnimationDouble:${_animationDouble.value}"),
          //       Text("AnimationColor:${_animationColor.value}"),
          //       SizeTransition(
          //         sizeFactor: _animationController,
          //         child: SizedBox(
          //           child: Center(
          //             child: SizedBox(
          //               child: Container(
          //                 color: _animationColor.value,
          //               ),
          //               width: _animationDouble.value,
          //               height: _animationDouble.value,
          //             ),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),

          // AnimationBuilder

          child: AnimatedBuilder(
              animation: _animation,
              builder: (context, _) {
                return Transform.rotate(
                    angle: _animation.value,
                    child: const Icon(Icons.cached, size: 100));
              })),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: _play,
            child: const Icon(Icons.arrow_forward),
          ),
          FloatingActionButton(
            onPressed: _stop,
            child: const Icon(Icons.pause),
          ),
          FloatingActionButton(
            onPressed: _reverse,
            child: const Icon(Icons.arrow_back),
          )
        ],
      ),
    );
  }
}
