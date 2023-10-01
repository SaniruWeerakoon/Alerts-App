import 'package:alerts/pages/load.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:alerts/color/color.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late List<CameraDescription> cameras;
  late CameraController controller;
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    _setupCameras();
  }

  Future<void> _setupCameras() async {
    try {
      // Initialize cameras.
      cameras = await availableCameras();
      final firstCamera = cameras.first;

      // Initialize camera controllers.
      controller = CameraController(firstCamera, ResolutionPreset.high);
      await controller
          .initialize()
          .then((value) async => await controller.setFlashMode(FlashMode.auto));
    } on CameraException catch (_) {
      // Handle camera initialization error.
      debugPrint('Error initializing camera');
    }
    if (!mounted) return;
    setState(() {
      _isReady = true;
    });
  }

  Future<void> _takePicture() async {
    try {
      if (!controller.value.isInitialized) {
        return;
      }

      XFile? imageFile = await controller.takePicture();

      // ignore: unnecessary_null_comparison
      if (imageFile != null) {
        String filePath = imageFile.path;
        debugPrint('Picture saved to: $filePath');
      //  Image.file(File(filePath));
      }
    } catch (e) {
      debugPrint('Error taking picture: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isReady) return const Loading();
    return Scaffold(
      backgroundColor: isDarkModeEnabled
          ? darkModeColors["010101"]
          : lightModeColors["F6F6F6"],
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => {
                  context.pop(),
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
            height: 30.0,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(20.0),
              // ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              child: CameraPreview(controller),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      // Return the color for the pressed state.
                      return Colors.red;
                    }
                    return isDarkModeEnabled
                        ? darkModeColors["333333"]
                        : lightModeColors["CACACA"];
                  },
                ),
              ),
              onPressed: _takePicture,
              child: Icon(
                Icons.camera_alt,
                size: 50,
                color: isDarkModeEnabled
                    ? darkModeColors["CCCCCC"]
                    : lightModeColors["252525"],
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 1000.milliseconds);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
