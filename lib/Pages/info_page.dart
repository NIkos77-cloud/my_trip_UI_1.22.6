import 'package:flutter/material.dart';
import 'package:happy_trip/Pages/thanks_page/thank_you_page.dart';
import 'package:happy_trip/common/global.dart';
import 'package:happy_trip/common/screenutil.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phoneno = TextEditingController();
  TextEditingController _cardnumber = TextEditingController();
  TextEditingController _mm = TextEditingController();
  TextEditingController _yy = TextEditingController();
  TextEditingController _cvv = TextEditingController();
  TextEditingController _cardholdername = TextEditingController();
  TextEditingController _vouchercode = TextEditingController();
  FocusNode nodeText1;
  var selectedvalue = 'Code';

  int flag = 1;
  Size _size;

  @override
  void initState() {
    super.initState();
  }

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
          'Info',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff42436A)),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffF1F4FB),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  topcontainer(),
                  centerportion(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  topcontainer() {
    return Container(
      decoration: BoxDecoration(color: Color(0xffFFFFFF), borderRadius: BorderRadius.circular(30.0)),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Stack(
            children: <Widget>[
              InkWell(
                onTap: () {
                  flag = 0;
                  setState(() {});
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 3 - 10,
                  alignment: Alignment.centerLeft,
                  child: Center(
                      child: Text(
                    'Mr.',
                    style: TextStyle(
                        color: Color(0xff42436A), fontSize: 22, fontWeight: FontWeight.w500, fontFamily: "GoogleSans"),
                  )),
                ),
              ),
              flag == 0
                  ? Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 3 - 10,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff8612EA),
                              Color(0xff4406D1),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff8612EA).withOpacity(0.2),
                              blurRadius: 20.0, // has the effect of softening the shadow
                              spreadRadius: 2.0, // has the effect of extending the shadow
                              offset: Offset(
                                0.0, // horizontal, move right 10
                                10.0, // vertical, move down 10
                              ),
                            )
                          ],
                          // color: Colors.grey,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                          child: Text('Ms.',
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "GoogleSans"))),
                    )
                  : Container(),
            ],
          ),
          Stack(
            children: <Widget>[
              InkWell(
                onTap: () {
                  flag = 1;
                  setState(() {});
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 3 - 10,
                  alignment: Alignment.centerLeft,
                  child: Center(
                      child: Text('Mr.',
                          style: TextStyle(
                              color: Color(0xff42436A),
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              fontFamily: "GoogleSans"))),
                ),
              ),
              flag == 1
                  ? Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 3 - 10,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff8612EA),
                              Color(0xff4406D1),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff8612EA).withOpacity(0.2),
                              blurRadius: 20.0, // has the effect of softening the shadow
                              spreadRadius: 2.0, // has the effect of extending the shadow
                              offset: Offset(
                                0.0, // horizontal, move right 10
                                10.0, // vertical, move down 10
                              ),
                            )
                          ],
                          // color: Colors.grey,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                          child: Text('Mrs.',
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "GoogleSans"))),
                    )
                  : Container(),
            ],
          ),
          Stack(
            children: <Widget>[
              InkWell(
                onTap: () {
                  flag = 2;
                  setState(() {});
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 3 - 10,
                  alignment: Alignment.centerLeft,
                  child: Center(
                      child: Text('Mr.',
                          style: TextStyle(
                              color: Color(0xff42436A),
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              fontFamily: "GoogleSans"))),
                ),
              ),
              flag == 2
                  ? Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 3 - 10,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff8612EA),
                              Color(0xff4406D1),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff8612EA).withOpacity(0.2),
                              blurRadius: 20.0, // has the effect of softening the shadow
                              spreadRadius: 2.0, // has the effect of extending the shadow
                              offset: Offset(
                                0.0, // horizontal, move right 10
                                10.0, // vertical, move down 10
                              ),
                            )
                          ],
                          // color: Colors.grey,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                          child: Text('Mr.',
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "GoogleSans"))),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }

  centerportion() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Text('Info',
                style: TextStyle(
                    color: Color(0xff42436A), fontSize: 17, fontWeight: FontWeight.bold, fontFamily: "GoogleSans")),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: location(context),
                  ),
                  Container(
                    width: 20,
                  ),
                  Expanded(
                    child: lastname(context),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: email(context),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  timeDurtion(),
                  Container(
                    width: 20,
                  ),
                  Expanded(
                    child: phonenumber(),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text('Credit Card Info',
                  style: TextStyle(
                      color: Color(0xff42436A), fontSize: 17, fontWeight: FontWeight.bold, fontFamily: "GoogleSans")),
            ),
          ),
          creditcard(),
          applyvoucher(),
          _booknow()
        ],
      ),
    );
  }

  Widget location(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 0,
      ),
      child: TextField(
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        onChanged: (text) {},
        controller: _firstname,
        textInputAction: TextInputAction.done,
        onSubmitted: (value) {},
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffFFFFFF),
          contentPadding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10, right: 10),
          labelText: 'First Name',
          labelStyle:
              TextStyle(color: Color(0xffD9D9E1), fontFamily: "GoogleSans", fontSize: 14, fontWeight: FontWeight.w500),
          focusColor: Colors.black,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffEBECF0), width: 1.0),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffEBECF0), width: 1.0),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Color(0xffEBECF0), width: 1.0)),
        ),
        onTap: () {},
      ),
    );
  }

  Widget lastname(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 0,
      ),
      child: TextField(
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        onChanged: (text) {},
        controller: _lastname,
        textInputAction: TextInputAction.done,
        onSubmitted: (value) {},
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffFFFFFF),
          contentPadding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10, right: 10),
          labelText: 'Last Name',
          labelStyle:
              TextStyle(color: Color(0xffD9D9E1), fontFamily: "GoogleSans", fontSize: 14, fontWeight: FontWeight.w500),
          focusColor: Colors.black,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffEBECF0), width: 1.0),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffEBECF0), width: 1.0),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Color(0xffEBECF0), width: 1.0)),
        ),
        onTap: () {},
      ),
    );
  }

  Widget email(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 0,
      ),
      child: TextField(
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        onChanged: (text) {},
        controller: _email,
        textInputAction: TextInputAction.done,
        onSubmitted: (value) {},
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffFFFFFF),
          contentPadding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10, right: 10),
          labelText: 'Email',
          labelStyle:
              TextStyle(color: Color(0xffD9D9E1), fontFamily: "GoogleSans", fontSize: 14, fontWeight: FontWeight.w500),
          focusColor: Colors.black,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffEBECF0), width: 1.0),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffEBECF0), width: 1.0),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Color(0xffEBECF0), width: 1.0)),
        ),
        onTap: () {},
      ),
    );
  }

  Widget timeDurtion() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
            height: 44,
            decoration: BoxDecoration(color: Color(0xffFFFFFF), borderRadius: BorderRadius.circular(6.0)),
            width: MediaQuery.of(context).size.width / 4,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 0),
              child: Container(
                height: 42,
                width: MediaQuery.of(context).size.width / 4,
                child: DropdownButton(
                  underline: Text(''),
                  icon: Icon(Icons.arrow_drop_down, size: 28, color: Color(0xff42436A)),
                  hint: Text(
                    'Code',
                    style: TextStyle(color: Color(0xffD9D9E1)),
                  ),
                  value: selectedvalue,
                  items: cccode.map((dynamic dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(
                        dropDownStringItem,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Color(0xff42436A),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: "GoogleSans"),
                      ),
                    );
                  }).toList(),
                  onChanged: (dynamic newValueSelected) {
                    selectedvalue = newValueSelected;
                    setState(() {});
                  },
                  isExpanded: true,
                ),
              ),
            )),
      ],
    );
  }

  Widget phonenumber() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 0,
      ),
      child: TextField(
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        onChanged: (text) {},
        controller: _phoneno,
        textInputAction: TextInputAction.done,
        onSubmitted: (value) {},
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffFFFFFF),
          contentPadding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10, right: 10),
          labelText: 'Phone Number',
          labelStyle:
              TextStyle(color: Color(0xffD9D9E1), fontFamily: "GoogleSans", fontSize: 14, fontWeight: FontWeight.w500),
          focusColor: Colors.black,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffEBECF0), width: 1.0),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffEBECF0), width: 1.0),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Color(0xffEBECF0), width: 1.0)),
        ),
        onTap: () {},
      ),
    );
  }

  creditcard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Color(0xffFFFFFF),
      child: Container(
        padding: EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 25),
        child: Column(
          children: <Widget>[
            cardnumber(),
            mmyycvv(),
            cardholdername(),
          ],
        ),
      ),
    );
  }

  cardnumber() {
    return TextField(
      cursorColor: Colors.green,
      controller: _cardnumber,
      onChanged: (text) {},
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffEBEBEF), width: 2),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffEBEBEF), width: 2),
          ),
          hintText: 'Card Number',
          hintStyle:
              TextStyle(color: Color(0xffACACBE), fontWeight: FontWeight.w500, fontSize: 14, fontFamily: "GoogleSans")),
    );
  }

  mmyycvv() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          mm(),
          yy(),
          cvv(),
        ],
      ),
    );
  }

  mm() {
    return Container(
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width / 3 - 50,
      child: TextField(
        cursorColor: Colors.green,
        controller: _mm,
        onChanged: (text) {},
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffEBEBEF), width: 2),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffEBEBEF), width: 2),
            ),
            hintText: 'MM',
            hintStyle: TextStyle(
                color: Color(0xffACACBE), fontWeight: FontWeight.w500, fontSize: 14, fontFamily: "GoogleSans")),
      ),
    );
  }

  yy() {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 3 - 50,
      child: TextField(
        cursorColor: Colors.green,
        controller: _yy,
        onChanged: (text) {},
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffEBEBEF), width: 2),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffEBEBEF), width: 2),
            ),
            hintText: 'YY',
            hintStyle: TextStyle(
                color: Color(0xffACACBE), fontWeight: FontWeight.w500, fontSize: 14, fontFamily: "GoogleSans")),
      ),
    );
  }

  cvv() {
    return Container(
      alignment: Alignment.centerRight,
      width: MediaQuery.of(context).size.width / 3 - 50,
      child: TextField(
        cursorColor: Colors.green,
        controller: _cvv,
        onChanged: (text) {},
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffEBEBEF), width: 2),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffEBEBEF), width: 2),
            ),
            hintText: 'CVV',
            hintStyle: TextStyle(
                color: Color(0xffACACBE), fontWeight: FontWeight.w500, fontSize: 14, fontFamily: "GoogleSans")),
      ),
    );
  }

  cardholdername() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextField(
        cursorColor: Colors.green,
        controller: _cardholdername,
        onChanged: (text) {},
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffEBEBEF), width: 2),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffEBEBEF), width: 2),
            ),
            hintText: 'Card Holder Name',
            hintStyle: TextStyle(
                color: Color(0xffACACBE), fontWeight: FontWeight.w500, fontSize: 14, fontFamily: "GoogleSans")),
      ),
    );
  }

  Widget applyvoucher() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextField(
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        onChanged: (text) {},
        controller: _vouchercode,
        textInputAction: TextInputAction.done,
        focusNode: nodeText1,
        onSubmitted: (value) {},
        decoration: InputDecoration(
          suffixIcon: FlatButton(
              onPressed: () {},
              child: Text(
                'Apply',
                style: TextStyle(
                    color: Color(0xff5808D8), fontFamily: "GoogleSans", fontSize: 16, fontWeight: FontWeight.w300),
              )),
          contentPadding: const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 16, right: 16),
          labelText: ' Add a voucher code(optional)',
          labelStyle:
              TextStyle(color: Color(0xffACACBE), fontFamily: "GoogleSans", fontSize: 16, fontWeight: FontWeight.w300),
          focusColor: Colors.black,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff5808D8),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff5808D8),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Color(0xff5808D8))),
        ),
        onTap: () {},
      ),
    );
  }

  Widget _booknow() {
    return InkWell(
      onTap: () {
        Navigator.push(context, NoAnimationMaterialPageRoute(builder: (context) => ThankYouPage()));
      },
      child: Padding(
        padding: EdgeInsets.only(top: 25.0, bottom: 25.0),
        child: Container(
          height: ScreenUtil.getResponsiveHeightOfWidget(50, _size.width),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                ScreenUtil.getResponsiveHeightOfWidget(10, _size.width),
              ),
            ),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff8612EA),
                Color(0xff4406D1),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xff4406D1).withOpacity(0.4),
                offset: Offset(0, 5),
                blurRadius: 30,
                spreadRadius: 4,
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            'Book Now',
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil.getHorizontalPixel(_size, 18),
              fontWeight: FontWeight.bold,
              fontFamily: "GoogleSans",
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
