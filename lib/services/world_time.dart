import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = 'time';
  String flag;
  String url;
  bool isDayTime = false;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].toString().substring(1, 3);

      DateTime now =
          DateTime.parse(datetime).add(Duration(hours: int.parse(offset)));

      time = DateFormat.jm().format(now);
      isDayTime = now.hour >= 6 && now.hour <= 17;
    } catch (e) {
      time = 'could not get the time data';

    }
  }
}
