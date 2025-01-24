// dating_card.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DatingCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String location;
  final String date;
  final String time;
  final String personName;
  final String distance;
  final VoidCallback onMessage;
  final VoidCallback onCall;
  final VoidCallback onOptions;

  const DatingCard({
    required this.title,
    required this.imageUrl,
    required this.location,
    required this.date,
    required this.time,
    required this.personName,
    required this.distance,
    required this.onMessage,
    required this.onCall,
    required this.onOptions,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with title and options icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.calendarCheck,
                        size: 20.0,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: onOptions,
                    child: const Icon(Icons.more_horiz, size: 24.0, color: Colors.black),
                  ),
                ],
              ),
              const Divider(thickness: 0.2, color: Colors.grey),

              // Row with avatar, name, and distance
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(imageUrl),
                          radius: 25.0,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 14.0,
                          width: 14.0,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        personName,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        distance,
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: onMessage,
                    icon: const Icon(
                      FontAwesomeIcons.comment,
                      color: Colors.blue,
                    ),
                  ),
                  IconButton(
                    onPressed: onCall,
                    icon: const Icon(
                      Icons.call,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18.0),

              // Date and Location Row with a vertical divider
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today_outlined,
                            size: 20.0,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 8.0),
                          const Text(
                            'Date',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        date,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        time,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  // Vertical Divider
                  Container(
                    width: 1.0,
                    height: 60.0,
                    color: Colors.grey.withOpacity(0.5),
                  ),

                  // Location Section
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                size: 20.0,
                                color: Colors.black,
                              ),
                              const SizedBox(width: 8.0),
                              const Text(
                                'Location',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0), // Space between the rows
                          Text(
                            location.length > 18 ? location.substring(0, 15) + '...' : location,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
