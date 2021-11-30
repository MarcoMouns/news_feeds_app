import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_dev/utils/fixed_assets.dart';

class CommonWidgets {
  static showNoNetworkMsg(context, {topMargin}) {
    Flushbar(
        margin: EdgeInsets.only(top: topMargin ?? 64.h),
        userInputForm: Form(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(children: [
                      Icon(Icons.wifi, size: 35),
                      SizedBox(width: 8),
                      Expanded(
                          child: Text(
                              "Oops! The internet connection is down!!. Please try again.",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15.sp)))
                    ])))),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.white,
        flushbarPosition: FlushbarPosition.TOP,
        boxShadows: [
          BoxShadow(
              offset: Offset(0.0, -1.0),
              blurRadius: 1.0,
              color: Colors.black.withOpacity(0.4)),
          BoxShadow(
              offset: Offset(0.0, 1.0),
              blurRadius: 1.0,
              color: Colors.black.withOpacity(0.4))
        ],
        leftBarIndicatorColor: Colors.white)
      ..show(context);
  }

  static loadingWidget() {
    return Center(
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey)));
  }

  static mainAppBar(context, title) {
    return AppBar(
        backgroundColor: Colors.black,
        title: Text("$title".toUpperCase()),
        actions: [
          IconButton(
              icon: Image.asset(FixedAssets.searchIcon,
                  height: 20.h, width: 20.h),
              onPressed: () {})
        ]);
  }

  static imagePlaceHolder() {
    return Image.asset(FixedAssets.imagePlaceHolder,
        height: 200.h, fit: BoxFit.cover, width: double.maxFinite);
  }

  static Widget inkwellTransparentWidget(
      {@required Function onTap, @required Widget child}) {
    return InkWell(
        onTap: () => onTap(),
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        child: child);
  }

  static Widget atomButton(Function onTap, text,
      {width = double.maxFinite,
      height,
      color = Colors.grey,
      textColor,
      fontSize,
      key,
      radiusCircular = 8,
      borderColor}) {
    return InkWell(
        key: key,
        onTap: () => onTap(),
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        child: Container(
            decoration: BoxDecoration(
                border:
                    borderColor == null ? null : Border.all(color: borderColor),
                borderRadius: BorderRadius.all(
                    Radius.circular(double.parse(radiusCircular.toString()))),
                color: color),
            height: height == null ? 64.h : height.toDouble(),
            width: width.toDouble(),
            child: Container(
                child: SizedBox(
                    height: height == null ? 64.h : height.toDouble(),
                    width: width,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(text,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: textColor,
                                      fontSize: fontSize == null
                                          ? 17.sp
                                          : fontSize.toDouble()))
                            ]))))));
  }
}
