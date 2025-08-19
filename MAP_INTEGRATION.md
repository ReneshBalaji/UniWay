# OpenStreetMap Integration with JSON Data

## Overview

The UniWay app now uses OpenStreetMap with coordinates and routes loaded from JSON data. This provides a complete offline-capable mapping solution for the campus navigation app.

## Features

### 🗺️ **Interactive Campus Map**
- **OpenStreetMap Tiles**: Free, open-source map tiles
- **Building Markers**: All campus buildings with custom markers
- **Route Visualization**: Predefined routes between buildings
- **Zoom Controls**: 15x to 19x zoom levels for detailed campus view
- **Touch Interactions**: Tap markers for building info, tap map to clear selection

### 📍 **Building Locations**
- **10 Campus Buildings**: All major buildings with precise coordinates
- **Custom Markers**: Orange markers with building icons
- **Building Info**: Tap markers to see building details and coordinates
- **Navigation**: Direct navigation buttons to each building

### 🛣️ **Predefined Routes**
- **Orientation Route**: Dome Building → Academic Block-1 → Academic Block-2
- **Academic Route**: All academic blocks in sequence
- **Library Route**: Central Library → Law Library
- **Campus Tour**: Complete campus tour route

### 📊 **JSON Data Structure**

The app uses a comprehensive JSON structure for all map data:

```json
{
  "campus": {
    "name": "Manipal University Jaipur",
    "center": {"lat": 26.9124, "lng": 75.7873},
    "bounds": {
      "north": 26.9150, "south": 26.9100,
      "east": 75.7900, "west": 75.7850
    }
  },
  "buildings": [
    {
      "id": "1",
      "name": "Dome Building",
      "description": "...",
      "type": "BUILDING",
      "latitude": 26.9124,
      "longitude": 75.7873,
      "etaMinutes": 9,
      "facilities": ["Library", "Placement Office", "Admin"],
      "tags": ["Academic", "Administrative"]
    }
  ],
  "routes": {
    "Orientation": [
      {"lat": 26.9124, "lng": 75.7873},
      {"lat": 26.9130, "lng": 75.7870}
    ]
  }
}
```

## Implementation Details

### Dependencies Used
- **flutter_map**: OpenStreetMap integration
- **latlong2**: Geographic coordinates handling
- **geolocator**: Location services (for future use)
- **http**: JSON data loading

### Key Components

#### 1. **MapDataService** (`lib/core/services/map_data_service.dart`)
- Loads JSON data from local assets or remote URLs
- Provides building coordinates and route data
- Calculates distances and ETA
- Finds nearby buildings

#### 2. **CampusMap Widget** (`lib/shared/widgets/campus_map.dart`)
- Interactive OpenStreetMap implementation
- Custom building markers
- Route polylines
- Touch event handling

#### 3. **Map Screen** (`lib/features/map/map_screen.dart`)
- Full-screen map view
- Route selection controls
- Building information modal
- Navigation functionality

### Map Features

#### Building Markers
- **Visual Design**: Orange circular markers with location icons
- **Interaction**: Tap to show building information
- **Information**: Building name, coordinates, navigation options

#### Route Visualization
- **Color**: Blue polylines for routes
- **Width**: 4px stroke width for visibility
- **Animation**: Smooth route display

#### Map Controls
- **Zoom**: Pinch to zoom, double-tap to zoom in
- **Pan**: Drag to move around campus
- **Reset**: Refresh button to clear selections

## Usage Examples

### Loading Map Data
```dart
// Load from local JSON file
final mapData = await MapDataService.loadMapDataFromJson();

// Load from remote URL
final mapData = await MapDataService.loadMapDataFromRemoteJson('https://api.example.com/map-data.json');
```

### Getting Building Coordinates
```dart
final coordinates = MapDataService.getBuildingCoordinates('Dome Building');
if (coordinates != null) {
  print('Dome Building: ${coordinates.latitude}, ${coordinates.longitude}');
}
```

### Getting Routes
```dart
final orientationRoute = MapDataService.getRoute('Orientation');
final academicRoute = MapDataService.getRoute('Academic Route');
```

### Using the Campus Map Widget
```dart
CampusMap(
  initialCenter: MapDataService.campusCenter,
  routePoints: currentRoute,
  onMarkerTap: (buildingName) {
    print('Tapped on: $buildingName');
  },
  onMapTap: (position) {
    print('Map tapped at: ${position.latitude}, ${position.longitude}');
  },
)
```

## Data Management

### Local JSON File
- **Location**: `assets/data/map_data.json`
- **Advantages**: Offline access, fast loading, no network dependency
- **Use Case**: Default campus data, offline mode

### Remote JSON Loading
- **Advantages**: Real-time updates, dynamic content
- **Use Case**: Live updates, multiple campuses, user-generated content

### Data Validation
- **Coordinate Validation**: Ensures valid latitude/longitude values
- **Route Validation**: Checks for valid route points
- **Building Validation**: Verifies building data integrity

## Future Enhancements

### Planned Features
- [ ] **Real-time Location**: GPS integration for user location
- [ ] **Turn-by-turn Navigation**: Step-by-step directions
- [ ] **Indoor Maps**: Building floor plans
- [ ] **Custom Tiles**: Campus-specific map styling
- [ ] **Offline Tiles**: Downloadable map tiles for offline use
- [ ] **Route Optimization**: Shortest path algorithms
- [ ] **Traffic Integration**: Real-time campus traffic data

### Advanced Features
- [ ] **AR Navigation**: Augmented reality directions
- [ ] **Voice Navigation**: Audio turn-by-turn guidance
- [ ] **Accessibility Routes**: Wheelchair-friendly paths
- [ ] **Emergency Routes**: Quickest paths to emergency services
- [ ] **Crowd Analytics**: Real-time campus density data

## Performance Considerations

### Optimization Techniques
- **Marker Clustering**: Group nearby markers for better performance
- **Tile Caching**: Cache map tiles for faster loading
- **Lazy Loading**: Load building data on demand
- **Memory Management**: Dispose map controllers properly

### Best Practices
- **Coordinate Precision**: Use appropriate decimal places
- **Route Optimization**: Minimize route points for smooth rendering
- **Asset Management**: Optimize JSON file size
- **Error Handling**: Graceful fallbacks for missing data

## Troubleshooting

### Common Issues
1. **Map Not Loading**: Check internet connection for OpenStreetMap tiles
2. **Markers Not Showing**: Verify JSON data structure and coordinates
3. **Routes Not Displaying**: Ensure route coordinates are valid
4. **Performance Issues**: Check for memory leaks in map controllers

### Debug Tips
- Use `flutter_map` debug mode for tile loading issues
- Validate JSON structure with online JSON validators
- Test coordinates with mapping tools like Google Maps
- Monitor memory usage during map interactions

## API Reference

### MapDataService Methods
- `loadMapDataFromJson()`: Load local JSON data
- `loadMapDataFromRemoteJson(url)`: Load remote JSON data
- `getBuildingCoordinates(name)`: Get building coordinates
- `getRoute(name)`: Get predefined route
- `calculateDistance(point1, point2)`: Calculate distance between points
- `calculateETA(current, destination)`: Calculate estimated arrival time

### CampusMap Widget Properties
- `initialCenter`: Starting map center
- `routePoints`: Route to display
- `customMarkers`: Additional markers
- `showBuildingMarkers`: Toggle building markers
- `onMarkerTap`: Marker tap callback
- `onMapTap`: Map tap callback

This integration provides a robust, scalable mapping solution that can be easily extended with additional features and data sources. 