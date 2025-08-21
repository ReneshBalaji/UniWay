import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final int selectedIndex;

  const AppScaffold({
    Key? key,
    required this.child,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFE6E6E6), width: 2.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navBarItem(context, 'Home.png', 'Home', 0, '/home'),
          _navBarItem(context, 'locationgray.png', 'Map', 1, '/map'),
          _navBarItem(context, 'Amenities.gray.png', 'Amenities', 2, '/amenities'),
          _navBarItem(context, 'eventsgray.png', 'Events', 3, '/events'),
        ],
      ),
    );
  }

  Widget _navBarItem(BuildContext context, String iconName, String label, int index, String route) {
    final bool isActive = index == selectedIndex;
    final Color color = isActive ? const Color(0xFFFC563A) : const Color(0xFFADADAF);

    return GestureDetector(
      onTap: () {
        if (!isActive) {
          context.go(route);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageIcon(
            AssetImage('assets/images/$iconName'),
            size: 24,
            color: color,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontFamily: 'Gilroy-Medium',
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}