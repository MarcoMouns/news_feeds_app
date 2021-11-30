import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:link_dev/model/articles_response_model.dart';
import 'package:link_dev/widgets/articles/articles_details_screen.dart';
import 'package:link_dev/widgets/common_widgets.dart';

class ArticleCard extends StatelessWidget {
  final ArticleModel articleModel;

  ArticleCard(this.articleModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: CommonWidgets.inkwellTransparentWidget(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ArticlesDetailsScreen(articleModel)));
          },
          child: Card(
              child: Column(children: [
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
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.grey)))
                ]),
                SizedBox(height: 5),
                Row(children: [
                  Expanded(
                      child: Text(
                          "${DateFormat("MMM dd, yyyy").format(articleModel.publishedAt)}",
                          textAlign: TextAlign.end,
                          style:
                              TextStyle(fontSize: 12.sp, color: Colors.grey)))
                ]),
              ]),
            ),
          ]))),
    );
  }
}
