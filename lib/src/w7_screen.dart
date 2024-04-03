import 'package:flutter/material.dart';

/// Simulate the BSOD of Windows 8
class Windows8Screen extends StatelessWidget {
  const Windows8Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 114, 169),
      body: Padding(
        padding: const EdgeInsets.all(64.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                ":(",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 150,
                ),
              ),
              Text(
                "Your ${_getDeviceString(Theme.of(context))} run into a problem that it couldn't handle, and now it needs to restart.",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              const Text(
                "You can search the error online: HAL_INITIALIZATION_FAILED",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String _getDeviceString(ThemeData theme) {
  return switch (theme.platform) {
    TargetPlatform.android ||
    TargetPlatform.iOS ||
    TargetPlatform.fuchsia =>
      'phone',
    TargetPlatform.windows ||
    TargetPlatform.macOS ||
    TargetPlatform.linux =>
      'computer'
  };
}
