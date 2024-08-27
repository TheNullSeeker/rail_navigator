import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rail_navigator/rail_navigator.dart'; // Update the path based on your project structure

void main() {
  // 1. Basic Render Test
  testWidgets('RailNavigator renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: RailNavigator(
          isExpanded: false,
          onToggle: () {},
          railItems: [
            RailItem(icon: Icons.dashboard, label: 'Dashboard'),
          ],
        ),
      ),
    ));

    expect(find.byType(RailNavigator), findsOneWidget);
    expect(find.byIcon(Icons.dashboard), findsOneWidget);
  });

  // 2. Toggle Functionality Test
  testWidgets('RailNavigator toggle button works', (WidgetTester tester) async {
    bool isExpanded = false;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: RailNavigator(
          isExpanded: isExpanded,
          onToggle: () {
            isExpanded = !isExpanded;
          },
          railItems: [
            RailItem(icon: Icons.dashboard, label: 'Dashboard'),
          ],
        ),
      ),
    ));

    // Verify initial state
    expect(isExpanded, false);

    // Tap the toggle button
    await tester.tap(find.byType(IconButton));
    await tester.pump();

    // Verify that the state has changed
    expect(isExpanded, true);
  });

  // 3. Custom Colors Test
  testWidgets('RailNavigator applies custom colors',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: RailNavigator(
          isExpanded: true,
          onToggle: () {},
          expandedRailColor: Colors.red,
          activeIconColor: Colors.blue,
          activeTextColor: Colors.green,
          railItems: [
            RailItem(icon: Icons.dashboard, label: 'Dashboard'),
          ],
        ),
      ),
    ));

    // Verify custom colors
    final railContainer = tester.widget<Container>(find.byType(Container));
    expect(railContainer.color, Colors.red);

    final icon = tester.widget<Icon>(find.byIcon(Icons.dashboard));
    expect(icon.color, Colors.blue);

    final text = tester.widget<Text>(find.text('Dashboard'));
    expect(text.style?.color, Colors.green);
  });

  // 4. Rail Item Tap Test
  testWidgets('Rail item onTap is triggered', (WidgetTester tester) async {
    bool itemTapped = false;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: RailNavigator(
          isExpanded: true,
          onToggle: () {},
          railItems: [
            RailItem(
              icon: Icons.dashboard,
              label: 'Dashboard',
              onTap: () {
                itemTapped = true;
              },
            ),
          ],
        ),
      ),
    ));

    // Tap the rail item
    await tester.tap(find.byType(ListTile));
    await tester.pump();

    // Verify that the item was tapped
    expect(itemTapped, true);
  });
}
