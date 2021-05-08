import 'dart:io';

import 'package:flutter/material.dart';
import 'package:happy_trip/Pages/info_page.dart';
import 'package:happy_trip/Pages/loyalty_program_page/loyalty_program_page.dart';
import 'package:happy_trip/Pages/mylist.dart';
import 'package:happy_trip/Pages/verification.dart';
import 'package:happy_trip/common/global.dart';

class Myprofile extends StatefulWidget {
  @override
  _MyprofileState createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  List<dynamic> languages = ['English', 'Arabic', 'Spanish', 'French', 'German'];
  List<dynamic> currencies = ['AFN', 'EUR', 'EUR', 'XCD', 'SHP'];
  int flag = 0;
  int currencyflag = 0;
  int selectedlang = 0;
  int selectedcur = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.bottomCenter,
        overflow: Overflow.visible,
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 176,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/images/topback.png',
                      height: 176,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Container(
                    height: 176,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/images/myprofiletop.png',
                      height: 176,
                      width: MediaQuery.of(context).size.width,
                    ),
                  )
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    // color: Colors.grey,
                    height: 124,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/images/secondtop.png',
                      height: 124,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 18),
                          child: Container(
                            child: Text(
                              'Jonathan Yudee',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff42436A),
                                  fontFamily: "GoogleSans",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            child: Text(
                              'Travel Blogger',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff8D91A2),
                                fontFamily: "GoogleSans",
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 0.5,
                color: Color(0xff42436A).withOpacity(0.1),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffF5F8FE),
                ),
                child: Column(
                  children: <Widget>[
                    //_________________________________________home______________________________________________
                    InkWell(
                      onTap: (){
                        Navigator.push(context, NoAnimationMaterialPageRoute(builder: (context) => VerificationPage()));
                      },
                                          child: Container(
                        height: 57,
                        width: MediaQuery.of(context).size.width - 20,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Container(
                                child: Image.asset(
                                  'assets/images/profilehome.png',
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Container(
                                child: Text(
                                  'Home',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff42436A),
                                    fontFamily: "GoogleSans",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //_________________________________________home______________________________________________
                    //_________________________________________mymap______________________________________________
                    Container(
                      // color: Colors.grey,
                      height: 57,
                      width: MediaQuery.of(context).size.width - 20,
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Container(
                              child: Image.asset(
                                'assets/images/profilemap.png',
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Container(
                              child: Text(
                                'My Map',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff42436A),
                                  fontFamily: "GoogleSans",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //_________________________________________home______________________________________________
                    //_________________________________________my list______________________________________________
                    InkWell(
                      onTap: () {
                        Navigator.push(context, NoAnimationMaterialPageRoute(builder: (context) => Mylist()));
                      },
                      child: Container(
                        // color: Colors.grey,
                        height: 57,
                        width: MediaQuery.of(context).size.width - 20,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Container(
                                  child: Icon(
                                Icons.list,
                                color: Color(0xff42436A),
                                size: 25,
                              )
                                  //  Image.asset('assets/images/profilelist.png',height: 20,width:  22,),
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Container(
                                child: Text(
                                  'My List',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff42436A),
                                    fontFamily: "GoogleSans",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //_________________________________________home______________________________________________
                    //_________________________________________heart______________________________________________
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context, NoAnimationMaterialPageRoute(builder: (context) => LoyaltyProgramPage()));
                      },
                      child: Container(
                        // color: Colors.grey,
                        height: 57,
                        width: MediaQuery.of(context).size.width - 20,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Container(
                                child: Image.asset(
                                  'assets/images/profileheart.png',
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Container(
                                child: Text(
                                  'Loyalty Programmer',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff42436A),
                                    fontFamily: "GoogleSans",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //_________________________________________home______________________________________________
                    //_________________________________________recent searches______________________________________________
                    InkWell(
                      onTap: () {
                        Navigator.push(context, NoAnimationMaterialPageRoute(builder: (context) => InfoPage()));
                      },
                      child: Container(
                        // color: Colo  rs.grey,
                        height: 57,
                        width: MediaQuery.of(context).size.width - 20,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Container(
                                child: Image.asset(
                                  'assets/images/profilestar.png',
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Container(
                                child: Text(
                                  'My Reviews',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff42436A),
                                    fontFamily: "GoogleSans",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //_________________________________________home______________________________________________
                    //_________________________________________my review______________________________________________
                    GestureDetector(
                      child: Container(
                        // color: Colors.grey,
                        height: 57,
                        width: MediaQuery.of(context).size.width - 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _titleicon(),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Container(
                                  child: flag == 0
                                      ? Image.asset(
                                          'assets/images/naviarrow.png',
                                        )
                                      : Image.asset(
                                          'assets/images/downarrow.png',
                                        )
                                  //  Icon(Icons.arrow_drop_down,size: 30,color: Color(0xff42436A),),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        if (flag == 0) {
                          flag = 1;
                          setState(() {});
                        } else {
                          flag = 0;
                          setState(() {});
                        }
                      },
                    ),
                    flag == 1
                        ? langlist()
                        : Container(
                            height: 0,
                          ),
                    //_________________________________________home______________________________________________
                    //_________________________________________home______________________________________________
                    GestureDetector(
                      child: Container(
                        // color: Colors.grey,
                        height: 57,
                        width: MediaQuery.of(context).size.width - 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _currencylist(),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Container(
                                  child: currencyflag == 0
                                      ? Image.asset(
                                          'assets/images/naviarrow.png',
                                        )
                                      : Image.asset(
                                          'assets/images/downarrow.png',
                                        )
                                  //  Icon(Icons.arrow_drop_down,size: 30,color: Color(0xff42436A),),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        if (currencyflag == 0) {
                          currencyflag = 1;
                          setState(() {});
                        } else {
                          currencyflag = 0;
                          setState(() {});
                        }
                      },
                    ),
                    currencyflag == 1
                        ? currencylist()
                        : Container(
                            height: 0,
                          ),
                    //_________________________________________home______________________________________________
                    //_________________________________________home_____________________________________________
                    Container(
                      // color: Colors.grey,
                      height: 57,
                      width: MediaQuery.of(context).size.width - 20,
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Container(
                              child: Image.asset(
                                'assets/images/profilepowerlogout.png',
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Container(
                                child: Text(
                              'Sign Out',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff5808D8),
                                  fontFamily: "GoogleSans",
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height == 812.0 ||
                    (MediaQuery.of(context).size.height >= 812.0 && MediaQuery.of(context).size.height <= 896.0) &&
                        Platform.isIOS
                ? MediaQuery.of(context).size.height / 6.6
                : MediaQuery.of(context).size.height / 5.8,
            child: Container(
              height: 83,
              width: 83,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 100),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  height: 78,
                  width: 75,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  topwidget() {}

  _titleicon() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Container(
            child: Image.asset(
              'assets/images/profilelang.png',
              height: 20,
              width: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Container(
            child: Text(
              'Change Language',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff42436A),
                fontFamily: "GoogleSans",
              ),
            ),
          ),
        ),
      ],
    );
  }

  _currencylist() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Container(
            child: Image.asset(
              'assets/images/profilecurrency.png',
              height: 20,
              width: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Container(
            child: Text(
              'Change Currency',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff42436A),
                fontFamily: "GoogleSans",
              ),
            ),
          ),
        ),
      ],
    );
  }

  langlist() {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        itemCount: languages.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: GestureDetector(
              child: Container(
                height: 45,
                color: selectedlang == index ? Color(0xffFFFFFF) : Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Container(
                        child: Text(
                          '${languages[index]}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff42436A),
                            fontFamily: "GoogleSans",
                          ),
                        ),
                      ),
                    ),
                    selectedlang == index
                        ? Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Image.asset('assets/images/selectedlanguage.png'))
                        : Container(),
                  ],
                ),
              ),
              onTap: () {
                selectedlang = index;
                setState(() {});
              },
            ),
          );
        });
  }

  currencylist() {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        itemCount: currencies.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: GestureDetector(
              child: Container(
                height: 45,
                color: selectedcur == index ? Color(0xffFFFFFF) : Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Container(
                        child: Text(
                          '${currencies[index]}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff42436A),
                            fontFamily: "GoogleSans",
                          ),
                        ),
                      ),
                    ),
                    selectedcur == index
                        ? Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Image.asset('assets/images/selectedlanguage.png'))
                        : Container(),
                  ],
                ),
              ),
              onTap: () {
                selectedcur = index;
                setState(() {});
              },
            ),
          );
        });
  }
}
