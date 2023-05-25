import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// Colors
const Color WhiteColor = Color(0xFFFFFFFF);
const Color BaseColor = Color(0xfff5f5f5);
const Color RedColor = Color(0xffBD271B);
const Color YellowColor = Color(0xffF5C137);
const Color BlackColor = Color(0xff000000);
const Color GreenColor = Color(0xff2CBA15);

// Pages
String LandingPage = "/landingPage";
String Order = "/orders";
String Loginsignup = "/login&signup";
String RestaurantListPage = "/restaurantListPage";
String OrderingPage = "/orderingPage";
//String Page = "/Page";

//Strings, Names, Address
late String Phone ;
late String Email ;
late String Address ;
late String InstagramPage ;
// Images
String FastfeedLogo = "assets/images/logo.png";
String Tick = "assets/images/Tick.png";
String Zabdar = "assets/images/zabdar.png";
String RestaurantLogoDef = "assets/images/restarauntLogo.png";
String WhiteLogo = "assets/images/logo_white.png";
String SadFace = "assets/images/sadface.png";
// Fonts
String IranSansWeb = "IranSansWeb";
String FugazOne = "FugazOne";

ButtonStyle buttonStyle_build(int width, int height, int radius,Color color){
  return ButtonStyle(
    backgroundColor:
    MaterialStateProperty.all<Color>(color),
    elevation: MaterialStateProperty.all<double>(0.0),
    padding:
    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
    fixedSize: MaterialStateProperty.all<Size>(
      Size(width.w, height.h),
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius.r),
      ),
    ),
  );
}
Widget buildInfoDialog(BuildContext context, String? text, String? Phrase) {
  return AlertDialog(
    title: Text(text!),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

      ],
    ),
    actions: <Widget>[
      Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'متوجه شدم',
            style: TextStyle(
              color: BlackColor,
              fontFamily: "IranSansWeb",
              fontSize: 24.sp,
            ),
          ),
          style: buttonStyle_build(30, 30, 10, YellowColor),
        ),
      ),
    ],
  );
}
Widget loading(){
  return Container(
    padding: EdgeInsets.only(
      left: 15.0.w,
      top: 5.0.h,
      right: 15.0.w,
    ),
    //width: 1920.w,
    //height: 700.h,
    child: Center(
      child: SpinKitCircle(
        size: 14.r,
        duration: Duration(seconds: 2),
        itemBuilder: (context, index){
          final colors = [YellowColor, RedColor];
          final color = colors[index % colors.length];
          return DecoratedBox(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          );
        },
      ),
    ),
  );
}
AppBar AppBarMenu(){
  return AppBar(
    title: Image.asset(WhiteLogo, width: 90.w, height: 90.h,),
    //actions: [],
    leading: BackButton(color: WhiteColor,),
    backgroundColor: RedColor,
  );
}