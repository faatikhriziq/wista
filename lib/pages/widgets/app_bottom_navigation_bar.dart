import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wista/core/extensions/widget_extensions.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';

enum BottomNavigationItem { home, picture, cart, love, write }

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({
    super.key,
  });

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  BottomNavigationItem _selectedMenu = BottomNavigationItem.home;
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  void animateSelected() {
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.buttonHeightLarge,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSizes.borderRadiusLarge),
          topRight: Radius.circular(AppSizes.borderRadiusLarge),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: BottomNavigationItem.values
            .map(
              (item) => InkWell(
                onTap: () {
                  setState(() {
                    _selectedMenu = item;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Animate(
                      controller: _controller,
                      effects: const [ScaleEffect()],
                      child: SvgPicture.asset(
                        'assets/icons/${item.name}.svg',
                        height: _selectedMenu == item
                            ? AppSizes.iconSizeMedium
                            : AppSizes.iconSize,
                        width: AppSizes.iconSize,
                      ),
                    ),
                    Animate(
                      effects: const [ScaleEffect()],
                      child: Visibility(
                        visible: _selectedMenu == item ? true : false,
                        child: Container(
                          height: 4.0,
                          width: AppSizes.iconSizeMedium + 4.0,
                          decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(
                                AppSizes.borderRadiusMedium),
                          ),
                        ),
                      ),
                    ),
                  ],
                ).gap(8).paddingSymmetric(vertical: AppSizes.paddingSmall),
              ),
            )
            .toList(),
      ).paddingSymmetric(horizontal: AppSizes.paddingLarge),
    );
  }
}
