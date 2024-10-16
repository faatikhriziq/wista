import 'package:flutter/cupertino.dart';
import 'package:wista/core/extensions/widget_extensions.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';

class SliderIndicator extends StatelessWidget {
  final int selectedIndex;
  final int length;
  const SliderIndicator(
      {super.key, required this.selectedIndex, required this.length});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(length, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          width: selectedIndex == index ? 35 : 12,
          height: 12,
          decoration: BoxDecoration(
            color: selectedIndex == index
                ? AppColors.primaryColor
                : AppColors.buttonDisabledColor,
            borderRadius: BorderRadius.circular(AppSizes.borderRadius),
          ),
        );
      }),
    ).gap(8);
  }
}
