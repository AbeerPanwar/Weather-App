import 'package:flutter/material.dart';


class AdditionalInfoWidget extends StatelessWidget {
  final String currentWindSpeed;
  final String currentPressure;
  final String currentVisibility;
  const AdditionalInfoWidget({
    super.key, 
    required this.currentWindSpeed, 
    required this.currentPressure, 
    required this.currentVisibility, 
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AdditionalInfoItem(
          icon: Icons.visibility_rounded,
          label: 'Visibility',
          value: currentVisibility,
        ),
        AdditionalInfoItem(
          icon: Icons.air,
          label: 'Wind Speed',
          value: currentWindSpeed,
        ),
        AdditionalInfoItem(
          icon: Icons.beach_access,
          label: 'Pressure',
          value: currentPressure,
        ),
      ],
    );
  }
}

class AdditionalInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const AdditionalInfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Icon(
            icon,
            size: 40,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}