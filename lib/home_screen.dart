import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 3) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppBar(),
              const SizedBox(height: 8),
              _buildSearchBar(),
              const SizedBox(height: 12),
              Column(
                children: [
                  _buildMapPreview(),
                  _buildQuickLocationsPanel(),
                ],
              ),
              const SizedBox(height: 12),
              _buildBannerCarousel(),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: RichText(
          text: const TextSpan(
            style: TextStyle(
              fontFamily: 'Gilroy-Bold',
              fontSize: 32,
            ),
            children: <TextSpan>[
              TextSpan(text: 'Uni', style: TextStyle(color: Color(0xFFF0624A))),
              TextSpan(text: 'Way', style: TextStyle(color: Color(0xFF2A4459))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: const Color(0xFFD1D1D1).withOpacity(0.9),
          width: 1,
        ),
      ),
      child: const TextField(
        decoration: InputDecoration(
          icon: ImageIcon(AssetImage('assets/images/search.png')),
          hintText: 'Search for your destination',
          hintStyle: TextStyle(
            fontFamily: 'Gilroy-Medium',
            color: Color(0x33000000),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildMapPreview() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
      child: Image.asset('assets/images/map_preview.png'),
    );
  }

  Widget _buildQuickLocationsPanel() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(15.0)),
        border: Border(
          left: BorderSide(color: const Color(0x1A000000), width: 1),
          right: BorderSide(color: const Color(0x1A000000), width: 1),
          bottom: BorderSide(color: const Color(0x1A000000), width: 1),
        ),
      ),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/GPS.png', width: 24),
                  const SizedBox(width: 8),
                  const Text(
                    'Quick locations',
                    style: TextStyle(
                      fontFamily: 'Gilroy-Bold',
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Container(
                height: 2,
                width: 100,
                color: Colors.grey[300],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              Row(
                children: [
                  Expanded(child: _quickLocationButton('Orientation')),
                  const SizedBox(width: 8),
                  Expanded(child: _quickLocationButton('Dome Building')),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(child: _quickLocationButton('Academic Block-1')),
                  const SizedBox(width: 8),
                  Expanded(child: _quickLocationButton('Academic Block-2')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _quickLocationButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFF0624A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/location.png', width: 16),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              text,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'Gilroy-Bold',
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerCarousel() {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 4,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    'assets/images/orientation_banner.png',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) => _buildDot(index: index)),
        ),
      ],
    );
  }

  Widget _buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: _currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? const Color(0xFFF0624A) : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}