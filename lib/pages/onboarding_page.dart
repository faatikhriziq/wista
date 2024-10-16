import 'package:flutter/material.dart';
import 'package:wista/core/extensions/screen_extension.dart';
import 'package:wista/core/extensions/widget_extensions.dart';
import 'package:wista/pages/home_page.dart';
import 'package:wista/pages/widgets/slider_indicator.dart';
import 'package:wista/pages/widgets/onboarding_view.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_sizes.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  final pageController = PageController();
  int currentPage = 0;
  bool selectedPage = false;
  List<Widget> onBoardingView = [
    const OnBoardingView(
      imageAsset: 'assets/images/landing.png',
      headline: 'Temukan Destinasi Terbaik',
      description:
          'Temukan destinasi terbaik di seluruh Nusantara, mulai dari pantai, pegunungan, hingga hutan belantara.',
    ),
    const OnBoardingView(
      imageAsset: 'assets/images/landing2.jpg',
      headline: 'Rencanakan Perjalananmu',
      description:
          'Rencanakan perjalananmu dengan mudah, pilih destinasi, pesan tiket, dan nikmati petualanganmu.',
    ),
    const OnBoardingView(
      imageAsset: 'assets/images/landing3.jpg',
      headline: 'Temukan Hidden Gems',
      description:
          'Temukan hidden gems di setiap sudut Nusantara, jelajahi keindahan alam yang belum terjamah.',
    ),
  ];

  void onPageChanged(int page) {
    setState(() {
      currentPage = page;
    });
  }

  void animateToPage(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: onPageChanged,
              controller: pageController,
              padEnds: true,
              children: onBoardingView,
            ),
          ),
          Container(
            height: context.screenHeight * 0.1,
            color: AppColors.backgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                SliderIndicator(
                  length: onBoardingView.length,
                  selectedIndex: currentPage,
                ),
                InkWell(
                  onTap: () {
                    if (currentPage < onBoardingView.length - 1) {
                      animateToPage(currentPage + 1);
                    } else {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: AppColors.backgroundColor,
                    ),
                  ),
                )
              ],
            ).paddingSymmetric(horizontal: AppSizes.padding),
          )
        ],
      ),
    );
  }
}
