class User {
  final String firstName;
  final String lastName;
  final String imageUrl;
  final String location;
  final String dateOfBirth;
  final String timeOfBirth;
  final String city;
  final String country;
  final String date;
  final String time;
  final String personName;
  final double latitude;
  final double longitude;

  User({
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
    required this.location,
    required this.dateOfBirth,
    required this.timeOfBirth,
    required this.city,
    required this.country,
    required this.date,
    required this.time,
    required this.personName,
    required this.latitude,
    required this.longitude,
  });

  // Factory constructor to parse the data from the API
  factory User.fromJson(Map<String, dynamic> json) {
    // Extract latitude and longitude from coordinates
    final latitude = double.tryParse(json['location']['coordinates']['latitude'].toString()) ?? 0.0;
    final longitude = double.tryParse(json['location']['coordinates']['longitude'].toString()) ?? 0.0;

    return User(
      firstName: json['name']['first'],
      lastName: json['name']['last'],
      imageUrl: json['picture']['large'],
      location: '${json['location']['city']}, ${json['location']['country']}',
      dateOfBirth: json['dob']['date'].substring(0, 10),
      timeOfBirth: json['dob']['date'].substring(11, 19),
      city: json['location']['city'],
      country: json['location']['country'],
      date: json['dob']['date'].substring(0, 10),
      time: json['dob']['date'].substring(11, 19),
      personName: json['name']['first'],
      latitude: latitude,
      longitude: longitude,
    );
  }
}
