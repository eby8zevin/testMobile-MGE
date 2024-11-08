import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:test_mge_ahmadabuhasan/app/modules/content/content.controller.dart';
import 'package:test_mge_ahmadabuhasan/app/modules/content/data.page.dart';
import 'package:test_mge_ahmadabuhasan/app/modules/content/profile.page.dart';
import 'package:test_mge_ahmadabuhasan/core/theme/colors.dart';

import '../../../routes/pages.dart';

class ContentPage extends GetView<ContentController> {
  ContentPage({super.key});

  final _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreen() {
    return [
      const DataPage(),
      const ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.menu),
          activeColorPrimary: Colors.blue,
          inactiveIcon: const Icon(Icons.menu, color: Colors.grey),
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              "/data": (final context) => const DataPage(),
            },
          ),
      ),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          inactiveIcon: const Icon(Icons.person, color: Colors.grey)
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.content,
        title: const Text(
          'Welcome, Ahmad Abu Hasan',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.storage.logout();
              Get.offAllNamed(Routes.login);
            }, 
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: PersistentTabView(
          context, 
          controller: _controller,
          screens: _buildScreen(),
          items: _navBarItems(),
        )
      ),
    );
  }
}