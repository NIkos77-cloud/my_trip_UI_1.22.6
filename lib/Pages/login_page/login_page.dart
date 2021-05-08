import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_trip/common/screenutil.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                _buildUsernameTextfield(),
                SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(20, _size.width)),
                _buildPasswordTextfield(),
                SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(20, _size.width)),
                _buildForgetPassword(),
                SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(32, _size.width)),
                _buildLoginButton(),
                SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(26, _size.width)),
                _buildSignUpButton(),
              ],
            ),
            _buildOtherOptionToLogin(),
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

  Widget _buildUsernameTextfield() {
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
          hintText: 'Username',
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

  Widget _buildPasswordTextfield() {
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
          fontSize: ScreenUtil.getHorizontalPixel(_size, 14),
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
          hintText: 'Password',
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

  Widget _buildForgetPassword() {
    return Row(
      children: <Widget>[
        Container(
          height: ScreenUtil.getResponsiveWidthOfWidget(16, _size.width),
          width: ScreenUtil.getResponsiveWidthOfWidget(16, _size.width),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            border: Border.all(
              color: Color(0xffC7C8F3),
              width: 2,
            ),
          ),
        ),
        SizedBox(width: ScreenUtil.getResponsiveWidthOfWidget(8, _size.width)),
        Text(
          'Remeber Me',
          style: TextStyle(
            color: Color(0xff8D91A2),
            fontSize: ScreenUtil.getHorizontalPixel(_size, 14),
            fontWeight: FontWeight.normal,
            fontFamily: "GoogleSans",
          ),
          textAlign: TextAlign.left,
        ),
        Spacer(),
        Text(
          'Forget Password',
          style: TextStyle(
            color: Color(0xff8D91A2),
            fontSize: ScreenUtil.getHorizontalPixel(_size, 14),
            fontWeight: FontWeight.normal,
            fontFamily: "GoogleSans",
          ),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
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
              offset: Offset(0, 5),
              blurRadius: 30,
              spreadRadius: 4,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          'Login',
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

  Widget _buildSignUpButton() {
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
          border: Border.all(
            color: Color(0xff42436A).withOpacity(0.1),
            width: 2,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          'Sign up with email',
          style: TextStyle(
            color: Color(0xff42436A),
            fontSize: ScreenUtil.getHorizontalPixel(_size, 18),
            fontWeight: FontWeight.bold,
            fontFamily: "GoogleSans",
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildOtherOptionToLogin() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            'Or Login with',
            style: TextStyle(
              color: Color(0xff42436A).withOpacity(0.30),
              fontSize: ScreenUtil.getHorizontalPixel(_size, 15),
              fontWeight: FontWeight.w500,
              fontFamily: "GoogleSans",
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(12, _size.width)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/facebook.png',
                width: ScreenUtil.getResponsiveWidthOfWidget(48, _size.width),
                height: ScreenUtil.getResponsiveHeightOfWidget(48, _size.width),
                fit: BoxFit.cover,
              ),
              SizedBox(width: ScreenUtil.getResponsiveWidthOfWidget(25, _size.width)),
              Image.asset(
                'assets/images/twitter.png',
                width: ScreenUtil.getResponsiveWidthOfWidget(48, _size.width),
                height: ScreenUtil.getResponsiveHeightOfWidget(48, _size.width),
                fit: BoxFit.cover,
              ),
              SizedBox(width: ScreenUtil.getResponsiveWidthOfWidget(25, _size.width)),
              Image.asset(
                'assets/images/googleplus.png',
                width: ScreenUtil.getResponsiveWidthOfWidget(48, _size.width),
                height: ScreenUtil.getResponsiveHeightOfWidget(48, _size.width),
                fit: BoxFit.cover,
              ),
            ],
          ),
          SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(40, _size.width)),
        ],
      ),
    );
  }
}
