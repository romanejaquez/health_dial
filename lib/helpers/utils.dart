
import 'package:flutter/material.dart';
import 'package:health_dial/helpers/health_dial_icons_icons.dart';
import 'package:health_dial/models/health_item.dart';
import 'package:health_dial/widgets/health_item_blood.dart';
import 'package:health_dial/widgets/health_item_heart.dart';
import 'package:health_dial/widgets/health_item_lungs.dart';
import 'package:health_dial/widgets/health_item_steps.dart';
import 'package:health_dial/widgets/health_item_temp.dart';
import 'package:health_dial/widgets/health_item_user.dart';

class Utils {

  static const Color darkGrayBg = Color(0xFF303030);
  static const Color heartColor = Color(0xFFE80404);
  static const Color lungsColor = Color(0xFF4BB4FF);
  static const Color tempColor = Color(0xFF2FBB4E);
  static const Color stepsColor =  Color(0xFF9550CC);
  static const Color bloodColor = Color(0xFF960303);
  static const Color userColor = Color(0xFF3ECDAB);

  static List<HealthItem> getHealthItems() {
    return [
      
      HealthItem(
        color: heartColor, 
        startAngle: -2.25,
        icon: HealthDialIcons.heart,
        iconPositionX: 160,
        iconPositionY: 15,
        view: const HealthItemHeart()
      ),

      HealthItem(
        color: tempColor, 
        startAngle: -1.5,
        icon: HealthDialIcons.temp,
        iconPositionX: 320,
        iconPositionY: 25,
        view: const HealthItemTemp()
      ),

      HealthItem(
        color: stepsColor, 
        startAngle: -0.75,
        icon: HealthDialIcons.steps,
        iconPositionX: 440,
        iconPositionY: 150,
        view: const HealthItemSteps()
      ),

      HealthItem(
        color: lungsColor, 
        startAngle: 0.0,
        icon: HealthDialIcons.lungs,
        iconPositionX: 430,
        iconPositionY: 310,
        view: const HealthItemLungs()
      ),

      HealthItem(
        color: bloodColor, 
        startAngle: 0.75,
        icon: HealthDialIcons.blood,
        iconPositionX: 320,
        iconPositionY: 430,
        view: const HealthItemBlood()
      ),

      
       HealthItem(
        color: userColor, 
        startAngle:  1.5,
        icon: HealthDialIcons.user,
        iconPositionX: 160,
        iconPositionY: 440,
        view: const HealthItemUser()
      ),

    ];
  }
}
