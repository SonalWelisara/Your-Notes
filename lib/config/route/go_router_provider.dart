import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_notes/config/global/app_settings.dart';
import 'package:your_notes/features/pages/create_first_note.dart';
import 'package:your_notes/features/pages/create_note.dart';
import 'package:your_notes/features/pages/home.dart';
import 'package:your_notes/features/pages/read_note.dart';

class GoRouterProvider {
  GoRouter getRouter() {
    return GoRouter(
        navigatorKey: AppSettings.rootNavigatorKey,
        initialLocation: '/createFirstNote',
        routes: [
          GoRoute(
              path: '/createFirstNote',
              redirect: (context, state) async {
                var sharedPreferences = await SharedPreferences.getInstance();
                if (sharedPreferences.getBool('keyFirstTime') ?? true) {
                  return '/createFirstNote';
                } else {
                  return '/home';
                }
              },
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
              }),
          GoRoute(
              path: '/readNote',
              pageBuilder: (BuildContext context, GoRouterState state) {
                final int index = state.extra as int;
                return CustomTransitionPage(
                  child: ReadNote(index: index,),
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
