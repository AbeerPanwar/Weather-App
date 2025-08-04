import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';


class ComfortLevelWidget extends StatelessWidget {
  final String currentFeelLike;
  final String currentSeaLvl;
  final int currentHumidity;
  const ComfortLevelWidget({
    super.key, 
    required this.currentHumidity, 
    required this.currentFeelLike, 
    required this.currentSeaLvl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          children: [
            Text(
              'Comfort Level',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            CircularSliderWidget(
              currentHumidity: currentHumidity.toDouble(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Feels Like $currentFeelLike',
                  ),
                  Container(
                    height: 20,
                    width: 1,
                    color: Colors.white30,
                  ),
                  Text(
                    'Sea Level ${currentSeaLvl.toString()}',
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CircularSliderWidget extends StatelessWidget {
  final double currentHumidity;
  const CircularSliderWidget({
    super.key, 
    required this.currentHumidity,
  });

  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      max: 100,
      min: 0,
      initialValue: currentHumidity,
      appearance: CircularSliderAppearance(
        customWidths: CustomSliderWidths(
          trackWidth: 5,
          progressBarWidth: 10,
        ),
        size: 140,
        animationEnabled: true,
        infoProperties: InfoProperties(
          mainLabelStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          bottomLabelText: 'Humidity',
          bottomLabelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        customColors: CustomSliderColors(
          progressBarColors: [
            Colors.purpleAccent,
            Colors.deepPurpleAccent,
          ],
          trackColor: Colors.white30,
        ),
      ),
    );
  }
}