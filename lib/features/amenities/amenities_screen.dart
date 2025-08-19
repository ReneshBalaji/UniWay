import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../shared/constants/app_constants.dart';
import '../../shared/widgets/custom_bottom_navigation.dart';
import '../../shared/widgets/search_bar.dart';
import '../../shared/models/building.dart';

class AmenitiesScreen extends StatefulWidget {
  const AmenitiesScreen({super.key});

  @override
  State<AmenitiesScreen> createState() => _AmenitiesScreenState();
}

class _AmenitiesScreenState extends State<AmenitiesScreen> {
  int _currentIndex = AppConstants.amenitiesIndex;
  final List<Building> _buildings = _getMockBuildings();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),
            const SizedBox(height: AppConstants.paddingMedium),
            
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingMedium),
              child: CustomSearchBar(
                hintText: 'Search for your destination',
                onChanged: (value) {
                  // TODO: Implement search functionality
                },
              ),
            ),
            const SizedBox(height: AppConstants.paddingLarge),
            
            // Buildings List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingMedium),
                itemCount: _buildings.length,
                itemBuilder: (context, index) {
                  return _buildBuildingCard(_buildings[index]);
                },
              ),
            ),
            
            // Bottom Navigation
            CustomBottomNavigation(
              currentIndex: _currentIndex,
              onTap: _onNavigationTap,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppTheme.textPrimary,
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Amenities',
                style: AppTheme.headingMedium,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              // TODO: Implement share functionality
            },
            icon: const Icon(
              Icons.share,
              color: AppTheme.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBuildingCard(Building building) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.paddingMedium),
      decoration: AppTheme.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        child: Row(
          children: [
            // Building Image
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                child: _buildBuildingImage(building),
              ),
            ),
            const SizedBox(width: AppConstants.paddingMedium),
            
            // Building Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    building.name,
                    style: AppTheme.headingSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    building.description,
                    style: AppTheme.bodySmall,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBuildingImage(Building building) {
    // Placeholder images based on building type
    IconData iconData;
    Color iconColor;
    
    switch (building.name) {
      case AppConstants.domeBuilding:
        iconData = Icons.account_balance;
        iconColor = Colors.orange;
        break;
      case AppConstants.academicBlock1:
      case AppConstants.academicBlock2:
      case AppConstants.academicBlock3:
      case AppConstants.academicBlock4:
        iconData = Icons.school;
        iconColor = Colors.blue;
        break;
      case AppConstants.centralLibrary:
      case AppConstants.lawLibrary:
        iconData = Icons.library_books;
        iconColor = Colors.green;
        break;
      case AppConstants.placementOffice:
        iconData = Icons.work;
        iconColor = Colors.purple;
        break;
      default:
        iconData = Icons.business;
        iconColor = Colors.grey;
    }
    
    return Container(
      color: iconColor.withValues(alpha: 0.1),
      child: Icon(
        iconData,
        size: 40,
        color: iconColor,
      ),
    );
  }

  void _onNavigationTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    
    // Navigate to different screens
    switch (index) {
      case AppConstants.homeIndex:
        Navigator.of(context).pushReplacementNamed('/home');
        break;
      case AppConstants.mapIndex:
        Navigator.of(context).pushReplacementNamed('/map');
        break;
      case AppConstants.eventsIndex:
        Navigator.of(context).pushReplacementNamed('/events');
        break;
    }
  }

  static List<Building> _getMockBuildings() {
    return [
      Building(
        id: '1',
        name: AppConstants.domeBuilding,
        description: 'It contains the central library, key academic faculties, the placement office, and core administrative departments.',
        type: AppConstants.buildingType,
        imageUrl: '',
        latitude: 0.0,
        longitude: 0.0,
        etaMinutes: 9,
        facilities: ['Library', 'Placement Office', 'Admin'],
        tags: ['Academic', 'Administrative'],
      ),
      Building(
        id: '2',
        name: AppConstants.academicBlock1,
        description: 'Building with Chemistry and Math/Physics labs for teaching and research.',
        type: AppConstants.facultyBlockType,
        imageUrl: '',
        latitude: 0.0,
        longitude: 0.0,
        etaMinutes: 6,
        facilities: ['Chemistry Lab', 'Physics Lab', 'Math Lab'],
        tags: ['Academic', 'Laboratory'],
      ),
      Building(
        id: '3',
        name: AppConstants.academicBlock2,
        description: 'Block with auditoriums, classrooms, labs, faculty rooms, and spaces for events and discussions.',
        type: AppConstants.facultyBlockType,
        imageUrl: '',
        latitude: 0.0,
        longitude: 0.0,
        etaMinutes: 7,
        facilities: ['Auditorium', 'Classrooms', 'Faculty Rooms'],
        tags: ['Academic', 'Events'],
      ),
      Building(
        id: '4',
        name: AppConstants.academicBlock3,
        description: 'Modern building with classrooms, a library, a 385-seat auditorium, Rajasthan-inspired design, and sustainable features.',
        type: AppConstants.facultyBlockType,
        imageUrl: '',
        latitude: 0.0,
        longitude: 0.0,
        etaMinutes: 7,
        facilities: ['Library', 'Auditorium', 'Classrooms'],
        tags: ['Academic', 'Modern'],
      ),
      Building(
        id: '5',
        name: AppConstants.centralLibrary,
        description: 'The central library at MUJ is a large, modern facility offering books, journals, e-resources, and study spaces for students and faculty.',
        type: AppConstants.buildingType,
        imageUrl: '',
        latitude: 0.0,
        longitude: 0.0,
        etaMinutes: 5,
        facilities: ['Study Spaces', 'E-Resources', 'Books'],
        tags: ['Library', 'Study'],
      ),
    ];
  }
} 