import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_trip/Pages/hotel_details_page/hotel_details_page.dart';
import 'package:happy_trip/common/global.dart';

class FeaturedItemCardWidget extends StatefulWidget {
  final String imageUrl;
  FeaturedItemCardWidget(this.imageUrl);

  @override
  _FeaturedItemCardWidgetState createState() => _FeaturedItemCardWidgetState();
}

class _FeaturedItemCardWidgetState extends State<FeaturedItemCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, NoAnimationMaterialPageRoute(builder: (context) => HotelDetailsPage()));
      },
      child: Container(
        height: 205,
        width: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.10),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            )
          ],
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0x22484848),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    widget.imageUrl ?? '',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  _buildGradientView(),
                  _priceBadge(),
                  _buildRating(),
                ],
              ),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.only(left: 8, right: 8),
              width: double.infinity,
              child: Text(
                'Citymax Hotel',
                style: TextStyle(
                  color: Color(0xff42436A),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: "GoogleSans",
                ),
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.only(left: 8, right: 8),
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 16,
                    width: 13,
                    child: Image.asset(
                      'assets/images/map-pin.png',
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Bur Dubai',
                    style: TextStyle(
                      color: Color(0xff42436A).withOpacity(0.44),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: "GoogleSans",
                    ),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _priceBadge() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.only(top: 4, left: 4),
        height: 25,
        width: 55,
        decoration: BoxDecoration(
          color: Color(0xffFF1E74),
          borderRadius: BorderRadius.circular(13),
        ),
        alignment: Alignment.center,
        child: Text(
          '\$1999',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: "GoogleSans",
          ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    );
  }

  Widget _buildGradientView() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black,
              Colors.transparent,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRating() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
        child: Row(
          children: <Widget>[
            _buildRatingStar(),
            Spacer(),
            Text(
              '6 Nights',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontFamily: "GoogleSans",
              ),
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingStar() {
    return Row(
      children: [0, 1, 2, 3, 4]
          .map(
            (_) => Container(
              height: 9,
              width: 9,
              margin: EdgeInsets.only(right: 2.2),
              child: Image.asset(
                'assets/images/star.png',
              ),
            ),
          )
          .toList(),
    );
  }
}
