import 'package:flutter/material.dart';

// Main function to run the app
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

// Use TickerProviderStateMixin for animations
class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // Animation controller to manage the pulse effect
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      // The vsync prevents off-screen animations from consuming unnecessary resources.
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true); // This makes the animation loop back and forth

    // Define the scale animation curve
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.03).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is removed to free up resources
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // The Scaffold provides the basic structure of the visual interface.
    return Scaffold(
      // Page background color from your Figma design
      backgroundColor: const Color(0xFFF7F5F0),
      body: SafeArea(
        child: Column(
          children: [
            // This Expanded widget pushes the footer to the bottom
            Expanded(
              child: Center(
                // The ScaleTransition widget animates the size of its child
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      // To use a custom font like Gilroy, you must:
                      // 1. Add the font files (e.g., .ttf) to an 'assets/fonts/' folder.
                      // 2. Declare the font in your `pubspec.yaml` file.
                      //
                      // pubspec.yaml example:
                      // flutter:
                      //   fonts:
                      //     - family: Gilroy-Bold
                      //       fonts:
                      //         - asset: assets/fonts/Gilroy-Bold.ttf
                      //
                      // Then, you can use it like this:
                      // style: TextStyle(fontFamily: 'Gilroy-Bold', ...),
                      style: TextStyle(
                        fontFamily: 'Gilroy-Bold', // Using the custom font name
                        fontSize: 60,
                        fontWeight: FontWeight.w700, // Bold
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Uni',
                          style: TextStyle(color: Color(0xFFFC563A)), // 'Uni' color
                        ),
                        TextSpan(
                          text: 'Way',
                          style: TextStyle(color: Color(0xFF1366A9)), // 'Way' color
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Footer section
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                '- MUJ, Mapped Right -',
                style: TextStyle(
                  // See the note above about adding custom fonts.
                  // You would add 'Gilroy-Medium' to your pubspec.yaml as well.
                  fontFamily: 'Gilroy-Medium',
                  fontSize: 16,
                  color: const Color(0xFF2B445A), // Footer text color
                  fontWeight: FontWeight.w500, // Medium weight
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
