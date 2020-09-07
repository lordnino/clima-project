import 'package:geolocator/geolocator.dart';

class Location {
  double lat;
  double lng;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      this.lat = position.latitude;
      this.lng = position.longitude;
    } catch(e) {
      print(e);
    }
  }
}