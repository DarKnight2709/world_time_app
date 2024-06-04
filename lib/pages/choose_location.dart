import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'Athens', flag: 'greece', url: 'Europe/Athens'),
    WorldTime(location: 'Bangkok', flag: 'thailand', url: 'Asia/Bangkok'),
    WorldTime(location: 'Beijing', flag: 'china', url: 'Asia/Shanghai'),
    WorldTime(location: 'Berlin', flag: 'germany', url: 'Europe/Berlin'),
    WorldTime(
        location: 'Buenos Aires',
        flag: 'argentina',
        url: 'America/Argentina/Buenos_Aires'),
    WorldTime(location: 'Cairo', flag: 'egypt', url: 'Africa/Cairo'),
    WorldTime(
        location: 'Cape Town',
        flag: 'south-africa',
        url: 'Africa/Johannesburg'),
    WorldTime(
        location: 'Dubai', flag: 'united-arab-emirates', url: 'Asia/Dubai'),
    WorldTime(
        location: 'Ho Chi Minh city', flag: 'vietnam', url: 'Asia/Ho_Chi_Minh'),
    WorldTime(location: 'London', flag: 'united-kingdom', url: 'Europe/London'),
    WorldTime(location: 'Madrid', flag: 'spain', url: 'Europe/Madrid'),
    WorldTime(
        location: 'Mexico City', flag: 'mexico', url: 'America/Mexico_City'),
    WorldTime(location: 'Moscow', flag: 'russia', url: 'Europe/Moscow'),
    WorldTime(location: 'Mumbai', flag: 'india', url: 'Asia/Kolkata'),
    WorldTime(location: 'Nairobi', flag: 'kenya', url: 'Africa/Nairobi'),
    WorldTime(
        location: 'New York', flag: 'united-states', url: 'America/New_York'),
    WorldTime(location: 'Oslo', flag: 'norway', url: 'Europe/Oslo'),
    WorldTime(location: 'Paris', flag: 'france', url: 'Europe/Paris'),
    WorldTime(
        location: 'Rio de Janeiro', flag: 'brazil', url: 'America/Sao_Paulo'),
    WorldTime(location: 'Rome', flag: 'italy', url: 'Europe/Rome'),
    WorldTime(location: 'Seoul', flag: 'south-korea', url: 'Asia/Seoul'),
    WorldTime(location: 'Singapore', flag: 'singapore', url: 'Asia/Singapore'),
    WorldTime(location: 'Stockholm', flag: 'sweden', url: 'Europe/Stockholm'),
    WorldTime(location: 'Sydney', flag: 'australia', url: 'Australia/Sydney'),
    WorldTime(location: 'Tokyo', flag: 'japan', url: 'Asia/Tokyo'),
    WorldTime(location: 'Toronto', flag: 'canada', url: 'America/Toronto'),
  ];

  void setUpTime(BuildContext context, int index) async {
  WorldTime instance = locations[index];
  await instance.getTime();

  Navigator.pop(context, {
    'location': instance.location,
    'flag': instance.flag,
    'time': instance.time,
    'isDayTime': instance.isDayTime,
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Text("Choose location",
              style: TextStyle(color: Colors.white)),
          elevation: 0,
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: 26,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  setUpTime(context, index);
                },
                title: Text(locations[index].location),
              ),
            );
          },
        ));
  }
}


