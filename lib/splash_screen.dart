import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

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

    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        context.go('/home');
      }
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
              padding: const EdgeInsets.all(32.0),
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