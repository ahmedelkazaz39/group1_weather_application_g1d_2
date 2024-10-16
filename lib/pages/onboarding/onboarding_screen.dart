import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../home/main_screen.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = LiquidController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            liquidController: controller,
            onPageChangeCallback: OnPageChangeCallback,
            pages: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff484B5B),
                      Color(0xffBBC5D4),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/onboarding_splash_screen/onboarding1.png',
                      height: size.height * .5,
                      //width: size.width * .5,
                    ),
                    const Text(
                      'Weather Around \n     the World',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          textBaseline: TextBaseline.alphabetic,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Add any location you want and \n      swipe easily to chnage',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff484B5B),
                      Color(0xffBBC5D4),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                height: double.infinity,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/onboarding_splash_screen/onboarding2.png',
                      height: size.height * .5,
                      //width: size.width * .5,
                    ),
                    const Text(
                      'Detailed Hourly \n       Forecast',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          textBaseline: TextBaseline.alphabetic,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Get in - depth weather \n          information.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff484B5B),
                      Color(0xffBBC5D4),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topLeft,
                  ),
                ),
                height: double.infinity,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/onboarding_splash_screen/onboarding3.png',
                      height: size.height * .5,
                      //width: size.width * .5,
                    ),
                    const Text(
                      '  Real-Time \nWeather Map',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          textBaseline: TextBaseline.alphabetic,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        '        Watch the progress of\nthe precipitation to stay informed',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff484B5B),
                      Color(0xffBBC5D4),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                height: double.infinity,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/onboarding_splash_screen/onboarding4.png',
                      height: size.height * .5,
                      //width: size.width * .5,
                    ),
                    const Text(
                      'Detailed Hourly \n       Forecast',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          textBaseline: TextBaseline.alphabetic,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Get in - depth weather \n          information.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),
          Positioned(
            bottom: 50,
            child: OutlinedButton(
              onPressed: () {
                int nextPage = controller.currentPage + 1;
                controller.animateToPage(page: nextPage);
                if (nextPage == 4) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainScreen()));
                }
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: const EdgeInsets.all(20),
                side: const BorderSide(color: Colors.black),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(20),
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 25,
            child: TextButton(
              onPressed: () {
                controller.jumpToPage(page: 3);
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            child: AnimatedSmoothIndicator(
              activeIndex: controller.currentPage,
              count: 4,
              effect: WormEffect(activeDotColor: Colors.black, dotHeight: 8),
            ),
          ),
        ],
      ),
    );
  }

  void OnPageChangeCallback(int activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
  }
}