import 'package:geolocator/geolocator.dart';

class Location {
  double lat;
  double lng;

  Future<Map<String, double>> getLocation() async {
    try {
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      this.lat = position.latitude;
      this.lng = position.longitude;
      return {
        'lat': lat,
        'lng': lng
      };
    } catch(e) {
      print(e);
    }
  }
}