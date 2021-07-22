import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {

  String location;
  String time;
  String flag;
  String url;
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getData() async {

    try{

      Response response = await get(Uri.parse('https://www.worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);


      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime = now.hour >= 5 && now.hour <= 19 ? true : false;
      time = DateFormat.jm().format(now);

    }
    catch (e){
      print("Error: $e");
      time = 'something  went wrong...';
    }


  }
}