import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_dev/utils/fixed_assets.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () async {
      Navigator.of(context).pushNamedAndRemoveUntil(
          "/articles_screen", (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: 1.sw,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(FixedAssets.logo, height: 200.h, width: 200.w),
                  SizedBox(height: 80.h),
                  Text("Welcome to\nNews Feeds App",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold)),
                  SizedBox(height: 30.h),
                  CircularProgressIndicator(color: Colors.grey),
                  SizedBox(height: 30.h)
                ])));
  }
}
