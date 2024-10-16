import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wista/core/constants/app_sizes.dart';
import 'package:wista/core/extensions/screen_extension.dart';
import 'package:wista/core/extensions/widget_extensions.dart';

import '../core/constants/app_colors.dart';
import 'widgets/app_bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
        children: [
          Container(
            height: context.screenHeight * 0.2,
            width: context.screenWidth,
            color: AppColors.primaryColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: const AssetImage('assets/images/avatar.png'),
                ),
                SizedBox(
                  width: AppSizes.padding,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        color: AppColors.backgroundColor,
                        fontSize: 18,
                      ),
                    ),
                  ],
                )
              ],
            ).paddingOnly(bottom: AppSizes.padding, left: AppSizes.padding),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {},
          ),
        ],
      )),
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: AppColors.backgroundColor),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        backgroundColor: AppColors.primaryColor,
        title: SvgPicture.asset(
          'assets/icons/logo.svg',
          height: 40,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
              height: 20,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
