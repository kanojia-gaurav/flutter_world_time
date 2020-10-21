import 'package:flutter/material.dart';
import 'package:world_time/Services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Colombo', location: 'Srilanka', flag: 'srilanka.png'),
    WorldTime(url: 'Asia/Dhaka', location: 'Bangladesh', flag: 'bangladesh.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'India', flag: 'india.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
  ];

  void updateTime(index) async{

    WorldTime instance = locations[index];
    await instance.getTime();
    //poping the choose_location
    Navigator.pop(context,{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTIme,

    });

  }

  @override
  Widget build(BuildContext context) {
    print('Build is running');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text('choose location'),
        centerTitle: true,
        elevation: 0,
      ),

      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),


    );
  }
}
