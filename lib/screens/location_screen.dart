import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  LocationScreenState createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  bool _loaded = false;
  ImageProvider  networkImageProvider = const NetworkImage('https://source.unsplash.com/random/?nature,day');
  ImageProvider  asset = const AssetImage('images/location_background.jpg');

  @override
  void initState() {
    networkImageProvider
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo imageInfo, bool syncCall) {
      setState(() {
        _loaded = true;
        print('done');
      });
    }));
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: _loaded == true
                    ? networkImageProvider
                    : asset,

                 //image: AssetImage('images/location_background.jpg'),
                // image: const NetworkImage(
                //     'https://source.unsplash.com/random/?nature,day'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(

                    Colors.white.withOpacity(0.8), BlendMode.dstATop),
              ),
            ),
            constraints: const BoxConstraints.expand(),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.white.withOpacity(0.0),
                    Colors.white.withOpacity(0.0)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  // color: Colors.white.withOpacity(0.0),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.near_me,
                        size: 50.0,
                        color: kSecondaryColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                      },
                      child: const Icon(
                        Icons.location_city,
                        size: 50.0,
                        color: kSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Icon(
                      FontAwesomeIcons.cloudSun,
                      size: 120,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        const Text(
                          '32',
                          style: kTempTextStyle,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 10),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 7,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                                  // shape: BoxShape.circle,
                                  ),
                            ),
                            const Text(
                              'now',
                              style: TextStyle(
                                fontSize: 30.0,
                                fontFamily: 'Spartan MB',
                                letterSpacing: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 24.0),
                child: Text(
                  "It's 🥶 in gaza! Dress 🧤🧣",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    padding: const EdgeInsets.all(34),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: const Text('welcome'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
