import 'package:birbir/presentation/shared/color.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class PrimaryCalendar extends StatelessWidget {
  const PrimaryCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          elevation: 5,
          shadowColor: UIColor.tint,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24))),
          child: TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime(2020),
            lastDay: DateTime(2022),
            daysOfWeekVisible: false,
            startingDayOfWeek: StartingDayOfWeek.monday,
            rowHeight: 50.0,
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: UIColor.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
