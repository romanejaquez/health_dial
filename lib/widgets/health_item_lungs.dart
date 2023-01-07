import 'package:flutter/material.dart';
import 'package:health_dial/helpers/health_dial_icons_icons.dart';
import 'package:health_dial/helpers/utils.dart';

class HealthItemLungs extends StatefulWidget {
  const HealthItemLungs({super.key});

  @override
  State<HealthItemLungs> createState() => _HealthItemLungsState();
}

class _HealthItemLungsState extends State<HealthItemLungs> with SingleTickerProviderStateMixin {
  
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
    return ScaleTransition(
      scale: Tween<double>(
        begin: 1, end: 1.25
      ).animate(CurvedAnimation(parent: ctrl, curve: Curves.easeInOutSine)),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Icon(HealthDialIcons.lungs, size: 160, color: Utils.lungsColor,
          shadows: [
            BoxShadow(
              color: Utils.lungsColor.withOpacity(0.5),
              blurRadius: 20,
              offset: Offset.zero
            )
          ]
        ),
      ),
    );
  }
}