import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = Location();

  @override
  void initState() {
    super.initState();
    location.getLocation();
  }

  void getData() async {
    Response response =  await get('https://samples.openweathermap.org/data/'
        '2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02');
    print(response.body);
  }



  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            //Get the current location
            await location.getLocation();
            print(location.lat);
            print(location.lng);
          },
          child: Text('Get Location'),
        ),
      ),
    );

  }
}
