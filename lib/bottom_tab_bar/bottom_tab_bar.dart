import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:happy_trip/Pages/myprofile.dart';
import 'package:happy_trip/Pages/profile_page.dart';
import 'package:happy_trip/Pages/search_history_page.dart';
import '../Pages/explore_page.dart';
import '../Pages/home_page.dart';
import '../Pages/support_page.dart';
import 'customtabbar/src/bar.dart';
import 'customtabbar/src/item.dart';
import 'data.dart';
import 'model/choice_value.dart';

class BottomTabBar extends StatefulWidget {
  @override
  BottomTabBarState createState() {
    return BottomTabBarState();
  }
}

class BottomTabBarState extends State<BottomTabBar> with SingleTickerProviderStateMixin {
  static const kStyles = [
    ChoiceValue<TabStyle>(
      title: 'TabStyle.fixedCircle',
      label: 'Appbar use fixedCircle style',
      value: TabStyle.fixedCircle,
    ),
  ];

  static final kTabTypes = [
    ChoiceValue<List<TabItem>>(
      title: 'Icon Tab',
      label: 'Appbar use icon with Tab',
      value: Data.items(image: false),
    ),
    ChoiceValue<List<TabItem>>(
      title: 'Image Tab',
      label: 'Appbar use image with Tab',
      value: Data.items(image: true),
    ),
  ];
  var _tabItems = kTabTypes.first;

  ChoiceValue<TabStyle> _style = kStyles.first;
  ChoiceValue<Curve> _curve = Data.curves.first;
  Gradient _gradient = Data.gradients.first;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabItems.value.length, vsync: this);
  }

  final List<Widget> screens = [
    HomePage(),
    ProfilePage(),
    HomePage(),
    SearchHistoryPage(),
    SupportPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var wid = MediaQuery.of(context).size.height == 812.0 ||
        (MediaQuery.of(context).size.height >= 812.0 && MediaQuery.of(context).size.height <= 896.0) && Platform.isIOS;

    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: screens.toList(growable: false)),
        bottomNavigationBar: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            ConvexAppBar(
              items: _tabItems.value,
              style: _style.value,
              curve: _curve.value,
              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
              gradient: _gradient,
              controller: _tabController,
              curveSize: wid ? 84.0 : 78.0,
              activeColor: Color(0xff8612EA),
              initialActiveIndex: 0,
              top: -38.0,
              elevation: 0.4,
              height: 68,
              onTap: (int i) => debugPrint('select index=$i'),
            ),
            Positioned(
              bottom: wid ? 30 : 22,
              child: Image.asset(
                'assets/images/Ellipse_18.png',
                fit: BoxFit.cover,
                width: 68,
                height: 34,
              ),
            )
          ],
        ),
      ),
    );
  }
}
