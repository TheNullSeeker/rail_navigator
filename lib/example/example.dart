// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../rail_navigator.dart';

void main() {
  runApp(const AdvancedExample());
}

class AdvancedExample extends StatefulWidget {
  const AdvancedExample({super.key});

  @override
  _AdvancedExampleState createState() => _AdvancedExampleState();
}

class _AdvancedExampleState extends State<AdvancedExample> {
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
            // RailNavigator with all customizations applied
            RailNavigator(
              isExpanded: isExpanded,
              onToggle: toggleRail,
              expandedWidth: 250, // Set custom expanded width
              collapsedWidth: 60, // Set custom collapsed width
              expandedRailColor: Colors.white, // Set custom expanded rail color
              collapsedRailColor:
                  Colors.grey[800], // Set custom collapsed rail color
              activeIconColor: Colors.blue, // Set custom active icon color
              inactiveIconColor: Colors.grey, // Set custom inactive icon color
              activeTextColor: Colors.black, // Set custom active text color
              inactiveTextColor: Colors.grey, // Set custom inactive text color
              activeItemColor:
                  Colors.blueAccent, // Set custom active item color
              inactiveItemColor: Colors.grey, // Set custom inactive item color
              toggleButtonIcon:
                  Icons.arrow_right, // Set custom toggle button icon
              //  toggleButtonPosition:
              //    , // Set custom toggle button position
              toggleButtonColor: Colors.blue, // Set custom toggle button color
              topPadding: 20.0, // Set custom top padding
              bottomPadding: 10.0, // Set custom bottom padding
              railItems: [
                RailItem(
                  icon: Icons.dashboard,
                  label: 'Dashboard',
                  onTap: () {
                    if (kDebugMode) {
                      print('Dashboard clicked');
                    }
                  },
                ),
                RailItem(
                  icon: Icons.settings,
                  label: 'Settings',
                  onTap: () {
                    if (kDebugMode) {
                      print('Settings clicked');
                    }
                  },
                ),
                RailItem(
                  icon: Icons.info,
                  label: 'About',
                  onTap: () {
                    if (kDebugMode) {
                      print('About clicked');
                    }
                  },
                ),
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
