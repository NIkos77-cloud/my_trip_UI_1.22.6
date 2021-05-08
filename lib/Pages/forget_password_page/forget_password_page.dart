import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_trip/common/screenutil.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xffF1F4FB),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                left: ScreenUtil.getResponsiveWidthOfWidget(48, _size.width),
                right: ScreenUtil.getResponsiveWidthOfWidget(48, _size.width),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(130, _size.width)),
                  _buildForgetPasswordIcon(),
                  SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(30, _size.width)),
                  _buildDescriptionText(),
                  SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(30, _size.width)),
                  _buildForgetPasswordTextField(),
                  SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(30, _size.width)),
                  _buildSubmitButton(),
                ],
              ),
            ),
            _buildHeaderBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildForgetPasswordIcon() {
    return Image.asset(
      'assets/images/forget_password_background.png',
      width: ScreenUtil.getResponsiveWidthOfWidget(230, _size.width),
      height: ScreenUtil.getResponsiveHeightOfWidget(140, _size.width),
      fit: BoxFit.cover,
    );
  }

  Widget _buildDescriptionText() {
    return Text(
      'Please enter your email address to\nrecieve a verification code',
      style: TextStyle(
        color: Color(0xff42436A),
        fontSize: ScreenUtil.getHorizontalPixel(_size, 16),
        fontWeight: FontWeight.normal,
        fontFamily: "GoogleSans",
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildForgetPasswordTextField() {
    return Container(
      height: ScreenUtil.getResponsiveHeightOfWidget(50, _size.width),
      padding: EdgeInsets.only(
        left: ScreenUtil.getResponsiveHeightOfWidget(20, _size.width),
        top: ScreenUtil.getResponsiveHeightOfWidget(2, _size.width),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        style: TextStyle(
          fontFamily: "GoogleSans",
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Color(0xff42436A),
        ),
        autofocus: false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          border: InputBorder.none,
          // prefixIcon: Padding(
          //   padding: EdgeInsetsDirectional.only(end: 0.0),
          //   child: Image.asset(
          //     'assets/images/user.png',
          //     width: ScreenUtil.getResponsiveWidthOfWidget(10, _size.width),
          //     height: ScreenUtil.getResponsiveHeightOfWidget(12, _size.width),
          //     fit: BoxFit.fitHeight,
          //   ),
          // ),
          hintText: 'Email',
          hintStyle: TextStyle(
            fontFamily: "GoogleSans",
            fontSize: ScreenUtil.getHorizontalPixel(_size, 14),
            fontWeight: FontWeight.bold,
            color: Color(0xff42436A).withOpacity(0.3),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return InkWell(
      onTap: () {
        // Navigator.of(context, rootNavigator: true).pushNamed(RouteName.loginPage);
      },
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
              offset: Offset(0, 10),
              blurRadius: 30,
              spreadRadius: 4,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          'Submit',
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil.getHorizontalPixel(_size, 18),
            fontWeight: FontWeight.bold,
            fontFamily: "GoogleSans",
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildHeaderBar() {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.only(top: ScreenUtil.getResponsiveWidthOfWidget(10, _size.width)),
          child: Row(
            children: <Widget>[
              SizedBox(width: ScreenUtil.getResponsiveWidthOfWidget(10, _size.width)),
              Container(
                width: ScreenUtil.getResponsiveWidthOfWidget(40, _size.width),
                height: ScreenUtil.getResponsiveHeightOfWidget(40, _size.width),
                alignment: AlignmentDirectional.center,
                child: Image.asset(
                  'assets/images/back_button.png',
                  width: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
                  height: ScreenUtil.getResponsiveHeightOfWidget(20, _size.width),
                  fit: BoxFit.contain,
                ),
              ),
              Spacer(),
              Text(
                'Forget Password',
                style: TextStyle(
                  color: Color(0xff42436A),
                  fontSize: ScreenUtil.getHorizontalPixel(_size, 20),
                  fontWeight: FontWeight.bold,
                  fontFamily: "GoogleSans",
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              SizedBox(width: ScreenUtil.getResponsiveWidthOfWidget(50, _size.width)),
            ],
          ),
        ),
      ),
    );
  }
}
