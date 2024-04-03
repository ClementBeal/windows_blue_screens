import 'package:flutter/material.dart';

/// Simulate the BSOD of Windows 2000/ XP / Vista / 7
class Windows2000Screen extends StatelessWidget {
  const Windows2000Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 128, 1),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text(
              '*** STOP: c000021a {Fatal System Error}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'The initial session process or system process terminated unexpectedly with a status 0x00000000 (0xc00000001 0x00100448).',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'The system has been shut down',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
