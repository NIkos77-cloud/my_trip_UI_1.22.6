import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_trip/common/screenutil.dart';

enum ThankYouPageType { hotel, flight }

class ThankYouPage extends StatefulWidget {
  ThankYouPage();
  @override
  _ThankYouPageState createState() => _ThankYouPageState();
}

class _ThankYouPageState extends State<ThankYouPage> {
  Size _size;
  ThankYouPageType thankYouPageType = ThankYouPageType.hotel;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(100, _size.width)),
              Image.asset(
                thankYouPageType == ThankYouPageType.flight
                    ? 'assets/images/flight_thanks.png'
                    : 'assets/images/hotel_thanks.png',
                height: ScreenUtil.getResponsiveHeightOfWidget(230, _size.width),
                width: ScreenUtil.getResponsiveHeightOfWidget(230, _size.width),
              ),
              SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(50, _size.width)),
              Text(
                'Thank You!',
                style: TextStyle(
                  color: Color(0xff42436A),
                  fontSize: ScreenUtil.getHorizontalPixel(_size, 30),
                  fontWeight: FontWeight.normal,
                  fontFamily: "GoogleSans",
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(15, _size.width)),
              Padding(
                padding: EdgeInsets.only(
                  left: ScreenUtil.getResponsiveWidthOfWidget(50, _size.width),
                  right: ScreenUtil.getResponsiveWidthOfWidget(50, _size.width),
                ),
                child: Text(
                  'Thank you for signing up! Check your inbox  soon for special offers from us.',
                  style: TextStyle(
                    color: Color(0xff8D91A2),
                    fontSize: ScreenUtil.getHorizontalPixel(_size, 16),
                    fontWeight: FontWeight.normal,
                    fontFamily: "GoogleSans",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(70, _size.width)),
              _buildButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: ScreenUtil.getResponsiveHeightOfWidget(50, _size.width),
        margin: EdgeInsets.only(
          left: ScreenUtil.getResponsiveWidthOfWidget(50, _size.width),
          right: ScreenUtil.getResponsiveWidthOfWidget(50, _size.width),
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
          'Back to home',
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil.getHorizontalPixel(_size, 16),
            fontWeight: FontWeight.bold,
            fontFamily: "GoogleSans",
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
