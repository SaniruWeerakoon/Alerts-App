import 'package:flutter/material.dart';

const Map<String, Color> lightModeColors = {
  "F6F6F6": Color.fromRGBO(246, 246, 246, 1),
  "252525": Color.fromRGBO(37, 37, 37, 1),
  "CACACA": Color.fromRGBO(202, 202, 202, 1),
  "7E7E7E": Color.fromRGBO(126, 126, 126, 1),
  "1A54E9": Color.fromRGBO(26, 84, 233, 1),
  "4173F4": Color.fromRGBO(65, 115, 244, 1),
  "DEF7FF": Color.fromRGBO(181, 237, 255, 1),
  "FF0000": Color.fromRGBO(255, 0, 0, 1),
  "000000": Color.fromRGBO(0, 0, 0, 1),
  "EB3223": Color.fromRGBO(235, 50, 35, 1),
  "252525_90": Color.fromRGBO(37, 37, 37, 0.9),
};

const Map<String, Color> darkModeColors = {
  "CCCCCC": Color.fromRGBO(204, 204, 204, 1),
  "4173F4": Color.fromRGBO(65, 115, 244, 1),
  "333333": Color.fromRGBO(51, 51, 51, 1),
  "1A54E9": Color.fromRGBO(26, 84, 233, 1),
  "010101": Color.fromRGBO(1, 1, 1, 1),
  "000000": Color.fromRGBO(0, 0, 0, 1),
  "7E7E7E": Color.fromRGBO(126, 126, 126, 1),
  "171717": Color.fromRGBO(23, 23, 23, 1),
  "EB3223": Color.fromRGBO(235, 50, 35, 1),
};

bool isDarkModeEnabled = false;
bool isAdapBrightness = false;