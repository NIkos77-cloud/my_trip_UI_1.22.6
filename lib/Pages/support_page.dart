import 'package:flutter/material.dart';
import 'package:happy_trip/Pages/search_page.dart';
import 'package:happy_trip/common/global.dart';
import 'package:happy_trip/common/screenutil.dart';

class SupportPage extends StatefulWidget {
  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  List<String> dummyUrls = [];
  Size _size;

  @override
  void initState() {
    super.initState();
  }

  List<dynamic> suppo = ['Booking', 'Flight', 'Hotel', 'Account'];
  List<dynamic> selectedbooking = [
    'How can I create an Account?',
    'Updaating Email and Mobile number',
    'How can I reset my password?',
    'What are benefits of becoming a registered member of Goibibo?',
    'How can I reset my password?'
  ];
  List<dynamic> languages = [
    'English',
    'Arabic',
  ];
  int selectedindex = 0;
  int selectedquestion = 0;
  int flag = 0;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
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
                  child: Image.asset('assets/images/nav_bar_list.png')),
            ),
          ),
        ),
        title: Text(
          'Support',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff42436A)),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffFFFFFF),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xffF1F4FB),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 160,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xffFFFFFF), Color(0xffF1F4FB)],
                          tileMode: TileMode.clamp,
                          stops: [0.4, 0.4],
                          end: Alignment.bottomCenter,
                          begin: Alignment.topCenter,
                        ),
                      ),
                    ),
                    Positioned(
                        top: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 40,
                          height: 160,
                          // color: Colors.grey,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 0),
                                  child: GestureDetector(
                                    child: Container(
                                      height: 117,
                                      // color: Colors.red,
                                      width: MediaQuery.of(context).size.width / 2 - 30,
                                      decoration: BoxDecoration(
                                        color: Color(0xffFFFFFF),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Color(0xffFF1E74), width: 2.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xffFF1E74).withOpacity(0.2),
                                            blurRadius: 20.0, // has the effect of softening the shadow
                                            spreadRadius: 2.0, // has the effect of extending the shadow
                                            offset: Offset(
                                              0.0, // horizontal, move right 10
                                              10.0, // vertical, move down 10
                                            ),
                                          )
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Container(child: Image.asset('assets/images/callus.png')
                                              // Icon(Icons.call,
                                              //     size: 30, color: Color(0xffFF1E74)),
                                              ),
                                          Container(
                                              child: Text('Call Us Anytime',
                                                  style: TextStyle(
                                                      color: Color(0xff42436A),
                                                      fontSize: 15.0,
                                                      fontWeight: FontWeight.bold,
                                                      fontFamily: "GoogleSans",
                                                      decoration: TextDecoration.none))),
                                        ],
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                              ),
                              Container(width: 15),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child: GestureDetector(
                                    child: Container(
                                      height: 117,
                                      width: MediaQuery.of(context).size.width / 2 - 30,
                                      decoration: BoxDecoration(
                                        color: Color(0xffFFFFFF),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Color(0xff00D8FD), width: 2.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xff00D8FD).withOpacity(0.2),
                                            blurRadius: 20.0, // has the effect of softening the shadow
                                            spreadRadius: 2.0, // has the effect of extending the shadow
                                            offset: Offset(
                                              0.0, // horizontal, move right 10
                                              10.0, // vertical, move down 10
                                            ),
                                          )
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Container(child: Image.asset('assets/images/sendemail.png')
                                              //  Icon(Icons.mail,
                                              //     size: 30, color: Color(0xff00D8FD)),
                                              ),
                                          Container(
                                              child: Text('Send an email',
                                                  style: TextStyle(
                                                      color: Color(0xff42436A),
                                                      fontFamily: "GoogleSans",
                                                      fontSize: 15.0,
                                                      fontWeight: FontWeight.bold,
                                                      decoration: TextDecoration.none))),
                                        ],
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              bodypart(),
            ],
          ),
        ),
      ),
    );
    // topbar();
  }

  Widget bodypart() {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Top Question',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "GoogleSans",
                          color: Color(0xff42436A)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      child: GestureDetector(
                        child: Image.asset('assets/images/searchbar.png'),
                        onTap: () {
                          Navigator.push(context, NoAnimationMaterialPageRoute(builder: (context) => SearchPage()));
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Container(
              // color: Colors.yellow[200],
              width: MediaQuery.of(context).size.width - 40,
              height: 40.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: suppo.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        //calling
                        selectedindex = index;
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Container(
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: selectedindex == index
                                  ? [
                                      Color(0xff8612EA),
                                      Color(0xff4406D1),
                                    ]
                                  : [
                                      Color(0xffFFFFFF),
                                      Color(0xffFFFFFF),
                                    ],
                            ),
                            border: Border.all(
                                color: selectedindex != index ? Color(0xffC9CBD9) : Colors.transparent, width: 2.0),
                          ),
                          child: Center(
                            child: Text(
                              '${suppo[index]}',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontFamily: "GoogleSans",
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                  color: selectedindex == index ? Color(0xffFFFFFF) : Color(0xffC9CBD9)),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Container(
              height: 61.8 * selectedbooking.length,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 0),
                  itemCount: selectedbooking.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        selectedquestion = index;
                        setState(() {});
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 61.8,
                            color: selectedquestion == index ? Color(0xffFFFFFF) : Colors.transparent,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width - 80,
                                    child: Text(
                                      '${selectedbooking[index]}',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: Color(0xff42436A),
                                          fontFamily: "GoogleSans",
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Container(
                                      child: selectedquestion != index
                                          ? Image.asset(
                                              'assets/images/naviarrow.png',
                                            )
                                          : Image.asset(
                                              'assets/images/downarrow.png',
                                            )),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 0.8,
                            color: Color(0xffFFFFFF),
                            width: MediaQuery.of(context).size.width,
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
