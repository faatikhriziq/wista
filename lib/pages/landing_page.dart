import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:wista/core/constants/app_colors.dart';
import 'package:wista/core/constants/app_sizes.dart';
import 'package:wista/core/extensions/screen_extension.dart';
import 'package:wista/core/extensions/widget_extensions.dart';
import 'package:wista/pages/onboarding_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: context.screenHeight,
            width: context.screenWidth,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Image.asset(
                  height: context.screenHeight,
                  width: context.screenWidth,
                  'assets/images/landing.png',
                  fit: BoxFit.cover,
                ),
                Container(
                  height: context.screenHeight * 0.38,
                  width: context.screenWidth,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.2),
                        Colors.black.withOpacity(0.5),
                        Colors.black,
                        Colors.black,
                        Colors.black,
                        Colors.black,
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              const Spacer(),
              Image.asset(
                'assets/images/logo.png',
                height: context.screenHeight * 0.2,
              ),
              const Spacer(),
              Animate(
                controller: _controller,
                delay: const Duration(milliseconds: 2000),
                autoPlay: true,
                effects: const [
                  FadeEffect(
                    curve: Curves.easeInOut,
                  ),
                  ScaleEffect(
                    curve: Curves.easeInOut,
                  )
                ],
                child: const Text(
                  'Jelajahi keindahan Nusantara, temukan keajaiban di setiap sudut negeri',
                  style: TextStyle(
                    fontSize: AppSizes.fontSizeExtraLarge,
                    color: AppColors.backgroundColor,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: AppSizes.paddingLarge),
              Animate(
                effects: const [FadeEffect(), ScaleEffect()],
                delay: const Duration(milliseconds: 2500),
                autoPlay: true,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const OnboardingPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: const StadiumBorder(),
                    minimumSize:
                        Size(context.screenWidth, AppSizes.buttonHeightMedium),
                  ),
                  child: const Text(
                    'Mulai Sekarang',
                    style: TextStyle(
                      color: AppColors.backgroundColor,
                      fontSize: AppSizes.fontSizeMedium,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ).paddingOnly(
            top: context.paddingTop + AppSizes.paddingLarge,
            left: AppSizes.padding,
            right: AppSizes.padding,
            bottom: AppSizes.paddingLarge,
          ),
        ],
      ),
    );
  }
}
