import 'package:flutter/material.dart';
import 'package:practice1/pages/ae.dart';
import 'package:practice1/pages/dav.dart';
import 'package:practice1/pages/light.dart';
import 'package:practice1/pages/ph_home.dart';
import 'package:practice1/pages/ph_shope.dart';
import 'package:practice1/pages/pr.dart';
import 'package:practice1/pages/ps.dart';
import 'package:provider/provider.dart';

import 'models/cart.dart';
import 'pages/intro_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(

      create: (context) => Cart(),
      builder: (context,child) => MaterialApp(
        routes: {
          '/ps': (context) => const PhShop(),
          '/light' : (context) => const Light(),
          '/after' : (context) => const After(),
          '/premiere' : (context) => const Premeire(),
          '/Dav' : (context) => const Davinci(),
        },
        debugShowCheckedModeBanner: false,
      home: IntroPage(),),
    );

  }
}
