import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class TestPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test2"),
      ),
      body: Center(
        child: Container(
          color: Colors.redAccent,
          child: const Text("Test2", style: TextStyle(fontSize: 80),),
        ),
      ),
    );
  }
}
