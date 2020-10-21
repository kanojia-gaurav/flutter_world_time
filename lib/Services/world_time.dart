import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String time;
  String flag;
  String url;
  bool isDayTIme;

  WorldTime({this.location, this.flag, this.url});

Future <void> getTime() async{

  try{

    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    //print(data);

    //get properties from data

    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    String minute1 = data['utc_offset'].substring(3,6);
    //print(datetime);
    print(offset);
    print(minute1);

    //create datatime object

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));


    //set time property.
    isDayTIme = now.hour>6 && now.hour<18 ? true : false;
    time = DateFormat.jm().format(now);


  }
  catch(e){
    time = 'Could not load Time';
  }



  }
}


