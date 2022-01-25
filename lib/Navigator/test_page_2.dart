import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:hello_world/Navigator/test_page_3.dart';

// ignore: use_key_in_widget_constructors
class TestPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () => {
                      // Navigator.of(context)
                      //     .push(MaterialPageRoute(builder: (context) {
                      //   return TestPage3();
                      // }))
                      Navigator.of(context).pushNamed("/test3")
                    },
                child: const Text(
                  "進む",
                  style: TextStyle(fontSize: 80),
                )),
            TextButton(
                onPressed: () => {Navigator.of(context).pop()},
                child: const Text(
                  "戻る",
                  style: TextStyle(fontSize: 80),
                ))
          ],
        ),
      ),
    );
  }
}
