class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCoordinate coordinates;
  final LocationTimezone timezone;

  UserLocation({
    required this.city,
    required this.coordinates,
    required this.country,
    required this.postcode,
    required this.state,
    required this.street,
    required this.timezone,

  });

  factory UserLocation.fromMap(Map<String, dynamic> json) {



    final coordinates = LocationCoordinate.fromMap(json['coordinates']);
    final street = LocationStreet.fromMap(json['street']);

    final timezone = LocationTimezone.fromMap(json['timezone']);
    return UserLocation(
        city: json['city'],
        coordinates: coordinates,
        country: json['country'],
        // some post code are string
        postcode: json['postcode'].toString(),
        state: json['state'],
        street: street,
        timezone: timezone);
  }

}

class LocationCoordinate {
  final String latitude;
  final String longitude;

  LocationCoordinate ({
    required this.latitude,
    required this.longitude,
  });

  factory LocationCoordinate.fromMap(Map<String, dynamic> json) {
    return LocationCoordinate(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

}

class LocationTimezone {
  final String offset;
  final String description;

  LocationTimezone({
    required this.offset,
    required this.description,
  });

  factory LocationTimezone.fromMap(Map<String, dynamic> json) {
    return  LocationTimezone(
      offset: json['offset'],
      description: json['description'],
    );
  }


}

class LocationStreet {
  final int number;
  final String name;

  LocationStreet({
    required this.number,
    required this.name,
  });

  factory LocationStreet.fromMap(Map<String, dynamic> json) {
    return LocationStreet(
      number: json['number'],
      name: json['name'],
    );
  }

}