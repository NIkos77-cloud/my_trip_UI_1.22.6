import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:happy_trip/common/screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HotellistingPage extends StatefulWidget {
  @override
  _HotellistingPageState createState() => _HotellistingPageState();
}

class _HotellistingPageState extends State<HotellistingPage> {
  Size _size;
  int flag = 0;
  List<dynamic> dummyUrls = [
    'https://images.pexels.com/photos/258154/pexels-photo-258154.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
    'https://images.pexels.com/photos/271639/pexels-photo-271639.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    'https://images.pexels.com/photos/164595/pexels-photo-164595.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    'https://images.pexels.com/photos/573552/pexels-photo-573552.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    'https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    'https://static2.tripoto.com/media/filter/nl/img/67758/TripDocument/1520839937_img_0915.jpg'
  ];
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
            trailing: Container(
              padding: EdgeInsets.only(right: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width)),
              child: GestureDetector(
                  onTap: () {
                    // Navigator.push(context, NoAnimationMaterialPageRoute(builder: (context) => HotellistingPage()));
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              overflow: Overflow.visible,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      color: Color(0xffFFFFFF),
                      child: Center(
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
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xffFFFFFF), Color(0xffF1F4FB)],
                          tileMode: TileMode.clamp,
                          stops: [0.5, 0.5],
                          end: Alignment.bottomCenter,
                          begin: Alignment.topCenter,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Card(
                          color: Color(0xffFFFFFF),
                          elevation: 0.6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 60,
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              height: 42.0,
                              width: MediaQuery.of(context).size.width - 60,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
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
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: dummyUrls.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(20.0),
                      height: 155,
                      color: index % 2 != 0 ? Color(0xffFFFFFF) : Color(0xffF1F4FB),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              height: 108,
                              width: 108.0,
                              decoration:
                                  BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.grey[200]),
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(10.0),
                                child: CachedNetworkImage(
                                  imageUrl: '${dummyUrls[index]}',
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Shimmer.fromColors(
                                      baseColor: Colors.grey[200],
                                      highlightColor: Colors.grey[300],
                                      child: Container(
                                        height: 108,
                                        width: 108.0,
                                      )),
                                  height: 108,
                                  width: 108.0,
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                              )),
                          Container(
                            width: MediaQuery.of(context).size.width - 170,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width - 170,
                                  child: Text(
                                    'Atlantis Hotel',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "GoogleSans",
                                        color: Color(0xff42436A)),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 2.0),
                                  width: MediaQuery.of(context).size.width - 170,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/mappin.png',
                                        height: 10.2,
                                        width: 8,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          'Dubai , UAE',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "GoogleSans",
                                              color: Color(0xff42436A)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 4),
                                  width: MediaQuery.of(context).size.width - 170,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                          width: MediaQuery.of(context).size.width / 3.5,
                                          child: Text(
                                              'This is elegant luxury hotel. this hotel is an 8-minute walk from.. ',
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "GoogleSans",
                                                color: Color(0xff42436A),
                                              ))),
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              child: Text(
                                                'SAR 629',
                                                style: TextStyle(
                                                    color: Color(0xffFF1E74),
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.w500,
                                                    decoration: TextDecoration.lineThrough),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 8.0),
                                              child: Container(
                                                width: 37.17,
                                                height: 22.81,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffFF1E74), borderRadius: BorderRadius.circular(5.0)),
                                                child: Container(
                                                  child: Center(
                                                      child: Text(
                                                    '-23%',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w500,
                                                        fontFamily: "GoogleSans"),
                                                  )),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        width: 75,
                                        height: 12,
                                        child: ListView.builder(
                                            physics: NeverScrollableScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 5,
                                            itemBuilder: (BuildContext context, int index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(right: 2.5),
                                                child: Container(
                                                    height: 12,
                                                    width: 12,
                                                    child: Image.asset('assets/images/active_start.png')),
                                              );
                                            }),
                                      ),
                                      Container(
                                        height: 29,
                                        width: 93,
                                        decoration: BoxDecoration(
                                            color: Color(0xff1CCF3D), borderRadius: BorderRadius.circular(20)),
                                        child: Center(
                                          child: Container(
                                            child: Text(
                                              '\$140/"Night',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "GoogleSans",
                                                  color: Color(0xffFFFFFF)),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
