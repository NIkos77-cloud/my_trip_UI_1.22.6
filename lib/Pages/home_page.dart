import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_trip/common/screenutil.dart';

import 'flight_search_page/flight_search_page.dart';
import 'hotel_search_page/hotel_search_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size _size;
  List<Tab> myTabs = <Tab>[
    Tab(text: "Flight Search"),
    Tab(text: "Hotel Search"),
  ];

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(ScreenUtil.getResponsiveHeightOfWidget(110, _size.width)),
            child: AppBar(
              flexibleSpace: SafeArea(
                child: ListTile(
                  contentPadding: EdgeInsets.only(
                    top: ScreenUtil.getResponsiveHeightOfWidget(0, _size.width),
                    left: ScreenUtil.getResponsiveWidthOfWidget(10, _size.width),
                  ),
                  leading: Padding(
                    padding: EdgeInsets.only(left: ScreenUtil.getResponsiveWidthOfWidget(8, _size.width)),
                    child: Image.asset(
                      'assets/images/app_icon.png',
                      width: ScreenUtil.getResponsiveWidthOfWidget(160, _size.width),
                      height: ScreenUtil.getResponsiveHeightOfWidget(50, _size.width),
                    ),
                  ),
                  trailing: Container(
                    padding: EdgeInsets.only(right: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width)),
                    child: Image.asset("assets/images/nav_bar_list.png"),
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              bottom: TabBar(
                indicatorWeight: 3.0,
                labelStyle: TextStyle(
                  fontFamily: "GoogleSans",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                tabs: myTabs,
                labelColor: Color(0xFF5808D8),
                indicatorColor: Color(0xFF5808D8),
                unselectedLabelColor: Color(0xFF42436A),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              FlightSearchPage(),
              HotelSearchPage(),
            ],
          ),
        ),
      ),
    );
  }
}
