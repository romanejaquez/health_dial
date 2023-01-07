import 'package:flutter/material.dart';
import 'package:health_dial/helpers/health_dial_icons_icons.dart';
import 'package:health_dial/helpers/utils.dart';

class HealthItemUser extends StatefulWidget {
  const HealthItemUser({super.key});

  @override
  State<HealthItemUser> createState() => _HealthItemUserState();
}

class _HealthItemUserState extends State<HealthItemUser> with SingleTickerProviderStateMixin {

  late AnimationController ctrl;

  @override
  void initState() {
    super.initState();

    ctrl = AnimationController(vsync: this,
      upperBound: 30,
      lowerBound: 1,
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: ctrl,
          builder: (context, widget) {
            return Icon(HealthDialIcons.user, color: Utils.userColor, size: 100,
              shadows: [
                BoxShadow(
                  color: Utils.tempColor.withOpacity(0.5),
                  blurRadius: ctrl.value,
                  offset: Offset.zero
                )
              ]
            );
          }
        ),
        SizedBox(height: 20),
        Text('Roman Jaquez', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
        Text('42 yo / 200 lb / 5\'8"',textAlign: TextAlign.center, style: TextStyle(color: Utils.userColor, fontSize: 20)),
      ],
    );
  }
}