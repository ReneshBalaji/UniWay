# UniWay - Campus Navigation App

A complete offline Flutter app for campus navigation, built with a clean architecture and modern UI design.

## Features

- **Splash Screen**: Animated app logo with smooth transitions
- **Home Screen**: Campus map overview, quick location access, and promotional banners
- **Amenities**: Detailed building information with descriptions and facilities
- **Events**: Campus events with beautiful event cards and navigation
- **Map**: Interactive campus map (placeholder for future implementation)
- **Offline First**: All data is stored locally for offline access

## App Structure

```
lib/
├── core/
│   ├── theme/
│   │   └── app_theme.dart          # App theme, colors, and styles
│   └── utils/                      # Utility functions
├── features/
│   ├── home/
│   │   ├── splash_screen.dart      # App splash screen
│   │   └── home_screen.dart        # Main home screen
│   ├── map/
│   │   └── map_screen.dart         # Campus map screen
│   ├── amenities/
│   │   └── amenities_screen.dart   # Building amenities screen
│   └── events/
│       └── events_screen.dart      # Events listing screen
├── shared/
│   ├── constants/
│   │   └── app_constants.dart      # App-wide constants
│   ├── models/
│   │   ├── building.dart           # Building data model
│   │   └── event.dart              # Event data model
│   └── widgets/
│       ├── custom_bottom_navigation.dart  # Bottom navigation bar
│       └── search_bar.dart         # Custom search bar
└── main.dart                       # App entry point
```

## Design System

### Colors
- **Primary Red**: #E53E3E (UniWay branding)
- **Primary Blue**: #3182CE (UniWay branding)
- **Accent Orange**: #FF6B35 (Interactive elements)
- **Background Light**: #F8F9FA (App background)
- **Card Background**: #FFFFFF (Card surfaces)

### Typography
- **Font Family**: Poppins
- **Heading Large**: 24px, Bold
- **Heading Medium**: 20px, SemiBold
- **Heading Small**: 18px, SemiBold
- **Body Large**: 16px, Medium
- **Body Medium**: 14px, Regular
- **Body Small**: 12px, Regular

### Components
- **Cards**: Rounded corners (16px), subtle shadows
- **Buttons**: Rounded corners (12px), consistent padding
- **Search Bar**: Light background, rounded corners (12px)
- **Navigation**: Custom bottom navigation with active states

## Screens

### 1. Splash Screen
- Animated UniWay logo with fade and scale effects
- App tagline: "MUJ, Mapped Right"
- Auto-navigation to home screen after 3 seconds

### 2. Home Screen
- UniWay logo header
- Search bar for destination lookup
- Interactive campus map placeholder
- Quick location chips (Orientation, Dome Building, Academic Blocks)
- Promotional banner for freshers orientation

### 3. Amenities Screen
- List of campus buildings with descriptions
- Building type icons (Library, Academic, Office)
- Search functionality for buildings
- Navigation buttons for each building

### 4. Events Screen
- Event cards with gradient banners
- Event details (name, tagline, description, date, location)
- Navigate buttons for event locations
- Beautiful visual design matching Figma

### 5. Map Screen
- Placeholder for interactive campus map
- Future implementation planned with Google Maps integration

## Navigation

The app uses GoRouter for navigation with the following routes:
- `/` - Splash Screen
- `/home` - Home Screen
- `/map` - Map Screen
- `/amenities` - Amenities Screen
- `/events` - Events Screen

## Dependencies

- **flutter**: Core Flutter framework
- **go_router**: Navigation and routing
- **provider**: State management (for future use)
- **cached_network_image**: Image caching (for future use)
- **shared_preferences**: Local storage (for future use)

## Getting Started

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

## Future Enhancements

- [ ] Google Maps integration for interactive campus map
- [ ] Real-time location services
- [ ] Push notifications for events
- [ ] Offline data synchronization
- [ ] User preferences and favorites
- [ ] Building floor plans
- [ ] Accessibility features

## Architecture

The app follows a feature-based architecture with:
- **Separation of Concerns**: Each feature has its own directory
- **Shared Components**: Reusable widgets and models
- **Theme System**: Centralized design tokens
- **Navigation**: Declarative routing with GoRouter
- **Data Models**: Type-safe models for buildings and events

## Contributing

1. Follow the existing code structure
2. Use the established design system
3. Add proper documentation for new features
4. Test on multiple screen sizes

## License

This project is for educational purposes and campus use.
