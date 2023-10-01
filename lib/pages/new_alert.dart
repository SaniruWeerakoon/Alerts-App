import 'package:flutter/material.dart';
import 'package:alerts/color/color.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:alerts/class/events.dart';
import 'package:alerts/Popups/discard_popup.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';

class NewAlert extends StatefulWidget {
  const NewAlert({super.key});

  @override
  State<NewAlert> createState() => NewAlertState();
}

class NewAlertState extends State<NewAlert> {
  TextEditingController descController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  TimeOfDay? selectedTime;
  DateTime? selectedDate;
  PhoneContact? _phoneContact;
  String? selectedContactName;
  String? selectedContactNum;

  void validateAndSave(
    TextEditingController titleController,
    TextEditingController descController,
    DateTime? selectedDate,
    TimeOfDay? selectedTime,
  ) {
    final String title = titleController.text.trim();
    final String description = descController.text.trim();

    // Check if title, selectedDate, and selectedTime are not empty
    if (title.isNotEmpty && selectedDate != null && selectedTime != null) {
      final String date = DateFormat("yyyy-MM-dd").format(selectedDate);
      final String time = '${selectedTime.hour}:${selectedTime.minute}';
//save the event
      Event newEvent = Event(
        title: title,
        description: description,
        date: date,
        time: time,
        isComplete: false,
      );
      debugPrint(newEvent.toString());
      eventsNew.add(newEvent);
      context.go('/');
    } else {
      // popup saying error
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
            title: const Text("Error"),
            content: const Text("You cannot leave empty fields."),
            actions: <Widget>[
              TextButton(
                child: Text(
                  "OK",
                  style: TextStyle(
                    color: isDarkModeEnabled
                        ? darkModeColors["CCCCCC"]
                        : lightModeColors["252525"],
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
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
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => {
                    showDiscardDialog(
                      context,
                      () {
                        context.go('/');
                      },
                    ),
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: isDarkModeEnabled
                        ? darkModeColors["CCCCCC"]
                        : lightModeColors["252525"],
                    size: 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40.0, 0, 0, 0),
                  child: Text(
                    "New Alerts",
                    style: TextStyle(
                        color: isDarkModeEnabled
                            ? darkModeColors["CCCCCC"]
                            : lightModeColors["252525"],
                        fontFamily: "Inter",
                        fontSize: 36,
                        fontWeight: FontWeight.w700),
                  ),
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
              height: 50.0,
            ),
            Container(
              width: 330,
              height: 70,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: isDarkModeEnabled
                    ? darkModeColors["171717"]
                    : lightModeColors["CACACA"],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: 'Title',
                        hintStyle: TextStyle(
                          color: isDarkModeEnabled
                              ? darkModeColors["CCCCCC"]
                              : lightModeColors["252525"],
                          fontSize: 20,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(10.0),
                      ),
                      cursorColor: isDarkModeEnabled
                          ? darkModeColors["CCCCCC"]
                          : lightModeColors["252525"],
                      style: TextStyle(
                        color: isDarkModeEnabled
                            ? darkModeColors["CCCCCC"]
                            : lightModeColors["252525"],
                        fontSize: 20,
                      ),
                      maxLines: 1,
                      // maxLength: 30,
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
                    child: TextField(
                      controller: descController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: isDarkModeEnabled
                              ? darkModeColors["CCCCCC"]
                              : lightModeColors["252525"],
                          fontSize: 20,
                        ),
                        hintText: 'Description',
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(10.0),
                      ),
                      cursorColor: isDarkModeEnabled
                          ? darkModeColors["CCCCCC"]
                          : lightModeColors["252525"],
                      style: TextStyle(
                        color: isDarkModeEnabled
                            ? darkModeColors["CCCCCC"]
                            : lightModeColors["252525"],
                        fontSize: 20,
                      ),
                      maxLines: 3,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.camera_alt),
                        onPressed: () {
                          debugPrint('Camera');
                          context.push('/camera');
                        },
                        iconSize: 40,
                        color: isDarkModeEnabled
                            ? darkModeColors["CCCCCC"]
                            : lightModeColors["252525"],
                      ),
                      IconButton(
                        icon: const Icon(Icons.call),
                        onPressed: () async {
                          debugPrint('Call');
                          bool permission =
                              await FlutterContactPicker.requestPermission();
                          if (permission) {
                            if (await FlutterContactPicker.hasPermission()) {
                              _phoneContact =
                                  await FlutterContactPicker.pickPhoneContact();
                              if (_phoneContact != null) {
                                if (_phoneContact!
                                        .phoneNumber!.number!.isNotEmpty &&
                                    _phoneContact!.fullName!.isNotEmpty) {
                                  debugPrint(
                                      _phoneContact!.phoneNumber.toString());
                                  setState(() {
                                    selectedContactName =
                                        _phoneContact!.fullName!.toString();
                                    selectedContactNum =
                                        _phoneContact!.phoneNumber!.number.toString();
                                    
                                    descController.text =
                                        "${selectedContactName!}\n${selectedContactNum!}";
                                  });
                                } else {
                                  debugPrint("No number");
                                }
                              }
                            }
                          }
                        },
                        iconSize: 40,
                        color: isDarkModeEnabled
                            ? darkModeColors["CCCCCC"]
                            : lightModeColors["252525"],
                      ),
                    ],
                  )
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
                      selectedDate != null
                          ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                          : ' Add Date',
                      style: TextStyle(
                        color: isDarkModeEnabled
                            ? darkModeColors["CCCCCC"]
                            : lightModeColors["252525"],
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: IconButton(
                      onPressed: () async {
                        final DateTime? date = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030),
                          initialDate: DateTime.now(),
                        );
                        if (date != null) {
                          setState(() {
                            selectedDate = date;
                          });
                        }
                        debugPrint(selectedDate.toString());
                      },
                      icon: Icon(
                        Icons.add,
                        size: 50,
                        color: isDarkModeEnabled
                            ? darkModeColors["CCCCCC"]
                            : lightModeColors["252525"],
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
                      selectedTime?.format(context) ?? 'Add Time',
                      style: TextStyle(
                        fontSize: 20,
                        color: isDarkModeEnabled
                            ? darkModeColors["CCCCCC"]
                            : lightModeColors["252525"],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: IconButton(
                      onPressed: () async {
                        final TimeOfDay? timeOfDay = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          initialEntryMode: TimePickerEntryMode.dial,
                        );
                        if (timeOfDay != null) {
                          setState(() {
                            selectedTime = timeOfDay;
                          });
                        }
                        debugPrint(selectedTime.toString());
                        // debugPrint(getFormattedTime(selectedTime));
                      },
                      icon: Icon(
                        Icons.add,
                        size: 50,
                        color: isDarkModeEnabled
                            ? darkModeColors["CCCCCC"]
                            : lightModeColors["252525"],
                      ),
                    ),
                  ),
                ],
              ),
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
            TextButton(
              onPressed: () {
                // discrad popup
                showDiscardDialog(context, () {
                  context.go('/');
                });
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: lightModeColors["252525"],
                  fontFamily: "Inter",
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // Handle save button press
                validateAndSave(titleController, descController, selectedDate,
                    selectedTime);
              },
              child: Text(
                "Save",
                style: TextStyle(
                  color: lightModeColors["252525"],
                  fontFamily: "Inter",
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 800.milliseconds);
  }
}
