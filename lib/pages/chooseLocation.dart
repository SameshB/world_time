import 'package:flutter/material.dart';
import 'package:Time/services/timeZone.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<TimeZone> timezones = [
    TimeZone(location: 'Kathmandu, Nepal', offset: '+00:00', flag: 'nepal.png'),
    TimeZone(location: 'New Dehli, India', offset: '+05:30', flag: 'india.png'),
    TimeZone(
        location: 'London, England', offset: '+00:00', flag: 'england.png'),
    TimeZone(
        location: 'Chicago, USA', offset: '-06:00', flag: 'united-states.png'),
  ];

  void updateTime(index) async {
    TimeZone instance = timezones[index];
    await instance.getTime();
    Navigator.pop(
      context,
      {
        'location': instance.location,
        'time': instance.time,
        'isDay': instance.isDay,
        'flag': instance.flag
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: timezones.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(timezones[index].location.split(',')[0]),
                leading: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage('images/flags/${timezones[index].flag}'),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
