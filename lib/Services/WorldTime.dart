import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String? location;
  String? time;
  String? flag;
  String? url;
  bool? isDayTime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    // make Request

    try {
      var path =
          Uri.https('worldtimeapi.org', '/api/timezone/$url', {'q': '{http}'});

      var response = await http.get(path);

      // print(response.body); // it print json object in the form of string representation

      Map data = jsonDecode(response
          .body); // to convert json object we need to import 'dart:convert' which decode the json object into map

      //  get properties from data
      String dateTime = data['datetime'];
      // String offsetWithoutSubString = data['utc_offset'];
      String offset = data['utc_offset'].substring(1, 3);

      // print(dateTime)
      // print(offset);

      // we not wannt "+" in offset then

      // Create DateTime Object
      DateTime now = DateTime.parse(dateTime);
 

      now = now.add(Duration(hours: int.parse(offset)));


      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;

      // set time
      time = DateFormat.jm().format(now);
    } catch (e) {
      print("caaught error $e");
      time = "Could not get time";
      isDayTime = false;
    }
  }
}
