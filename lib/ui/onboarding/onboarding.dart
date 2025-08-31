import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gem_store/core/constants/app_colors.dart';
import 'package:gem_store/core/constants/assets.dart';
import 'package:gem_store/ui/widgets/onboarding_button.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final CarouselSliderController _carouselController = CarouselSliderController();
  int _activePage = 0;

  final List<String> images = [
    Assets.onboarding_1,
    Assets.onboarding_2,
    Assets.onboarding_3,
  ];

  final List<String> titles = [
    'Discover something new',
    'Explore your true style',
    'Find fashion made for you',
  ];

  final List<String> descriptions = [
    'Special new arrivals just for you',
    'Favorite brands and hottest trends',
    'Relax and let us bring the style to you',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                const SizedBox(height: 55),
                Text(
                  titles[_activePage],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  descriptions[_activePage],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 351,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.dardGrey,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    /// Page indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        images.length,
                        (index) => Container(
                          height: 8,
                          width: _activePage == index ? 20 : 8,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: _activePage == index ? Colors.white : Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    /// Button
                    GlassButton(
                      title: _activePage == images.length - 1 ? 'Get Started' : 'Shopping Now',
                      onTap: () => onNextPage(),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),

            /// Carousel for Images
            Positioned(
              bottom: 270,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  carouselController: _carouselController,
                  items: images
                      .map(
                        (image) => Container(
                          height: 368,
                          width: 261,
                          padding: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            color: AppColors.lightGrey,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                spreadRadius: 1,
                                offset: const Offset(0, 3),
                              )
                            ],
                          ),
                          child: Image.asset(
                            image,
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    height: 368,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    viewportFraction: 0.72,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _activePage = index;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onNextPage() {
    if (_activePage < images.length - 1) {
      _carouselController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      // TODO: Navigate to Home screen
      debugPrint("Navigate to Home");
    }
  }
}
