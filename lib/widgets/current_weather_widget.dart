import 'dart:ui';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final String currentTemp;
  final String currentSky;
  final String currentSkyAnimation;
  const CurrentWeatherWidget({
    super.key, 
    required this.currentTemp, 
    required this.currentSky, 
    required this.currentSkyAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Colors.deepPurpleAccent,
        elevation: 10,
        shadowColor: Colors.black54,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 8, 
              sigmaY: 8,
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Lottie.asset(
                    currentSkyAnimation,
                    height: 120,
                  ),
                  Container(
                    height: 60,
                    width: 1,
                    color: Colors.white30,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '$currentTemp°',
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: currentSky,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}