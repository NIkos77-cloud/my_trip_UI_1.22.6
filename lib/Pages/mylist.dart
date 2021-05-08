import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:happy_trip/Pages/support_page.dart';
import 'package:happy_trip/common/global.dart';
import 'package:happy_trip/common/screenutil.dart';
import 'package:shimmer/shimmer.dart';

class Mylist extends StatefulWidget {
  @override
  _MylistState createState() => _MylistState();
}

class _MylistState extends State<Mylist> {
  List<String> dummyUrls = [];
  Size _size;
  int selectedindex = 1;
  bool selectedgrid = false;
  var dialogsize;
  @override
  void initState() {
    dummyUrls = [
      'https://images.pexels.com/photos/258154/pexels-photo-258154.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
      'https://images.pexels.com/photos/271639/pexels-photo-271639.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'https://images.pexels.com/photos/164595/pexels-photo-164595.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'https://images.pexels.com/photos/573552/pexels-photo-573552.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'https://static2.tripoto.com/media/filter/nl/img/67758/TripDocument/1520839937_img_0915.jpg'
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    dialogsize = MediaQuery.of(context).size.height / 2.1;
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
                      Navigator.push(context, NoAnimationMaterialPageRoute(builder: (context) => SupportPage()));
                    },
                    child: Image.asset("assets/images/nav_bar_list.png")),
              ),
            ),
          ),
          title: Text(
            'My List',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff42436A)),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: selectedgrid ? Color(0xff42436A).withOpacity(0.8) : Color(0xffF1F4FB),
          elevation: 0.0,
        ),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                topcontainer(context),
                buildGridView(),
              ],
            ),
            selectedgrid
                ? Stack(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          selectedgrid = false;
                          setState(() {});
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(color: Color(0xff42436A).withOpacity(0.8)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 68),
                        child: Center(
                          child: Container(
                              height: dialogsize,
                              width: MediaQuery.of(context).size.width - 40,
                              decoration:
                                  BoxDecoration(color: Color(0xffFFFFFF), borderRadius: BorderRadius.circular(14.0)),
                              // Group4809.png
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        height: dialogsize / 2 + 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(14.0),
                                            topRight: Radius.circular(14.0),
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: new BorderRadius.only(
                                            topLeft: Radius.circular(14.0),
                                            topRight: Radius.circular(14.0),
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                'https://images.pexels.com/photos/258154/pexels-photo-258154.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) => Shimmer.fromColors(
                                                baseColor: Colors.grey[200],
                                                highlightColor: Colors.grey[300],
                                                child: Container(
                                                  width: MediaQuery.of(context).size.width - 40,
                                                )),
                                            width: MediaQuery.of(context).size.width - 40,
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: dialogsize / 2 - 30,
                                        width: MediaQuery.of(context).size.width - 40,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 20.0, left: 20.0, right: 80.0, bottom: 10.0),
                                              child: Container(
                                                child: Text(
                                                  'Double Tree By Gilton Dubaii',
                                                  style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff42436A),
                                                    fontFamily: "GoogleSans",
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 2.0),
                                              child: Container(
                                                child: Text(
                                                  'Mon 29 -Tue 30 Apr 2019',
                                                  style: TextStyle(
                                                    fontSize: 19,
                                                    color: Color(0xffFF1E74),
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: "GoogleSans",
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 2.0),
                                              child: Text(
                                                'Dubai, United Arab Emirates',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff42436A).withOpacity(0.5),
                                                  fontFamily: "GoogleSans",
                                                ),
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Positioned(
                                    right: 15.0,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 60),
                                      child: Container(
                                        child: Image.asset('assets/images/Group4809.png'),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ],
                  )
                : Container()
          ],
        ));
  }

  magewid() {
    return Column(
      children: <Widget>[
        Container(
          child: Image.asset('assets/images/Path106.png'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Container(
            child: Image.asset('assets/images/Path107.png'),
          ),
        )
      ],
    );
  }

  magewid1() {
    return Column(
      children: <Widget>[
        Container(
          child: Image.asset('assets/images/Path105.png'),
        ),
      ],
    );
  }

  magewid2() {
    return Column(
      children: <Widget>[
        Container(
          child: Image.asset('assets/images/Path109.png'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Container(
            child: Image.asset('assets/images/Path108.png'),
          ),
        )
      ],
    );
  }

  Widget topcontainer(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 93,
            width: MediaQuery.of(context).size.width - 20,
            decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    selectedindex = 0;
                    setState(() {});
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3 - 13.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                      color: Color(0xffFFFFFF),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        magewid(),
                        Container(
                          child: Text(
                            'Coming Trip',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xff42436A)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    selectedindex = 1;
                    setState(() {});
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3 - 13.5,
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        magewid(),
                        Container(
                          child: Text(
                            'Future Trip',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xff42436A)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    selectedindex = 2;
                    setState(() {});
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3 - 13.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      color: Color(0xffFFFFFF),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        magewid2(),
                        Container(
                          child: Text(
                            'Previous Trip',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xff42436A)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        selectedindex == 1
            ? Padding(
                padding: const EdgeInsets.only(top: 13.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff8612EA),
                            Color(0xff4406D1),
                          ],
                        ),
                      ),
                      height: 104,
                      width: MediaQuery.of(context).size.width / 3 - 13.5,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          magewid1(),
                          Container(
                            child: Text(
                              'Future Trip',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xffFFFFFF)),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            : selectedindex == 0
                ? Padding(
                    padding: const EdgeInsets.only(top: 13.5, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff8612EA),
                                Color(0xff4406D1),
                              ],
                            ),
                          ),
                          height: 104,
                          width: MediaQuery.of(context).size.width / 3 - 13.5,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              magewid1(),
                              Container(
                                child: Text(
                                  'Coming Trip',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xffFFFFFF)),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 13.5, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff8612EA),
                                Color(0xff4406D1),
                              ],
                            ),
                          ),
                          height: 104,
                          width: MediaQuery.of(context).size.width / 3 - 13.5,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              magewid1(),
                              Container(
                                child: Text(
                                  'Previous Trip',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xffFFFFFF)),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
      ],
    );
  }

  Widget buildGridView() {
    return Expanded(
      child: GridView.count(
        physics: BouncingScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 175 / 220,
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        children: dummyUrls
            .map((item) => Container(
                  child: InkWell(
                    onTap: () {
                      selectedgrid = true;

                      setState(() {});
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      elevation: 6.0,
                      child: Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.height / 7.6,
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: new BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                                  ),
                                  child: item != ''
                                      ? CachedNetworkImage(
                                          imageUrl: item,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) => Shimmer.fromColors(
                                              baseColor: Colors.grey[200],
                                              highlightColor: Colors.grey[300],
                                              child: Container(
                                                width: MediaQuery.of(context).size.width - 60,
                                              )),
                                          width: MediaQuery.of(context).size.width - 60,
                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                        )
                                      : Shimmer(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: new BorderRadius.all(Radius.circular(10)),
                                              color: Colors.grey[200],
                                            ),
                                          ),
                                          gradient: null),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      'Double Tree By Gilton Dubaii',
                                      style: TextStyle(
                                          fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xff42436A)),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                                    child: Text(
                                      'Mon 29 -Tue 30 Apr 2019',
                                      style: TextStyle(fontSize: 12, color: Color(0xffFF1E74)),
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0),
                                    child: Text(
                                      'Dubai, United Arab Emirates',
                                      style: TextStyle(fontSize: 11, color: Color(0xff42436A)),
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
