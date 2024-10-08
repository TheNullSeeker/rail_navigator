# `rail_navigator`

`rail_navigator` is a customizable Flutter package for implementing a side rail navigation menu. It offers flexible configuration options for colors, sizes, and behaviors, making it suitable for both beginner and intermediate developers looking to enhance their Flutter applications with a dynamic and visually appealing navigation rail.

![Rail navigator](https://github.com/user-attachments/assets/0caf81b8-5408-4cd1-ae78-f9164ef8c274)


## Features

- **Expandable and Collapsible Rail:** Customize the width and appearance of the rail in both expanded and collapsed states.
- **Customizable Colors:** Set colors for active and inactive icons, text, and rail backgrounds.
- **Adjustable Padding:** Add padding to the top and bottom of the rail items.
- **Toggle Button Configuration:** Customize the toggle button's icon, color, and position.
- **Item Tap Handling:** Attach `onTap` handlers to rail items for dynamic interactions.

## Installation

Add `rail_navigator` to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  rail_navigator: ^0.0.1 # Replace with the latest version
```

Then, run `flutter pub get` to install the package.

## Usage

### Basic Example

Here's a simple example of how to use the `RailNavigation` widget in your application:

```dart
import 'package:flutter/material.dart';
import 'package:rail_navigator/rail_navigation.dart';

void main() {
  runApp(BasicExample());
}

class BasicExample extends StatefulWidget {
  @override
  _BasicExampleState createState() => _BasicExampleState();
}

class _BasicExampleState extends State<BasicExample> {
  bool isExpanded = false;

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
            RailNavigation(
              isExpanded: isExpanded,
              onToggle: toggleRail,
              railItems: [
                RailItem(icon: Icons.dashboard, label: 'Dashboard'),
                RailItem(icon: Icons.settings, label: 'Settings'),
                RailItem(icon: Icons.info, label: 'About'),
              ],
            ),
            Expanded(
              child: Center(child: Text('Main Content Area')),
            ),
          ],
        ),
      ),
    );
  }
}
```
![rail navigator collapsed](https://github.com/user-attachments/assets/e1c8051d-42c1-4635-8aec-5d40b7d1b704)


![rail navigator expanded](https://github.com/user-attachments/assets/dca9db4a-83a6-4527-9ae1-a55e3cc7075f)

### Advanced Example

This example demonstrates how to customize various properties of the `RailNavigation` widget:

```dart
import 'package:flutter/material.dart';
import 'package:rail_navigator/rail_navigation.dart';

void main() {
  runApp(AdvancedExample());
}

class AdvancedExample extends StatefulWidget {
  @override
  _AdvancedExampleState createState() => _AdvancedExampleState();
}

class _AdvancedExampleState extends State<AdvancedExample> {
  bool isExpanded = false;

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
            RailNavigation(
              isExpanded: isExpanded,
              onToggle: toggleRail,
              expandedWidth: 250,
              collapsedWidth: 80,
              expandedRailColor: Colors.white,
              collapsedRailColor: Colors.grey[800],
              activeIconColor: Colors.blue,
              inactiveIconColor: Colors.grey,
              activeTextColor: Colors.black,
              inactiveTextColor: Colors.grey,
              activeItemColor: Colors.blueAccent,
              inactiveItemColor: Colors.grey,
              toggleButtonIcon: Icons.menu,
              toggleButtonPosition: Alignment.centerRight,
              toggleButtonColor: Colors.blue,
              topPadding: 20.0,
              bottomPadding: 10.0,
              railItems: [
                RailItem(
                  icon: Icons.dashboard,
                  label: 'Dashboard',
                  onTap: () {
                    print('Dashboard clicked');
                  },
                ),
                RailItem(
                  icon: Icons.settings,
                  label: 'Settings',
                  onTap: () {
                    print('Settings clicked');
                  },
                ),
                RailItem(
                  icon: Icons.info,
                  label: 'About',
                  onTap: () {
                    print('Settings clicked');
                  },
                ),
              ],
            ),
            Expanded(
              child: Center(child: Text('Main Content Area')),
            ),
          ],
        ),
      ),
    );
  }
}
```
![rail navigator collapsed](https://github.com/user-attachments/assets/b7f9f3f7-f9ff-4c29-94a3-cbaf427e5bd2)

![rail navigator expanded](https://github.com/user-attachments/assets/ab30e94e-ca18-4b7f-ae45-d47882df50bb)


## Configuration Options

### `RailNavigation` Properties

- **`isExpanded`**: `bool` - Determines if the rail is in expanded or collapsed state.
- **`onToggle`**: `Function` - Callback function triggered when the toggle button is pressed.
- **`collapsedRailColor`**: `Color?` - Background color of the rail when collapsed.
- **`expandedRailColor`**: `Color?` - Background color of the rail when expanded.
- **`expandedWidth`**: `double?` - Width of the rail when expanded.
- **`collapsedWidth`**: `double?` - Width of the rail when collapsed.
- **`activeIconColor`**: `Color?` - Color of the icon when the item is active.
- **`inactiveIconColor`**: `Color?` - Color of the icon when the item is inactive.
- **`activeTextColor`**: `Color?` - Color of the text when the item is active.
- **`inactiveTextColor`**: `Color?` - Color of the text when the item is inactive.
- **`activeItemColor`**: `Color?` - Color of the rail item when active.
- **`inactiveItemColor`**: `Color?` - Color of the rail item when inactive.
- **`toggleButtonIcon`**: `IconData?` - Icon used for the toggle button.
- **`toggleButtonPosition`**: `Alignment?` - Position of the toggle button.
- **`toggleButtonColor`**: `Color?` - Background color of the toggle button.
- **`topPadding`**: `double?` - Padding at the top of the rail items list.
- **`bottomPadding`**: `double?` - Padding at the bottom of the rail items list.
- **`railItems`**: `List<RailItem>` - List of items to display in the rail.

### `RailItem` Properties

- **`icon`**: `IconData` - Icon displayed for the rail item.
- **`label`**: `String` - Text label for the rail item.
- **`onTap`**: `VoidCallback?` - Function to execute when the rail item is tapped.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.
