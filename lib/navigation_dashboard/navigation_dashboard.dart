// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2x_assesment/shopping/shopping_view.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class NavigationDashboard extends StatelessWidget {
  NavigationDashboard({Key? key}) : super(key: key);
  PersistentTabController controller = PersistentTabController(initialIndex: 3);

  List<Widget> _buildViews() {
    return [
      Container(),
      Container(),
      Container(),
      ShoppingView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(FontAwesomeIcons.home),
          title: ("Home"),
          iconSize: 20,
          activeColorPrimary: Colors.teal,
          inactiveColorPrimary: Colors.grey),
      PersistentBottomNavBarItem(
          icon: const Icon(FontAwesomeIcons.user),
          title: ("User"),
          iconSize: 20,
          activeColorPrimary: Colors.teal,
          inactiveColorPrimary: Colors.grey),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.notifications_active),
          title: ("Notifications"),
          iconSize: 25,
          activeColorPrimary: Colors.teal,
          inactiveColorPrimary: Colors.grey),
      PersistentBottomNavBarItem(
          icon: const Icon(FontAwesomeIcons.shoppingCart),
          title: ("Market"),
          iconSize: 20,
          activeColorPrimary: Colors.teal,
          inactiveColorPrimary: Colors.grey),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      backgroundColor: Colors.white,
      screens: _buildViews(),
      items: _navBarsItems(),
      confineInSafeArea: true,
    );
  }
}
