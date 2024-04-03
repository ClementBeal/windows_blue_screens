library windows_blue_screens;

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:windows_blue_screens/src/w2000_screen.dart';
import 'package:windows_blue_screens/src/w7_screen.dart';

/**
 *  Main 
 */
class WindowsBlueScreen extends StatefulWidget {
  const WindowsBlueScreen({
    super.key,
    required this.child,
    this.randomMode = true,
    this.mustCrashBeforeSeconds = 600,
  });

  // Your Material app
  final Widget child;

  // true if the BSoF appears randomly else false
  final bool randomMode;

  // define the limit in seconds before the BSoF
  final int mustCrashBeforeSeconds;

  static WindowsBlueScreenState of(BuildContext context) {
    final WindowsBlueScreenState? result =
        context.findAncestorStateOfType<WindowsBlueScreenState>();
    if (result != null) {
      return result;
    }

    throw Exception(
        "WindowsBlueScreen.of() called with a context that does not contain a WindowsBlueScreen.");
  }

  @override
  State<WindowsBlueScreen> createState() => WindowsBlueScreenState();
}

class WindowsBlueScreenState extends State<WindowsBlueScreen> {
  bool _isActivated = false;

  late Widget _blueScreen;
  Timer? _timer;

  void triggerBlueScreen() {
    setState(() {
      _isActivated = true;
    });
  }

  @override
  void initState() {
    super.initState();

    _blueScreen = switch (Random().nextInt(2)) {
      0 => const Windows2000Screen(),
      _ => const Windows8Screen(),
    };

    if (widget.randomMode) {
      _timer = Timer(
          Duration(seconds: Random().nextInt(widget.mustCrashBeforeSeconds)),
          () {
        setState(() {
          _isActivated = true;
        });
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isActivated) {
      return MaterialApp(
        home: _blueScreen,
        debugShowCheckedModeBanner: false,
      );
    }

    return widget.child;
  }
}
