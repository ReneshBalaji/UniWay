class AppConstants {
  // App Info
  static const String appName = 'UniWay';
  static const String appTagline = 'MUJ, Mapped Right';
  
  // Navigation
  static const int homeIndex = 0;
  static const int mapIndex = 1;
  static const int amenitiesIndex = 2;
  static const int eventsIndex = 3;
  
  // Routes
  static const String homeRoute = '/';
  static const String mapRoute = '/map';
  static const String amenitiesRoute = '/amenities';
  static const String eventsRoute = '/events';
  static const String buildingDetailRoute = '/building-detail';
  static const String eventDetailRoute = '/event-detail';
  
  // Building Types
  static const String buildingType = 'BUILDING';
  static const String facultyBlockType = 'FACULTY BLOCK';
  static const String auditoriumType = 'AUDITORIUM';
  static const String classroomType = 'CLASSROOM';
  static const String foodCourtType = 'FOOD COURT';
  static const String washroomType = 'WASHROOM';
  
  // Quick Locations
  static const List<String> quickLocations = [
    'Orientation',
    'Dome Building',
    'Academic Block-1',
    'Academic Block-2',
  ];
  
  // Building Names
  static const String domeBuilding = 'Dome Building';
  static const String academicBlock1 = 'Academic Block-1';
  static const String academicBlock2 = 'Academic Block-2';
  static const String academicBlock3 = 'Academic Block-3';
  static const String academicBlock4 = 'Academic Block-4';
  static const String aws = 'AWS';
  static const String mess = 'Mess';
  static const String centralLibrary = 'Central Library';
  static const String placementOffice = 'Placement Office';
  static const String lawLibrary = 'Law Library';
  
  // Event Names
  static const String oneirosEvent = 'ONEIROS';
  static const String aclEvent = 'ACL';
  static const String orientationProgram = 'ORIENTATION PROGRAM 2025';
  
  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);
  
  // Spacing
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;
  
  // Border Radius
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 12.0;
  static const double radiusLarge = 16.0;
  static const double radiusXLarge = 24.0;
} 