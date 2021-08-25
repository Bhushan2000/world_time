import 'package:flutter/material.dart';




// this is nnot part of project it is only for understandinng asychronous code in flutter


class Asychronous extends StatefulWidget {
  const Asychronous({Key? key}) : super(key: key);

  @override
  _AsychronousState createState() => _AsychronousState();
}

class _AsychronousState extends State<Asychronous> {
  // lifecycle method
  // it called only once when widget is created
  @override
  void initState() {
    super.initState();
    print("initState called");
    getData();
  }

  int counter = 0;

  // non blocking code (synchronous code)
  // here Future funtion 1  & 2 execute simultaneously and Future funtion 2 not wait for  Future funtion 1 to complete its execution first
  // void getData() {
  //   // simulate network request for a database
  //   Future.delayed(Duration(seconds: 3), () {
  //     print("Future funtion 1");
  //   });

  //   // simulate network request for biodata of user
  //   Future.delayed(Duration(seconds: 2), () {
  //     print("Future funtion 2");
  //   });
  // }

  //  blocking code (asynchronous code)
  // here Future funtion 1  & 2 execute one after another and Future funtion 2  wait for  Future funtion 1 to complete its execution first
  // this asynchronous is useful when we dealing with the  Network requpest

  void getData() async {
    // simulate network request for a database
    await Future.delayed(Duration(seconds: 3), () {
      print("Future funtion 1");
    });

    // simulate network request for biodata of user
    await Future.delayed(Duration(seconds: 2), () {
      print("Future funtion 2");
    });

    // we can store response of network request inside await
    String user = await Future.delayed(Duration(seconds: 2), () {
      return "Bhuhan";
    });
    print(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("loading"),
    );
  }
}
