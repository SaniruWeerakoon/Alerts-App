import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isDarkModeEnabled = false;
  bool isAdapBrightness = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(246, 246, 246, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Settings",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 36,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const Divider(
              color: Color.fromRGBO(37, 37, 37, 1),
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
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffcacaca),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              "Dark Mode",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Switch(
                            value: isDarkModeEnabled,
                            activeColor: Colors.blueAccent,
                            onChanged: (value) => {
                              setState(
                                () {
                                  isDarkModeEnabled = value;
                                },
                              ),
                            },
                          )
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
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffcacaca),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              "Adaptive Brightness",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Switch(
                            value: isAdapBrightness,
                            activeColor: Colors.blueAccent,
                            onChanged: (value) => {
                              setState(
                                () {
                                  isAdapBrightness = value;
                                },
                              ),
                            },
                          )
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
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffcacaca),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'some info abt the app gpt',
                            style: TextStyle(
                              // fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
