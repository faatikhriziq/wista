import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wista/core/constants/app_sizes.dart';
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
      body: const Center(
        child: Text('Home Page'),
      ),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
