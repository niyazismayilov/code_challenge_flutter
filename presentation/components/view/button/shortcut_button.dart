import 'package:birbir/presentation/shared/color.dart';
import 'package:flutter/material.dart';

class ShortcutButton extends StatelessWidget {
  final String title;

  const ShortcutButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      side: BorderSide(color: UIColor.black),
      backgroundColor: UIColor.transparent,
      label: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: UIColor.black,
          fontSize: 10.0,
        ),
      ),
    );
  }
}
