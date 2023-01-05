import 'package:flutter/material.dart';
import 'package:weather_app/screens/location_screen.dart';

import 'screens/loading_screen.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {

   MyApp({super.key});

   bool _loaded = false;
   ImageProvider  networkImageProvider = const NetworkImage('https://source.unsplash.com/random/?nature,day');
   ImageProvider  asset = const AssetImage('images/location_background.jpg');


  @override


  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xff131410),
      ),
      // home: LoadingScreen(),
       home: const LocationScreen(),
    );
  }
}
