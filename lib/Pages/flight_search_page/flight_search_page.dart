import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_trip/Pages/flight_search_page/flight_search_list_page.dart';
import 'package:happy_trip/common/global.dart';
import 'package:happy_trip/common/screenutil.dart';

class FlightSearchPage extends StatefulWidget {
  @override
  _FlightSearchPageState createState() => _FlightSearchPageState();
}

class _FlightSearchPageState extends State<FlightSearchPage> {
  Size _size;
  bool _isSelectOneWay = true;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffF5F8FE),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffF5F8FE),
          child: Column(
            children: <Widget>[
              SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(30, _size.width)),
              _buildFlightSearchButtons(),
              SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(30, _size.width)),
              _buildFromToDestination(),
              SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(22, _size.width)),
              _buildCheckInOut(),
              SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(22, _size.width)),
              _buildPassenger(),
              SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(30, _size.width)),
              _buildSearchFlightButton(),
              SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(50, _size.width)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFlightSearchButtons() {
    return Container(
      height: 50,
      width: (_size.width - ScreenUtil.getResponsiveWidthOfWidget(40, _size.width)),
      margin: EdgeInsets.only(
        left: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
        right: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29),
      ),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                _isSelectOneWay = true;
              });
            },
            child: Container(
              width: (_size.width - ScreenUtil.getResponsiveWidthOfWidget(40, _size.width)) / 2,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(29),
                gradient: _isSelectOneWay
                    ? LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff8612EA),
                          Color(0xff4406D1),
                        ],
                      )
                    : null,
              ),
              alignment: AlignmentDirectional.center,
              child: Text(
                'One Way',
                style: TextStyle(
                  color: _isSelectOneWay ? Colors.white : Color(0xff42436A),
                  fontSize: ScreenUtil.getHorizontalPixel(_size, 15),
                  fontWeight: FontWeight.w500,
                  fontFamily: "GoogleSans",
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _isSelectOneWay = false;
              });
            },
            child: Container(
              width: (_size.width - ScreenUtil.getResponsiveWidthOfWidget(40, _size.width)) / 2,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(29),
                gradient: _isSelectOneWay
                    ? null
                    : LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff8612EA),
                          Color(0xff4406D1),
                        ],
                      ),
              ),
              alignment: AlignmentDirectional.center,
              child: Text(
                'Round Trip',
                style: TextStyle(
                  color: _isSelectOneWay ? Color(0xff42436A) : Colors.white,
                  fontSize: ScreenUtil.getHorizontalPixel(_size, 15),
                  fontWeight: FontWeight.w500,
                  fontFamily: "GoogleSans",
                ),
                textAlign: TextAlign.left,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFromToDestination() {
    return Container(
      width: (_size.width - ScreenUtil.getResponsiveWidthOfWidget(40, _size.width)),
      margin: EdgeInsets.only(
        left: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
        right: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: (_size.width - ScreenUtil.getResponsiveWidthOfWidget(70, _size.width)) / 2,
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/from_dest.png',
                    ),
                    SizedBox(width: 6),
                    Text(
                      'From',
                      style: TextStyle(
                        color: Color(0xff42436A),
                        fontSize: ScreenUtil.getHorizontalPixel(_size, 14),
                        fontWeight: FontWeight.w500,
                        fontFamily: "GoogleSans",
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ),
              SizedBox(width: 30),
              Container(
                width: (_size.width - ScreenUtil.getResponsiveWidthOfWidget(70, _size.width)) / 2,
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/to_dest.png',
                    ),
                    SizedBox(width: 6),
                    Text(
                      'To',
                      style: TextStyle(
                        color: Color(0xff42436A),
                        fontSize: ScreenUtil.getHorizontalPixel(_size, 14),
                        fontWeight: FontWeight.w500,
                        fontFamily: "GoogleSans",
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(14, _size.width)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 45,
                width: (_size.width - ScreenUtil.getResponsiveWidthOfWidget(70, _size.width)) / 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xffC2C3DF), width: 1),
                ),
                padding: EdgeInsets.only(
                  left: ScreenUtil.getResponsiveWidthOfWidget(14, _size.width),
                  right: ScreenUtil.getResponsiveWidthOfWidget(14, _size.width),
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  'London',
                  style: TextStyle(
                    color: Color(0xff42436A).withOpacity(0.55),
                    fontSize: ScreenUtil.getHorizontalPixel(_size, 14),
                    fontWeight: FontWeight.normal,
                    fontFamily: "GoogleSans",
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(width: 30),
              Container(
                height: 45,
                width: (_size.width - ScreenUtil.getResponsiveWidthOfWidget(70, _size.width)) / 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xffC2C3DF), width: 1),
                ),
                padding: EdgeInsets.only(
                  left: ScreenUtil.getResponsiveWidthOfWidget(14, _size.width),
                  right: ScreenUtil.getResponsiveWidthOfWidget(14, _size.width),
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Amsterdam',
                  style: TextStyle(
                    color: Color(0xff42436A).withOpacity(0.55),
                    fontSize: ScreenUtil.getHorizontalPixel(_size, 14),
                    fontWeight: FontWeight.normal,
                    fontFamily: "GoogleSans",
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCheckInOut() {
    return Container(
      width: (_size.width - ScreenUtil.getResponsiveWidthOfWidget(40, _size.width)),
      margin: EdgeInsets.only(
        left: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
        right: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: (_size.width - ScreenUtil.getResponsiveWidthOfWidget(70, _size.width)) / 2,
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/calendar.png',
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Checkin',
                      style: TextStyle(
                        color: Color(0xff42436A),
                        fontSize: ScreenUtil.getHorizontalPixel(_size, 14),
                        fontWeight: FontWeight.w500,
                        fontFamily: "GoogleSans",
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ),
              SizedBox(width: 30),
              Container(
                width: (_size.width - ScreenUtil.getResponsiveWidthOfWidget(70, _size.width)) / 2,
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/calendar.png',
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Checkout',
                      style: TextStyle(
                        color: Color(0xff42436A),
                        fontSize: ScreenUtil.getHorizontalPixel(_size, 14),
                        fontWeight: FontWeight.w500,
                        fontFamily: "GoogleSans",
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(14, _size.width)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 45,
                width: (_size.width - ScreenUtil.getResponsiveWidthOfWidget(70, _size.width)) / 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xffC2C3DF), width: 1),
                ),
                padding: EdgeInsets.only(
                  left: ScreenUtil.getResponsiveWidthOfWidget(14, _size.width),
                  right: ScreenUtil.getResponsiveWidthOfWidget(14, _size.width),
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Wed, 28 Nov',
                  style: TextStyle(
                    color: Color(0xff42436A).withOpacity(0.55),
                    fontSize: ScreenUtil.getHorizontalPixel(_size, 14),
                    fontWeight: FontWeight.normal,
                    fontFamily: "GoogleSans",
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(width: 30),
              Container(
                height: 45,
                width: (_size.width - ScreenUtil.getResponsiveWidthOfWidget(70, _size.width)) / 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xffC2C3DF), width: 1),
                ),
                padding: EdgeInsets.only(
                  left: ScreenUtil.getResponsiveWidthOfWidget(14, _size.width),
                  right: ScreenUtil.getResponsiveWidthOfWidget(14, _size.width),
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sat, 30 Nov',
                  style: TextStyle(
                    color: Color(0xff42436A).withOpacity(0.55),
                    fontSize: ScreenUtil.getHorizontalPixel(_size, 14),
                    fontWeight: FontWeight.normal,
                    fontFamily: "GoogleSans",
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPassenger() {
    return Container(
      width: (_size.width - ScreenUtil.getResponsiveWidthOfWidget(40, _size.width)),
      margin: EdgeInsets.only(
        left: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
        right: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: (_size.width - ScreenUtil.getResponsiveWidthOfWidget(70, _size.width)) / 2,
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/calendar.png',
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Passenger',
                      style: TextStyle(
                        color: Color(0xff42436A),
                        fontSize: ScreenUtil.getHorizontalPixel(_size, 14),
                        fontWeight: FontWeight.w500,
                        fontFamily: "GoogleSans",
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ),
              SizedBox(width: 30),
              Container(
                width: (_size.width - ScreenUtil.getResponsiveWidthOfWidget(70, _size.width)) / 2,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 6),
                    Text(
                      '',
                      style: TextStyle(
                        color: Color(0xff42436A),
                        fontSize: ScreenUtil.getHorizontalPixel(_size, 14),
                        fontWeight: FontWeight.w500,
                        fontFamily: "GoogleSans",
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(14, _size.width)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 45,
                width: (_size.width - ScreenUtil.getResponsiveWidthOfWidget(70, _size.width)) / 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xffC2C3DF), width: 1),
                ),
                padding: EdgeInsets.only(
                  left: ScreenUtil.getResponsiveWidthOfWidget(14, _size.width),
                  right: ScreenUtil.getResponsiveWidthOfWidget(14, _size.width),
                ),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Text(
                      'Adults',
                      style: TextStyle(
                        color: Color(0xff42436A).withOpacity(0.55),
                        fontSize: ScreenUtil.getHorizontalPixel(_size, 14),
                        fontWeight: FontWeight.normal,
                        fontFamily: "GoogleSans",
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(
                        top: ScreenUtil.getResponsiveWidthOfWidget(8, _size.width),
                        bottom: ScreenUtil.getResponsiveWidthOfWidget(8, _size.width),
                      ),
                      width: 1,
                      color: Color(0xffC2C3DF),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '2',
                      style: TextStyle(
                        color: Color(0xff42436A),
                        fontSize: ScreenUtil.getHorizontalPixel(_size, 14),
                        fontWeight: FontWeight.normal,
                        fontFamily: "GoogleSans",
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: 10),
                    Image.asset(
                      'assets/images/top_bottom_arrow.png',
                    ),
                  ],
                ),
              ),
              SizedBox(width: 30),
              Container(
                height: 45,
                width: (_size.width - ScreenUtil.getResponsiveWidthOfWidget(70, _size.width)) / 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xffC2C3DF), width: 1),
                ),
                padding: EdgeInsets.only(
                  left: ScreenUtil.getResponsiveWidthOfWidget(14, _size.width),
                  right: ScreenUtil.getResponsiveWidthOfWidget(14, _size.width),
                ),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Text(
                      'Children',
                      style: TextStyle(
                        color: Color(0xff42436A).withOpacity(0.55),
                        fontSize: ScreenUtil.getHorizontalPixel(_size, 14),
                        fontWeight: FontWeight.normal,
                        fontFamily: "GoogleSans",
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(
                        top: ScreenUtil.getResponsiveWidthOfWidget(8, _size.width),
                        bottom: ScreenUtil.getResponsiveWidthOfWidget(8, _size.width),
                      ),
                      width: 1,
                      color: Color(0xffC2C3DF),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '2',
                      style: TextStyle(
                        color: Color(0xff42436A),
                        fontSize: ScreenUtil.getHorizontalPixel(_size, 14),
                        fontWeight: FontWeight.normal,
                        fontFamily: "GoogleSans",
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: 10),
                    Image.asset(
                      'assets/images/top_bottom_arrow.png',
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSearchFlightButton() {
    return InkWell(
      onTap: () {
        Navigator.push(context, NoAnimationMaterialPageRoute(builder: (context) => FlightSearchListPage()));
      },
      child: Container(
        height: ScreenUtil.getResponsiveHeightOfWidget(50, _size.width),
        margin: EdgeInsets.only(
          left: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
          right: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              ScreenUtil.getResponsiveHeightOfWidget(10, _size.width),
            ),
          ),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff8612EA),
              Color(0xff4406D1),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xff4406D1).withOpacity(0.4),
              offset: Offset(0, 5),
              blurRadius: 30,
              spreadRadius: 4,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          'Search Flight',
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil.getHorizontalPixel(_size, 18),
            fontWeight: FontWeight.bold,
            fontFamily: "GoogleSans",
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
