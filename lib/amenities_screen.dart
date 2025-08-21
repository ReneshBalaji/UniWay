import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AmenitiesScreen extends StatelessWidget {
  const AmenitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              _buildAppBar(context, 'Amenities'),
              const SizedBox(height: 8),
              _buildSearchBar('Search for your destination'),
              const SizedBox(height: 16),
              _buildAmenityList(),
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

  Widget _buildAmenityList() {
    final amenities = [
      {'image': 'assets/images/dome_building.png', 'title': 'Dome Building', 'description': 'It contains the central library, key academic faculties, the placement office, and core administrative departments.'},
      {'image': 'assets/images/academic_block1.png', 'title': 'Academic Block-1', 'description': 'Building with Chemistry and Math, Physics labs for teaching and research.'},
      {'image': 'assets/images/academic_block2.png', 'title': 'Academic Block-2', 'description': 'Block with classrooms, seminar halls, faculty rooms, and spaces for events and discussions.'},
      {'image': 'assets/images/academic_block3.png', 'title': 'Academic Block-3', 'description': 'Modern building with classrooms, a large 100-seat auditorium, a human-centered design, and sustainable features.'},
      {'image': 'assets/images/library.png', 'title': 'Library', 'description': 'The central library at MUJ is a large, modern facility offering books, journals, and a peaceful study space for students and faculty.'},
    ];

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: amenities.length,
      itemBuilder: (context, index) {
        final amenity = amenities[index];
        return _buildAmenityCard(
          imagePath: amenity['image']!,
          title: amenity['title']!,
          description: amenity['description']!,
        );
      },
    );
  }

  Widget _buildAmenityCard({
    required String imagePath,
    required String title,
    required String description,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15.0),
              bottomLeft: Radius.circular(15.0),
            ),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
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
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}