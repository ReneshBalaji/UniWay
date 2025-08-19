import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/services/map_data_service.dart';
import '../../shared/constants/app_constants.dart';
import '../../shared/widgets/custom_bottom_navigation.dart';
import '../../shared/widgets/search_bar.dart';
import '../../shared/widgets/campus_map.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = AppConstants.homeIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppConstants.paddingMedium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with Logo
                    _buildHeader(),
                    const SizedBox(height: AppConstants.paddingMedium),
                    
                    // Search Bar
                    CustomSearchBar(
                      onTap: () {
                        // TODO: Implement search functionality
                      },
                    ),
                    const SizedBox(height: AppConstants.paddingLarge),
                    
                    // Map Section
                    _buildMapSection(),
                    const SizedBox(height: AppConstants.paddingLarge),
                    
                    // Quick Locations
                    _buildQuickLocations(),
                    const SizedBox(height: AppConstants.paddingLarge),
                    
                    // Promotional Banner
                    _buildPromotionalBanner(),
                    const SizedBox(height: AppConstants.paddingLarge),
                  ],
                ),
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
    return Center(
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
          children: [
            TextSpan(
              text: 'Uni',
              style: TextStyle(
                color: AppTheme.primaryRed,
              ),
            ),
            TextSpan(
              text: 'Way',
              style: TextStyle(
                color: AppTheme.primaryBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMapSection() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        border: Border.all(color: AppTheme.borderLight),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        child: Stack(
          children: [
            // Interactive Campus Map
            CampusMap(
              initialCenter: MapDataService.campusCenter,
              showBuildingMarkers: true,
              showCampusPaths: true,
              onMarkerTap: (buildingName) {
                _showBuildingQuickInfo(buildingName);
              },
            ),
            // Expand button
            Positioned(
              top: 12,
              right: 12,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/map');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.open_in_full,
                    size: 20,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickLocations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.location_on,
              color: AppTheme.primaryRed,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'Quick locations',
              style: AppTheme.headingSmall.copyWith(
                color: AppTheme.textPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppConstants.paddingMedium),
        Wrap(
          spacing: AppConstants.paddingSmall,
          runSpacing: AppConstants.paddingSmall,
          children: AppConstants.quickLocations.map((location) {
            return _buildQuickLocationChip(location);
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildQuickLocationChip(String location) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingMedium,
        vertical: AppConstants.paddingSmall,
      ),
      decoration: BoxDecoration(
        color: AppTheme.primaryRed,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.location_on,
            color: Colors.white,
            size: 16,
          ),
          const SizedBox(width: 4),
          Text(
            location,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromotionalBanner() {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      decoration: BoxDecoration(
        color: AppTheme.warningYellow,
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Freshers!!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryRed,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  AppConstants.orientationProgram,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimary,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  '25-27 July, 2025',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.textSecondary,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppConstants.paddingMedium),
          // Building illustration placeholder
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.business,
              size: 32,
              color: AppTheme.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  void _showBuildingQuickInfo(String buildingName) {
    final coordinates = MapDataService.getBuildingCoordinates(buildingName);
    if (coordinates != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$buildingName - Tap to view details'),
          backgroundColor: AppTheme.accentOrange,
          action: SnackBarAction(
            label: 'View',
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).pushNamed('/amenities');
            },
          ),
        ),
      );
    }
  }

  void _onNavigationTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    
    // Navigate to different screens
    switch (index) {
      case AppConstants.mapIndex:
        Navigator.of(context).pushReplacementNamed('/map');
        break;
      case AppConstants.amenitiesIndex:
        Navigator.of(context).pushReplacementNamed('/amenities');
        break;
      case AppConstants.eventsIndex:
        Navigator.of(context).pushReplacementNamed('/events');
        break;
    }
  }
} 