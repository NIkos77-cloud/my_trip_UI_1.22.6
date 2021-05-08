import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:happy_trip/common/global.dart';
import 'package:happy_trip/common/screenutil.dart';

import 'hotel_listing_page.dart';

class SearchPage extends StatefulWidget {
  SearchPage();
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _location = TextEditingController();
  FocusNode nodeText1;
  double _lowerValue = 50;
  double _upperValue = 180;
  bool aircondition = false;
  bool vehicle = false;
  bool coffee = false;
  bool swimingpool = false;
  int flagforsortlist;

  List<dynamic> sortlist = [
    'Most Recommended First',
    'Hotel Rating (Highest First)',
    'Hotel Rating (Lowest First)',
    'Price (Height First)',
    'Price (Lowest First)',
    'Best Reviewed First',
    'Most Reviewed First',
    'Near me'
  ];
  int flag = 0;
  Size _size;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
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
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, NoAnimationMaterialPageRoute(builder: (context) => HotellistingPage()));
                  },
                  child: Image.asset("assets/images/nav_bar_list.png")),
            ),
          ),
        ),
        title: Text(
          'Search',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff42436A)),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffFFFFFF),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                overflow: Overflow.visible,
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    // color: Colors.grey[200],
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 0, top: 5),
                      child: Text(
                        'Hotel Search',
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
                  Positioned(
                      top: 50,
                      child: Container(
                        child: Card(
                          // margin: EdgeInsets.all(10.0),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 40,
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 42.0,
                                  width: MediaQuery.of(context).size.width - 60,
                                  decoration: BoxDecoration(
                                      //  color: Colors.red,
                                      borderRadius: BorderRadius.circular(20.0)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      InkWell(
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
                                              borderRadius: BorderRadius.circular(20.0)),
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
                                              borderRadius: BorderRadius.circular(20.0)),
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
                                flag == 0
                                    ? Padding(
                                        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('PRICE',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Color(0xff42436A),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "GoogleSans")),
                                        ))
                                    : Container(),

//_________

                                flag != 0
                                    ? Container()
                                    : Container(
                                        margin: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 15),
                                        alignment: Alignment.centerLeft,
                                        child: FlutterSlider(
                                          values: [3000, 17000],
                                          rangeSlider: true,
                                          max: 25000,
                                          min: 0,
                                          step: 100,
                                          jump: true,
                                          trackBar: FlutterSliderTrackBar(
                                              inactiveTrackBarHeight: 6.5,
                                              activeTrackBarHeight: 6.5,
                                              activeTrackBar: BoxDecoration(color: Color(0xff5808D8)),
                                              inactiveTrackBar: BoxDecoration(
                                                  color: Color(0xffEBECF0), borderRadius: BorderRadius.circular(30.0))),
                                          disabled: false,
                                          handlerHeight: 25,
                                          handlerWidth: 25,
                                          handler: customHandler(Icons.chevron_right),
                                          rightHandler: customHandler(Icons.chevron_left),
                                          tooltip: FlutterSliderTooltip(
                                            leftPrefix: Icon(
                                              Icons.attach_money,
                                              size: 19,
                                              color: Colors.black45,
                                            ),
                                            rightSuffix: Icon(
                                              Icons.attach_money,
                                              size: 19,
                                              color: Colors.black45,
                                            ),
                                            textStyle: TextStyle(fontSize: 17, color: Colors.black45),
                                          ),
                                          onDragging: (handlerIndex, lowerValue, upperValue) {
                                            _lowerValue = lowerValue;
                                            _upperValue = upperValue;
                                            // setState(() {});
                                          },
                                        )),

                                flag != 0
                                    ? Container()
                                    : Container(
                                        height: 1,
                                        color: Color(0xffEBECF0),
                                        width: MediaQuery.of(context).size.width - 100,
                                      ),

                                //___________________
                                flag != 0
                                    ? Container()
                                    : Padding(
                                        padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('HOTEL RATING',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Color(0xff42436A),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "GoogleSans")),
                                        )),

                                flag != 0
                                    ? Container()
                                    : Container(
                                        height: 88,
                                        // color: Colors.red,
                                        width: MediaQuery.of(context).size.width - 100,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 5,
                                            itemBuilder: (BuildContext context, int index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(top: 20, right: 20, bottom: 20),
                                                child: Container(
                                                  height: 37,
                                                  width: 128,
                                                  decoration: BoxDecoration(
                                                      // color: Colors.grey[200],
                                                      border: Border.all(color: Color(0xffEBECF0), width: 1.5),
                                                      borderRadius: BorderRadius.circular(60)),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: 128,
                                                    padding: EdgeInsets.only(left: 20, right: 20),
                                                    child: ListView.builder(
                                                        physics: NeverScrollableScrollPhysics(),
                                                        scrollDirection: Axis.horizontal,
                                                        itemCount: 5,
                                                        itemBuilder: (BuildContext context, int index) {
                                                          return Padding(
                                                            padding: const EdgeInsets.only(right: 6.5),
                                                            child: Container(
                                                                // color: Colors.red,
                                                                height: 12,
                                                                width: 12,
                                                                child: Image.asset('assets/images/active_start.png')),
                                                          );
                                                        }),
                                                  ),
                                                ),
                                              );
                                            })),

                                flag != 0
                                    ? Container()
                                    : Container(
                                        height: 1,
                                        color: Color(0xffEBECF0),
                                        width: MediaQuery.of(context).size.width - 100,
                                      ),

                                //___________________
                                flag != 0
                                    ? Container()
                                    : Padding(
                                        padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('DISTRICT',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Color(0xff42436A),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "GoogleSans")),
                                        )),

                                flag != 0 ? Container() : location(context),

                                Container(
                                  height: 1,
                                  color: Color(0xffEBECF0),
                                  width: MediaQuery.of(context).size.width - 100,
                                ),

                                //___________________
                                flag != 0
                                    ? Container()
                                    : Padding(
                                        padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('PROPERTY AMENITY',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Color(0xff42436A),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "GoogleSans")),
                                        )),

                                flag != 0
                                    ? Container()
                                    : Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            //______________________Air condition
                                            Stack(
                                              alignment: Alignment.topRight,
                                              overflow: Overflow.visible,
                                              children: <Widget>[
                                                InkWell(
                                                  child: Container(
                                                    height: 69,
                                                    width: 69,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10.0),
                                                      color: Color(0xff1CCF3D),
                                                      boxShadow: aircondition
                                                          ? [
                                                              BoxShadow(
                                                                color: Color(0xff1CCF3D).withOpacity(0.3),
                                                                blurRadius:
                                                                    25.0, // has the effect of softening the shadow
                                                                spreadRadius:
                                                                    10.0, // has the effect of extending the shadow
                                                                offset: Offset(
                                                                  8.0, // horizontal, move right 10
                                                                  5.0, // vertical, move down 10
                                                                ),
                                                              )
                                                            ]
                                                          : [],
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: <Widget>[
                                                        Container(
                                                          child: Image.asset('assets/images/air_conditioner.png'),
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.only(left: 5, right: 5),
                                                          child: Text(
                                                            'Air Condition',
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                                fontSize: 11.0,
                                                                fontWeight: FontWeight.w300,
                                                                fontFamily: "GoogleSans",
                                                                color: Color(0xffFFFFFF)),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    if (aircondition) {
                                                      aircondition = false;
                                                      setState(() {});
                                                    } else {
                                                      aircondition = true;
                                                      setState(() {});
                                                    }
                                                  },
                                                ),
                                                aircondition
                                                    ? Positioned(
                                                        top: -5,
                                                        right: -5,
                                                        child: Container(
                                                          height: 20,
                                                          width: 20,
                                                          decoration: BoxDecoration(
                                                            color: Color(0xffFFFFFF),
                                                            shape: BoxShape.circle,
                                                          ),
                                                          child:
                                                              Center(child: Image.asset('assets/images/rightsign.png')),
                                                        ))
                                                    : Container()
                                              ],
                                            ),
                                            //______________________Vehicle parking
                                            Stack(
                                              alignment: Alignment.topRight,
                                              overflow: Overflow.visible,
                                              children: <Widget>[
                                                InkWell(
                                                  child: Container(
                                                    height: 69,
                                                    width: 69,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10.0),
                                                      color: Color(0xffFF1E74),
                                                      boxShadow: vehicle
                                                          ? [
                                                              BoxShadow(
                                                                color: Color(0xffFF1E74).withOpacity(0.3),
                                                                blurRadius:
                                                                    25.0, // has the effect of softening the shadow
                                                                spreadRadius:
                                                                    10.0, // has the effect of extending the shadow
                                                                offset: Offset(
                                                                  8.0, // horizontal, move right 10
                                                                  5.0, // vertical, move down 10
                                                                ),
                                                              )
                                                            ]
                                                          : [],
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: <Widget>[
                                                        Container(
                                                          child: Image.asset('assets/images/vehicleparking.png'),
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.only(left: 5, right: 5),
                                                          child: Text(
                                                            'Vehicle Parking',
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                                fontSize: 11.0,
                                                                fontWeight: FontWeight.w300,
                                                                fontFamily: "GoogleSans",
                                                                color: Color(0xffFFFFFF)),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    if (vehicle) {
                                                      vehicle = false;
                                                      setState(() {});
                                                    } else {
                                                      vehicle = true;
                                                      setState(() {});
                                                    }
                                                  },
                                                ),
                                                vehicle
                                                    ? Positioned(
                                                        top: -5,
                                                        right: -5,
                                                        child: Container(
                                                          height: 20,
                                                          width: 20,
                                                          decoration: BoxDecoration(
                                                            color: Color(0xffFFFFFF),
                                                            shape: BoxShape.circle,
                                                          ),
                                                          child:
                                                              Center(child: Image.asset('assets/images/rightsign.png')),
                                                        ))
                                                    : Container()
                                              ],
                                            ),
                                            //______________________Breakfast
                                            Stack(
                                              alignment: Alignment.topRight,
                                              overflow: Overflow.visible,
                                              children: <Widget>[
                                                InkWell(
                                                  child: Container(
                                                    height: 69,
                                                    width: 69,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10.0),
                                                      color: Color(0xff00D8FD),
                                                      boxShadow: coffee
                                                          ? [
                                                              BoxShadow(
                                                                color: Color(0xff00D8FD).withOpacity(0.3),
                                                                blurRadius:
                                                                    25.0, // has the effect of softening the shadow
                                                                spreadRadius:
                                                                    10.0, // has the effect of extending the shadow
                                                                offset: Offset(
                                                                  8.0, // horizontal, move right 10
                                                                  5.0, // vertical, move down 10
                                                                ),
                                                              )
                                                            ]
                                                          : [],
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: <Widget>[
                                                        Container(
                                                          child: Image.asset('assets/images/coffee_cup.png'),
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.only(left: 5, right: 5),
                                                          child: Text(
                                                            'Breakfast',
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                                fontSize: 11.0,
                                                                fontWeight: FontWeight.w300,
                                                                fontFamily: "GoogleSans",
                                                                color: Color(0xffFFFFFF)),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    if (coffee) {
                                                      coffee = false;
                                                      setState(() {});
                                                    } else {
                                                      coffee = true;
                                                      setState(() {});
                                                    }
                                                  },
                                                ),
                                                coffee
                                                    ? Positioned(
                                                        top: -5,
                                                        right: -5,
                                                        child: Container(
                                                          height: 20,
                                                          width: 20,
                                                          decoration: BoxDecoration(
                                                            color: Color(0xffFFFFFF),
                                                            shape: BoxShape.circle,
                                                          ),
                                                          child:
                                                              Center(child: Image.asset('assets/images/rightsign.png')),
                                                        ))
                                                    : Container()
                                              ],
                                            ),
                                            //______________________swiming pool

                                            Stack(
                                              alignment: Alignment.topRight,
                                              overflow: Overflow.visible,
                                              children: <Widget>[
                                                InkWell(
                                                  child: Container(
                                                    height: 69,
                                                    width: 69,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10.0),
                                                      color: Color(0xffB14AFD),
                                                      boxShadow: swimingpool
                                                          ? [
                                                              BoxShadow(
                                                                color: Color(0xffB14AFD).withOpacity(0.3),
                                                                blurRadius:
                                                                    25.0, // has the effect of softening the shadow
                                                                spreadRadius:
                                                                    10.0, // has the effect of extending the shadow
                                                                offset: Offset(
                                                                  8.0, // horizontal, move right 10
                                                                  5.0, // vertical, move down 10
                                                                ),
                                                              )
                                                            ]
                                                          : [],
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: <Widget>[
                                                        Container(
                                                          child: Image.asset('assets/images/swimming_pool.png'),
                                                        ),
                                                        Container(
                                                          alignment: Alignment.center,
                                                          padding: EdgeInsets.only(left: 5, right: 5),
                                                          child: Text(
                                                            'Swiming Pool',
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                                fontSize: 11.0,
                                                                fontWeight: FontWeight.w300,
                                                                fontFamily: "GoogleSans",
                                                                color: Color(0xffFFFFFF)),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    if (swimingpool) {
                                                      swimingpool = false;
                                                      setState(() {});
                                                    } else {
                                                      swimingpool = true;
                                                      setState(() {});
                                                    }
                                                  },
                                                ),
                                                swimingpool
                                                    ? Positioned(
                                                        top: -5,
                                                        right: -5,
                                                        child: Container(
                                                          height: 20,
                                                          width: 20,
                                                          decoration: BoxDecoration(
                                                            color: Color(0xffFFFFFF),
                                                            shape: BoxShape.circle,
                                                          ),
                                                          child:
                                                              Center(child: Image.asset('assets/images/rightsign.png')),
                                                        ))
                                                    : Container()
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),

                                flag == 1
                                    ? Container(
                                        padding: EdgeInsets.only(left: 5, right: 5, top: 20, bottom: 20),
                                        // width: MediaQuery.of(context).size.width -50,
                                        height: 45.0 * sortlist.length,
                                        child: ListView.builder(
                                            physics: NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: sortlist.length,
                                            itemBuilder: (BuildContext context, int index) {
                                              return InkWell(
                                                onTap: () {
                                                  flagforsortlist = index;
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10.0),
                                                    color: flagforsortlist != null && flagforsortlist == index
                                                        ? Color(0xffF1F4FB)
                                                        : Colors.transparent,
                                                  ),
                                                  padding: EdgeInsets.only(
                                                    left: 20,
                                                    right: 10,
                                                  ),

                                                  height: 40,
                                                  // width: MediaQuery.of(context).size.width -60,
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: <Widget>[
                                                        Container(
                                                          // color: Colors.grey,
                                                          child: Text(
                                                            '${sortlist[index]}',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.w400,
                                                              color: Color(0xff42436A),
                                                              fontFamily: "GoogleSans",
                                                            ),
                                                          ),
                                                        ),
                                                        flagforsortlist != null && flagforsortlist == index
                                                            ? Container(
                                                                height: 20,
                                                                width: 20,
                                                                decoration: BoxDecoration(
                                                                    shape: BoxShape.circle, color: Color(0xffFFFFFF)),
                                                                child: Center(
                                                                  child: Image.asset('assets/images/rightsign.png'),
                                                                ),
                                                              )
                                                            : Container()
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      )
                                    : Container(),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        child: SizedBox(
                                          height: 42,
                                          child: OutlineButton(
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.5)),
                                            borderSide: BorderSide(width: 1.5, color: Color(0xff5808D8)),
                                            child: Text(
                                              'Reset',
                                              style: TextStyle(
                                                  color: Color(0xff5808D8), fontWeight: FontWeight.w500, fontSize: 18),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          height: 42,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8.5),
                                              gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xff8612EA),
                                                  Color(0xff4406D1),
                                                ],
                                              ),
                                            ),
                                            // color: Colors.green,
                                            child: Center(
                                              child: Text(
                                                'Show Results',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "GoogleSans",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  customHandler(IconData icon) {
    return FlutterSliderHandler(
      decoration: BoxDecoration(),
      child: Container(
        child: Container(
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(color: Color(0xff5808D8), shape: BoxShape.circle),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: Colors.blue.withOpacity(0.3), spreadRadius: 0.05, blurRadius: 3, offset: Offset(0, 1))
          ],
        ),
      ),
    );
  }

  Widget location(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextField(
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        onChanged: (text) {},
        controller: _location,
        textInputAction: TextInputAction.done,
        focusNode: nodeText1,
        onSubmitted: (value) {},
        decoration: InputDecoration(
          suffixIcon: Image.asset('assets/images/locationcircle.png'),
          contentPadding: const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 16, right: 16),
          labelText: ' Location Name',
          labelStyle: TextStyle(color: Colors.black, fontFamily: 'Iceland_Regular'),
          focusColor: Colors.black,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffEBECF0), width: 2.0),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffEBECF0), width: 2.0),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Color(0xffEBECF0), width: 2.0)),
        ),
        onTap: () {},
      ),
    );
  }
}
