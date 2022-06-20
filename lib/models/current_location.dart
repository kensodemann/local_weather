import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class CurrentLocation with ChangeNotifier {
  final Client _httpClient;
  double _latitude = 0.0;
  double _longitude = 0.0;
  String _locationName = 'Unknown';

  final Map<String, String> _postalAbbreviations = {
    'Alabama': 'AL',
    'Alaska': 'AK',
    'Arizona': 'AZ',
    'Arkansas': 'AR',
    'California': 'CA',
    'Colorado': 'CO',
    'Connecticut': 'CT',
    'Delaware': 'DE',
    'Florida': 'FL',
    'Georgia': 'GA',
    'Hawaii': 'HI',
    'Idaho': 'ID',
    'Illinois': 'IL',
    'Indiana': 'IN',
    'Iowa': 'IA',
    'Kansas': 'KS',
    'Kentucky': 'KY',
    'Louisiana': 'LA',
    'Maine': 'ME',
    'Maryland': 'MD',
    'Massachusetts': 'MA',
    'Michigan': 'MI',
    'Minnesota': 'MN',
    'Mississippi': 'MS',
    'Missouri': 'MO',
    'Montana': 'MT',
    'Nebraska': 'NE',
    'Nevada': 'NV',
    'New Hampshire': 'NH',
    'New Jersey': 'NJ',
    'New Mexico': 'NM',
    'New York': 'NY',
    'North Carolina': 'NC',
    'North Dakota': 'ND',
    'Ohio': 'OH',
    'Oklahoma': 'OK',
    'Oregon': 'OR',
    'Pennsylvania': 'PA',
    'Rhode Island': 'RI',
    'South Carolina': 'SC',
    'South Dakota': 'SD',
    'Tennessee': 'TN',
    'Texas': 'TX',
    'Utah': 'UT',
    'Vermont': 'VT',
    'Virginia': 'VA',
    'Washington': 'WA',
    'West Virginia': 'WV',
    'Wisconsin': 'WI',
    'Wyoming': 'WY',
  };

  CurrentLocation(this._httpClient);

  double get latitude => _latitude;
  double get longitude => _longitude;
  String get locationName => _locationName;

  Future _checkPermissions() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  Future<void> _getLocationName() async {
    final url = Uri.https('api.openweathermap.org', '/geo/1.0/reverse', {
      'lat': _latitude.toString(),
      'lon': _longitude.toString(),
      'limit': '1',
      'appid': dotenv.env['WEATHER_KEY'],
    });
    final response = await _httpClient.get(url);
    final d = json.decode(response.body)[0];
    if (d != null) {
      _locationName =
          '${d["name"]}, ${_postalAbbreviations[d["state"]] ?? d["country"]}';
    } else {
      _locationName = 'Unknown';
    }
  }

  Future<void> _getCurrentLocation() async {
    await _checkPermissions();
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    _latitude = position.latitude;
    _longitude = position.longitude;
    await _getLocationName();
  }

  Future<void> refresh() async {
    try {
      await _getCurrentLocation();
    } catch (e) {
      _latitude = 43.074085;
      _longitude = -89.381027;
    }
    notifyListeners();
  }
}
