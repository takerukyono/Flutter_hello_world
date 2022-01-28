// ignore_for_file: avoid_print, unused_import

import 'dart:async';
import 'dart:io';

class Async {
  void asynctest1() {
    print("method begin");
    print(DateTime.now().toString());
    print("data1 start");
    print(syncFunc("data1", 3));
    print("data2 start");
    print(syncFunc("data2", 2));
    print("data3 start");
    print(syncFunc("data3", 1));
  }

  void asynctest2() {
    print("method begin");
    print(DateTime.now().toString());
    print("data1 start");
    print(asyncFunc("data1", 3));
    print("data2 start");
    print(asyncFunc("data2", 2));
    print("data3 start");
    print(asyncFunc("data3", 1));
  }

  void asynctest3() async {
    print("method begin");
    print(DateTime.now().toString());
    print("data1 start");
    Future<String> result1 = asyncFunc("data1", 3);
    result1.then((result) {
      print(result);
    });
    print("data2 start");
    Future<String> result2 = asyncFunc("data2", 2);
    result2.then((result) {
      print(result);
    });
    print("data3 start");
    Future<String> result3 = asyncFunc("data3", 1);
    result3.then((result) {
      print(result);
    });
  }

    void asynctest4() async{
    print("method begin");
    print(DateTime.now().toString());
    print("data1 start");
    print(await asyncFunc("data1", 3));
    print("data2 start");
    print(await asyncFunc("data2", 2));
    print("data3 start");
    print(await asyncFunc("data3", 1));
  }


  // 通常処理
  String syncFunc(String name, int time) {
    sleep(Duration(seconds: time));
    return name + ":" + DateTime.now().toString();
  }

  // 非同期処理
  Future<String> asyncFunc(String name, int time) async {
    return Future.delayed(Duration(seconds: time), () {
      return name + ":" + DateTime.now().toString();
    });
  }
}
