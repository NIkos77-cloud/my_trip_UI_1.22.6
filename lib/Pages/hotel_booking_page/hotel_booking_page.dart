import 'package:flutter/material.dart';
import 'package:happy_trip/common/screenutil.dart';

class HotelBookingPage extends StatefulWidget {
  @override
  _HotelBookingPageState createState() => _HotelBookingPageState();
}

class _HotelBookingPageState extends State<HotelBookingPage> {
  Size _size;

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
          ),
        ),
        title: Text(
          'Your Booking',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xff42436A),
            fontFamily: "GoogleSans",
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffF1F4FB),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffF1F4FB),
          child: Column(
            children: <Widget>[
              _buildBookingConfirmedBar(),
              _buildConfirmationIds(),
              _buildHotelConfirmationDetails(),
              _buildFinalReceipt(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBookingConfirmedBar() {
    return Container(
      height: 46,
      width: double.infinity,
      color: Color(0xff1CCF3D),
      alignment: Alignment.center,
      child: Text(
        'Booking Confirmed',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.white,
          fontFamily: "GoogleSans",
        ),
      ),
    );
  }

  Widget _buildConfirmationIds() {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: <Widget>[
          _buildTitleAndDetails('Happy Trip Id', 'HT323323232', titleFontWeight: FontWeight.bold),
          SizedBox(height: 14),
          _buildTitleAndDetails('Confirmation#', 'HTL196529', titleFontWeight: FontWeight.bold),
        ],
      ),
    );
  }

  Widget _buildHotelConfirmationDetails() {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff8612EA),
                    Color(0xff4406D1),
                  ],
                ),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    height: 75,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color(0x22484848),
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://images.pexels.com/photos/189296/pexels-photo-189296.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Burj Al Arab Hotel, Dubai',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: "GoogleSans",
                        ),
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(height: 8),
                      _buildRatingStar(),
                      SizedBox(height: 8),
                      Row(
                        children: <Widget>[
                          Container(
                            height: 12,
                            width: 9,
                            child: Image.asset(
                              'assets/images/map-pin.png',
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Bur Dubai',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: "GoogleSans",
                            ),
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
            child: Column(
              children: <Widget>[
                _buildTitleAndDetails('Not from residence', '2 Adults'),
                SizedBox(height: 18),
                _buildTitleAndDetails('Number Of Nights', '1 Night'),
                SizedBox(height: 10),
                _buildTitleAndDetails('Check-in', '29-09-2018'),
                SizedBox(height: 10),
                _buildTitleAndDetails('Check-Out', '27-09-2018'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFinalReceipt() {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitleAndDetails('Cancellation Policy', 'Non- Refundable', titleFontWeight: FontWeight.bold),
          SizedBox(height: 14),
          _buildTitleAndDetails('HTL88', 'SAR - 32.79', titleFontWeight: FontWeight.bold),
          SizedBox(height: 20),
          Text(
            'NOT INCLUDED',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Color(0xff42436A).withOpacity(0.5),
              fontFamily: "GoogleSans",
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 14),
          Row(
            children: <Widget>[
              Text(
                'Tourism Fees',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff42436A),
                  fontFamily: "GoogleSans",
                ),
                textAlign: TextAlign.left,
              ),
              Spacer(),
              Text(
                'AED 20.00',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff42436A),
                  fontFamily: "GoogleSans",
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          SizedBox(height: 2),
          Row(
            children: <Widget>[
              Text(
                '(Pay at the property)',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff42436A).withOpacity(0.5),
                  fontFamily: "GoogleSans",
                ),
                textAlign: TextAlign.left,
              ),
              Spacer(),
              Text(
                'AED 20.00/ Per Room / Night',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff42436A).withOpacity(0.5),
                  fontFamily: "GoogleSans",
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          SizedBox(height: 48),
          Container(
            height: 1,
            color: Color(0xff42436A).withOpacity(0.1),
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text(
                'TOTAL',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff42436A),
                  fontFamily: "GoogleSans",
                ),
                textAlign: TextAlign.left,
              ),
              Spacer(),
              Text(
                'SAR 377.07',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff5808D8),
                  fontFamily: "GoogleSans",
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          Text(
            '(Incl.Tax)',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.normal,
              color: Color(0xff42436A).withOpacity(0.5),
              fontFamily: "GoogleSans",
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget _buildTitleAndDetails(String titleText, String detailsText, {FontWeight titleFontWeight = FontWeight.w500}) {
    return Row(
      children: <Widget>[
        Text(
          titleText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: titleFontWeight,
            color: Color(0xff42436A),
            fontFamily: "GoogleSans",
          ),
          textAlign: TextAlign.left,
        ),
        Spacer(),
        Text(
          detailsText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Color(0xff42436A),
            fontFamily: "GoogleSans",
          ),
          textAlign: TextAlign.right,
        ),
      ],
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
