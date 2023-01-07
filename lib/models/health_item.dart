
import 'package:flutter/material.dart';

class HealthItem {
  final Color color;
  final double startAngle;
  final IconData icon;
  final double iconPositionX;
  final double iconPositionY;
  bool isSelected = false;
  final Widget view;

  HealthItem({
    required this.color,
    required this.startAngle,
    required this.icon,
    required this.iconPositionX,
    required this.iconPositionY,
    required this.view
  });
}
