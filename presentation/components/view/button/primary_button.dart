import 'package:birbir/presentation/shared/color.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor;
  final double elevation;
  final double borderRadius;
  final double height;
  final VoidCallback? onPressed;

  const PrimaryButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.borderRadius = 20.0,
    this.height = 50.0,
    this.color = UIColor.primary,
    this.textColor = UIColor.white,
    this.elevation = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
          elevation: elevation,
          primary: color,
          shadowColor: elevation != 0.0 ? UIColor.tint : UIColor.transparent,
        ),
        onPressed: onPressed,
        child: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12.0,
              color: textColor,
            )),
      ),
    );
  }
}
