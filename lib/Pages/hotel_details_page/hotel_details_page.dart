import 'package:flutter/material.dart';
import 'package:happy_trip/common/tags/item_tags.dart';
import 'package:happy_trip/common/tags/tags.dart';

enum RoomChoiceType { roomOnly, bedAndBreakfast }

final Map<RoomChoiceType, String> roomChoiceTypeTypeStrings = {
  RoomChoiceType.roomOnly: 'Room Only',
  RoomChoiceType.bedAndBreakfast: 'Bed and Breakfast',
};

class HotelDetailsPage extends StatefulWidget {
  @override
  _HotelDetailsPageState createState() => _HotelDetailsPageState();
}

class _HotelDetailsPageState extends State<HotelDetailsPage> {
  final scrollController = ScrollController();
  int _transparency = 0;
  RoomChoiceType _roomChoiceType = RoomChoiceType.roomOnly;
  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();
  final GlobalKey<TagsState> _tagStateKey1 = GlobalKey<TagsState>();

  @override
  Widget build(BuildContext context) {
    final double upperBound = 350 * 0.9;
    final double lowerBound = 350 * 0.8;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            controller: scrollController,
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                floating: false,
                snap: false,
                centerTitle: true,
                stretch: true,
                backgroundColor: Colors.white,
                title: AnimatedBuilder(
                  animation: scrollController,
                  builder: (context, snapshot) {
                    final double offset = scrollController.offset;

                    if (offset >= lowerBound && offset <= upperBound) {
                      double ratio = (offset - lowerBound) / (upperBound - lowerBound);
                      _transparency = (255 * ratio).floor();
                    } else if (offset > upperBound && (_transparency != 255)) {
                      _transparency = 255;
                    } else if (offset < lowerBound && (_transparency != 255)) {
                      _transparency = 0;
                    }

                    return Text(
                      'Burj Al Arab',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: (_transparency / 255) == 0 ? Colors.white : Color(0xff42436A),
                        height: 1.2,
                        fontFamily: "GoogleSans",
                      ),
                    );
                  },
                ),
                leading: AnimatedBuilder(
                  animation: scrollController,
                  builder: (context, snapshot) {
                    final double offset = scrollController.offset;

                    if (offset >= lowerBound && offset <= upperBound) {
                      double ratio = (offset - lowerBound) / (upperBound - lowerBound);
                      _transparency = (255 * ratio).floor();
                    } else if (offset > upperBound && (_transparency != 255)) {
                      _transparency = 255;
                    } else if (offset < lowerBound && (_transparency != 255)) {
                      _transparency = 0;
                    }

                    return Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        child: Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Image.asset(
                            'assets/images/back_button.png',
                            color: (_transparency / 255) == 0 ? Colors.white : Color(0xff42436A),
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                ),
                actions: <Widget>[
                  AnimatedBuilder(
                    animation: scrollController,
                    builder: (context, snapshot) {
                      final double offset = scrollController.offset;

                      if (offset >= lowerBound && offset <= upperBound) {
                        double ratio = (offset - lowerBound) / (upperBound - lowerBound);
                        _transparency = (255 * ratio).floor();
                      } else if (offset > upperBound && (_transparency != 255)) {
                        _transparency = 255;
                      } else if (offset < lowerBound && (_transparency != 255)) {
                        _transparency = 0;
                      }

                      return Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          child: Container(
                            padding: EdgeInsets.only(right: 20),
                            child: Image.asset(
                              'assets/images/share.png',
                              color: (_transparency / 255) == 0 ? Colors.white : Color(0xff42436A),
                            ),
                          ),
                          onTap: () {},
                        ),
                      );
                    },
                  )
                ],
                expandedHeight: 350 - MediaQuery.of(context).padding.top,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    children: <Widget>[
                      ClipRect(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0x22484848),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://images.pexels.com/photos/258154/pexels-photo-258154.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.8),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20, bottom: 55),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 40,
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                'FAMILY FRIENDLY',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontFamily: "GoogleSans",
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Burj Al Arab Hotel, Dubai',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: "GoogleSans",
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: <Widget>[
                                _buildRatingStar(),
                                Text(
                                  '(Write Review)',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontFamily: "GoogleSans",
                                  ),
                                ),
                                Spacer(),
                                Image.asset(
                                  'assets/images/favorite.png',
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildHotelBookingDetails(),
                          _buildHotelGallery(),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: _buildTags(
                              hashtags: [
                                'Double Bed',
                                'Or 2 Twin Beds',
                                'Sea View',
                                'Minibar',
                                'Size 45 M²',
                                'Air Conditioning'
                              ],
                              images: ['bed', 'twin_beds', 'sea_view', 'minibar', 'size', 'ac'],
                              tagStateKey: _tagStateKey,
                            ),
                          ),
                          SizedBox(height: 50),
                          _buildRoomChoices(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          roundedEdgeWidget(350),
        ],
      ),
    );
  }

  Widget roundedEdgeWidget(double bannerHeight) {
    int transparency = 0;
    return AnimatedBuilder(
      animation: scrollController,
      builder: (context, snapshot) {
        double offset = scrollController.offset;

        transparency = setTransparency(bannerHeight, offset, transparency);

        return Positioned(
          top: 350 - scrollController.offset - 40 + 1,
          child: Opacity(
            opacity: 1 - (transparency / 255),
            child: IgnorePointer(
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  int setTransparency(double bannerHeight, double offset, int currentTransparency) {
    final double upperBound = bannerHeight * 0.9;
    final double lowerBound = bannerHeight * 0.8;
    if (offset >= lowerBound && offset <= upperBound) {
      double ratio = (offset - lowerBound) / (upperBound - lowerBound);
      return (255 * ratio).floor();
    } else if (offset > upperBound && (currentTransparency != 255)) {
      return 255;
    } else if (offset < lowerBound && (currentTransparency != 255)) {
      return 0;
    }

    return 255;
  }

  Widget _buildHotelBookingDetails() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Citymax Hotel Bur Dubai',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color(0xff42436A),
              height: 1.2,
              fontFamily: "GoogleSans",
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Image.asset(
                'assets/images/big_map_pin.png',
              ),
              SizedBox(width: 8),
              Text(
                'Jumeirah P.O. Box 75157 , UAE',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xff42436A),
                  fontFamily: "GoogleSans",
                ),
                textAlign: TextAlign.left,
              )
            ],
          ),
          SizedBox(height: 14),
          Text(
            'Kuwait Street And Mankhool Road, Al Mankhool, Bur Dubai, Dubai, United Arab Emirates, Pincode- 0 Dubai United Arab Emirates',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xff8D91A2),
              height: 1.5,
              fontFamily: "GoogleSans",
              letterSpacing: 0.3,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 30),
          Container(
            height: 45,
            child: Row(
              children: <Widget>[
                Container(
                  width: (MediaQuery.of(context).size.width - 70) / 2,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22.5),
                    color: Color(0xff5808D8).withOpacity(0.1),
                  ),
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    'View on Map',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xff5808D8),
                      fontFamily: "GoogleSans",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 15),
                Container(
                  width: (MediaQuery.of(context).size.width - 40) / 2,
                  height: 45,
                  alignment: AlignmentDirectional.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Color(0xff1CCF3D),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          '9.0',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: "GoogleSans",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Excellent',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0xff1CCF3D),
                              fontFamily: "GoogleSans",
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            '130556 Review',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color(0xff42436A),
                              fontFamily: "GoogleSans",
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 75,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 10,
                  offset: Offset(0, 0),
                  spreadRadius: 2,
                )
              ],
            ),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 18),
                    Text(
                      ' SAR 629  ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                        color: Color(0xffFF1E74),
                        fontFamily: "GoogleSans",
                        decoration: TextDecoration.lineThrough,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'SAR 599',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: Color(0xff5808D8),
                            fontFamily: "GoogleSans",
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(width: 6),
                        Container(
                          height: 24,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Color(0xffFF1E74),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            '-23%',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.white,
                              fontFamily: "GoogleSans",
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 110,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Color(0xffFF1E74).withOpacity(0.06),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    'Save 105 SAR',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Color(0xffFF1E74),
                      fontFamily: "GoogleSans",
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0xffEBECF0).withOpacity(0.1),
              border: Border.all(
                color: Color(0xff42436A).withOpacity(0.1),
                width: 2,
              ),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 18),
                  width: (MediaQuery.of(context).size.width - 46) / 2,
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/calendar.png',
                      ),
                      SizedBox(width: 14),
                      Text(
                        'April 11, 2019',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xff42436A).withOpacity(0.78),
                          fontFamily: "GoogleSans",
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 2,
                  color: Color(0xff42436A).withOpacity(0.1),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width - 46) / 2,
                  padding: EdgeInsets.only(left: 18),
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/calendar.png',
                      ),
                      SizedBox(width: 14),
                      Text(
                        'April 13, 2019',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xff42436A).withOpacity(0.78),
                          fontFamily: "GoogleSans",
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Container(
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0xffEBECF0).withOpacity(0.1),
              border: Border.all(
                color: Color(0xff42436A).withOpacity(0.1),
                width: 2,
              ),
            ),
            padding: EdgeInsets.only(left: 18, right: 18),
            child: Row(
              children: <Widget>[
                Image.asset(
                  'assets/images/profile_tab.png',
                ),
                SizedBox(width: 14),
                Text(
                  '2 Guests',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xff42436A).withOpacity(0.78),
                    fontFamily: "GoogleSans",
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(width: 14),
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffFF1E74),
                  ),
                ),
                SizedBox(width: 14),
                Text(
                  '1 Room',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xff42436A).withOpacity(0.78),
                    fontFamily: "GoogleSans",
                  ),
                  textAlign: TextAlign.left,
                ),
                Expanded(
                  child: Container(),
                ),
                Image.asset(
                  'assets/images/down_arrow.png',
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Container(
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0xffEBECF0).withOpacity(0.1),
              border: Border.all(
                color: Color(0xff42436A).withOpacity(0.1),
                width: 2,
              ),
            ),
            padding: EdgeInsets.only(left: 18, right: 18),
            child: Row(
              children: <Widget>[
                Image.asset(
                  'assets/images/bed.png',
                ),
                SizedBox(width: 14),
                Text(
                  '1 Standard Double or Twin',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xff42436A).withOpacity(0.78),
                    fontFamily: "GoogleSans",
                  ),
                  textAlign: TextAlign.left,
                ),
                Expanded(
                  child: Container(),
                ),
                Image.asset(
                  'assets/images/down_arrow.png',
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Container(
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xff4406D1),
                  Color(0xff8612EA),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff8612EA).withOpacity(0.25),
                  blurRadius: 10,
                  offset: Offset(0, 11),
                  spreadRadius: 2,
                )
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              'Book Now',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
                fontFamily: "GoogleSans",
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildHotelGallery() {
    List<String> dummyUrls = [
      'https://images.pexels.com/photos/258154/pexels-photo-258154.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
      'https://images.pexels.com/photos/271639/pexels-photo-271639.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'https://images.pexels.com/photos/164595/pexels-photo-164595.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'https://images.pexels.com/photos/573552/pexels-photo-573552.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'
    ];
    return Container(
      height: 150,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [SizedBox(width: 20)]..addAll(
            dummyUrls
                .map(
                  (item) => Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: _buildGalleryItem(item),
                  ),
                )
                .toList(),
          ),
      ),
    );
  }

  Widget _buildGalleryItem(String url) {
    return Container(
      height: 95,
      width: 110,
      margin: EdgeInsets.only(right: 22),
      decoration: BoxDecoration(
        color: Color(0x22484848),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10,
            offset: Offset(0, 0),
            spreadRadius: 2,
          )
        ],
        image: DecorationImage(
          image: NetworkImage(
            url ?? '',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildRoomChoices() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Room Choices',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color(0xff42436A),
              height: 1.2,
              fontFamily: "GoogleSans",
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 18),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.11),
                  blurRadius: 20,
                  offset: Offset(0, 20),
                  spreadRadius: 2,
                )
              ],
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: 170,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0x22484848),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://images.pexels.com/photos/3757055/pexels-photo-3757055.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 14, right: 14),
                        margin: EdgeInsets.only(left: 12, top: 10),
                        height: 32,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Color(0xff42436A).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Deluxe King',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color(0xff42436A),
                            fontFamily: "GoogleSans",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 30,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(width: 16),
                    _buildRoomChoiceOption(RoomChoiceType.roomOnly, onTap: () {
                      setState(() {
                        _roomChoiceType = RoomChoiceType.roomOnly;
                      });
                    }),
                    _buildRoomChoiceOption(RoomChoiceType.bedAndBreakfast, onTap: () {
                      setState(() {
                        _roomChoiceType = RoomChoiceType.bedAndBreakfast;
                      });
                    }),
                  ],
                ),
                SizedBox(height: 36),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: _buildTags(hashtags: [
                    'Double Bed',
                    'Or 2 Twin Beds',
                    'Sea View',
                    'Minibar',
                    'Size 45 M²',
                    'Air Conditioning'
                  ], images: [
                    'bed',
                    'twin_beds',
                    'sea_view',
                    'minibar',
                    'size',
                    'ac'
                  ], tagStateKey: _tagStateKey1),
                ),
                SizedBox(height: 30),
                _buildSubTitleText('Whats Included'),
                Container(
                  alignment: AlignmentDirectional.centerStart,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    'Room Only',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xff5808D8),
                      fontFamily: "GoogleSans",
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  alignment: AlignmentDirectional.centerStart,
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff1CCF3D),
                        ),
                      ),
                      SizedBox(width: 11),
                      Text(
                        'Non Refundable',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Color(0xff42436A),
                          fontFamily: "GoogleSans",
                          decoration: TextDecoration.underline,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(width: 8),
                      Image.asset(
                        'assets/images/info.png',
                      ),
                      SizedBox(width: 18),
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff1CCF3D),
                        ),
                      ),
                      SizedBox(width: 11),
                      Text(
                        'Room Only',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Color(0xff42436A),
                          fontFamily: "GoogleSans",
                          decoration: TextDecoration.underline,
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                _buildSubTitleText('Total For Stay'),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            ' SAR 629  ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              color: Color(0xffFF1E74),
                              fontFamily: "GoogleSans",
                              decoration: TextDecoration.lineThrough,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'SAR 599',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                  color: Color(0xff5808D8),
                                  fontFamily: "GoogleSans",
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(width: 6),
                              Container(
                                height: 24,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Color(0xffFF1E74),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                alignment: AlignmentDirectional.center,
                                child: Text(
                                  '-23%',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontFamily: "GoogleSans",
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Align(
                        child: Container(
                          width: 110,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Color(0xffFF1E74).withOpacity(0.06),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            'Save 105 SAR',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Color(0xffFF1E74),
                              fontFamily: "GoogleSans",
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 45,
                  margin: EdgeInsets.only(top: 20, bottom: 30, left: 24, right: 24),
                  decoration: BoxDecoration(
                    color: Color(0xff1CCF3D),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    'Book Now',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                      fontFamily: "GoogleSans",
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildRoomChoiceOption(RoomChoiceType type, {Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 52,
        width: (MediaQuery.of(context).size.width - 80) / 2,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: _roomChoiceType == type ? Color(0xff5808D8).withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Text(
          roomChoiceTypeTypeStrings[type],
          style: TextStyle(
            color: _roomChoiceType == type ? Color(0xff5808D8) : Color(0xff42436A),
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: "GoogleSans",
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ),
    );
  }

  Widget _buildSubTitleText(String text) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 20),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Color(0xff42436A),
          fontFamily: "GoogleSans",
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _buildTags({List<String> hashtags, List<String> images, Key tagStateKey}) {
    return Tags(
      key: tagStateKey,
      alignment: WrapAlignment.start,
      itemCount: hashtags.toList().length,
      spacing: 14,
      itemBuilder: (index) {
        final itemTag = hashtags.toList()[index];
        return ItemTags(
          key: Key(index.toString()),
          index: index,
          title: itemTag ?? '',
          pressEnabled: true,
          textColor: Color(0xff42436A).withOpacity(0.77),
          textActiveColor: Color(0xff42436A).withOpacity(0.77),
          color: Colors.white,
          activeColor: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Color(0xff42436A).withOpacity(0.1), width: 1.5),
          combine: ItemTagsCombine.withTextAfter,
          image: ItemTagsImage(
            padding: EdgeInsets.only(right: 12),
            child: Image.asset(
              'assets/images/${images[index]}.png',
            ),
          ),
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 10,
            bottom: 10,
          ),
          textStyle: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14,
            color: Color(0xff42436A).withOpacity(0.77),
            fontFamily: "GoogleSans",
          ),
          onRemoved: () {},
          onPressed: (item) => {},
        );
      },
    );
  }

  Widget _buildRatingStar() {
    return Row(
      children: [0, 1, 2, 3, 4]
          .map(
            (_) => Container(
              height: 12,
              width: 12,
              margin: EdgeInsets.only(right: 5),
              child: Image.asset(
                'assets/images/big_star.png',
                color: Color(0xffFB9400),
                height: 12,
                width: 12,
              ),
            ),
          )
          .toList(),
    );
  }
}
