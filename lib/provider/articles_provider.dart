import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:link_dev/model/articles_response_model.dart';
import 'package:link_dev/services/articles/articles_service.dart';

class ArticlesProvider with ChangeNotifier {
  ArticlesService articlesService = ArticlesService();
  List<ArticleModel> listOfArticleModel;
  List<ArticleModel> listOfArticleModel2;
  bool isInternetConnectedWhenLoadData = true;
  bool hasErrorWhenLoadData = false;

  Future getArticlesList1({bool syncData = false}) async {
    if (listOfArticleModel == null || syncData) {
      changeIsInternetConnectedWhenLoadDataValue(true);
      changeHasErrorWhenLoadDataValue(false);
      return await articlesService.getArticlesList1().then((responseData) {
        if (responseData != null &&
            responseData.statusCode != null &&
            responseData.statusCode == 200) {
          ArticlesResponseModel articlesResponseModel =
              ArticlesResponseModel.fromMap(responseData.data);
          if (articlesResponseModel.status.toLowerCase() == "ok") {
            if (listOfArticleModel == null) {
              listOfArticleModel = [];
            }
            if (syncData) {
              listOfArticleModel.clear();
            }
            listOfArticleModel.addAll(articlesResponseModel.articles);
            notifyListeners();
            return;
          } else {
            setSomethingWentWrongWhenLoadData();
            return;
          }
        } else {
          setSomethingWentWrongWhenLoadData();
          return;
        }
      }).catchError((error) {
        log("error list 1 $error");
        if (error.toString() == "no_internet_connection") {
          changeIsInternetConnectedWhenLoadDataValue(false);
          changeHasErrorWhenLoadDataValue(false);
          throw "no_internet_connection";
        } else if (error.toString() == "something_went_wrong") {
          setSomethingWentWrongWhenLoadData();
          throw "something_went_wrong";
        } else {
          setSomethingWentWrongWhenLoadData();
          throw "something_went_wrong";
        }
      });
    }
  }

  Future getArticlesList2({bool syncData = false}) async {
    if (listOfArticleModel2 == null || syncData) {
      changeIsInternetConnectedWhenLoadDataValue(true);
      changeHasErrorWhenLoadDataValue(false);
      return await articlesService.getArticlesList2().then((responseData) {
        if (responseData != null &&
            responseData.statusCode != null &&
            responseData.statusCode == 200) {
          ArticlesResponseModel articlesResponseModel =
              ArticlesResponseModel.fromMap(responseData.data);
          if (articlesResponseModel.status.toLowerCase() == "ok") {
            if (listOfArticleModel2 == null) {
              listOfArticleModel2 = [];
            }
            listOfArticleModel.addAll(articlesResponseModel.articles);
            notifyListeners();
            return;
          } else {
            setSomethingWentWrongWhenLoadData();
            return;
          }
        } else {
          setSomethingWentWrongWhenLoadData();
          return;
        }
      }).catchError((error) {
        if (error.toString() == "no_internet_connection") {
          if (listOfArticleModel == null) {
            changeIsInternetConnectedWhenLoadDataValue(false);
            changeHasErrorWhenLoadDataValue(false);
          }
        } else if (error.toString() == "something_went_wrong") {
          setSomethingWentWrongWhenLoadData();
        }
        return;
      });
    }
  }

  setSomethingWentWrongWhenLoadData() {
    if (listOfArticleModel == null) {
      log("setSomethingWentWrongWhenLoadData");
      changeIsInternetConnectedWhenLoadDataValue(true);
      changeHasErrorWhenLoadDataValue(true);
    } else {
      log("!setSomethingWentWrongWhenLoadData");
    }
  }

  changeHasErrorWhenLoadDataValue(bool hasErrorWhenLoadDataValue) {
    hasErrorWhenLoadData = hasErrorWhenLoadDataValue;
    notifyListeners();
  }

  changeIsInternetConnectedWhenLoadDataValue(
      bool isInternetConnectedWhenLoadDataValue) {
    isInternetConnectedWhenLoadData = isInternetConnectedWhenLoadDataValue;
    notifyListeners();
  }
}
