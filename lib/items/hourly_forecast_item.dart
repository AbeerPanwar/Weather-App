import 'package:flutter/material.dart' ;
import 'package:lottie/lottie.dart';



class HourlyForecast extends StatelessWidget {
  final String time;
  final String temp;
  final String icon;
  final Color? color;
  const HourlyForecast({
    super.key,
    required this.time,
    required this.temp, 
    required this.icon, 
    this.color,
    });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 6,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              time,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 6,),
            Lottie.asset(
              icon,
              height: 35,
            ),
            SizedBox(height: 6,),
            Text(
              temp,
              style: TextStyle(
                fontSize: 14, 
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}