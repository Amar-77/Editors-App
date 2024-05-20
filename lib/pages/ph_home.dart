import 'package:flutter/material.dart';
import 'package:practice1/pages/shop_page.dart';

import '../components/bottom_nav_bar.dart';
import 'cart_page.dart';


class PHome extends StatefulWidget {
  const PHome({super.key});

  @override
  State<PHome> createState() => _PHomeState();
}

class _PHomeState extends State<PHome> {

  int _selectedIndex = 0;

  void navigateBottomBar(int index)
  {
    setState(() {

      _selectedIndex = index;
    });
  }

final List<Widget> _pages = [
  const ShopPage(), const CartPage(),
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
          leading: Builder(builder: (context) => IconButton(
            icon:const Icon(Icons.menu,color: Colors.black,),
            onPressed: (){
              Scaffold.of(context).openDrawer();
            },
          ),),
      ),
      drawer: Drawer
        (
          backgroundColor: Colors.grey[900],
          child: Column(children: [
            DrawerHeader(child: Image.asset('lib/images/logo.png',color: Colors.white,)
              ,),
           Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
           child: Divider(
             color: Colors.grey[800],
           ),
           ),
            const Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(leading: Icon(
                  Icons.home,
              color: Colors.white,
              ),
                title: Text(
                    'veed',
                style: TextStyle(color: Colors.white),
                ),
            ),
            ),
            const Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(leading: Icon(
                Icons.info,
                color: Colors.white,
              ),
                title: Text(
                  'ABOUT',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(leading: Icon(
                Icons.logout,
                color: Colors.white,
              ),
                title: Text(
                  'LOGOUT',
                  style: TextStyle(color: Colors.white,),
                ),
              ),
            )



           ],
          ),
        ),
      body: _pages[_selectedIndex],

    );
  }
}
