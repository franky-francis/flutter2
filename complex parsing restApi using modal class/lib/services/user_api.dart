import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restapi/modal/user_dob.dart';
import 'package:restapi/modal/user_location.dart';

import '../modal/user.dart';
import '../modal/username_api.dart';
class UserApi {

  static Future<List<User>> fetchUsers() async {
    print('users fetched');
    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      final name = Username(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last'],

      );
      final date = e['dob']['date'];
      final dob = UserDob(
          date: 
          DateTime.parse(date), 
          age: e['dob']['age']);

      final coordinates = LocationCoordinate(
          latitude: e['location']['coordinates']['latitude'],
          longitude: e['location']['coordinates']['longitude'],
      );

      final street = LocationStreet(
          number: e['location']['street']['number'],
          name: e['location']['street']['name'],
      );
      final timezone = LocationTimezone(
          offset: e['location']['timezone']['offset'],
          description: e['location']['timezone']['description'],
      );

      final location = UserLocation(
          city: e['location']['city'],
          coordinates: coordinates,
          country: e['location']['country'],
          // some post code are string
          postcode: e['location']['postcode'].toString(),
          state: e['location']['state'],
          street: street,
          timezone: timezone);
      return User(
        gender: e['gender'],
        email: e['email'],
        phone: e['phone'],
        cell: e['cell'],
        nat: e['nat'],
        name: name,
        dob: dob,
        location: location,
      );
    }).toList();
    return users;

    print('completed');
  }
}