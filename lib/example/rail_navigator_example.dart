// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../rail_navigator.dart';

void main() {
  runApp(const BasicExample());
}

class BasicExample extends StatefulWidget {
  const BasicExample({super.key});

  @override
  _BasicExampleState createState() => _BasicExampleState();
}

class _BasicExampleState extends State<BasicExample> {
  bool isExpanded = false;

  // Toggles the expanded/collapsed state of the RailNavigator
  void toggleRail() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            // Basic RailNavigator with default settings
            RailNavigator(
              isExpanded: isExpanded,
              onToggle: toggleRail,
              railItems: [
                RailItem(icon: Icons.dashboard, label: 'Dashboard'),
                RailItem(icon: Icons.settings, label: 'Settings'),
                RailItem(icon: Icons.info, label: 'About'),
              ],
            ),
            const Expanded(
              child: Center(child: Text('Main Content Area')),
            ),
          ],
        ),
      ),
    );
  }
}
