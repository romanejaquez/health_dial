import 'package:flutter/material.dart';
import 'package:health_dial/helpers/health_dial_icons_icons.dart';
import 'package:health_dial/helpers/utils.dart';

class HealthItemTemp extends StatelessWidget {
  const HealthItemTemp({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(HealthDialIcons.temp, color: Utils.tempColor, size: 120,
          shadows: [
            BoxShadow(
              color: Utils.tempColor.withOpacity(0.5),
              blurRadius: 20,
              offset: Offset.zero
            )
          ]),
          const Text('37°', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 100)),
        ],
      ),
    );
  }
}