import 'package:flutter/material.dart';
import 'package:zed_stores/pages/account_management.dart';
import 'package:zed_stores/pages/home.dart';
import 'package:zed_stores/pages/notifications_page.dart';
import 'package:zed_stores/pages/product_details_page.dart';
import 'package:zed_stores/pages/search_page.dart';
import 'package:zed_stores/pages/selling_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        AppHomePage(
          title: widget.title,
        ),
        const AccountManagementPage(),
        const SearchPage(),
        const NotificationsPage(),
        const SellingPage(),
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        // backgroundColor: Theme.of(context).colorScheme.primary,
        animationDuration: const Duration(microseconds: 500),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          NavigationDestination(
            icon: Icon(Icons.sell),
            label: 'Selling',
          ),
        ],
      ),
    );
  }
}
