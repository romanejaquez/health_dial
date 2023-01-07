import 'package:flutter/material.dart';
import 'package:health_dial/helpers/utils.dart';
import 'package:health_dial/services/health_item_service.dart';
import 'package:provider/provider.dart';

class HealthItemHeart extends StatefulWidget {
  const HealthItemHeart({super.key});

  @override
  State<HealthItemHeart> createState() => _HealthItemHeartState();
}

class _HealthItemHeartState extends State<HealthItemHeart> with TickerProviderStateMixin {

  late AnimationController ctrl;
  late AnimationController blurCtrl;

  @override
  void initState() {
    super.initState();

    ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500)
    )..repeat(reverse: true);

    blurCtrl = AnimationController(
      lowerBound: 4,
      upperBound: 40,
      vsync: this,
      duration: const Duration(milliseconds: 500)  
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    ctrl.dispose();
    blurCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HealthItemService hiService = context.read<HealthItemService>();
    
    return GestureDetector(
      onTap: () {
        hiService.toggleShowHeartOnly();
      },
      child: SizedBox(
        width: 250,
        height: 250,
        child: Stack(
          children: [
            ScaleTransition(
              scale: Tween<double>(
                begin: 1.10, end: 1.25
              ).animate(CurvedAnimation(parent: ctrl, curve: Curves.easeInOutSine)),
              child: AnimatedBuilder(
                animation: blurCtrl,
                builder: (context, widget) {
                  return Center(
                    child: Icon(Icons.favorite,
                    color: Utils.heartColor,
                    shadows: [
                      BoxShadow(
                        color: Utils.heartColor,
                        blurRadius: blurCtrl.value,
                        offset: Offset.zero
                      )
                    ],
                    size: 240
                  ));
                }
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('89', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 70)),
                  Text('bmp', textAlign: TextAlign.center,  style: TextStyle(color: Colors.white, fontSize: 30))
                ],
              )
            )
          ],
        )
      ),
    );
  }
}