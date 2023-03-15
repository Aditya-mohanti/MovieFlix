import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movieappdemo/sign%20Page/signpage.dart';
class Splashscreen extends StatefulWidget {
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder:(context)=>SignInPage(),
          ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Image.asset('Assets/images/logo.png'),
        alignment: Alignment.center,
      )
    );
  }
}
