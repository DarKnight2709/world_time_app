import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    // cast as Map because arguments is Object
    data = data.isEmpty ?  ModalRoute.of(context)?.settings.arguments as Map ?? {}: data;
    String bgImage = (data['isDayTime'] ?? false) ? 'day_image' : 'night_image';

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/$bgImage.${data['isDayTime'] ? 'jpg' : 'png'}'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () async{
              dynamic result =  await Navigator.pushNamed(context, '/location');
              setState(() {
                data = {
                  'location': result['location'],
                  'flag': result['flag'],
                  'time': result['time'],
                  'isDayTime': result['isDayTime'],
                };
              });



              
            } ,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
            ),
            child: const Icon(Icons.edit_location)
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(data['location'],
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 5.0,
                      color: data['isDayTime'] ? Colors.black : Colors.white)),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            data['time'],
            style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                wordSpacing: 10.0,
                color: data['isDayTime'] ? Colors.black54 : Colors.white54),
          )
        ],
      )),
    ));
  }
}
