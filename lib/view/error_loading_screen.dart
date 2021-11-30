import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_dev/utils/fixed_assets.dart';
import 'package:link_dev/widgets/common_widgets.dart';

class ErrorLoadingScreen extends StatelessWidget {
  final VoidCallback refreshError;

  ErrorLoadingScreen(this.refreshError);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 1.sw,
        child: Column(children: [
          SizedBox(height: 142.h),
          Image.asset(FixedAssets.noInternetIcon, width: 104.w, height: 104.h),
          SizedBox(height: 32.h),
          Text("Something went wrong\nloading this page",
              style: TextStyle(height: 1.4, fontSize: 15.sp),
              textAlign: TextAlign.center),
          SizedBox(height: 32.h),
          CommonWidgets.atomButton(() {
            try {
              refreshError();
            } catch (e) {}
          }, "Refresh",
              width: 188.w,
              height: 56.h,
              textColor: Colors.black,
              color: Colors.white,
              borderColor: Colors.black)
        ]));
  }
}
