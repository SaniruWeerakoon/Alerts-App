import 'dart:ui_web';

import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
       const  Image(
          image: AssetImage('assets/images/background.jpg'),
        ),
        Positioned(
          width: 360,
          height: 800,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Text("Hello World"),
                  Icon(
                    Icons.access_alarms_outlined,
                    color: Color.fromARGB(199, 192, 9, 9),
                    size: 60,
                  ),
                  Icon(
                    Icons.airplanemode_active,
                    color: Color.fromARGB(198, 30, 18, 99),
                    size: 60,
                  ),
                  Icon(
                    Icons.coffee_outlined,
                    color: Color.fromARGB(255, 0, 0, 0),
                    size: 60,
                  ),
                ],
              ),
             const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Text("Hello World"),
                  Icon(
                    Icons.airplanemode_active,
                    color: Color.fromARGB(198, 30, 18, 99),
                    size: 60,
                  ),
                  Icon(
                    Icons.access_alarms_outlined,
                    color: Color.fromARGB(199, 192, 9, 9),
                    size: 60,
                  ),

                  Icon(
                    Icons.coffee_outlined,
                    color: Color.fromARGB(255, 0, 0, 0),
                    size: 60,
                  ),
                ],
              ),
             const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.coffee_outlined,
                    color: Color.fromARGB(255, 0, 0, 0),
                    size: 60,
                  ), // Text("Hello World"),

                  Icon(
                    Icons.airplanemode_active,
                    color: Color.fromARGB(198, 30, 18, 99),
                    size: 60,
                  ),
                  Icon(
                    Icons.access_alarms_outlined,
                    color: Color.fromARGB(199, 192, 9, 9),
                    size: 60,
                  ),
                ],
              ),
              Row(
                children: [
                 const SizedBox(
                    width: 300,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      debugPrint("nice press");
                    },
                    backgroundColor: Colors.blueAccent,
                    mouseCursor: SystemMouseCursors.precise,
                    child: 
                    const Center(child:   Icon(Icons.add,color: Colors.black,size: 60,)),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
