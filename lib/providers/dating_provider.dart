import 'package:flutter/material.dart';
import 'package:bilytica/services/api_service.dart';

class DatingProvider with ChangeNotifier {
  final ApiService apiService;
  List<dynamic> _dating = [];
  bool _isLoading = false;
  bool _hasMoreData = true;
  int _currentPage = 1;

  List<dynamic> get reviews => _dating;
  bool get isLoading => _isLoading;
  bool get hasMoreData => _hasMoreData;

  DatingProvider(this.apiService);

  Future<void> fetchList() async {
    if (_isLoading) return; // Prevent fetching while already loading
    _isLoading = true;
    notifyListeners();

    try {
      final newList = await apiService.fetchData(_currentPage);
      if (newList.isEmpty) {
        _hasMoreData = false;
      } else {
        _dating.addAll(newList);
        _currentPage++;
      }
    } catch (e) {
      print("Error fetching reviews: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
