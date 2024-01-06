import 'package:restapi/modal/user_dob.dart';
import 'package:restapi/modal/user_location.dart';
import 'package:restapi/modal/user_picture.dart';
import 'package:restapi/modal/username_api.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final Username name;
  final UserDob dob;
  final UserLocation location;
  final UserPicture picture;


  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,
    required this.picture,
});

  factory User.fromMap(Map<String, dynamic> e) {

    final date = e['dob']['date'];


    final name = Username.fromMap(e['name']);

    final picture = UserPicture.fromMap(e['picture']);
    final location = UserLocation.fromMap(e['location']);
    final dob = UserDob.fromMap(e['dob']);




    return User(
      gender: e['gender'],
      email: e['email'],
      phone: e['phone'],
      cell: e['cell'],
      nat: e['nat'],
      name: name,
      dob: dob,
      location: location,
      picture : picture,
    );

  }

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
