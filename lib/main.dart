import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_dial/helpers/utils.dart';
import 'package:health_dial/models/health_item.dart';
import 'package:health_dial/services/health_item_service.dart';
import 'package:health_dial/widgets/health_item_heart.dart';
import 'package:provider/provider.dart';

import 'widgets/health_dial_item.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HealthItemService())
      ],
      child: const HealthDialApp()
    )
  );
}

class HealthDialApp extends StatelessWidget {
  const HealthDialApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const HealthDialMain(),
      theme: ThemeData(
        fontFamily: 'Product Sans'
      ),
    );
  }
}

class HealthDialMain extends StatefulWidget {
  const HealthDialMain({super.key});

  @override
  State<HealthDialMain> createState() => _HealthDialMainState();
}

class _HealthDialMainState extends State<HealthDialMain> with TickerProviderStateMixin {

  late AnimationController ctrl;

  @override 
  void initState() {
    super.initState();

    ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1)
    )..forward();
  }

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer<HealthItemService>(
        builder: (context, healthItemService, child) {
          return healthItemService.showHeartOnly ?
            Center(
              child: Transform.scale(
                scale: 1.75,
                child: const HealthItemHeart())
            ) :
            Center(
              child: SizedBox(
                width: 570,
                height: 570,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Center(
                      child: ClipOval(
                        child: Container(
                          width: 600,
                          height: 600,
                          color: Utils.darkGrayBg
                        ),
                      ),
                    ),
                    
                    ...List.generate(healthItemService.values.length, (index) {

                      var value = 1 / healthItemService.values.length;
                      var item = healthItemService.values[index];

                      return ScaleTransition(
                        alignment: Alignment.center,
                        scale: Tween<double>(
                          begin: 0.9, end: 1
                        ).animate(
                          CurvedAnimation(parent: ctrl,
                          curve: Interval(
                            index * value, (index + 1) * value,
                            curve: Curves.easeInOut
                          ))
                        ),
                        child: FadeTransition(
                          opacity: Tween<double>(
                            begin: 0, end: 1
                          ).animate(
                            CurvedAnimation(parent: ctrl,
                            curve: Interval(
                              index * value, (index + 1) * value,
                              curve: Curves.easeInOut
                            ))
                          ),
                          child: Center(
                            child: HealthDialItem(
                              ctrl: ctrl,
                              item: item,
                            ),
                          ),
                        ),
                      );
                    }),

                    ...List.generate(healthItemService.values.length, (index) {
                      var item = healthItemService.values[index];

                      return Positioned(
                        top: item.iconPositionY,
                        left: item.iconPositionX,
                        child: IconButton(
                          alignment: Alignment.center,
                          onPressed: () {
                            healthItemService.selectHealthItem(item);
                          },
                          iconSize: 100,
                          icon: Icon(
                            item.icon, 
                            color: item.isSelected ? Colors.white : Utils.darkGrayBg, 
                            size: 60
                          )
                        )
                      );
                    }),

                    Center(
                      child: healthItemService.currentValue.view
                    )
                  ]
                )
              ),
            );
        }
      ),
    );
  }
}












