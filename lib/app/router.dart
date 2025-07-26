import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:yolda/views/app_view.dart';
import 'package:yolda/views/home_view.dart';
import 'package:yolda/views/discover_view.dart';
import 'package:yolda/views/note_view.dart';
import 'package:yolda/views/search_view.dart';

final _routerKey = GlobalKey<NavigatorState>();

class AppRoutes {
  AppRoutes._();

  static const String home = '/';
  static const String discover = '/discover';
  static const String search = '/search';
  static const String note = '/note';
}

final router = GoRouter(
  navigatorKey: _routerKey,
  initialLocation: AppRoutes.home,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          AppView(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.home,
              builder: (context, state) => const HomeView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.discover,
              builder: (context, state) => const DiscoverView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.search,
              builder: (context, state) => const SearchView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.note,
              builder: (context, state) => const NoteView(),
            ),
          ],
        ),
      ],
    ),
  ],
);
