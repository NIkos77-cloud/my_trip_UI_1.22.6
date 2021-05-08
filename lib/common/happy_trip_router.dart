import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_trip/Pages/login_page/login_page.dart';
import 'package:happy_trip/Pages/loyalty_program_page/loyalty_program_page.dart';
import 'package:happy_trip/bottom_tab_bar/bottom_tab_bar.dart';

class RouteName {
  // base ones
  static const String root = '/';

  // Common ones
  static const String loginPage = 'login_page';
  static const String loyaltyProgramPage = 'loyalty_program_page';
}

class Routes {
  static final baseRoutes = <String, WidgetBuilder>{
    RouteName.root: (BuildContext context) => BottomTabBar(),
  };

  static final commonRoutes = <String, WidgetBuilder>{
    RouteName.loginPage: (BuildContext context) => LoginPage(),
    RouteName.loyaltyProgramPage: (BuildContext context) => LoyaltyProgramPage(),
  };
}
