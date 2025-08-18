import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import '../../core/theme/app_theme.dart';
import '../../core/services/map_data_service.dart';
import '../../shared/constants/app_constants.dart';
import '../../shared/widgets/custom_bottom_navigation.dart';
import '../../shared/widgets/campus_map.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int _currentIndex = AppConstants.mapIndex;
  String? _selectedBuilding;
  List<LatLng>? _currentRoute;

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
            
            // Map Controls
            _buildMapControls(),
            const SizedBox(height: AppConstants.paddingMedium),
            
            // Interactive Map
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(AppConstants.paddingMedium),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
                  border: Border.all(color: AppTheme.borderLight),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
                  child: CampusMap(
                    initialCenter: MapDataService.campusCenter,
                    routePoints: _currentRoute,
                    onMarkerTap: _onBuildingTap,
                    onMapTap: _onMapTap,
                  ),
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
                'Campus Map',
                style: AppTheme.headingMedium,
              ),
            ),
          ),
          IconButton(
            onPressed: _resetMap,
            icon: const Icon(
              Icons.refresh,
              color: AppTheme.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapControls() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingMedium),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _showMainCampusPath,
                  icon: const Icon(Icons.route, size: 16),
                  label: const Text('Main Path'),
                  style: AppTheme.secondaryButtonStyle,
                ),
              ),
              const SizedBox(width: AppConstants.paddingSmall),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _showAcademicRoute,
                  icon: const Icon(Icons.school, size: 16),
                  label: const Text('Academic'),
                  style: AppTheme.secondaryButtonStyle,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.paddingSmall),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _showCampusLoop,
                  icon: const Icon(Icons.loop, size: 16),
                  label: const Text('Campus Loop'),
                  style: AppTheme.secondaryButtonStyle,
                ),
              ),
              const SizedBox(width: AppConstants.paddingSmall),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _showLibraryPath,
                  icon: const Icon(Icons.library_books, size: 16),
                  label: const Text('Library'),
                  style: AppTheme.secondaryButtonStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onBuildingTap(String buildingName) {
    setState(() {
      _selectedBuilding = buildingName;
    });
    
    _showBuildingInfo(buildingName);
  }

  void _onMapTap(LatLng position) {
    setState(() {
      _selectedBuilding = null;
      _currentRoute = null;
    });
  }

  void _showMainCampusPath() {
    setState(() {
      _currentRoute = MapDataService.getRoute('Main Campus Path');
    });
  }

  void _showAcademicRoute() {
    setState(() {
      _currentRoute = MapDataService.getRoute('Academic Route');
    });
  }

  void _showCampusLoop() {
    setState(() {
      _currentRoute = MapDataService.getRoute('Campus Loop');
    });
  }

  void _showLibraryPath() {
    setState(() {
      _currentRoute = MapDataService.getRoute('Library Path');
    });
  }

  void _resetMap() {
    setState(() {
      _selectedBuilding = null;
      _currentRoute = null;
    });
  }

  void _showBuildingInfo(String buildingName) {
    final coordinates = MapDataService.getBuildingCoordinates(buildingName);
    if (coordinates != null) {
      showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          padding: const EdgeInsets.all(AppConstants.paddingMedium),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                buildingName,
                style: AppTheme.headingSmall,
              ),
              const SizedBox(height: AppConstants.paddingSmall),
              Text(
                'Coordinates: ${coordinates.latitude.toStringAsFixed(4)}, ${coordinates.longitude.toStringAsFixed(4)}',
                style: AppTheme.bodySmall,
              ),
              const SizedBox(height: AppConstants.paddingMedium),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        _navigateToBuilding(buildingName);
                      },
                      icon: const Icon(Icons.navigation, size: 16),
                      label: const Text('Navigate'),
                      style: AppTheme.primaryButtonStyle,
                    ),
                  ),
                  const SizedBox(width: AppConstants.paddingSmall),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        _showRouteToBuilding(buildingName);
                      },
                      icon: const Icon(Icons.route, size: 16),
                      label: const Text('Show Route'),
                      style: AppTheme.secondaryButtonStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }

  void _navigateToBuilding(String buildingName) {
    // TODO: Implement actual navigation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Navigating to $buildingName...'),
        backgroundColor: AppTheme.accentOrange,
      ),
    );
  }

  void _showRouteToBuilding(String buildingName) {
    final route = MapDataService.getRouteBetweenBuildings('Dome Building', buildingName);
    setState(() {
      _currentRoute = route;
    });
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
      case AppConstants.amenitiesIndex:
        Navigator.of(context).pushReplacementNamed('/amenities');
        break;
      case AppConstants.eventsIndex:
        Navigator.of(context).pushReplacementNamed('/events');
        break;
    }
  }
} 