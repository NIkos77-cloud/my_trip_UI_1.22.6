import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:happy_trip/common/screenutil.dart';
import 'package:shimmer/shimmer.dart';

class FlightSearchListPage extends StatefulWidget {
  @override
  _FlightSearchListPageState createState() => _FlightSearchListPageState();
}

class _FlightSearchListPageState extends State<FlightSearchListPage> {
  Size _size;
  int flag = 0;
  List<dynamic> dummyUrls = [
    'https://images.pexels.com/photos/258154/pexels-photo-258154.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
    'https://images.pexels.com/photos/271639/pexels-photo-271639.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    'https://images.pexels.com/photos/164595/pexels-photo-164595.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    'https://images.pexels.com/photos/573552/pexels-photo-573552.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    'https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    'https://static2.tripoto.com/media/filter/nl/img/67758/TripDocument/1520839937_img_0915.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffF1F4FB),
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: ListTile(
            contentPadding: EdgeInsets.only(
              top: ScreenUtil.getResponsiveHeightOfWidget(0, _size.width),
              left: ScreenUtil.getResponsiveWidthOfWidget(10, _size.width),
            ),
            leading: Padding(
              padding: EdgeInsets.only(left: ScreenUtil.getResponsiveWidthOfWidget(8, _size.width), top: 5),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/images/back_button.png',
                ),
              ),
            ),
            trailing: Container(
              padding: EdgeInsets.only(right: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width)),
              child: GestureDetector(onTap: () {}, child: Image.asset("assets/images/nav_bar_list.png")),
            ),
          ),
        ),
        title: Text(
          'Search',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xff42436A),
            fontFamily: "GoogleSans",
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffFFFFFF),
        elevation: 0.0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              overflow: Overflow.visible,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      color: Color(0xffFFFFFF),
                      child: Center(
                        child: Text(
                          'Flight Search',
                          style: TextStyle(
                            color: Color(0xff42436A),
                            fontFamily: "GoogleSans",
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xffFFFFFF), Color(0xffF1F4FB)],
                          tileMode: TileMode.clamp,
                          stops: [0.5, 0.5],
                          end: Alignment.bottomCenter,
                          begin: Alignment.topCenter,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffBCC5D9).withOpacity(0.34),
                                blurRadius: 10,
                                offset: Offset(0, 0),
                                spreadRadius: 2,
                              )
                            ],
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 60,
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              height: 42.0,
                              width: MediaQuery.of(context).size.width - 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      if (flag == 1) {
                                        flag = 0;
                                        setState(() {});
                                      }
                                    },
                                    child: Container(
                                      height: 42.0,
                                      decoration: BoxDecoration(
                                          color: flag == 0 ? Color(0xff5707D6) : Color(0xffFFFFFF),
                                          borderRadius: BorderRadius.circular(8.0)),
                                      width: MediaQuery.of(context).size.width / 2 - 30,
                                      child: InkWell(
                                        onTap: () {
                                          if (flag == 1) {
                                            flag = 0;
                                            setState(() {});
                                          }
                                        },
                                        child: Center(
                                          child: Text(
                                            'Filter',
                                            style: TextStyle(
                                                color: flag == 0 ? Color(0xffFFFFFF) : Color(0xff42436A),
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "GoogleSans"),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (flag == 0) {
                                        flag = 1;
                                        setState(() {});
                                      }
                                    },
                                    child: Container(
                                      height: 42.0,
                                      decoration: BoxDecoration(
                                          color: flag == 1 ? Color(0xff5707D6) : Color(0xffFFFFFF),
                                          borderRadius: BorderRadius.circular(8.0)),
                                      width: MediaQuery.of(context).size.width / 2 - 30,
                                      child: Center(
                                        child: InkWell(
                                          onTap: () {
                                            if (flag == 0) {
                                              flag = 1;
                                              setState(() {});
                                            }
                                          },
                                          child: Text(
                                            'Sort',
                                            style: TextStyle(
                                                color: flag == 1 ? Color(0xffFFFFFF) : Color(0xff42436A),
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "GoogleSans"),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Expanded(
                child: ListView(
              children: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((item) => _buildFlightItem()).toList(),
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildFlightItem() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 14),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 12),
          Text(
            '2 hrs 10 min',
            style: TextStyle(
              color: Color(0xff8D91A2),
              fontSize: 12,
              fontWeight: FontWeight.normal,
              fontFamily: "GoogleSans",
            ),
          ),
          Row(
            children: <Widget>[
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'LON',
                    style: TextStyle(
                      color: Color(0xff767676),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontFamily: "GoogleSans",
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    '13:00',
                    style: TextStyle(
                      color: Color(0xff5808D8),
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      fontFamily: "GoogleSans",
                    ),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
              Spacer(),
              Image.asset(
                'assets/images/flight_search.png',
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Ams',
                    style: TextStyle(
                      color: Color(0xff8D91A2),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontFamily: "GoogleSans",
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    '15:10',
                    style: TextStyle(
                      color: Color(0xff5808D8),
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      fontFamily: "GoogleSans",
                    ),
                    textAlign: TextAlign.right,
                  )
                ],
              ),
              SizedBox(width: 20),
            ],
          ),
          Text(
            'Non-Stop',
            style: TextStyle(
              color: Color(0xff8D91A2),
              fontSize: 12,
              fontWeight: FontWeight.normal,
              fontFamily: "GoogleSans",
            ),
          ),
          SizedBox(height: 14),
          Container(
            height: 0.5,
            color: Color(0xffE0E0E0),
          ),
          SizedBox(height: 6),
          Row(
            children: <Widget>[
              SizedBox(width: 20),
              Image.asset(
                'assets/images/airlines.png',
              ),
              SizedBox(width: 8),
              Text(
                '6E 189',
                style: TextStyle(
                  color: Color(0xff8D91A2),
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontFamily: "GoogleSans",
                ),
              ),
              Spacer(),
              Image.asset(
                'assets/images/info.png',
              ),
              SizedBox(width: 6),
              Text(
                'Flight Info',
                style: TextStyle(
                  color: Color(0xff8D91A2),
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontFamily: "GoogleSans",
                ),
              ),
              Spacer(),
              Text(
                'SAR 756',
                style: TextStyle(
                  color: Color(0xffFF1E74),
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: "GoogleSans",
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
