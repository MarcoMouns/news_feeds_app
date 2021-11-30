import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_dev/utils/fixed_assets.dart';
import 'package:link_dev/widgets/common_widgets.dart';

class MainDrawer extends StatelessWidget {
  final int selectedScreenIndex;

  MainDrawer(this.selectedScreenIndex);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
            color: Colors.grey[300],
            child: ListView(children: [
              header(),
              SizedBox(height: 50.h),
              drawerItem(selectedScreenIndex == 0 ? true : false,
                  FixedAssets.exploreIcon, "Articles", () {
                Navigator.of(context).pushReplacementNamed("/articles_screen");
              }),
              drawerItem(selectedScreenIndex == 1 ? true : false,
                  FixedAssets.liveChatIcon, "Live Chat", () {
                Navigator.of(context).pushReplacementNamed("/live_chat_screen");
              }),
              drawerItem(selectedScreenIndex == 2 ? true : false,
                  FixedAssets.galleryIcon, "Gallery", () {
                Navigator.of(context).pushReplacementNamed("/gallery_screen");
              }),
              drawerItem(selectedScreenIndex == 3 ? true : false,
                  FixedAssets.wishListIcon, "Wish List", () {
                Navigator.of(context).pushReplacementNamed("/wish_list_screen");
              }),
              drawerItem(selectedScreenIndex == 4 ? true : false,
                  FixedAssets.onlineNewsIcon, "Explore Online News", () {
                Navigator.of(context)
                    .pushReplacementNamed("/online_news_screen");
              })
            ])));
  }

  Widget header() {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            SizedBox(width: 40.w),
            Image.asset(FixedAssets.profileIcon, height: 65, width: 65),
            SizedBox(width: 20),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome",
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text("Tony Roshdy", style: TextStyle(fontSize: 16)),
                ])
          ]),
          Row(children: [
            Image.asset(FixedAssets.arrowIcon, height: 65, width: 20),
            SizedBox(width: 20)
          ])
        ]));
  }

  Widget drawerItem(bool isSelected, icon, title, onPress) {
    return CommonWidgets.inkwellTransparentWidget(
        onTap: () {
          if (!isSelected) {
            onPress();
          }
        },
        child: Padding(
          padding: EdgeInsets.only(bottom: 50.h),
          child: Stack(
            children: [
              if (isSelected) Image.asset(FixedAssets.selectedMenu, height: 30),
              Row(children: [
                SizedBox(width: 40.w),
                Image.asset(icon, height: 30, width: 30),
                SizedBox(width: 20.w),
                Text(title,
                    style: TextStyle(
                        fontSize: 17.sp,
                        color: isSelected ? Colors.grey : Colors.black))
              ]),
            ],
          ),
        ));
  }
}
