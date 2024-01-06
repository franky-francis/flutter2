import 'package:restapi/modal/user_dob.dart';
import 'package:restapi/modal/user_location.dart';
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


  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,
});

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
