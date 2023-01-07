
import 'package:flutter/material.dart';
import 'package:health_dial/helpers/dialdrawer.dart';
import 'package:health_dial/models/health_item.dart';

class HealthDialItem extends StatelessWidget {

  final HealthItem item;
  final Listenable ctrl;
  const HealthDialItem({super.key, required this.item, required this.ctrl });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomPaint(
          painter: DialDrawer(
            repaint: ctrl,
            startAngle: item.startAngle,
            color: item.color,
            selected: item.isSelected
          ),
          child: const SizedBox(
            width: 450,
            height: 450
          ),
        ),
      ],
    );
  }
}
