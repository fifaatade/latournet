import 'dart:async';

import 'package:fintrackai/onboarding/onboarding.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
      Timer(Duration(seconds: 2), () async {
     /*  final SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? isFirstTime = await prefs.getBool("isFirstTime");
      bool? isFirstLogin = await prefs.getBool("isFirstLogin");
      bool? isFirstLoginC = await prefs.getBool("isFirstLoginC");
      bool? isFirstLoginB = await prefs.getBool("isFirstLoginB"); */

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) =>Onboarding(),
        ),
        (route) => false,
      );

    });
        super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/logo.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

