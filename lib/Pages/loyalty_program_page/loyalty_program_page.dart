import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_trip/common/dashed_rect.dart';
import 'package:happy_trip/common/screenutil.dart';

enum NightServiceType { collectedNights, freeNights, membershipActivity }

final Map<NightServiceType, String> nightServiceTypeStrings = {
  NightServiceType.collectedNights: 'Collected\nNights',
  NightServiceType.freeNights: 'Free\nNights',
  NightServiceType.membershipActivity: 'Your Membership\nActivity',
};

class LoyaltyProgramPage extends StatefulWidget {
  @override
  _LoyaltyProgramPageState createState() => _LoyaltyProgramPageState();
}

class _LoyaltyProgramPageState extends State<LoyaltyProgramPage> {
  Size _size;
  NightServiceType _nightServiceType = NightServiceType.collectedNights;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xffF1F4FB),
      appBar: AppBar(
        backgroundColor: Color(0xff4406D1),
        elevation: 0.0,
        title: Text(
          'Loyalty Program',
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil.getHorizontalPixel(_size, 20),
            fontWeight: FontWeight.bold,
            fontFamily: "GoogleSans",
          ),
          textAlign: TextAlign.center,
        ),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
                  child: Padding(
            padding: EdgeInsets.only(left: ScreenUtil.getResponsiveWidthOfWidget(12, _size.width)),
            child: Image.asset("assets/images/back_button.png", color: Colors.white),
          ),
        ),
        actions: <Widget>[
          Container(
            child: Image.asset("assets/images/nav_bar_list.png", color: Colors.white),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: ScreenUtil.getResponsiveHeightOfWidget((_size.height / 2).toInt() - 100, _size.width),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff4406D1),
                  Color(0xff8612EA),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(23),
                  ),
                  margin: EdgeInsets.only(
                    left: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
                    right: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
                    top: ScreenUtil.getResponsiveWidthOfWidget(15, _size.width),
                  ),
                  padding: EdgeInsets.only(
                    left: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
                    right: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
                  ),
                  child: _buildMembershipDetails(),
                ),
                SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(24, _size.width)),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(23),
                  ),
                  margin: EdgeInsets.only(
                    left: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
                    right: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
                  ),
                  padding: EdgeInsets.only(
                    left: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
                    right: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
                  ),
                  child: _buildBookingService(),
                ),
                SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(40, _size.width)),
                Container(
                  width: double.infinity,
                  color: Color(0xffF1F4FB),
                  padding: EdgeInsets.only(
                    left: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
                    right: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
                  ),
                  child: _buildGotAQuestion(),
                ),
                SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(80, _size.width)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMembershipDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(30, _size.width)),
        Text(
          'Ramonyv',
          style: TextStyle(
            color: Color(0xff42436A),
            fontSize: ScreenUtil.getHorizontalPixel(_size, 26),
            fontWeight: FontWeight.bold,
            fontFamily: "GoogleSans",
          ),
          textAlign: TextAlign.left,
        ),
        Text(
          'www.happytrips.com',
          style: TextStyle(
            color: Color(0xff42436A),
            fontSize: ScreenUtil.getHorizontalPixel(_size, 17),
            fontWeight: FontWeight.normal,
            fontFamily: "GoogleSans",
          ),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(30, _size.width)),
        Text(
          'Membership details',
          style: TextStyle(
            color: Color(0xff42436A),
            fontSize: ScreenUtil.getHorizontalPixel(_size, 14),
            fontWeight: FontWeight.bold,
            fontFamily: "GoogleSans",
          ),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(15, _size.width)),
        _buildMemberPlusDetailsItem(
            'memberplus_card', 'Membership number:', '94527876', Color(0xffFF1E74).withOpacity(0.12)),
        SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(26, _size.width)),
        _buildMemberPlusDetailsItem('current_membership', 'Current membership:', 'Apr 8, 2019 to Apr 8, 2020',
            Color(0xff00D8FD).withOpacity(0.12)),
        SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(26, _size.width)),
        _buildMemberPlusDetailsItem(
            'night_redeemed', 'Last collected or redeemed nights on:', '8 Nights', Color(0xffB14AFD).withOpacity(0.12)),
        SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(35, _size.width)),
        _buildSeprator(),
        SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(30, _size.width)),
        Text(
          'Your  Collected Nights',
          style: TextStyle(
            color: Color(0xff42436A),
            fontSize: ScreenUtil.getHorizontalPixel(_size, 14),
            fontWeight: FontWeight.bold,
            fontFamily: "GoogleSans",
          ),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(30, _size.width)),
        _buildCollectedNightsCard(),
        SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(36, _size.width)),
      ],
    );
  }

  Widget _buildMemberPlusDetailsItem(String imageName, String title, String subTitle, Color backgroundColor) {
    return Row(
      children: <Widget>[
        Container(
          height: ScreenUtil.getResponsiveHeightOfWidget(38, _size.width),
          width: ScreenUtil.getResponsiveHeightOfWidget(38, _size.width),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
          ),
          alignment: AlignmentDirectional.center,
          child: Image.asset("assets/images/$imageName.png"),
        ),
        SizedBox(width: ScreenUtil.getResponsiveWidthOfWidget(8, _size.width)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: Color(0xff42436A).withOpacity(0.5),
                fontSize: ScreenUtil.getHorizontalPixel(_size, 14),
                fontWeight: FontWeight.normal,
                fontFamily: "GoogleSans",
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              subTitle,
              style: TextStyle(
                color: Color(0xff42436A),
                fontSize: ScreenUtil.getHorizontalPixel(_size, 14),
                fontWeight: FontWeight.bold,
                fontFamily: "GoogleSans",
              ),
              textAlign: TextAlign.left,
            ),
          ],
        )
      ],
    );
  }

  Widget _buildSeprator() {
    return Container(
      height: 1,
      color: Color(0xff42436A).withOpacity(0.1),
    );
  }

  Widget _buildCollectedNightsCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffF1F4FB).withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.only(
        left: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
        right: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(30, _size.width)),
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      _buildSelectedDayItem('1'),
                      SizedBox(width: ScreenUtil.getResponsiveWidthOfWidget(8, _size.width)),
                      _buildSelectedDayItem('2'),
                      SizedBox(width: ScreenUtil.getResponsiveWidthOfWidget(8, _size.width)),
                      _buildSelectedDayItem('3'),
                      SizedBox(width: ScreenUtil.getResponsiveWidthOfWidget(8, _size.width)),
                      _buildSelectedDayItem('4'),
                      SizedBox(width: ScreenUtil.getResponsiveWidthOfWidget(8, _size.width)),
                      _buildDayItem('5'),
                    ],
                  ),
                  SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(6, _size.width)),
                  Container(
                    width: 210,
                    child: DashedRect(
                      color: Color(0xff5808D8).withOpacity(0.3),
                      strokeWidth: 1.0,
                      gap: 5.0,
                    ),
                  ),
                  SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(6, _size.width)),
                  Row(
                    children: <Widget>[
                      _buildDayItem('6'),
                      SizedBox(width: ScreenUtil.getResponsiveWidthOfWidget(8, _size.width)),
                      _buildDayItem('7'),
                      SizedBox(width: ScreenUtil.getResponsiveWidthOfWidget(8, _size.width)),
                      _buildDayItem('8'),
                      SizedBox(width: ScreenUtil.getResponsiveWidthOfWidget(8, _size.width)),
                      _buildDayItem('9'),
                      SizedBox(width: ScreenUtil.getResponsiveWidthOfWidget(8, _size.width)),
                      _buildDayItem('10'),
                    ],
                  ),
                ],
              ),
              _buildDayBigItem('1'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(22, _size.width)),
              Text(
                'Collect 10 nights',
                style: TextStyle(
                  color: Color(0xff42436A),
                  fontSize: ScreenUtil.getHorizontalPixel(_size, 23),
                  fontWeight: FontWeight.normal,
                  fontFamily: "GoogleSans",
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(6, _size.width)),
              Row(
                children: <Widget>[
                  Text(
                    'Get 1 Night Free',
                    style: TextStyle(
                      color: Color(0xff5808D8),
                      fontSize: ScreenUtil.getHorizontalPixel(_size, 12),
                      fontWeight: FontWeight.bold,
                      fontFamily: "GoogleSans",
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(width: ScreenUtil.getResponsiveWidthOfWidget(3, _size.width)),
                  Image.asset("assets/images/right_arrow_icon.png")
                ],
              ),
            ],
          ),
          SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(10, _size.width)),
          Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              color: Color(0xff1CCF3D),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              'BOOK NOW',
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil.getHorizontalPixel(_size, 12),
                fontWeight: FontWeight.bold,
                fontFamily: "GoogleSans",
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(25, _size.width)),
        ],
      ),
    );
  }

  Widget _buildSelectedDayItem(String day) {
    return Container(
      height: ScreenUtil.getResponsiveHeightOfWidget(30, _size.width),
      width: ScreenUtil.getResponsiveHeightOfWidget(30, _size.width),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xff5808D8),
        image: DecorationImage(
          image: AssetImage("assets/images/premium_icon.png"),
        ),
      ),
      alignment: AlignmentDirectional.center,
      child: Text(
        day,
        style: TextStyle(
          color: Colors.white,
          fontSize: ScreenUtil.getHorizontalPixel(_size, 12),
          fontWeight: FontWeight.normal,
          fontFamily: "GoogleSans",
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDayItem(String day) {
    return Container(
      height: ScreenUtil.getResponsiveHeightOfWidget(30, _size.width),
      width: ScreenUtil.getResponsiveHeightOfWidget(30, _size.width),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Color(0xff5808D8).withOpacity(0.3),
          width: 1,
        ),
      ),
      alignment: AlignmentDirectional.center,
      child: Text(
        day,
        style: TextStyle(
          color: Color(0xff5808D8),
          fontSize: ScreenUtil.getHorizontalPixel(_size, 12),
          fontWeight: FontWeight.normal,
          fontFamily: "GoogleSans",
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDayBigItem(String day) {
    return Container(
      height: ScreenUtil.getResponsiveHeightOfWidget(63, _size.width),
      width: ScreenUtil.getResponsiveHeightOfWidget(63, _size.width),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Color(0xff5808D8).withOpacity(0.3),
          width: 8,
        ),
      ),
      alignment: AlignmentDirectional.center,
      child: Text(
        day,
        style: TextStyle(
          color: Color(0xff5808D8),
          fontSize: ScreenUtil.getHorizontalPixel(_size, 22),
          fontWeight: FontWeight.bold,
          fontFamily: "GoogleSans",
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildBookingService() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(28, _size.width)),
          Row(
            children: <Widget>[
              _buildNightCheckoutOption(NightServiceType.collectedNights, onTap: () {
                setState(() {
                  _nightServiceType = NightServiceType.collectedNights;
                });
              }),
              _buildNightCheckoutOption(NightServiceType.freeNights, onTap: () {
                setState(() {
                  _nightServiceType = NightServiceType.freeNights;
                });
              }),
              _buildNightCheckoutOption(NightServiceType.membershipActivity, onTap: () {
                setState(() {
                  _nightServiceType = NightServiceType.membershipActivity;
                });
              }),
            ],
          ),
          SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(36, _size.width)),
          Text(
            'Nights will appear in your\naccount up to 72 hours after you\ncheck out.',
            style: TextStyle(
              color: Color(0xff42436A),
              fontSize: ScreenUtil.getHorizontalPixel(_size, 16),
              fontWeight: FontWeight.bold,
              fontFamily: "GoogleSans",
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(8, _size.width)),
          Text(
            'Missing nights? Already booked but can’t see the nights you’ll collect? Add your booking to your account before your stay to collect nights. Find your booking',
            style: TextStyle(
                color: Color(0xff42436A).withOpacity(0.8),
                fontSize: ScreenUtil.getHorizontalPixel(_size, 14),
                fontWeight: FontWeight.normal,
                fontFamily: "GoogleSans",
                height: 1.5),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(40, _size.width)),
        ],
      ),
    );
  }

  Widget _buildNightCheckoutOption(NightServiceType type, {Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
          left: ScreenUtil.getResponsiveWidthOfWidget(18, _size.width),
          right: ScreenUtil.getResponsiveWidthOfWidget(18, _size.width),
        ),
        height: ScreenUtil.getResponsiveHeightOfWidget(60, _size.width),
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: _nightServiceType == type ? Color(0xffF1F4FB) : Colors.white,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Text(
          nightServiceTypeStrings[type],
          style: TextStyle(
            color: Color(0xff42436A),
            fontSize: ScreenUtil.getHorizontalPixel(_size, 11),
            fontWeight: FontWeight.bold,
            fontFamily: "GoogleSans",
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ),
    );
  }

  Widget _buildGotAQuestion() {
    return Container(
      margin: EdgeInsets.only(
        left: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
        right: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
        top: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Got a question?',
            style: TextStyle(
              color: Color(0xff42436A),
              fontSize: ScreenUtil.getHorizontalPixel(_size, 20),
              fontWeight: FontWeight.bold,
              fontFamily: "GoogleSans",
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(20, _size.width)),
          _buildQuestion('How do I collect nights?'),
          _buildQuestion('Where’s my missing night?'),
          _buildQuestion('How do I redeem nights?'),
          _buildQuestion('How do I unlock Secret Prices?'),
          _buildQuestion(
              'For answers to questions like these and more, check out our articles. They have all the information you need.'),
        ],
      ),
    );
  }

  Widget _buildQuestion(String questionText) {
    return Container(
      padding: EdgeInsets.only(
        left: ScreenUtil.getResponsiveWidthOfWidget(10, _size.width),
        right: ScreenUtil.getResponsiveWidthOfWidget(10, _size.width),
        bottom: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: _size.width - 150,
            child: Text(
              questionText,
              style: TextStyle(
                  color: Color(0xff42436A),
                  fontSize: ScreenUtil.getHorizontalPixel(_size, 14),
                  fontWeight: FontWeight.normal,
                  fontFamily: "GoogleSans",
                  height: 1.5),
              textAlign: TextAlign.left,
            ),
          ),
          Spacer(),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff5808D8).withOpacity(0.1),
            ),
            alignment: AlignmentDirectional.center,
            child: Image.asset("assets/images/plus_icon.png"),
          )
        ],
      ),
    );
  }
}
