import 'dart:async';

import 'package:flutter/material.dart';
import 'package:health_dial/helpers/utils.dart';
import 'package:health_dial/models/health_item.dart';

class HealthItemService extends ChangeNotifier {

  List<HealthItem> values = [];
  late HealthItem currentValue;
  late Timer switcher;
  int count = 0;
  bool showHeartOnly = false;

  HealthItemService() {
    values = Utils.getHealthItems();
    currentValue = values.first;
    currentValue.isSelected = true;

    startSwitcher();
  }

  void startSwitcher({ bool start = true }) {

    if (start) {
      switcher = Timer.periodic(const Duration(seconds: 3), (timer) {

        for (var i = 0; i < values.length; i++) {
          values[i].isSelected = count == i;
        }
        currentValue = values[count];
        count++;

        if (count == values.length) {
          count = 0;
        }

        notifyListeners();

      });
    }
    else {
      switcher.cancel();
    }
  }

  void toggleShowHeartOnly() {
    showHeartOnly = !showHeartOnly;
    startSwitcher(start: !showHeartOnly);

    notifyListeners();
  }

  void selectHealthItem(HealthItem item) {
    for (var element in values) {
      element.isSelected = false;
    }

    count = values.indexOf(item);
    item.isSelected = true;
    currentValue = item;
    notifyListeners();
  }

  @override
  void dispose() {
    switcher.cancel();
    super.dispose();
  }
}