import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../view/contact_about_rules/components/ACR_style.dart';
import '../view/subscription/components/Sub_style.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// Colors
const Color WhiteColor = Color(0xFFFFFFFF);
const Color BaseColor = Color(0xfff5f5f5);
const Color RedColor = Color(0xffBD271B);
const Color YellowColor = Color(0xffF5C137);
const Color BlackColor = Color(0xff000000);
const Color GreenColor = Color(0xff2CBA15);

//Api
const Api = "";
const ApiKey = "";
const Url = "";
// Pages
String MaskGroupPage = "/maskgroupPage";
String RulesPage = "/rulePage";
String AboutPage = "/aboutPage";
String ContactUsPage = "/contactUsPage";
String SubscriptionPage = "/subscriptionPage";
String HomePage = "/homePage";
String OwnerRegisterPage = "/ownerRegisterPage";
String VerifySubscriptonPage = "/verifySubscriptonPage";
String SuccessfulPurchasePage = "/successfulPurchasePage";
String UnSuccessfulPurchasePage = "/unSuccessfulPurchasePage";
String RestaurantListPage = "/restaurantListPage";
String CategoriesPage = "/categoriesPage";
String PhoneNumbePage = "/phoneNumbePage";
String ProfilePage = "/profilePage";
//Strings, Names, Address
const AppName = "فست فید";
const AppNameEn = "FastFeed";
const AppVersion = "";
String Phone = "31234567 (031)";
String Email = "fastfeed@gmail.com";
String Name = "";
String Address = "اصفهان - میدان آزادی - دانشگاه اصفهان";
String PageUrl = "";
// Images
String Linkedin = "assets/images/linkedin.png";
String Twitter = "assets/images/twitter.png";
String Instagram = "assets/images/instagram.png";
String Telegram = "assets/images/telegram-app.png";
String FastfeedLogo = "assets/images/logo.png";
String ENamad = "assets/images/enamad.png";
String Map = "assets/images/map.png";
String MaskGroupimg = "assets/images/maskgroup.png";
String OwnerPageimg = "assets/images/ownerBackground.png";
String Qrsample = "assets/images/Qrsample.png";
String Tick = "assets/images/Tick.png";
String Zabdar = "assets/images/zabdar.png";
String RestaurantLogoDef = "assets/images/restarauntLogo.png";
String SadFace = "assets/images/sadface.png";
// Fonts
String IranSansWeb = "IranSansWeb";
String FugazOne = "FugazOne";

String AboutUsPhrase =
    "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه \nروزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود\n ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را\n می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی \nایجاد کرد."
;
String RulesPhrase =
    "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه \nروزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود\n ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را\n می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی \nایجاد کرد."
;
List<String> Proviences = [
  'آذربایجان شرقی',
  'آذربایجان غربی',
  'اردبیل',
  'اصفهان',
  'البرز',
  'ایلام',
  'بوشهر',
  'تهران',
  'چهارمحال و بختیاری',
   'خراسان جنوبی',
   'خراسان رضوی',
   'خراسان شمالی',
   'خوزستان',
   'زنجان',
   'سمنان',
   'سیستان و بلوچستان',
   'فارس',
   'قزوین',
   'قم',
   'کردستان',
   'کرمان',
   'کرمانشاه',
   'کهکیلویه و بویراحمد',
   'گلستان',
   'گیلان',
   'لرستان',
   'مازندران',
   'مرکزی',
   'هرمزگان',
   'همدان',
   'یزد'
];

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
    title: SubTitleStyle(text: text!),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        PhraseStyle(text: Phrase!),
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
          style: buttonStyle_build(190, 55, 10, YellowColor),
        ),
      ),
    ],
  );
}
Widget loading(){
  return Container(
    padding: EdgeInsets.only(
      left: 150.0.w,
      top: 51.0.h,
      right: 150.0.w,
    ),
    width: 1920.w,
    height: 700.h,
    child: Center(
      child: SpinKitCircle(
          size: 140.r,
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