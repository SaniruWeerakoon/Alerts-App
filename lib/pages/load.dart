import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            const Image(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
              width: double.infinity, // Make the image match the screen width
            ),
            Positioned(
              top: 136,
              left: 0,
              width: MediaQuery.of(context).size.width, // Match the screen width
              height: 700,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/appicon.png'),
                  ),
                  Text(
                    'Alerts',
                    style: TextStyle(
                      fontSize: 50,
                      fontFamily: 'JacquesFrancois',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  SpinKitCubeGrid(
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
