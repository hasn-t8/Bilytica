import 'package:bilytica/services/api_service.dart';
import 'package:bilytica/widgets/dating_card.dart';
import 'package:bilytica/widgets/search-header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bilytica/providers/dating_provider.dart';
import 'package:bilytica/utils/date_time_utils.dart'; // Import utility file

class DatingCardList extends StatefulWidget {
  @override
  _DatingCardListState createState() => _DatingCardListState();
}

class _DatingCardListState extends State<DatingCardList> {
  @override
  void initState() {
    super.initState();
    final datingProvider = Provider.of<DatingProvider>(context, listen: false);
    datingProvider.fetchList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchHeader(
            title: "Dating List",
            onBack: () => Navigator.pop(context),
            onSearch: (query) => print('Search query: $query'),
          ),
          Expanded(
            child: Consumer<DatingProvider>(
              builder: (context, reviewProvider, child) {
                return NotificationListener<ScrollNotification>(
                  onNotification: (scrollNotification) {
                    if (scrollNotification is ScrollEndNotification &&
                        scrollNotification.metrics.pixels ==
                            scrollNotification.metrics.maxScrollExtent) {
                      if (reviewProvider.hasMoreData) {
                        reviewProvider.fetchList();
                      }
                    }
                    return false;
                  },
                  child: ListView.builder(
                    itemCount: reviewProvider.reviews.length,
                    itemBuilder: (context, index) {
                      final user = reviewProvider.reviews[index];
                      String formattedDate = formatDate(user.dateOfBirth);
                      String formattedTime = formatTime(user.timeOfBirth);
                      // Calculate the distance
                      double distance = calculateDistanceToMyLocation(user.latitude, user.longitude);
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: DatingCard(
                          title: '${user.firstName} ${user.lastName}',
                          imageUrl: user.imageUrl,
                          location: user.location,
                          date: formattedDate,
                          time: formattedTime,
                          personName: user.firstName,
                          distance: '${distance.toStringAsFixed(2)} km from you', // Show the calculated distance
                          onMessage: () => print('Message person $index'),
                          onCall: () => print('Call Person $index'),
                          onOptions: () => print('Options for person $index'),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
