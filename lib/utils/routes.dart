import 'package:flutter/material.dart';
import 'package:link_dev/view/articles_screen.dart';
import 'package:link_dev/view/gallery_screen.dart';
import 'package:link_dev/view/live_chat_screen.dart';
import 'package:link_dev/view/online_news_screen.dart';
import 'package:link_dev/view/wish_list_screen.dart';

class Routes {
  static final Map<String, WidgetBuilder> _routes = {
    "/articles_screen": (context) => ArticlesScreen(),
    "/gallery_screen": (context) => GalleryScreen(),
    "/live_chat_screen": (context) => LiveChatScreen(),
    "/online_news_screen": (context) => OnlineNewsScreen(),
    "/wish_list_screen": (context) => WishListScreen()
  };
  static Map<String, WidgetBuilder> getAllRoutes() => _routes;
}
