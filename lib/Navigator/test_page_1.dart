import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:hello_world/Navigator/test_page_2.dart';

// ignore: use_key_in_widget_constructors
class TestPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test1"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => {
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            //   return TestPage2();
            // }))
            Navigator.of(context).pushNamed("/test2")
          },
          child: const Text(
            "進む",
            style: TextStyle(fontSize: 80),
          ),
        ),
      ),
    );
  }
}
