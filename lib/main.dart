import 'package:flutter/material.dart';
import 'common/custom_cupertino_page_route.dart';
import 'common/happy_trip_router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Happy Trip',
      onGenerateRoute: (RouteSettings settings) {
        return CustomCupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return Routes.baseRoutes[settings.name](context);
          },
        );
      },
    );
  }
}
