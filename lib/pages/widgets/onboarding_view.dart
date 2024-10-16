import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:wista/core/extensions/screen_extension.dart';
import 'package:wista/core/extensions/widget_extensions.dart';
import 'package:wista/pages/widgets/app_bottom_navigation_bar.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/theme/app_typography.dart';

class OnBoardingView extends StatelessWidget {
  final String imageAsset;
  final String headline;
  final String description;
  const OnBoardingView({
    super.key,
    required this.imageAsset,
    required this.headline,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        Animate(
          effects: const [FadeEffect()],
          child: Image.asset(
            imageAsset,
            fit: BoxFit.cover,
            height: context.screenHeight,
            width: context.screenWidth,
          ),
        ),
        Container(
          width: context.screenWidth,
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.backgroundColor.withOpacity(0.0),
                AppColors.backgroundColor.withOpacity(0.6),
                AppColors.backgroundColor,
                AppColors.backgroundColor,
                AppColors.backgroundColor,
              ],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                headline,
                style: AppTypography.display1.copyWith(
                  color: AppColors.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              Text(
                description,
                style: const TextStyle(
                  color: AppColors.primaryTextColor,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ).paddingOnly(
              left: AppSizes.padding, right: AppSizes.padding, top: 120),
        ),
      ],
    );
  }
}
