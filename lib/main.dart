import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

import 'app_scaffold.dart';
import 'splash_screen.dart';
import 'home_screen.dart';
import 'amenities_screen.dart';
import 'events_screen.dart';

void main() {
  runApp(const UniWayApp());
}

// --- Placeholder Classes ---
class AppConstants {
  static const String appName = "UniWay";
}

class AppTheme {
  static final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF7F5F0),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1366A9),
    ),
  );
}

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Map')),
      body: const Center(child: Text('Map Screen Placeholder')),
    );
  }
}

// --- Main App Widget ---
class UniWayApp extends StatelessWidget {
  const UniWayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appName,
      theme: AppTheme.lightTheme,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const AppScaffold(child: HomeScreen(), selectedIndex: 0),
    ),
    GoRoute(
      path: '/map',
      builder: (context, state) => const AppScaffold(child: MapScreen(), selectedIndex: 1),
    ),
    GoRoute(
      path: '/amenities',
      builder: (context, state) => const AppScaffold(child: AmenitiesScreen(), selectedIndex: 2),
    ),
    GoRoute(
      path: '/events',
      builder: (context, state) => const AppScaffold(child: EventsScreen(), selectedIndex: 3),
    ),
  ],
);