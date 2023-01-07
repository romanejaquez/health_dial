import 'package:flutter/material.dart';
import 'package:health_dial/helpers/health_dial_icons_icons.dart';
import 'package:health_dial/helpers/utils.dart';

class HealthItemBlood extends StatefulWidget {
  const HealthItemBlood({super.key});

  @override
  State<HealthItemBlood> createState() => _HealthItemBloodState();
}

class _HealthItemBloodState extends State<HealthItemBlood> with SingleTickerProviderStateMixin {
  
  late AnimationController ctrl;

  @override
  void initState() {
    super.initState();

    ctrl = AnimationController(vsync: this,
      duration: const Duration(seconds: 1)
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      width: 200,
      height: 200,
      child: Row(
        children: [
          SlideTransition(
            position: Tween<Offset>(
            begin: const Offset(0,-0.25), end: const Offset(0,0.25))
            .animate(CurvedAnimation(parent: ctrl, curve: Curves.easeInOut)
          ),
          child: const Icon(HealthDialIcons.blood,
              color: Utils.bloodColor,
              size: 100,
              shadows: [
                BoxShadow(
                  color: Utils.bloodColor,
                  blurRadius: 20,
                  offset: Offset.zero
                )
              ]
            )
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('102', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 60)),
              Text('SpO2', textAlign: TextAlign.center,  style: TextStyle(color: Colors.white, fontSize: 20))
            ],
          )
        ],
      ),
    );
  }
}