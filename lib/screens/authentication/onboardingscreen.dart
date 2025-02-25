import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/helpers/routeconstants.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> pages = [
    OnboardingPage(
      image: 'assets/images/onboarding.png',
      title: 'Explore Your World',
      description:
          'Discover a world of possibilities at your fingertips. Whether you’re searching for the best coffee shop nearby or planning your next vacation, our app makes it simple to navigate and explore the places that matter most to you.',
    ),
    OnboardingPage(
      image: 'assets/images/onboardingimage2.png',
      title: 'Book Smarter, Travel Better',
      description:
          'Booking your next adventure has never been easier. From accommodations to flights, our seamless integration lets you compare options, book with confidence, and manage your entire travel itinerary in one convenient app.',
    ),
    OnboardingPage(
      image: 'assets/images/onboardingimage3.png',
      title: 'Share, Connect, and Inspire',
      description:
          'Your opinions matter! Share reviews and recommendations with fellow travelers and discover new insights from the community. Together, we create a richer experience for everyone, making every adventure more rewarding.',
    ),
  ];

  void _goToNextPage() {
    if (_currentPage < pages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Get.toNamed(RouteConstants.loginscreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Get.toNamed(RouteConstants.loginscreen);
            },
            child: Text(
              'Skip',
              style: TextStyle(color: AppColors.textcolor),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: pages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return pages[index];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    pages.length,
                    (index) => _buildPageIndicator(index == _currentPage),
                  ),
                ),
                GestureDetector(
                  onTap: _goToNextPage,
                  child: Container(
                    height: 50,
                    width: 50,
                    margin:
                        EdgeInsets.only(right: 16), // Add spacing from the edge
                    decoration: BoxDecoration(
                      color: AppColors.lineargradient1,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildPageIndicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? AppColors.lineargradient1 : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
        children: [
          Center(
            child: Image.asset(image, height: 300.0),
          ),
          SizedBox(height: 20.0),
          Text(
            title,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: FontFamily.joan,
              fontWeight: FontWeight.bold,
              color: AppColors.lineargradient1,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            description,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: FontFamily.helvetica,
              fontSize: 16.0,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
