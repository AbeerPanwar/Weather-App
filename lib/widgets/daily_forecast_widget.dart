import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class DailyForecastWidget extends StatelessWidget {
  const DailyForecastWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.topLeft,
              child: Text(
                      'Daily Forecast',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
            DailyForecastItem(
              day: 'Today',
              color: Colors.deepPurpleAccent,
              icon: WeatherIcons.day_sunny,
              value: '25° / 32° C',
            ),
            DailyForecastItem(
              day: 'Thu',
              icon: WeatherIcons.day_cloudy_gusts,
              value: '26° / 34° C',
            ),
            DailyForecastItem(
              day: 'fri',
              icon: WeatherIcons.rain,
              value: '21° / 39° C',
            ),
            DailyForecastItem(
              day: 'sat',
              icon: WeatherIcons.day_sunny,
              value: '26° / 35° C',
            ),
            DailyForecastItem(
              day: 'sun',
              icon: WeatherIcons.cloudy_windy,
              value: '22° / 28° C',
            ),
            DailyForecastItem(
              day: 'mon',
              icon: WeatherIcons.cloudy_windy,
              value: '22° / 28° C',
            ),
          ],
        ),
      ),
    );
  }
}

class DailyForecastItem extends StatelessWidget {
  final String day;
  final IconData icon;
  final String value;
  final Color? color;
  const DailyForecastItem({
    super.key, 
    required this.day, 
    required this.icon, 
    required this.value,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                day,
                style: TextStyle(
                  fontSize: 18,
                  color: color,
                ),
              ),
              Icon(
                icon,
                size: 25,
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 18,
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
        ],
      ),
    );
  }
}