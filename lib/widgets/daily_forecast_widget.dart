import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';



class DailyForecastItem extends StatelessWidget {
  final int day;
  final String icon;
  final String tempMax;
  final Color? color;
  const DailyForecastItem({
    super.key, 
    required this.day, 
    required this.icon, 
    required this.tempMax,
    this.color,
  });

  String getDay(final day){
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              getDay(day),
              style: TextStyle(
                fontSize: 20,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
            Lottie.asset(
              icon,
              height: 40,
            ),
            Text(
              "$tempMax °C",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: 320,
          height: 1,
          color: Colors.white12,
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}