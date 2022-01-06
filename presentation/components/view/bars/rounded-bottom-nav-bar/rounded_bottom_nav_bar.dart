import 'package:birbir/presentation/shared/color.dart';
import 'package:flutter/material.dart';

import 'rounded_bottom_nav_bar_item.dart';
import 'rounded_bottom_nav_bar_tile.dart';

class RoundedBottomNavBar extends StatelessWidget {
  final List<RoundedBottomNavBarItem> items;
  final double height;
  final int currentIndex;
  final Function(int) didTap;

  const RoundedBottomNavBar({
    Key? key,
    this.height = 64,
    required this.items,
    required this.didTap,
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(height / 2)),
      child: Container(
        height: height,
        width: double.infinity,
        color: UIColor.tintLight,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: items.map((item) {
            return RoundedBottomNavBarTile(item: item, didTap: (item) => didTap(items.indexOf(item)));
          }).toList(),
        ),
      ),
    );
  }
}
