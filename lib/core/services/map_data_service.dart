import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import '../../shared/models/building.dart';

class MapDataService {
  static const String _baseUrl = 'https://api.openstreetmap.org';
  
  // Campus center coordinates (actual MUJ campus location)
  static const LatLng _campusCenter = LatLng(26.8421, 75.5639);
  
  // Actual building coordinates from GeoJSON
  static final Map<String, LatLng> _buildingCoordinates = {
    'Dome Building': const LatLng(26.84210947005886, 75.5639037337811),
    'Academic Block-1': const LatLng(26.842432342733858, 75.56423439944129),
    'Academic Block-2': const LatLng(26.842508731240954, 75.56441940258387),
    'Academic Block-3': const LatLng(26.842990982262336, 75.565269883485),
    'Academic Block-4': const LatLng(26.84310826990493, 75.5658299896817),
    'Central Library': const LatLng(26.84374588812436, 75.56689282842939),
    'Placement Office': const LatLng(26.843887382755796, 75.56751416189044),
    'AWS': const LatLng(26.84166094208605, 75.5659101997521),
    'Mess': const LatLng(26.841566594616495, 75.56565257839608),
  };

  // Actual route data from GeoJSON paths
  static final Map<String, List<LatLng>> _routes = {
    'Main Campus Path': [
      const LatLng(26.842118238227712, 75.56392444978056),
      const LatLng(26.842181240945493, 75.56410508193716),
      const LatLng(26.84235852747595, 75.56401969219002),
      const LatLng(26.84245815921315, 75.56431691381769),
      const LatLng(26.842477206492788, 75.56447455642638),
      const LatLng(26.84254900005726, 75.5644449984375),
      const LatLng(26.84257097766998, 75.56460920948888),
      const LatLng(26.84260467666836, 75.56469624134758),
      const LatLng(26.842816634470097, 75.56502520203475),
      const LatLng(26.84307157311632, 75.56573292970253),
      const LatLng(26.84311111215075, 75.56583309770062),
      const LatLng(26.843160967771638, 75.56597609588894),
      const LatLng(26.84353604975, 75.56580039006354),
      const LatLng(26.84383344838463, 75.56661650341132),
      const LatLng(26.843271147080316, 75.56685946380196),
      const LatLng(26.843446967241533, 75.56729626413173),
      const LatLng(26.8437165568578, 75.56722236915857),
      const LatLng(26.843867468156773, 75.56748346473105),
    ],
    'Academic Route': [
      const LatLng(26.841856789502444, 75.56411698439504),
      const LatLng(26.84173991174815, 75.56416631873734),
      const LatLng(26.842148224417684, 75.56529250267153),
      const LatLng(26.842055633197745, 75.5653401358285),
      const LatLng(26.842076882335462, 75.56540307970002),
      const LatLng(26.841966076371094, 75.56545071285694),
      const LatLng(26.842045006657926, 75.56570248811673),
      const LatLng(26.84186589554237, 75.5657739378531),
      const LatLng(26.84174901779666, 75.56583858285197),
    ],
    'Campus Loop': [
      const LatLng(26.841850043053668, 75.56481040187367),
      const LatLng(26.84174892333887, 75.56485474851371),
      const LatLng(26.84166099307852, 75.5650009281787),
      const LatLng(26.841706423721703, 75.56560207151631),
      const LatLng(26.841854439561416, 75.56575974845853),
      const LatLng(26.841882368549804, 75.56597317249947),
      const LatLng(26.84185745501277, 75.5660487260331),
      const LatLng(26.842042108160356, 75.56631644834093),
      const LatLng(26.842231157766832, 75.5666022376304),
      const LatLng(26.841964436902245, 75.56683875304293),
      const LatLng(26.84163616420615, 75.56637229209113),
      const LatLng(26.841527718584928, 75.5662523943214),
      const LatLng(26.84131082339502, 75.56634437253649),
      const LatLng(26.84109685881438, 75.56575472647435),
      const LatLng(26.84132108196016, 75.56562989889665),
      const LatLng(26.841275651737575, 75.56498540412665),
      const LatLng(26.841385564926398, 75.56486386148379),
      const LatLng(26.841757803452225, 75.56484086714926),
    ],
    'Library Path': [
      const LatLng(26.842120211427115, 75.56392346599003),
      const LatLng(26.842981338916644, 75.5635875669798),
      const LatLng(26.843415901141668, 75.56477174628486),
      const LatLng(26.844071459158926, 75.56443134200907),
    ],
  };

  /// Get campus center coordinates
  static LatLng get campusCenter => _campusCenter;

  /// Get coordinates for a specific building
  static LatLng? getBuildingCoordinates(String buildingName) {
    return _buildingCoordinates[buildingName];
  }

  /// Get all building coordinates
  static Map<String, LatLng> get allBuildingCoordinates => _buildingCoordinates;

  /// Get route between two points
  static List<LatLng> getRoute(String routeName) {
    return _routes[routeName] ?? [];
  }

  /// Get route between two buildings
  static List<LatLng> getRouteBetweenBuildings(String from, String to) {
    final fromCoords = getBuildingCoordinates(from);
    final toCoords = getBuildingCoordinates(to);
    
    if (fromCoords != null && toCoords != null) {
      return [fromCoords, toCoords];
    }
    
    return [];
  }

  /// Load map data from local JSON file
  static Future<Map<String, dynamic>> loadMapDataFromJson() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/data/map_data.json');
      return json.decode(jsonString);
    } catch (e) {
      throw Exception('Error loading map data: $e');
    }
  }

  /// Load map data from remote JSON file
  static Future<Map<String, dynamic>> loadMapDataFromRemoteJson(String jsonUrl) async {
    try {
      final response = await http.get(Uri.parse(jsonUrl));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load map data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error loading map data: $e');
    }
  }

  /// Parse building data from JSON
  static List<Building> parseBuildingsFromJson(Map<String, dynamic> jsonData) {
    final List<Building> buildings = [];
    
    if (jsonData.containsKey('buildings')) {
      final buildingsList = jsonData['buildings'] as List;
      for (final buildingJson in buildingsList) {
        try {
          final building = Building.fromJson(buildingJson);
          buildings.add(building);
        } catch (e) {
          print('Error parsing building: $e');
        }
      }
    }
    
    return buildings;
  }

  /// Parse route data from JSON
  static Map<String, List<LatLng>> parseRoutesFromJson(Map<String, dynamic> jsonData) {
    final Map<String, List<LatLng>> routes = {};
    
    if (jsonData.containsKey('routes')) {
      final routesMap = jsonData['routes'] as Map<String, dynamic>;
      routesMap.forEach((routeName, routeData) {
        if (routeData is List) {
          final List<LatLng> coordinates = [];
          for (final coord in routeData) {
            if (coord is Map<String, dynamic> && 
                coord.containsKey('lat') && 
                coord.containsKey('lng')) {
              coordinates.add(LatLng(
                coord['lat'].toDouble(),
                coord['lng'].toDouble(),
              ));
            }
          }
          routes[routeName] = coordinates;
        }
      });
    }
    
    return routes;
  }

  /// Load and parse GeoJSON data
  static Future<Map<String, dynamic>> loadGeoJsonData() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/data/campus_geojson.json');
      return json.decode(jsonString);
    } catch (e) {
      throw Exception('Error loading GeoJSON data: $e');
    }
  }

  /// Parse GeoJSON features into routes and buildings
  static Map<String, dynamic> parseGeoJsonFeatures(Map<String, dynamic> geoJsonData) {
    final Map<String, List<LatLng>> routes = {};
    final Map<String, LatLng> buildings = {};
    
    if (geoJsonData.containsKey('features')) {
      final features = geoJsonData['features'] as List;
      
      for (final feature in features) {
        final properties = feature['properties'] as Map<String, dynamic>;
        final geometry = feature['geometry'] as Map<String, dynamic>;
        final geometryType = geometry['type'] as String;
        final coordinates = geometry['coordinates'] as List;
        
        if (geometryType == 'LineString') {
          // Parse route/path
          final routeName = properties['name'] ?? 'Unnamed Path';
          final List<LatLng> routePoints = [];
          
          for (final coord in coordinates) {
            if (coord is List && coord.length >= 2) {
              // GeoJSON format: [longitude, latitude]
              routePoints.add(LatLng(
                coord[1].toDouble(), // latitude
                coord[0].toDouble(), // longitude
              ));
            }
          }
          
          routes[routeName] = routePoints;
        } else if (geometryType == 'Point') {
          // Parse building/point
          final buildingName = properties['name'] ?? 'Unnamed Building';
          if (coordinates.length >= 2) {
            buildings[buildingName] = LatLng(
              coordinates[1].toDouble(), // latitude
              coordinates[0].toDouble(), // longitude
            );
          }
        }
      }
    }
    
    return {
      'routes': routes,
      'buildings': buildings,
    };
  }

  /// Calculate distance between two points
  static double calculateDistance(LatLng point1, LatLng point2) {
    const Distance distance = Distance();
    return distance.as(LengthUnit.Meter, point1, point2);
  }

  /// Calculate estimated time to reach destination
  static int calculateETA(LatLng current, LatLng destination, {double speedMps = 1.4}) {
    final distance = calculateDistance(current, destination);
    return (distance / speedMps / 60).round(); // Convert to minutes
  }

  /// Get nearby buildings within a radius
  static List<String> getNearbyBuildings(LatLng location, double radiusMeters) {
    final nearby = <String>[];
    
    _buildingCoordinates.forEach((buildingName, coordinates) {
      final distance = calculateDistance(location, coordinates);
      if (distance <= radiusMeters) {
        nearby.add(buildingName);
      }
    });
    
    return nearby;
  }
} 