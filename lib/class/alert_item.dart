import 'package:alerts/color/color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AlertItem extends StatelessWidget {
  final String title;
  final String date;
  final bool isComplete;
  final ValueChanged<bool?>? onCheckboxChanged;
  // Add other properties here as needed

  const AlertItem({
  required this.title,
  required this.date,
  required this.isComplete,
  this.onCheckboxChanged,
  Key? key,
}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.fromLTRB(30, 5, 30, 5),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color:isDarkModeEnabled? darkModeColors["171717"] :  lightModeColors["CACACA"],
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 2.0,
          ),
        ],
      ),
      child: ListTile(
        onTap: () => {
          context.goNamed('alertInfo', pathParameters: {"title": title})
        },
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: isDarkModeEnabled? darkModeColors["CCCCCC"] : lightModeColors["252525"],
            decoration: isComplete
                ? TextDecoration.lineThrough// Apply strikethrough if complete
                : TextDecoration.none, 
          ),
        ),
        subtitle: Text(
          date,
          style: TextStyle(
            fontSize: 14,
            color: isDarkModeEnabled? darkModeColors["7E7E7E"] : lightModeColors["7E7E7E"],
            decoration: isComplete
                ? TextDecoration.lineThrough
                : TextDecoration.none, // Apply strikethrough if complete
          ),
        ),
        trailing: Checkbox(
          // Add a Checkbox widget as the trailing widget
          value: isComplete,
          onChanged: onCheckboxChanged, // Call the provided callback
        ),
      ).animate().fadeIn(duration: 1000.milliseconds),
    );
  }
}
