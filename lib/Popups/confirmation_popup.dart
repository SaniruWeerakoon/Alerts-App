import 'package:alerts/color/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
void showConfirmationDialog(
    BuildContext context, VoidCallback onConfirm, VoidCallback onCancel) {
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
        title: const Text("Confirmation"),
        surfaceTintColor: isDarkModeEnabled
            ? darkModeColors["010101"]
            : lightModeColors["F6F6F6"],
        content: const Text("Are you sure you completed the task?"),
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
                  onCancel(); 
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
                  Navigator.of(context).pop();
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
