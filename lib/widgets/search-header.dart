// search_header.dart
import 'package:flutter/material.dart';

class SearchHeader extends StatelessWidget {
  final VoidCallback onBack;
  final ValueChanged<String> onSearch;
  final String title; // Dynamic title

  const SearchHeader({
    required this.onBack,
    required this.onSearch,
    required this.title, // Pass the title dynamically
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea( // Ensures the widgets starts below the status bar
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0), // Padding removed from the bottom
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color(0xFF2196F3), // Background color changed to blue
            borderRadius: BorderRadius.circular(16.0), // Rounded corners on all sides
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back arrow and dynamic title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: onBack,
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24.0), // Placeholder for spacing alignment
                ],
              ),
              const SizedBox(height: 10.0),

              // Search bar
              TextField(
                onChanged: onSearch,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 28.0, // Increased icon size
                    color: Colors.black54, // Dark gray color for the icon
                  ),
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
