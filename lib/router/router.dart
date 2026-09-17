import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_match_booking/presentation/screens/welcome_screen.dart';

GoRouter router = GoRouter(
  initialLocation: NamedRoutes.welcome.routeName,
  routes: [
    GoRoute(path: NamedRoutes.welcome.routeName, builder: (ctx, state) => const WelcomeScreen()),
    GoRoute(
      path: NamedRoutes.home.routeName,
      builder: (ctx, state) => const Scaffold(body: Center(child: Text('Home'))),
    ),
  ],
);

enum NamedRoutes {
  welcome('/welcome'),
  home('/home');

  final String routeName;
  const NamedRoutes(this.routeName);
}
