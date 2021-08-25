import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:world_time/Services/WorldTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setUpWorldTime() async {
    WorldTime instance =
        WorldTime(location: "Kolkata", url: "Asia/Kolkata", flag: "India.png");

    await instance.getTime();

    // go  to home screen when data loading complete

    //Navigator.pushNamed(context, '/home'); // it placed on top of the loading screen in stack
    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDayTime': instance.isDayTime
      },
    ); // it replaced loading screen in stack
  }

  // lifecycle method
  // it called only once when widget is created
  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  final spinkit = SpinKitFadingCube(
    color: Colors.white,
    size: 50.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: spinkit,
      ),
    );
  }
}
