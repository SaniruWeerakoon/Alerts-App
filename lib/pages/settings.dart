import 'dart:async';
import 'package:alerts/color/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:light_sensor/light_sensor.dart';
import 'package:screen_brightness/screen_brightness.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // bool isDarkModeEnabled = false;
  // bool isAdapBrightness = false;
  final ScreenBrightness _brightness = ScreenBrightness();
  StreamSubscription? lightsensorSubscritption;
  @override
  void initState() {
    super.initState();
    if (isAdapBrightness) {
      adaptiveBrightnessEnabled();
    }
  }

  Future<void> adaptiveBrightnessEnabled() async {
    final hasSensor = await LightSensor.hasSensor;
    // debugPrint(isAdapBrightness.toString());
    if (hasSensor != null && hasSensor) {
      lightsensorSubscritption =
          LightSensor.lightSensorStream.listen((luxValue) {
        final double ambientBrightness = luxValue / 5000.0;

        if (ambientBrightness <= 1) {
          _setBrightness(ambientBrightness);
        } else if (ambientBrightness > 1) {
          _setBrightness(0.9);
        }
      });
    } else {
      debugPrint("No light sensor");
    }
  }

  Future<void> _setBrightness(double brightness) async {
    // Update the screen brightness using the ScreenBrightness instance
    setState(() async {
      await _brightness.setScreenBrightness(brightness);
    });
  }

  void stopAdaptiveBrightness() {
    if (lightsensorSubscritption != null) {
      lightsensorSubscritption!.cancel();
      _setBrightness(0.3);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkModeEnabled
          ? darkModeColors["010101"]
          : lightModeColors["F6F6F6"],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Settings",
                  style: TextStyle(
                      color: isDarkModeEnabled
                          ? darkModeColors["CCCCCC"]
                          : lightModeColors["252525"],
                      fontFamily: "Inter",
                      fontSize: 36,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Divider(
              color: isDarkModeEnabled
                  ? darkModeColors["CCCCCC"]
                  : lightModeColors["252525"],
              thickness: 2,
            ),
            const SizedBox(
              height: 20.0,
            ),

            //darkmode//////////////////////////////////////
            /////////////////////////////////////////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      alignment:
                          Alignment.centerLeft, // Align the child to the left
                      width: 330,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: isDarkModeEnabled
                            ? darkModeColors["171717"]
                            : lightModeColors["CACACA"],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              "Dark Mode",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: isDarkModeEnabled
                                    ? darkModeColors["CCCCCC"]
                                    : lightModeColors["252525"],
                              ),
                            ),
                          ),
                          Switch.adaptive(
                            value: isDarkModeEnabled,
                            activeColor: isDarkModeEnabled
                                ? darkModeColors["CCCCCC"]
                                : lightModeColors["4173F4"],
                            onChanged: (value) => {
                              setState(
                                () {
                                  isDarkModeEnabled = value;
                                },
                              ),
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(
              height: 20.0,
            ),

            //Adaptive brightness////////////////////////////
            /////////////////////////////////////////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      alignment:
                          Alignment.centerLeft, // Align the child to the left
                      width: 330,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: isDarkModeEnabled
                            ? darkModeColors["171717"]
                            : lightModeColors["CACACA"],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              "Adaptive Brightness",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: isDarkModeEnabled
                                    ? darkModeColors["CCCCCC"]
                                    : lightModeColors["252525"],
                              ),
                            ),
                          ),
                          Switch(
                            value: isAdapBrightness,
                            activeColor: isDarkModeEnabled
                                ? darkModeColors["CCCCCC"]
                                : lightModeColors["4173F4"],
                            onChanged: (value) => {
                              setState(
                                () {
                                  isAdapBrightness = value;
                                  if (isAdapBrightness) {
                                    adaptiveBrightnessEnabled();
                                  } else {
                                    stopAdaptiveBrightness();
                                    debugPrint(isAdapBrightness.toString());
                                  }
                                },
                              ),
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(
              height: 20.0,
            ),

            /////About///////////////////////////////////////
            /////////////////////////////////////////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      // alignment:
                      //     Alignment.topCenter, // Align the child to the left
                      width: 330,
                      height: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: isDarkModeEnabled
                            ? darkModeColors["171717"]
                            : lightModeColors["CACACA"],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "About",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: isDarkModeEnabled
                                    ? darkModeColors["CCCCCC"]
                                    : lightModeColors["252525"],
                              ),
                            ),
                            Text(
                              '\nAlerts is a powerful and user-friendly task management app designed to help you stay organized and on top of your daily tasks and responsibilities. Whether you\'re a busy professional, a student, or simply someone who wants to manage their time more effectively, Alerts has you covered',
                              style: TextStyle(
                                // fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: isDarkModeEnabled
                                    ? darkModeColors["CCCCCC"]
                                    : lightModeColors["252525"],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 65,
        width: 360,
        decoration: BoxDecoration(
          color: lightModeColors["4173F4"],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => {
                context.go('/'),
              },
              icon: Icon(
                Icons.home,
                color: lightModeColors["000000"],
                size: 45,
              ),
            ),
            IconButton(
              onPressed: () => {
                context.go('/calendar'),
              },
              icon: Icon(
                Icons.calendar_month,
                size: 45,
                color: lightModeColors["000000"],
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(
          duration: 800.milliseconds,
        );
  }
}
