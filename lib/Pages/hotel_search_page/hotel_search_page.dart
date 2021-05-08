import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_trip/Pages/hotel_search_page/widgets/featured_item_card_widget.dart';
import 'package:happy_trip/common/screenutil.dart';

enum ItemThemeType { Grid, List }

class HotelSearchPage extends StatefulWidget {
  @override
  _HotelSearchPageState createState() => _HotelSearchPageState();
}

class _HotelSearchPageState extends State<HotelSearchPage> {
  Size _size;

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
              SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(25, _size.width)),
              _buildTitleAndButtons(),
              SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(30, _size.width)),
              _buildCalendarWiseGridView(),
              _buildListView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndButtons() {
    return Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
        right: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
      ),
      child: Row(
        children: <Widget>[
          Text(
            'Featured Packages',
            style: TextStyle(
              color: Color(0xff42436A),
              fontSize: ScreenUtil.getHorizontalPixel(_size, 22),
              fontWeight: FontWeight.bold,
              fontFamily: "GoogleSans",
            ),
            textAlign: TextAlign.left,
          ),
          Spacer(),
          _buildListButton(),
          SizedBox(width: ScreenUtil.getResponsiveWidthOfWidget(8, _size.width)),
          _buildGridButton(),
        ],
      ),
    );
  }

  Widget _buildListButton() {
    return Container(
      height: ScreenUtil.getResponsiveWidthOfWidget(38, _size.width),
      width: ScreenUtil.getResponsiveWidthOfWidget(38, _size.width),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            blurRadius: 20.0,
            spreadRadius: 2.0,
          )
        ],
      ),
      child: Image.asset(
        'assets/images/list.png',
      ),
    );
  }

  Widget _buildGridButton() {
    return Container(
      height: ScreenUtil.getResponsiveWidthOfWidget(38, _size.width),
      width: ScreenUtil.getResponsiveWidthOfWidget(38, _size.width),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff8612EA),
            Color(0xff4406D1),
          ],
        ),
      ),
      child: Image.asset(
        'assets/images/grid.png',
      ),
    );
  }

  Widget _buildCalendarWiseGridView() {
    List<Item> dummyItems = [
      Item(
          'https://images.pexels.com/photos/189296/pexels-photo-189296.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
          'Jan'),
      Item(
          'https://images.pexels.com/photos/338504/pexels-photo-338504.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
          'Feb'),
      Item(
          'https://images.pexels.com/photos/2034335/pexels-photo-2034335.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
          'Mar'),
      Item(
          'https://images.pexels.com/photos/261102/pexels-photo-261102.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
          'Apr'),
      Item(
          'https://images.pexels.com/photos/941861/pexels-photo-941861.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
          'May'),
    ];
    return Container(
      height: 280,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [SizedBox(width: 20)]..addAll(
            dummyItems
                .map(
                  (item) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 30,
                        width: 65,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xffFDD500),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          item.month,
                          style: TextStyle(
                            color: Color(0xff736000),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: "GoogleSans",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.only(bottom: 30),
                        margin: EdgeInsets.only(right: 20),
                        child: FeaturedItemCardWidget(item.url),
                      )
                    ],
                  ),
                )
                .toList(),
          ),
      ),
    );
  }

  Widget _buildListView() {
    List<String> dummyUrls = [
      'https://images.pexels.com/photos/258154/pexels-photo-258154.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
      'https://images.pexels.com/photos/271639/pexels-photo-271639.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'https://images.pexels.com/photos/164595/pexels-photo-164595.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'https://images.pexels.com/photos/573552/pexels-photo-573552.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'
    ];
    return Container(
      height: 235,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [SizedBox(width: 20)]..addAll(
            dummyUrls
                .map(
                  (item) => Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.only(bottom: 30),
                    margin: EdgeInsets.only(right: 20),
                    child: FeaturedItemCardWidget(item),
                  ),
                )
                .toList(),
          ),
      ),
    );
  }
}

class Item {
  final String url;
  final String month;

  Item(this.url, this.month);
}
