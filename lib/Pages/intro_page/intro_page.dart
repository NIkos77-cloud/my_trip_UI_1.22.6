import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_trip/common/happy_trip_router.dart';
import 'package:happy_trip/common/screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController _controller = PageController();
  double _currentPosition = 1.0;
  Size _size;

  @override
  void initState() {
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff8612EA),
              Color(0xff4406D1),
            ],
          ),
        ),
        child: Stack(
          children: <Widget>[
            _buildIntroPageView(),
            _buildSkipNextButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroPageView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: PageView(
        controller: _controller,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          _buildFirstIntro(),
          _buildTwoIntro(),
        ],
      ),
    );
  }

  Widget _buildFirstIntro() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(70, _size.width)),
          Text(
            'Customer\nloyalty Programs',
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil.getHorizontalPixel(_size, 28),
              fontWeight: FontWeight.bold,
              fontFamily: "GoogleSans",
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(22, _size.width)),
          Text(
            'Earn 10 nights and get 1\nreward night *',
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil.getHorizontalPixel(_size, 18),
              fontWeight: FontWeight.w500,
              fontFamily: "GoogleSans",
              decoration: TextDecoration.underline,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(60, _size.width)),
          Image.asset(
            'assets/images/intro_one.png',
            width: ScreenUtil.getResponsiveWidthOfWidget(300, _size.width),
            height: ScreenUtil.getResponsiveHeightOfWidget(220, _size.width),
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  Widget _buildTwoIntro() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(70, _size.width)),
          Text(
            'Competitive price\nand easy booking',
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil.getHorizontalPixel(_size, 28),
              fontWeight: FontWeight.bold,
              fontFamily: "GoogleSans",
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(80, _size.width)),
          Image.asset(
            'assets/images/intro_two.png',
            width: ScreenUtil.getResponsiveWidthOfWidget(270, _size.width),
            height: ScreenUtil.getResponsiveHeightOfWidget(400, _size.width),
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  Widget _buildSkipNextButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.only(
          bottom: ScreenUtil.getResponsiveHeightOfWidget(24, _size.width),
          left: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
          right: ScreenUtil.getResponsiveWidthOfWidget(4, _size.width),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context, rootNavigator: true).pushNamed(RouteName.loginPage);
              },
              child: Container(
                height: ScreenUtil.getResponsiveHeightOfWidget(40, _size.width),
                width: ScreenUtil.getResponsiveWidthOfWidget(90, _size.width),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      ScreenUtil.getResponsiveHeightOfWidget(20, _size.width),
                    ),
                  ),
                  color: Colors.white.withOpacity(0.1),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.3),
                    fontSize: ScreenUtil.getHorizontalPixel(_size, 16),
                    fontWeight: FontWeight.bold,
                    fontFamily: "GoogleSans",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Spacer(),
            _pagerIndicator(),
            Spacer(),
            InkWell(
              onTap: () {
                if (_currentPosition == 0.0) {
                  return;
                }
                _controller.animateTo(
                  _controller.position.maxScrollExtent,
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 250),
                );
              },
              child: Container(
                height: ScreenUtil.getResponsiveHeightOfWidget(40, _size.width),
                width: ScreenUtil.getResponsiveWidthOfWidget(90, _size.width),
                alignment: Alignment.center,
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil.getHorizontalPixel(_size, 16),
                    fontWeight: FontWeight.bold,
                    fontFamily: "GoogleSans",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pagerIndicator() {
    return DotsIndicator(
      dotsCount: 2,
      position: _currentPosition,
      axis: Axis.horizontal,
      reversed: true,
      decorator: DotsDecorator(activeColor: Colors.white),
    );
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent && !_controller.position.outOfRange) {
      setState(() {
        _currentPosition = 0.0;
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent && !_controller.position.outOfRange) {
      setState(() {
        _currentPosition = 1.0;
      });
    }
  }
}
