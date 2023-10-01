import 'package:alerts/Popups/delete_popup.dart';
import 'package:alerts/color/color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:alerts/class/events.dart';
import 'package:alerts/Popups/confirmation_popup.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AlertInfo extends StatefulWidget {
  const AlertInfo({required this.title, Key? key}) : super(key: key);
  final String title;
  @override
  State<AlertInfo> createState() => _AlertInfoState();
}

class _AlertInfoState extends State<AlertInfo> {
  List<Event> searchResults = [];

  @override
  void initState() {
    super.initState();
    searchForEvent();
  }

  void searchForEvent() {
    String searchTitle = widget.title;
    setState(() {
      searchResults = eventsNew.where((event) {
        return event.title.toLowerCase() == searchTitle.toLowerCase();
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkModeEnabled
          ? darkModeColors["010101"]
          : lightModeColors["F6F6F6"],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Alert Details",
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
          Container(
            width: 330,
            height: 70,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: isDarkModeEnabled
                  ? darkModeColors["171717"]
                  : lightModeColors["CACACA"],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    searchResults[0].title,
                    style: TextStyle(
                      color: isDarkModeEnabled
                          ? darkModeColors["CCCCCC"]
                          : lightModeColors["252525"],
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Container(
            width: 330,
            height: 160,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: isDarkModeEnabled
                  ? darkModeColors["171717"]
                  : lightModeColors["CACACA"],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    searchResults[0].description,
                    style: TextStyle(
                      color: isDarkModeEnabled
                          ? darkModeColors["CCCCCC"]
                          : lightModeColors["252525"],
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Container(
            width: 330,
            height: 70,
            // padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: isDarkModeEnabled
                  ? darkModeColors["171717"]
                  : lightModeColors["CACACA"],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    searchResults[0].date,
                    style: TextStyle(
                      color: isDarkModeEnabled
                          ? darkModeColors["CCCCCC"]
                          : lightModeColors["252525"],
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Container(
            width: 330,
            height: 70,
            // padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: isDarkModeEnabled
                  ? darkModeColors["171717"]
                  : lightModeColors["CACACA"],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    searchResults[0].time,
                    style: TextStyle(
                      fontSize: 20,
                      color: isDarkModeEnabled
                          ? darkModeColors["CCCCCC"]
                          : lightModeColors["252525"],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  showDeleteDialog(context, () {
                    setState(() {
                      //delete this event
                      eventsNew.remove(
                        searchResults[0],
                      );
                      context.go("/");
                    });
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: isDarkModeEnabled
                      ? darkModeColors["171717"]
                      : lightModeColors["CACACA"],
                  padding: const EdgeInsets.all(15),
                ),
                child: Icon(
                  Icons.delete,
                  color: lightModeColors["EB3223"],
                  size: 40,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showConfirmationDialog(context, () {
                    setState(() {
                      searchResults[0].isComplete = true;
                      context.go("/");
                    });
                  }, () {
                    setState(() {
                      searchResults[0].isComplete = false;
                    });
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: isDarkModeEnabled
                      ? darkModeColors["171717"]
                      : lightModeColors["CACACA"],
                  padding: const EdgeInsets.all(5),
                ),
                child: Icon(
                  Icons.check_sharp,
                  color: isDarkModeEnabled
                      ? darkModeColors["CCCCCC"]
                      : lightModeColors["000000"],
                  size: 60,
                ),
              ),
            ],
          ),
        ],
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
    ).animate().fadeIn( duration: 1000.milliseconds);
  }
}
