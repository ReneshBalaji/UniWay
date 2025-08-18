import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../shared/constants/app_constants.dart';
import '../../shared/widgets/custom_bottom_navigation.dart';
import '../../shared/widgets/search_bar.dart';
import '../../shared/models/event.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  int _currentIndex = AppConstants.eventsIndex;
  final List<Event> _events = _getMockEvents();

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
                hintText: 'Search for events',
                onChanged: (value) {
                  // TODO: Implement search functionality
                },
              ),
            ),
            const SizedBox(height: AppConstants.paddingLarge),
            
            // Events List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingMedium),
                itemCount: _events.length,
                itemBuilder: (context, index) {
                  return _buildEventCard(_events[index]);
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
                'Events',
                style: AppTheme.headingMedium,
              ),
            ),
          ),
          const SizedBox(width: 48), // Balance the back button
        ],
      ),
    );
  }

  Widget _buildEventCard(Event event) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.paddingLarge),
      decoration: AppTheme.cardDecoration,
      child: Column(
        children: [
          // Event Banner
          _buildEventBanner(event),
          // Event Details
          _buildEventDetails(event),
        ],
      ),
    );
  }

  Widget _buildEventBanner(Event event) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppConstants.radiusLarge),
          topRight: Radius.circular(AppConstants.radiusLarge),
        ),
        gradient: _getEventGradient(event.name),
      ),
      child: Stack(
        children: [
          // Event Logo/Text
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  event.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
                if (event.tagline.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    event.tagline,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white70,
                      fontFamily: 'Poppins',
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ],
            ),
          ),
          // Additional event info
          if (event.name == AppConstants.aclEvent) ...[
            Positioned(
              top: 12,
              left: 12,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'S',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'A',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildEventDetails(Event event) {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Event Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.name,
                  style: AppTheme.headingSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  event.description,
                  style: AppTheme.bodySmall,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 16,
                      color: AppTheme.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      event.formattedDate,
                      style: AppTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 16,
                      color: AppTheme.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      event.location,
                      style: AppTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: AppConstants.paddingMedium),
          // Navigate Button
          ElevatedButton.icon(
            onPressed: () {
              // TODO: Implement navigation to event location
            },
            icon: const Icon(
              Icons.navigation,
              size: 16,
            ),
            label: const Text('Navigate'),
            style: AppTheme.primaryButtonStyle.copyWith(
              backgroundColor: WidgetStateProperty.all(AppTheme.accentOrange),
            ),
          ),
        ],
      ),
    );
  }

  LinearGradient _getEventGradient(String eventName) {
    switch (eventName) {
      case AppConstants.oneirosEvent:
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2D3748), Color(0xFF4A5568)],
        );
      case AppConstants.aclEvent:
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF3182CE), Color(0xFF63B3ED)],
        );
      default:
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFE53E3E), Color(0xFFFC8181)],
        );
    }
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
      case AppConstants.amenitiesIndex:
        Navigator.of(context).pushReplacementNamed('/amenities');
        break;
    }
  }

  static List<Event> _getMockEvents() {
    return [
      Event(
        id: '1',
        name: AppConstants.oneirosEvent,
        tagline: 'CONVERGING EXTREMES',
        description: 'It contains the central library, key academic faculties, the placement office, and core administrative departments.',
        imageUrl: '',
        date: DateTime(2016, 2, 22),
        location: 'Front of cricket ground',
        latitude: 0.0,
        longitude: 0.0,
        tags: ['Academic', 'Cultural'],
      ),
      Event(
        id: '2',
        name: AppConstants.aclEvent,
        tagline: 'APERTURE CRICKET LEAGUE',
        description: 'Annual cricket tournament featuring teams from different departments competing for the championship.',
        imageUrl: '',
        date: DateTime(2025, 8, 18),
        location: 'Cricket Ground',
        latitude: 0.0,
        longitude: 0.0,
        tags: ['Sports', 'Tournament'],
      ),
    ];
  }
} 