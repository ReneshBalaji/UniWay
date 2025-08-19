import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../core/services/map_data_service.dart';
import '../../core/theme/app_theme.dart';
import '../constants/app_constants.dart';

class CampusMap extends StatefulWidget {
  final LatLng? initialCenter;
  final List<LatLng>? routePoints;
  final List<Marker>? customMarkers;
  final bool showBuildingMarkers;
  final bool showCampusPaths;
  final Function(LatLng)? onMapTap;
  final Function(String)? onMarkerTap;

  const CampusMap({
    super.key,
    this.initialCenter,
    this.routePoints,
    this.customMarkers,
    this.showBuildingMarkers = true,
    this.showCampusPaths = true,
    this.onMapTap,
    this.onMarkerTap,
  });

  @override
  State<CampusMap> createState() => _CampusMapState();
}

class _CampusMapState extends State<CampusMap> {
  late MapController _mapController;
  late LatLng _center;
  List<Marker> _markers = [];
  List<Polyline> _polylines = [];

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _center = widget.initialCenter ?? MapDataService.campusCenter;
    _initializeMap();
  }

  void _initializeMap() {
    _createBuildingMarkers();
    _createRoutePolylines();
    _createCampusPaths();
  }

  void _createBuildingMarkers() {
    if (!widget.showBuildingMarkers) return;

    final buildingCoordinates = MapDataService.allBuildingCoordinates;
    _markers = buildingCoordinates.entries.map((entry) {
      return Marker(
        point: entry.value,
        width: 40,
        height: 40,
        child: GestureDetector(
          onTap: () => widget.onMarkerTap?.call(entry.key),
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.accentOrange,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(
              Icons.location_on,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      );
    }).toList();

    // Add custom markers if provided
    if (widget.customMarkers != null) {
      _markers.addAll(widget.customMarkers!);
    }
  }

  void _createRoutePolylines() {
    if (widget.routePoints != null && widget.routePoints!.isNotEmpty) {
      _polylines = [
        Polyline(
          points: widget.routePoints!,
          strokeWidth: 4,
          color: AppTheme.primaryBlue,
        ),
      ];
    }
  }

  void _createCampusPaths() {
    if (!widget.showCampusPaths) return;

    // Get routes using the public method
    final routeNames = ['Main Campus Path', 'Academic Route', 'Campus Loop', 'Library Path'];
    for (final routeName in routeNames) {
      final routePoints = MapDataService.getRoute(routeName);
      if (routePoints.isNotEmpty) {
        _polylines.add(
          Polyline(
            points: routePoints,
            strokeWidth: 2,
            color: AppTheme.textLight.withValues(alpha: 0.6),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        center: _center,
        zoom: 17.0,
        minZoom: 15.0,
        maxZoom: 19.0,
        onTap: (_, point) => widget.onMapTap?.call(point),
      ),
      children: [
        // OpenStreetMap tiles
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.uniway',
          maxZoom: 19,
        ),
        
        // Route polylines
        PolylineLayer(polylines: _polylines),
        
        // Building markers
        MarkerLayer(markers: _markers),
      ],
    );
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }
}

// Custom marker widget for buildings
class BuildingMarker extends StatelessWidget {
  final String buildingName;
  final LatLng position;
  final VoidCallback? onTap;
  final bool isSelected;

  const BuildingMarker({
    super.key,
    required this.buildingName,
    required this.position,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryRed : AppTheme.accentOrange,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: isSelected ? 3 : 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: const Icon(
          Icons.location_on,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}

// Route polyline widget
class RoutePolyline extends StatelessWidget {
  final List<LatLng> points;
  final Color color;
  final double strokeWidth;

  const RoutePolyline({
    super.key,
    required this.points,
    this.color = AppTheme.primaryBlue,
    this.strokeWidth = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(); // This widget is not used in the current implementation
  }
} 