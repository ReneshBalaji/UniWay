import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              _buildAppBar(context, 'Events'),
              const SizedBox(height: 8),
              _buildSearchBar('Search for events'),
              const SizedBox(height: 16),
              _buildEventList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => context.pop(),
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Gilroy-Bold',
                  fontSize: 24,
                  color: Color(0xFF2A4459),
                ),
              ),
            ),
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }

  Widget _buildSearchBar(String hintText) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: const Color(0xFFD1D1D1).withOpacity(0.9),
          width: 1,
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          icon: const ImageIcon(AssetImage('assets/images/search.png')),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: 'Gilroy-Medium',
            color: Color(0x33000000),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildEventList() {
    final events = [
      {'image': 'assets/images/oneiros_event.png', 'title': 'ONEIROS', 'description': 'It contains the central library, key academic faculties, the placement office, and core administrative departments.', 'date': '22 February 2016', 'location': 'Front of cricket ground'},
      {'image': 'assets/images/acl_event.png', 'title': 'ACL', 'description': 'The aperture cricket league is a large cricket tournament for students and faculty.', 'date': '18-24 August 2025', 'location': 'Cricket Ground, MUJ'},
    ];

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return _buildEventCard(
          imagePath: event['image']!,
          title: event['title']!,
          description: event['description']!,
          date: event['date']!,
          location: event['location']!,
        );
      },
    );
  }

  Widget _buildEventCard({
    required String imagePath,
    required String title,
    required String description,
    required String date,
    required String location,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Gilroy-Bold',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontFamily: 'Gilroy-Medium',
                    fontSize: 12,
                    color: Colors.grey[700],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          date,
                          style: const TextStyle(
                            fontFamily: 'Gilroy-Medium',
                            fontSize: 12,
                            color: Color(0xFFF0624A),
                          ),
                        ),
                        Text(
                          location,
                          style: const TextStyle(
                            fontFamily: 'Gilroy-Medium',
                            fontSize: 12,
                            color: Color(0xFF2B445A),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Implement navigation logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF0624A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text('Navigate', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}