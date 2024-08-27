// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class RailNavigator extends StatefulWidget {
  final bool isExpanded;
  final Function onToggle;
  final Color? collapsedRailColor;
  final Color? expandedRailColor;
  final double? expandedWidth;
  final double? collapsedWidth;
  final Color? activeIconColor;
  final Color? inactiveIconColor;
  final Color? activeTextColor;
  final Color? inactiveTextColor;
  final Color? activeItemColor;
  final Color? inactiveItemColor;
  final IconData? toggleButtonIcon;
  final Alignment? toggleButtonPosition;
  final Color? toggleButtonColor;
  final double? topPadding;
  final double? bottomPadding;
  final List<RailItem> railItems;

  const RailNavigator({
    super.key,
    required this.isExpanded,
    required this.onToggle,
    this.collapsedRailColor,
    this.expandedRailColor,
    this.expandedWidth,
    this.collapsedWidth,
    this.activeIconColor,
    this.inactiveIconColor,
    this.activeTextColor,
    this.inactiveTextColor,
    this.activeItemColor,
    this.inactiveItemColor,
    this.toggleButtonIcon,
    this.toggleButtonPosition,
    this.toggleButtonColor,
    this.topPadding,
    this.bottomPadding,
    required this.railItems,
  });

  @override
  _RailNavigatorState createState() => _RailNavigatorState();
}

class _RailNavigatorState extends State<RailNavigator> {
  int activeIndex = 0; // Track the active item

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.isExpanded
          ? widget.expandedWidth ?? 200
          : widget.collapsedWidth ?? 60,
      color: widget.isExpanded
          ? widget.expandedRailColor ?? Colors.white
          : widget.collapsedRailColor ?? Colors.grey[800],
      child: Stack(
        children: [
          ListView.builder(
            padding: EdgeInsets.only(
              top: widget.topPadding ?? 0.0,
              bottom: widget.bottomPadding ?? 0.0,
            ),
            itemCount: widget.railItems.length,
            itemBuilder: (context, index) {
              return _buildRailItem(widget.railItems[index], index);
            },
          ),
          Positioned(
            top: widget.toggleButtonPosition?.y ??
                MediaQuery.of(context).size.height / 2 - 30,
            right: widget.toggleButtonPosition?.x ?? 0,
            child: CircleAvatar(
              backgroundColor: widget.toggleButtonColor ??
                  (widget.isExpanded ? Colors.green : Colors.red),
              child: IconButton(
                icon: Icon(widget.toggleButtonIcon ??
                    (widget.isExpanded
                        ? Icons.arrow_back
                        : Icons.arrow_forward)),
                color: Colors.white,
                onPressed: () {
                  widget.onToggle();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRailItem(RailItem item, int index) {
    bool isActive = index == activeIndex; // Determine if the item is active
    return ListTile(
      leading: Icon(
        item.icon,
        color: isActive
            ? widget.activeIconColor ?? widget.activeItemColor ?? Colors.blue
            : widget.inactiveIconColor ??
                widget.inactiveItemColor ??
                Colors.grey,
      ),
      title: widget.isExpanded
          ? Text(
              item.label,
              style: TextStyle(
                color: isActive
                    ? widget.activeTextColor ??
                        widget.activeItemColor ??
                        Colors.black
                    : widget.inactiveTextColor ??
                        widget.inactiveItemColor ??
                        Colors.grey,
              ),
            )
          : null,
      onTap: () {
        setState(() {
          activeIndex = index; // Update active item on tap
        });
        if (item.onTap != null) {
          item.onTap!(); // Execute the onTap function
        }
      },
    );
  }
}

class RailItem {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  RailItem({
    required this.icon,
    required this.label,
    this.onTap,
  });
}
