import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:link_dev/model/articles_response_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../common_widgets.dart';

class ArticlesDetailsScreen extends StatelessWidget {
  final ArticleModel articleModel;

  ArticlesDetailsScreen(this.articleModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar:
            CommonWidgets.mainAppBar(context, "Articles details".toUpperCase()),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: ListView(children: [
              Card(
                  child: Column(children: [
                SizedBox(
                  height: 200.h,
                  child: Stack(children: [
                    CachedNetworkImage(
                        imageUrl: articleModel.urlToImage,
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                        height: 200.h,
                        errorWidget: (context, imageUrl, error) {
                          return CommonWidgets.imagePlaceHolder();
                        },
                        placeholder: (context, imageUrl) {
                          return CommonWidgets.imagePlaceHolder();
                        }),
                    Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                          color: Colors.grey[500],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "${DateFormat("MMM dd, yyyy").format(articleModel.publishedAt)}",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.white)),
                          ),
                        ))
                  ]),
                ),
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(children: [
                      Row(children: [
                        Expanded(
                            child: Text("${articleModel.title}",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)))
                      ]),
                      SizedBox(height: 5),
                      Row(children: [
                        Expanded(
                            child: Text("By ${articleModel.author}",
                                style: TextStyle(
                                    fontSize: 14.sp, color: Colors.grey)))
                      ]),
                      SizedBox(height: 15),
                      Row(children: [
                        Expanded(
                            child: Text("${articleModel.description}",
                                style: TextStyle(
                                    fontSize: 14.sp, color: Colors.grey)))
                      ]),
                      SizedBox(height: 20)
                    ]))
              ])),
              SizedBox(height: 15.h),
              CommonWidgets.atomButton(() async {
                String url = articleModel.url;
                if (await canLaunch(url))
                  await launch(url);
                else {
                  throw "Could not launch $url";
                }
              }, "Open website".toUpperCase(),
                  color: Colors.black,
                  textColor: Colors.white,
                  radiusCircular: 3)
            ])));
  }
}
