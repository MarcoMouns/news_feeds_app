import 'dart:developer';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:link_dev/provider/articles_provider.dart';
import 'package:link_dev/view/error_loading_screen.dart';
import 'package:link_dev/widgets/articles/article_card.dart';
import 'package:link_dev/widgets/common_widgets.dart';
import 'package:link_dev/widgets/main_drawer.dart';
import 'package:provider/provider.dart';

class ArticlesScreen extends StatefulWidget {
  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> with AfterLayoutMixin {
  ArticlesProvider articlesProvider;

  @override
  Widget build(BuildContext context) {
    articlesProvider = Provider.of<ArticlesProvider>(context, listen: true);
    return Scaffold(
        backgroundColor: Colors.grey[300],
        drawer: MainDrawer(0),
        appBar: CommonWidgets.mainAppBar(context, "Articles".toUpperCase()),
        body: articlesProvider.listOfArticleModel == null &&
                !articlesProvider.hasErrorWhenLoadData &&
                articlesProvider.isInternetConnectedWhenLoadData
            ? CommonWidgets.loadingWidget()
            : articlesProvider.hasErrorWhenLoadData ||
                    !articlesProvider.isInternetConnectedWhenLoadData
                ? ErrorLoadingScreen(() {
                    getData();
                  })
                : RefreshIndicator(
                    onRefresh: () async {
                      await getData(syncData: true);
                      return;
                    },
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: EdgeInsets.only(
                                  top: index == 0 ? 5 : 0,
                                  bottom: index ==
                                          (articlesProvider
                                                  .listOfArticleModel.length -
                                              1)
                                      ? 40
                                      : 0),
                              child: ArticleCard(
                                  articlesProvider.listOfArticleModel[index]));
                        },
                        itemCount: articlesProvider.listOfArticleModel.length),
                  ));
  }

  @override
  void afterFirstLayout(BuildContext context) {
    getData();
  }

  getData({bool syncData = false}) async {
    await Provider.of<ArticlesProvider>(context, listen: false)
        .getArticlesList1(syncData: syncData)
        .then((data) {
      Provider.of<ArticlesProvider>(context, listen: false)
          .getArticlesList2(syncData: syncData);
    }).catchError((error) {
      log("error $error");
      if (error.toString() == "no_internet_connection") {
        CommonWidgets.showNoNetworkMsg(context);
      }
    });
  }
}
