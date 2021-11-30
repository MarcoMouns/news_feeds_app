import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_dev/widgets/common_widgets.dart';
import 'package:link_dev/widgets/main_drawer.dart';

class OnlineNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        drawer: MainDrawer(4),
        appBar: CommonWidgets.mainAppBar(
            context, "Explore Online News".toUpperCase()),
        body: Center(
            child: Text("Sorry, service is not available",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 23.sp, color: Colors.grey[700]))));
  }
}
