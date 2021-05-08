import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happy_trip/common/screenutil.dart';

class VerificationPage extends StatefulWidget {
  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  Size _size;
  TextEditingController _firstdigit = TextEditingController();
  TextEditingController _seconddigit = TextEditingController();
  TextEditingController _thirddigit = TextEditingController();
  TextEditingController _fourthdigit = TextEditingController();
  
FocusNode firstdigi = FocusNode();
FocusNode seconddigi = FocusNode();
FocusNode thirddigi = FocusNode();
FocusNode fourthdigi = FocusNode();

int maxLength = 1;
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
            Column(
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
                     
                    ],
                  ),
                ),
                 Container(
                   margin: EdgeInsets.only(left: 30,right: 30),
                   child: _buildForgetPasswordTextField()),
                  SizedBox(height: ScreenUtil.getResponsiveHeightOfWidget(30, _size.width)),
                  Container(
                      margin: EdgeInsets.only(
                    left: ScreenUtil.getResponsiveWidthOfWidget(48, _size.width),
                    right: ScreenUtil.getResponsiveWidthOfWidget(48, _size.width),
                  ),
                    child: _buildSubmitButton()),
              ],
            ),
            _buildHeaderBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildForgetPasswordIcon() {
    return Image.asset(
      'assets/images/verification.png',
      width: ScreenUtil.getResponsiveWidthOfWidget(230, _size.width),
      height: ScreenUtil.getResponsiveHeightOfWidget(140, _size.width),
      fit: BoxFit.cover,
    );
  }

  Widget _buildDescriptionText() {
    return Text(
      'Please enter the verificaiotn code we sent to your email address',
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
      
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 6.5,
                child: firstdigit(),
              ),
                Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 6.5,
                child: seconddigit(),
              ),
                Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 6.5,
                child: thirddigit(),
              ),
                Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 6.5,
                child: fouthdigit(),
              ),


          ],
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
          'Verify',
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
                child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                                  child: Image.asset(
                    'assets/images/back_button.png',
                    width: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width),
                    height: ScreenUtil.getResponsiveHeightOfWidget(20, _size.width),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Spacer(),
              Text(
                'Verificaiton',
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

  Widget firstdigit() {
    return Material(
      color: Colors.transparent,
      child: TextField(
        cursorColor: Color(0xff5808D8),
        // textCapitalization: TextCapitalization.sentences,
        // onChanged: docketvalidationBloc.addname,
        textAlign: TextAlign.center,
        controller: _firstdigit,
        
        onSubmitted: (value){
          //  FocusScope.of(context).requestFocus(seconddigi);
        },
        textInputAction: TextInputAction.next,
        focusNode: firstdigi,
        autocorrect: false,
        autofocus: false,
        
        
        keyboardType:
            TextInputType.numberWithOptions(decimal: false, signed: false),
        inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(1),
          WhitelistingTextInputFormatter.digitsOnly
        ],
        style: TextStyle(
            
            fontFamily: 'Poppins',
            fontSize: 15.0,
            color: Color(0xff5808D8),
            fontWeight: FontWeight.w500),
         onChanged: (digit){
           if(digit.length == 1)
           {
             FocusScope.of(context).requestFocus(seconddigi);
           }
         },   
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffFFFFFF),
          enabled: true,
  
          focusColor: Color(0xff5808D8),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffFFFFFF),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffFFFFFF),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onTap: () {},
      ),
    );
  }
  Widget seconddigit() {
    return Material(
      color: Colors.transparent,
      child: TextField(
        cursorColor: Color(0xff5808D8),
        // textCapitalization: TextCapitalization.sentences,
        // onChanged: docketvalidationBloc.addname,
        textAlign: TextAlign.center,
        controller: _seconddigit,
        // maxLines: 3,
        autocorrect: false,
        autofocus: false,
      
        onSubmitted: (value){
          
        },
        textInputAction: TextInputAction.next,
        focusNode: seconddigi,
        keyboardType:
            TextInputType.numberWithOptions(decimal: false, signed: false),
        inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(1),
          WhitelistingTextInputFormatter.digitsOnly
        ],
        style: TextStyle(
            
            fontFamily: 'Poppins',
            fontSize: 15.0,
            color: Color(0xff5808D8),
            fontWeight: FontWeight.w500),
         onChanged: (digit){
          if(digit.length == 1)
           {
             FocusScope.of(context).requestFocus(thirddigi);
           }
         },   
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffFFFFFF),
          enabled: true,
  
          focusColor: Color(0xff5808D8),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffFFFFFF),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffFFFFFF),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onTap: () {},
      ),
    );
  }

  Widget thirddigit() {
    return Material(
      color: Colors.transparent,
      child: TextField(
        cursorColor: Color(0xff5808D8),
        // textCapitalization: TextCapitalization.sentences,
        // onChanged: docketvalidationBloc.addname,
        textAlign: TextAlign.center,
        controller: _thirddigit,
        // maxLines: 3,
        autocorrect: false,
        autofocus: false,
        textInputAction: TextInputAction.next,
        onSubmitted: (value){
      
        },
        
        focusNode:thirddigi,
        keyboardType:
            TextInputType.numberWithOptions(decimal: false, signed: false),
        inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(1),
          WhitelistingTextInputFormatter.digitsOnly
        ],
        style: TextStyle(
            
            fontFamily: 'Poppins',
            fontSize: 15.0,
            color: Color(0xff5808D8),
            fontWeight: FontWeight.w500),
         onChanged: (digit){
          if(digit.length == 1)
           {
                 FocusScope.of(context).requestFocus(fourthdigi);
           }
         },   
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffFFFFFF),
          enabled: true,
  
          focusColor: Color(0xff5808D8),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffFFFFFF),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffFFFFFF),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onTap: () {},
      ),
    );
  }

  Widget fouthdigit() {
    return Material(
      color: Colors.transparent,
      child: TextField(
        cursorColor: Color(0xff5808D8),
        // textCapitalization: TextCapitalization.sentences,
        // onChanged: docketvalidationBloc.addname,
        textAlign: TextAlign.center,
        controller: _fourthdigit,
        // maxLines: 3,
        autocorrect: false,
        autofocus: false,
        
        onSubmitted: (value){
         
        },
        textInputAction: TextInputAction.done,
        focusNode: fourthdigi,
        keyboardType:
            TextInputType.numberWithOptions(decimal: false, signed: false),
        inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(1),
          WhitelistingTextInputFormatter.digitsOnly
        ],
        style: TextStyle(
            
            fontFamily: 'Poppins',
            fontSize: 15.0,
            color: Color(0xff5808D8),
            fontWeight: FontWeight.w500),
         onChanged: (digit){
          if(digit.length == 1)
           {
              FocusScope.of(context).requestFocus(FocusNode());
           }
         },   
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffFFFFFF),
          enabled: true,
  
          focusColor: Color(0xff5808D8),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffFFFFFF),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffFFFFFF),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onTap: () {},
      ),
    );
  }

}
