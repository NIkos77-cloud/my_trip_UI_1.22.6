import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_trip/common/screenutil.dart';

enum SignupTextFieldType { UserName, Email, Password, ConfirmPassword }

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xffF1F4FB),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(
          left: ScreenUtil.getResponsiveWidthOfWidget(48, _size.width),
          right: ScreenUtil.getResponsiveWidthOfWidget(48, _size.width),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(100, _size.width)),
                _buildAppIcon(),
                SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(50, _size.width)),
                _buildSignupTextFieldType(SignupTextFieldType.UserName),
                SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(20, _size.width)),
                _buildSignupTextFieldType(SignupTextFieldType.Email),
                SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(20, _size.width)),
                _buildSignupTextFieldType(SignupTextFieldType.Password),
                SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(20, _size.width)),
                _buildSignupTextFieldType(SignupTextFieldType.ConfirmPassword),
                SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(30, _size.width)),
                _buildSignupButton(),
              ],
            ),
            _buildTermsAndCondition(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppIcon() {
    return Image.asset(
      'assets/images/app_icon.png',
      width: ScreenUtil.getResponsiveWidthOfWidget(170, _size.width),
      height: ScreenUtil.getResponsiveHeightOfWidget(55, _size.width),
      fit: BoxFit.cover,
    );
  }

  Widget _buildSignupTextFieldType(SignupTextFieldType type) {
    String hintText = '';
    switch (type) {
      case SignupTextFieldType.UserName:
        hintText = 'Username';
        break;
      case SignupTextFieldType.Email:
        hintText = 'Email';
        break;
      case SignupTextFieldType.Password:
        hintText = 'Password';
        break;
      case SignupTextFieldType.ConfirmPassword:
        hintText = 'Confirm Password';
        break;
      default:
    }
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
          hintText: hintText,
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

  Widget _buildSignupButton() {
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
          'Sign Up',
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

  Widget _buildTermsAndCondition() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            'By signing up you have agreed to our',
            style: TextStyle(
              color: Color(0xff42436A).withOpacity(0.33),
              fontSize: ScreenUtil.getHorizontalPixel(_size, 14),
              fontWeight: FontWeight.normal,
              fontFamily: "GoogleSans",
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'Terms of  Use & Privacy',
            style: TextStyle(
              color: Color(0xff4506D1),
              fontSize: ScreenUtil.getHorizontalPixel(_size, 14),
              fontWeight: FontWeight.bold,
              fontFamily: "GoogleSans",
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(40, _size.width)),
        ],
      ),
    );
  }
}
