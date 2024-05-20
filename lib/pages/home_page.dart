import 'package:flutter/material.dart';
import 'package:practice1/pages/shop_page.dart';
import '../components/bottom_nav_bar.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = const [
    ShopPage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              onPressed: () {
                // Handle upload action
              },
              icon: Icon(
                Icons.cloud_upload,
                color: Colors.grey[900],
              ),
            ),
          ),
        ],
      ),
      drawer: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Drawer(
          backgroundColor: Colors.grey[900],
          child: Column(
            children: [
              DrawerHeader(
                child: Image.asset(
                  'lib/images/logo.png',
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Divider(
                  color: Colors.grey[800],
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text(
                  'HOME',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  // Handle HOME navigation
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.info,
                  color: Colors.white,
                ),
                title: Text(
                  'ABOUT',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  // Handle ABOUT navigation
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  'LOGOUT',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  // Handle LOGOUT
                },
              ),
            ],
          ),
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
