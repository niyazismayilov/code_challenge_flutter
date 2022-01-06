import 'package:birbir/presentation/shared/color.dart';
import 'package:flutter/material.dart';

class TimeShortcutButton extends StatelessWidget {
  final int index;

  const TimeShortcutButton({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.0,
      height: 45.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          side: BorderSide(color: UIColor.primary),
          elevation: 0,
          shadowColor: UIColor.transparent,
          primary: index % 2 == 0 ? UIColor.white : UIColor.primary,
        ),
        onPressed: () {},
        child: Text(
          '10:0$index',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
            letterSpacing: .17,
            color: index % 2 == 0 ? UIColor.primary : UIColor.white,
          ),
        ),
      ),
    );
  }
}
