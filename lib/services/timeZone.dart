import 'package:http/http.dart';
import 'dart:convert';

class TimeZone {
  String location;
  String time;
  String offset;
  String flag;
  bool isDay;

  TimeZone({this.location, this.offset, this.flag});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldclockapi.com/api/json/utc/now');
      Map data = jsonDecode(response.body);

      String datetime = data['currentDateTime'];
      DateTime utcNow = DateTime.parse(datetime);
      String symbol = offset.substring(0, 1);
      int hours = int.parse(offset.substring(1, 3));
      int minutes = int.parse(offset.substring(4, 6));
      DateTime now = symbol == '+'
          ? utcNow.add(Duration(hours: hours, minutes: minutes))
          : utcNow.subtract(Duration(hours: hours, minutes: minutes));
      isDay = (now.hour > 5 && now.hour < 18) ? true : false;
      time = now.toString().substring(11, 16);
    } catch (e) {
      time = "Failed to load time";
      print('caught error: $e');
    }
  }
}
