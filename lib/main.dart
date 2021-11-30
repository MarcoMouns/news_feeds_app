import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'provider/articles_provider.dart';
import 'utils/routes.dart';
import 'view/intro/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => ArticlesProvider())],
        child: ScreenUtilInit(
            builder: () {
              return MaterialApp(
                  title: 'News Feeds',debugShowCheckedModeBanner: false,
                  theme: ThemeData(primarySwatch: Colors.blue),
                  builder: (context, child) => MediaQuery(
                      data:
                          MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      child: child),
                  home: SplashScreen(),
                  routes: Routes.getAllRoutes());
            },
            designSize: Size(414, 896)));
  }
}
