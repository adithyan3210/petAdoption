import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:petnymble/screens/history_screen.dart';
import 'package:petnymble/screens/home_page.dart';
import 'package:petnymble/screens/search_screen.dart';

class RootScreen extends StatefulWidget {
  static const routeName = "/RootScreen";
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late List<Widget> screens;
  int currentScreen = 0;
  late PageController controller;
  @override
  void initState() {
    super.initState();
    screens = const [
      HomePage(),
      SearchScreen(),
      AdoptedHistoryScreen(),
    ];
    controller = PageController(initialPage: currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedIndex: currentScreen,
        height: kBottomNavigationBarHeight,
        onDestinationSelected: (index) {
          setState(() {
            currentScreen = index;
          });
          controller.jumpToPage(currentScreen);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(IconlyLight.home),
            selectedIcon: Icon(IconlyBold.home),
            label: "Home",
          ),
          const NavigationDestination(
            icon: Icon(IconlyLight.search),
            selectedIcon: Icon(IconlyBold.search),
            label: "Search",
          ),
          NavigationDestination(
            icon: Badge(
                backgroundColor: Colors.blue, child: Icon(IconlyLight.bag_2)),
            selectedIcon: Icon(IconlyBold.bag_2),
            label: "History",
          ),
        ],
      ),
    );
  }
}
