import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_dev/widgets/common_widgets.dart';
import 'package:link_dev/widgets/main_drawer.dart';

class WishListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        drawer: MainDrawer(3),
        appBar: CommonWidgets.mainAppBar(context, "Wish List".toUpperCase()),
        body: Center(
            child: Text("There are no item available to\n be displayed",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 23.sp, color: Colors.grey[700]))));
  }
}
