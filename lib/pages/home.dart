import 'package:alerts/color/color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:alerts/Popups/confirmation_popup.dart';
import 'package:alerts/class/events.dart';
import 'package:alerts/class/alert_item.dart';
import 'package:flutter_animate/flutter_animate.dart';

// import 'package:flutter_native_splash/flutter_native_splash.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String label = "Today";
  // int value = 0;
  List<Event> filterEventsByLabel(String label, List<Event> events) {
    final now = DateTime.now();
    // debugPrint("here");
    switch (label) {
      case "Today":
        final todayEvents = events.where((event) {
          final eventDate = DateTime.parse(event.date);
          final isToday = eventDate.year == now.year &&
              eventDate.month == now.month &&
              eventDate.day == now.day;
          // debugPrint('Event Date: $eventDate, Is Today: $isToday');
          return isToday;
        }).toList();
        // debugPrint('Today Events: $todayEvents');
        return todayEvents;
      case "Upcoming":
        final upcomingEvents = events.where((event) {
          final eventDate = DateTime.parse(event.date);
          final isUpcoming = eventDate.isAfter(now);
          // debugPrint('Event Date: $eventDate, Is Upcoming: $isUpcoming');
          return isUpcoming;
        }).toList();
        // debugPrint('Upcoming Events: $upcomingEvents');
        return upcomingEvents;
      case "Missed":
        final missedEvents = events.where((event) {
          final eventDate = DateTime.parse(event.date);
          final isMissed = eventDate.isBefore(now);
          // debugPrint('Event Date: $eventDate, Is Missed: $isMissed');
          return isMissed;
        }).toList();
        // debugPrint('Missed Events: $missedEvents');
        return missedEvents;
      case "Completed":
        final completedEvents = events.where((event) {
          return event.isComplete == true;
        }).toList();
        // debugPrint('Completed Events: $completedEvents');
        return completedEvents;
      default:
        return [];
    }
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
              Image.asset(
                'assets/images/appicon.png',
                width: 50,
                height: 50,
                alignment: Alignment.center,
              ),
              Text(
                "Alerts",
                style: TextStyle(
                    color: isDarkModeEnabled
                        ? darkModeColors["CCCCCC"]
                        : lightModeColors["252525"],
                    fontFamily: "JacquesFrancois",
                    fontSize: 40,
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
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Container(
                  width: 240,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: isDarkModeEnabled
                        ? darkModeColors["171717"]
                        : lightModeColors["CACACA"],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        label,
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 20,
                          color: isDarkModeEnabled
                              ? darkModeColors["CCCCCC"]
                              : lightModeColors["252525"],
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Theme(
                        data: ThemeData(
                          // Set the background color of the opened popup menu
                          popupMenuTheme: PopupMenuThemeData(
                            color: isDarkModeEnabled
                                ? darkModeColors["010101"]
                                : lightModeColors["F6F6F6"],
                            elevation: 20.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                color: isDarkModeEnabled
                                    ? Colors.white.withOpacity(0.5)
                                    : Colors.black.withOpacity(0.5),
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: PopupMenuButton<int>(
                            icon: Icon(
                              Icons.keyboard_arrow_down_sharp,
                              size: 50,
                              color: isDarkModeEnabled
                                  ? darkModeColors["CCCCCC"]
                                  : lightModeColors["252525"],
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 200,
                            ),
                            offset: const Offset(25, 25),
                            position: PopupMenuPosition.under,
                            onSelected: (int value) {
                              // Handle the selected value here
                              setState(() {
                                switch (value) {
                                  case 0:
                                    value = 0;
                                    label = "Today";
                                    break;
                                  case 1:
                                    value = 1;
                                    label = "Upcoming";
                                    break;
                                  case 2:
                                    value = 2;
                                    label = "Completed";
                                    break;
                                  case 3:
                                    value = 4;
                                    label = "Missed";
                                    break;
                                  default:
                                    value = 0;
                                    label = "Today";
                                    break;
                                }
                              });
                            },
                            itemBuilder: (BuildContext context) {
                              return <PopupMenuEntry<int>>[
                                PopupMenuItem<int>(
                                  value: 0,
                                  child: Text(
                                    "Today",
                                    style: TextStyle(
                                      color: isDarkModeEnabled
                                          ? darkModeColors["CCCCCC"]
                                          : lightModeColors["252525"],
                                    ),
                                  ),
                                ),
                                PopupMenuItem<int>(
                                  value: 1,
                                  child: Text(
                                    "Upcoming",
                                    style: TextStyle(
                                      color: isDarkModeEnabled
                                          ? darkModeColors["CCCCCC"]
                                          : lightModeColors["252525"],
                                    ),
                                  ),
                                ),
                                PopupMenuItem<int>(
                                  value: 2,
                                  child: Text(
                                    "Completed",
                                    style: TextStyle(
                                      color: isDarkModeEnabled
                                          ? darkModeColors["CCCCCC"]
                                          : lightModeColors["252525"],
                                    ),
                                  ),
                                ),
                                PopupMenuItem<int>(
                                  value: 3,
                                  child: Text(
                                    "Missed",
                                    style: TextStyle(
                                      color: isDarkModeEnabled
                                          ? darkModeColors["CCCCCC"]
                                          : lightModeColors["252525"],
                                    ),
                                  ),
                                ),
                              ];
                            },
                          ),
                        ).animate().move(
                              duration: 800.milliseconds,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(), // Pushes the following widget to the right
              IconButton(
                onPressed: () {
                  // debugPrint("settings button");
                  // context.go('/settings');
                  GoRouter.of(context).go('/settings');
                },
                icon: Icon(Icons.settings,
                    color: isDarkModeEnabled
                        ? darkModeColors["CCCCCC"]
                        : lightModeColors["252525"],
                    size: 40),
              ),
            ],
          ),
          // const Divider(thickness: 2,color: Colors.black12,),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 40.0, 0, 0),
            child: Row(
              children: [
                Text(
                  "Alerts",
                  style: TextStyle(
                      color: isDarkModeEnabled
                          ? darkModeColors["CCCCCC"]
                          : lightModeColors["252525"],
                      fontFamily: "Inter",
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filterEventsByLabel(label, eventsNew).length,
              itemBuilder: (context, index) {
                final filteredEvents = filterEventsByLabel(label, eventsNew);
                // debugPrint(filteredEvents.toString());
                final event = filteredEvents[index];

                return AlertItem(
                  title: event.title,
                  date: "${event.date} ${event.time}",
                  isComplete: event.isComplete,
                  onCheckboxChanged: (bool? newValue) {
                    setState(() {
                      // isChecked = newValue!;
                      if (newValue!) {
                        // Show the confirmation dialog when the checkbox is checked
                        showConfirmationDialog(context, () {
                          setState(() {
                            event.isComplete = true;
                          });
                        }, () {
                          setState(() {
                            event.isComplete = false;
                          });
                        });
                      } else {
                        event.isComplete = false;
                      }
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0, 10, 20.0),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: isDarkModeEnabled
              ? darkModeColors["333333"]
              : lightModeColors["DEF7FF"],
          onPressed: () {
            debugPrint("floating action button");
            context.go('/newalert');
          },
          child: Icon(
            Icons.add,
            size: 50,
            color: isDarkModeEnabled
                ? darkModeColors["CCCCCC"]
                : lightModeColors["000000"],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: const Color.fromRGBO(65, 115, 244, 1),
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: "Home",
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.calendar_month), label: "Calendar"),
      //   ],
      // ),
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
            Stack(
              children: [
                Container(
                  width: 84.5,
                  height: 65,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(42.25),
                      right: Radius.circular(42.25),
                    ),
                    color: lightModeColors[
                        "1A54E9"], // Set the color of the oval container
                  ),
                ),
                Positioned(
                  top: 0, // Adjust the top position as needed
                  left: 0,
                  right: 0,
                  bottom: 0, // Adjust the left position as needed
                  child: IconButton(
                    onPressed: () => {
                      context.go('/light'),
                    },
                    icon: Icon(
                      Icons.home,
                      size: 45,
                      color: lightModeColors["000000"],
                    ),
                  ),
                ),
              ],
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
    ).animate().slideX(begin: -1, duration: 600.milliseconds);
  }
}
