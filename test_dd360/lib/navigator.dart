import 'dart:io' show File, Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_dd360/features/home/presentation/pages/home_pages.dart';
import 'package:test_dd360/features/home/presentation/widget/character_info.dart';
import 'package:test_dd360/features/starting/presentation/pages/starting.dart';

// ignore_for_file: constant_identifier_names
enum Routes {
  HOME,
  CHARACTER,
}

class _Paths {
  static const String init = '/';
  static const String home = '/home';
  static const String character = '/character';

  static const Map<Routes, String> _pathMap = {
    Routes.HOME: _Paths.home,
    Routes.CHARACTER: _Paths.character,
  };

  static String? of(Routes route) => _pathMap[route];
}

String? _currentRoute;

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static String? getCurrentRoute() {
    return _currentRoute;
  }

  static String? getNameByRoute(Routes route) {
    return _Paths.of(route);
  }

  static Route onGenerateRoute(RouteSettings settings) {
    Route pageRoute({Widget page = const Starting()}) {
      return Platform.isIOS
          ? CupertinoPageRoute(builder: (context) => page)
          : MaterialPageRoute(builder: (context) => page);
    }

    _currentRoute = settings.name;

    switch (settings.name) {
      case _Paths.init:
        return pageRoute(page: const HomePages());
      case _Paths.home:
        return pageRoute(page: const HomePages());
      case _Paths.character:
        return pageRoute(page: const CharacterInfo());
      default:
        return pageRoute(page: const Starting());
    }
  }

  static Future push<T>(Routes route, [T? arguments]) =>
      state.pushNamed(_Paths.of(route)!, arguments: arguments);

  static Future pushNamedAndRemoveUntil<T>(Routes route, [T? arguments]) =>
      state.pushNamedAndRemoveUntil(
        _Paths.of(route)!,
        (Route routes) => false,
        arguments: arguments,
      );

  static Future replaceWith<T>(Routes route, [T? arguments]) =>
      state.pushReplacementNamed(_Paths.of(route)!, arguments: arguments);

  static void pop() => state.pop();

  static void popWithResult<T>(T res) => state.pop(res);

  static NavigatorState get state => navigatorKey.currentState!;
}
