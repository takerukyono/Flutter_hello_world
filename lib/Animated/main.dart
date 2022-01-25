import 'package:flutter/material.dart';
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
  bool flag = false;

  _click() async {
    setState(() {
      flag = !flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // AnimatedOpacity,AnimatedSize,AnimatedAlign

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // AnimatedOpacity(
            //   opacity: flag ? 0.1 : 1.0,
            //   duration: const Duration(seconds: 3),
            //   child: Text(
            //     "消える文字",
            //     style: Theme.of(context).textTheme.headline4,
            //   ),
            // ),
            // AnimatedSize(
            //   // vsync: this,
            //   duration: const Duration(seconds: 3),
            //   child: SizedBox(
            //     width: flag ? 50 : 200,
            //     height: flag ? 50 : 200,
            //     child: Container(
            //       color: Colors.purple,
            //     ),
            //   ),
            // ),
            // AnimatedAlign(
            //   alignment: flag ? Alignment.topLeft : Alignment.topRight,
            //   duration: const Duration(seconds: 3),
            //   child: SizedBox(
            //     width: 50,
            //     height: 50,
            //     child: Container(
            //       color: Colors.green,
            //     ),
            //   ),
            // ),

            AnimatedContainer(
              duration: const Duration(seconds: 3),
              width: flag ? 100 : 50,
              height: flag ? 50 : 100,
              padding: flag ? const EdgeInsets.all(0) : const EdgeInsets.all(30),
              margin: flag ? const EdgeInsets.all(0) : const EdgeInsets.all(30),
              transform: flag ? Matrix4.skewX(0.0) : Matrix4.skewY(0.3),
              color: flag ? Colors.blue : Colors.grey,
            ),
            AnimatedSwitcher(
              duration: const Duration(seconds: 3),
              child: flag
                  ? const Text("なにもない")
                  : const Icon(
                      Icons.favorite,
                      color: Colors.pink,
                    ),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _click,
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
