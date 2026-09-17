import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_match_booking/constants/string_const.dart';
import 'package:tennis_match_booking/presentation/screens/availability_screen.dart';
import 'package:tennis_match_booking/presentation/screens/home_screen.dart';
import 'package:tennis_match_booking/presentation/screens/main_shell_screen.dart';
import 'package:tennis_match_booking/presentation/screens/placeholder_screen.dart';
import 'package:tennis_match_booking/presentation/screens/welcome_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: NamedRoutes.welcome.routeName,
  routes: [
    GoRoute(path: NamedRoutes.welcome.routeName, builder: (ctx, state) => const WelcomeScreen()),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => MainShellScreen(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: NamedRoutes.home.routeName,
              builder: (ctx, state) => const HomeScreen(),
              routes: [
                GoRoute(
                  path: 'availability',
                  pageBuilder: (ctx, state) => CustomTransitionPage(
                    key: state.pageKey,
                    child: const AvailabilityScreen(),
                    transitionDuration: const Duration(milliseconds: 350),
                    reverseTransitionDuration: const Duration(milliseconds: 350),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
                      position: Tween(begin: const Offset(1, 0), end: Offset.zero).animate(
                        CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
                      ),
                      child: child,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: NamedRoutes.calendar.routeName,
              builder: (ctx, state) => const PlaceholderScreen(title: StringConst.calendar),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: NamedRoutes.tournaments.routeName,
              builder: (ctx, state) => const PlaceholderScreen(title: StringConst.tournaments),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: NamedRoutes.profile.routeName,
              builder: (ctx, state) => const PlaceholderScreen(title: StringConst.profile),
            ),
          ],
        ),
      ],
    ),
  ],
);

enum NamedRoutes {
  welcome('/welcome'),
  home('/home'),
  availability('/home/availability'),
  calendar('/calendar'),
  tournaments('/tournaments'),
  profile('/profile');

  final String routeName;
  const NamedRoutes(this.routeName);
}
