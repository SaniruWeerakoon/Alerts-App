import 'package:alerts/color/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

void showDiscardDialog(BuildContext context, VoidCallback onConfirm) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: isDarkModeEnabled
            ? darkModeColors["171717"]
            : lightModeColors["CACACA"],
        titleTextStyle: TextStyle(
          color: isDarkModeEnabled
              ? darkModeColors["CCCCCC"]
              : lightModeColors["252525"],
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: TextStyle(
          color: isDarkModeEnabled
              ? darkModeColors["CCCCCC"]
              : lightModeColors["252525"],
          fontSize: 16,
        ),
        surfaceTintColor: isDarkModeEnabled
            ? darkModeColors["010101"]
            : lightModeColors["F6F6F6"],
        title: const Text("Discard"),
        content: const Text("Are you sure you want to discard changes?"),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: Text(
                  "Cancel",
                  style:
                      TextStyle(color: lightModeColors["FF0000"], fontSize: 18),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text(
                  "Confirm",
                  style: TextStyle(
                      color: isDarkModeEnabled
                          ? darkModeColors["CCCCCC"]
                          : lightModeColors["252525"],
                      fontSize: 18),
                ),
                onPressed: () {
                  onConfirm(); 
                  // Navigator.of(context).pop();
                },
              ),
            ],
          )
        ],
      ).animate().moveY(
          duration: 800.milliseconds,
        );
    },
  );
}
