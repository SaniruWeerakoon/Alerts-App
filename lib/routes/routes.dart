import 'package:alerts/pages/alert_info.dart';
import 'package:alerts/pages/camera.dart';
import 'package:alerts/pages/home.dart';
import 'package:alerts/pages/load.dart';
import 'package:alerts/pages/new_alert.dart';
import 'package:alerts/pages/settings.dart';
import 'package:alerts/pages/Calendar.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const Settings(),
    ),
    GoRoute(
      path: '/calendar',
      builder: (context, state) => const Calendar(),
    ),
    GoRoute(
      path: '/newalert',
      builder: (context, state) => const NewAlert(),
    ),
    GoRoute(
      path: '/camera',
      builder: (context, state) => const CameraPage(),
    ),
    GoRoute(
      path: '/alertInfo/:title',
      name: 'alertInfo',
      builder: (context, GoRouterState state) {
        return AlertInfo(
          title: state.pathParameters["title"]!,
        );
      },
    ),
    GoRoute(
      path: '/load',
      builder: (context, state) => const Loading(),
    ),
  ],
);
