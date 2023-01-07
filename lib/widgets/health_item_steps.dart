import 'package:flutter/material.dart';
import 'package:health_dial/helpers/health_dial_icons_icons.dart';
import 'package:health_dial/helpers/utils.dart';
import 'package:rive/rive.dart';
import 'package:rive/rive.dart' as Rive;

class HealthItemSteps extends StatefulWidget {
  const HealthItemSteps({super.key});

  @override
  State<HealthItemSteps> createState() => _HealthItemStepsState();
}

class _HealthItemStepsState extends State<HealthItemSteps> with SingleTickerProviderStateMixin {

  late Rive.RiveAnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = Rive.SimpleAnimation('Walk');
    controller.isActive = true;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 200,
      child: Row(
        children: [
          Icon(
            Icons.directions_walk, size: 120, color: Utils.stepsColor,
            shadows: [
            BoxShadow(
              color: Utils.stepsColor.withOpacity(0.5),
              blurRadius: 20,
              offset: Offset.zero
            )
          ]  
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('2040', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 60)),
              Text('Steps', textAlign: TextAlign.center,  style: TextStyle(color: Colors.white, fontSize: 20))
            ],
          )
        ],
      ),
    );
  }
}