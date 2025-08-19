import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'dart:async'; // Import async library for the timer
import 'home_screen.dart'; // Import your new home screen file

// Main function to run the app
void main() {
  runApp(const MyApp());
}

// MyApp is the root widget of your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
=======
import 'package:go_router/go_router.dart';
import 'core/theme/app_theme.dart';
import 'features/home/splash_screen.dart';
import 'features/home/home_screen.dart';
import 'features/map/map_screen.dart';
import 'features/amenities/amenities_screen.dart';
import 'features/events/events_screen.dart';
import 'shared/constants/app_constants.dart';

void main() {
  runApp(const UniWayApp());
}

class UniWayApp extends StatelessWidget {
  const UniWayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appName,
      theme: AppTheme.lightTheme,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
>>>>>>> e3958f20ffb375dad5d9cb47338905ae21516b92
    );
  }
}

<<<<<<< HEAD
// SplashScreen is the stateful widget for your animated screen.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.03).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Navigate to HomeScreen after 5 seconds
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => const HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5F0),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        fontFamily: 'Gilroy-Bold',
                        fontSize: 60,
                        fontWeight: FontWeight.w700,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Uni',
                          style: TextStyle(color: Color(0xFFFC563A)),
                        ),
                        TextSpan(
                          text: 'Way',
                          style: TextStyle(color: Color(0xFF1366A9)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 50.0, top: 16.0),
              child: Text(
                '- MUJ, Mapped Right -',
                style: TextStyle(
                  fontFamily: 'Gilroy-Medium',
                  fontSize: 16,
                  color: const Color(0xFF2B445A),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
=======
final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/map',
      builder: (context, state) => const MapScreen(),
    ),
    GoRoute(
      path: '/amenities',
      builder: (context, state) => const AmenitiesScreen(),
    ),
    GoRoute(
      path: '/events',
      builder: (context, state) => const EventsScreen(),
    ),
  ],
);
>>>>>>> e3958f20ffb375dad5d9cb47338905ae21516b92
