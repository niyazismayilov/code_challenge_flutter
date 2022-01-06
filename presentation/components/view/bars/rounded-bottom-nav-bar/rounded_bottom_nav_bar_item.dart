import 'package:flutter/material.dart';

enum RoundedBottomNavBarItemType { image, titledIcon }

class RoundedBottomNavBarItem {
  final IconData icon;
  final String title;
  final RoundedBottomNavBarItemType type;
  final String? imagePath;

  const RoundedBottomNavBarItem({
    Key? key,
    required this.title,
    required this.icon,
    this.type = RoundedBottomNavBarItemType.titledIcon,
    this.imagePath
  });
}
