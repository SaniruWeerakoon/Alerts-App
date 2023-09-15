import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: const Color.fromRGBO(246, 246, 246, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Alerts",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "JacquesFrancois",
                        fontSize: 40,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const Divider(
                color: Color.fromRGBO(37, 37, 37, 1),
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Container(
                      width: 240,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            30), // Adjust the radius as needed
                        color: const Color.fromRGBO(
                            200, 200, 200, 1), // Background color
                      ),
                      child: const Center(
                        child: DropdownMenu(
                          trailingIcon: Icon(Icons.keyboard_arrow_down_sharp),
                          dropdownMenuEntries: [
                            DropdownMenuEntry(value: 0, label: "Today"),
                            DropdownMenuEntry(value: 1, label: "Upcoming"),
                            DropdownMenuEntry(value: 2, label: "Completed"),
                            DropdownMenuEntry(value: 3, label: "Missed"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(), // Pushes the following widget to the right
                  IconButton(
                    onPressed: () {
                      debugPrint("settings button");
                      // context.go('/settings');
                      GoRouter.of(context).go('/settings');
                    },
                    icon: const Icon(Icons.settings,
                        color: Color.fromRGBO(37, 37, 37, 1), size: 40),
                  ),
                ],
              ),
              // const Divider(thickness: 2,color: Colors.black12,),
              const Padding(
                padding: EdgeInsets.fromLTRB(6.0, 0, 0, 0),
                child: Row(
                  children: [
                    Text(
                      "Alerts",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "JacquesFrancois",
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 10.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: 300,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xffcacaca),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Read a book \n 15th Aug , 3.00 pm",
                              style: TextStyle(
                                // fontSize: Symbol(f),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Image.asset(
                      //   "assets/checkbox.png",
                      //   width: 34,
                      //   height: 34,
                      // ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 10.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: 300,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xffcacaca),
                            border: Border.all(
                              color: const Color.fromRGBO(255, 0, 0, 1),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Read a book \n 15th Aug , 3.00 pm",
                              style: TextStyle(
                                // fontSize: Symbol(f),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Image.asset(
                      //   "assets/checkbox.png",
                      //   width: 34,
                      //   height: 34,
                      // ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 20.0),
          child: FloatingActionButton(
            backgroundColor: const Color.fromRGBO(222, 247, 255, 1),
            onPressed: () {
              debugPrint("floating action button");
            },
            child: const Icon(
              Icons.add,
              size: 50,
              color: Colors.black,
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
          decoration: const BoxDecoration(
            color: Color.fromRGBO(65, 115, 244, 1),
            borderRadius: BorderRadius.only(
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
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(42.25), // Half of the width
                        right: Radius.circular(42.25), // Half of the width
                      ),
                      color: Color.fromRGBO(26, 84, 233,
                          1), // Set the color of the oval container
                    ),
                  ),
                  const Positioned(
                    top: 0, // Adjust the top position as needed
                    left: 0,
                    right: 0,
                    bottom: 0, // Adjust the left position as needed
                    child: Icon(
                      Icons.home,
                      size: 45,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.calendar_month,
                size: 45,
              ),
            ],
          ),
        ));
  }
}
