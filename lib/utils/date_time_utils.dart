import 'package:intl/intl.dart';
import 'dart:math'; // Import the math library

String formatDate(String dateStr) {
  try {
    DateTime dateTime = DateTime.parse(dateStr);
    return DateFormat('E, MMM dd yyyy').format(dateTime);
  } catch (e) {
    return "Invalid Date";
  }
}

String formatTime(String timeString) {
  try {
    if (timeString.contains("-")) {
      // If it contains a date, use DateTime.parse()
      return DateFormat.jm().format(DateTime.parse(timeString));
    } else {
      // If it's just a time, add a dummy date
      String formattedString = "1970-01-01 $timeString";
      DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(formattedString);
      return DateFormat.jm().format(dateTime);
    }
  } catch (e) {
    return "Invalid Time";
  }
}

double calculateDistanceToMyLocation(double userLatitude, double userLongitude) {
  // Define your location (e.g., New York City)
  const double myLatitude = -16.9651;
  const double myLongitude = -39.2620;

  // Calculate the distance from my location to the user's location
  return _calculateHaversineDistance(myLatitude, myLongitude, userLatitude, userLongitude);
}

double _calculateHaversineDistance(double lat1, double lon1, double lat2, double lon2) {
  const double earthRadius = 6371;

  double dLat = _degToRad(lat2 - lat1);
  double dLon = _degToRad(lon2 - lon1);

  double a = sin(dLat / 2) * sin(dLat / 2) +
      cos(_degToRad(lat1)) * cos(_degToRad(lat2)) *
          sin(dLon / 2) * sin(dLon / 2);

  double c = 2 * atan2(sqrt(a), sqrt(1 - a));
  return earthRadius * c;
}

double _degToRad(double deg) {
  return deg * (pi / 180);
}
