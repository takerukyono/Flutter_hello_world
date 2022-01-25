import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class TestPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test3"),
      ),
      body: Center(
        child: Container(
          color: Colors.redAccent,
          child: const Text("Test3", style: TextStyle(fontSize: 80),),
        ),
      ),
    );
  }
}
