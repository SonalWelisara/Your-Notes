import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:your_notes/config/global/app_settings.dart';
import 'package:your_notes/features/pages/create_first_note.dart';
import 'package:your_notes/features/pages/create_note.dart';
import 'package:your_notes/features/pages/home.dart';

class GoRouterProvider {
  GoRouter getRouter() {
    return GoRouter(
        navigatorKey: AppSettings.rootNavigatorKey,
        initialLocation: '/createFirstNote',
        routes: [
          GoRoute(
              path: '/createFirstNote',
              builder: (BuildContext context, GoRouterState state) =>
                  const CreateFirstNote()),
          GoRoute(
              path: '/createNote',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return CustomTransitionPage(
                  child: const CreateNote(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, 1.0);
                    const end = Offset.zero;
                    const curve = Curves.ease;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                );
              }),
          GoRoute(
              path: '/home',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return CustomTransitionPage(
                  child: const Home(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, 1.0);
                    const end = Offset.zero;
                    const curve = Curves.ease;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                );
              })
        ]);
  }
}
