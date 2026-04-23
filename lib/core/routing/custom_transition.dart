import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum PageTransitionType { fade, slideRight }

class RouterTransitionHelper {
  static CustomTransitionPage<T> build<T>({
    required GoRouterState state,
    required Widget child,
    PageTransitionType type = PageTransitionType.slideRight,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (type) {
          case PageTransitionType.fade:
            return FadeTransition(opacity: animation, child: child);

          case PageTransitionType.slideRight:
            return SlideTransition(
              position: animation.drive(
                Tween(begin: const Offset(1, 0), end: Offset.zero),
              ),
              child: child,
            );
        }
      },
    );
  }
}
