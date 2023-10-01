import 'package:alerts/class/events.dart';
import 'package:alerts/color/color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:alerts/Popups/confirmation_popup.dart';
import 'package:alerts/class/alert_item.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

// DateTime _focusedDay = DateTime.now();
class _CalendarState extends State<Calendar> {
  DateTime _selectedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();

  List<Event> filterByDay(DateTime selectedDate, List<Event> events) {
    final normalizedSelectedDay = DateFormat("yyyy-MM-dd").format(selectedDate);
    return events
        .where((event) => event.date == normalizedSelectedDay)
        .toList();
  }
  // debugPrint

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
                  "Calendar",
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
            TableCalendar(
              calendarStyle: CalendarStyle(
                defaultTextStyle: TextStyle(
                  color: isDarkModeEnabled
                      ? darkModeColors["CCCCCC"]
                      : lightModeColors["252525"],
                ),
              ),
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(
                  () {
                    _calendarFormat = format;
                  },
                );
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 0, 10),
              child: Row(
                children: [
                  Text(
                    DateFormat("yyyy-MM-dd").format(_selectedDay),
                    style: TextStyle(
                      color: isDarkModeEnabled
                          ? darkModeColors["CCCCCC"]
                          : lightModeColors["252525"],
                      fontFamily: "Inter",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: filterByDay(_selectedDay, eventsNew).length,
              itemBuilder: (context, index) {
                final filteredEvents = filterByDay(_selectedDay, eventsNew);
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
                size: 45,
                color: lightModeColors["000000"],
              ),
            ),
            Stack(
              children: [
                Container(
                  width: 84.5,
                  height: 65,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(42.25), // Half of the width
                      right: Radius.circular(42.25), // Half of the width
                    ),
                    color: lightModeColors["1A54E9"],
                  ),
                ),
                Positioned(
                  top: 0, // Adjust the top position as needed
                  left: 0,
                  right: 0,
                  bottom: 0, // Adjust the left position as needed
                  child: IconButton(
                    onPressed: () => {
                      context.go('/calendar'),
                    },
                    icon: Icon(
                      Icons.calendar_month,
                      color: lightModeColors["000000"],
                      size: 45,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ).animate().slideX(begin: 1, duration: 600.milliseconds);
  }
}
