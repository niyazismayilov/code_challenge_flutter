import 'package:birbir/presentation/shared/color.dart';
import 'package:flutter/material.dart';

import 'rounded_bottom_nav_bar_item.dart';

class RoundedBottomNavBarTile extends StatelessWidget {
  final RoundedBottomNavBarItem item;
  final Function(RoundedBottomNavBarItem) didTap;

  const RoundedBottomNavBarTile({
    Key? key,
    required this.item,
    required this.didTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: UniqueKey(),
      focusElevation: 0,
      highlightElevation: 0,
      hoverElevation: 0,
      backgroundColor: UIColor.transparent,
      elevation: 0,
      onPressed: () {
        didTap(item);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (item.type == RoundedBottomNavBarItemType.image)
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Image.asset(item.imagePath!),
              ),
            ),
          if (item.type == RoundedBottomNavBarItemType.titledIcon) Icon(item.icon, color: UIColor.primary),
          if (item.type == RoundedBottomNavBarItemType.titledIcon) SizedBox(height: 4.0),
          if (item.type == RoundedBottomNavBarItemType.titledIcon)
            Text(
              item.title,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: UIColor.black,
              ),
            ),
        ],
      ),
    );
  }
}
