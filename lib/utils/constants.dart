import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../model/entity/order.dart';
import '../model/entity/orderItem.dart';
import '../model/entity/socketData.dart';
// Colors
const Color WhiteColor = Color(0xFFFFFFFF);
const Color BaseColor = Color(0xfff5f5f5);
const Color RedColor = Color(0xffBD271B);
const Color YellowColor = Color(0xffF5C137);
const Color BlackColor = Color(0xff000000);
const Color GreenColor = Color(0xff2CBA15);

// Pages
String LandingPage = "/landingPage";
String OrderPage = "/orders";
String Loginsignup = "/login&signup";
String RestaurantListPage = "/restaurantListPage";
String OrderingPage = "/orderingPage";
//String Page = "/Page";
Map<String, dynamic> orderJson = {
  'id': 1,
  'store': 1,
  'table_number': 4,
  'description': 'Dummy order',
  'created_at_time': '2023-05-25 10:00:00',
  'auth_code': 987,
};

Order order = Order.fromJson(orderJson);

List<Map<String, dynamic>> orderItemsJson = [
  {
    'id': 1,
    'product': 456,
    'product_title': 'Product 1',
    'product_unit_price': 9.99,
    'quantity': 2,
    'order': 1,
  },
  {
    'id': 2,
    'product': 789,
    'product_title': 'Product 2',
    'product_unit_price': 14.99,
    'quantity': 1,
    'order': 1,
  },
];

List<OrderItem> orderItems = orderItemsJson
    .map((json) => OrderItem.fromJson(json))
    .toList();

SocketData socketData1 =SocketData(order: order, orderItem: orderItems);

//Strings, Names, Address
late String Phone ;
late String Email ;
late String Address ;
late String InstagramPage ;
// Images
String FastfeedLogo = "assets/logo.png";
String Tick = "assets/Tick.png";
String Zabdar = "assets/zabdar.png";
String RestaurantLogoDef = "assets/restarauntLogo.png";
String WhiteLogo = "assets/logo_white.png";
String BlackLogo = "assets/logo_black.png";
String SadFace = "assets/images/sadface.png";
// Fonts
String IranSansWeb = "IranSansWeb";
String FugazOne = "FugazOne";

ButtonStyle buttonStyle_build(double width, double height, double radius,Color color){
  return ButtonStyle(
    backgroundColor:
    MaterialStateProperty.all<Color>(color),
    elevation: MaterialStateProperty.all<double>(0.0),
    padding:
    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
    fixedSize: MaterialStateProperty.all<Size>(
      Size(width, height),
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
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
    title: Center(child: Image.asset(BlackLogo, width: 50, height: 50,)),
    //actions: [],
    leading: BackButton(color: BlackColor,),
    backgroundColor: YellowColor,
  );
}