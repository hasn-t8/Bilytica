import 'package:bilytica/models/user.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  final String baseUrl = "https://randomuser.me/api/";

  Future<List<User>> fetchData(int page) async {
    try {
      final response = await _dio.get(
        '$baseUrl?page=$page&results=10',
      );

      if (response.statusCode == 200) {
        // Map API response to a list of User objects
        return (response.data['results'] as List)
            .map((userJson) => User.fromJson(userJson))
            .toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}

