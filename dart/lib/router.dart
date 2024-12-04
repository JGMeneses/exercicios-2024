import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/calendar.dart';
import 'screens/activity.dart';


final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Calendar(),
    ),
    // Add more routes as needed for navigation
    GoRoute(
      path: '/activity',
      builder: (context, state) => const Activity(),
    ),
  ],
);
