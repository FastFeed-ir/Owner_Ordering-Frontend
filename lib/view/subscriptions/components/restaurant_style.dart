import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:shamsi_date/shamsi_date.dart';

import '../../../utils/constants.dart';

class HomeTextStyle extends StatelessWidget {
  final String text;

  const HomeTextStyle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 50.sp,
        fontFamily: IranSansWeb,
        color: RedColor,
      ),
    );
  }
}

class SubButtonTextStyle extends StatelessWidget {
  final String text;

  SubButtonTextStyle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24.sp,
        fontFamily: IranSansWeb,
        color: BlackColor,
      ),
    );
  }
}

Widget restaurantTitle(String? name, String? startDate, int? period, int? businessOwner, int? storeId) {
  Jalali startJal = _stringToJal(startDate);
  Jalali finishJal = _finishDate(startJal, period);
  int year = finishJal.year;
  int month = finishJal.month;
  int day = finishJal.day;
  return Wrap(
    alignment: WrapAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            name!,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              fontFamily: IranSansWeb,
              color: BlackColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            ("شروع اشتراک: " +startDate!),
            style: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.w400,
              fontFamily: IranSansWeb,
              color: BlackColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(("پایان اشتراک: "+"${year.toString().toPersianDigit()}/${month.toString().toPersianDigit()}/${day.toString().toPersianDigit()}"),
            style: TextStyle(
              fontSize: 28.0.sp,
              fontWeight: FontWeight.w400,
              fontFamily: IranSansWeb,
              color: BlackColor,
            ),
          ),
        ],
      ),
      Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(OrderingPage, arguments: [businessOwner, storeId]);
              },
              child: SubButtonTextStyle(
                text: 'انتخاب',
              ),
              style:
              buttonStyle_build(80, 40, 20, YellowColor),
            ),
          ),
        ],
      ),
    ],
  );
}

Jalali _stringToJal(String? startDate) {
  List<String> parts = startDate!.split('/');
  int shamsiYear = int.parse(parts[0]);
  int shamsiMonth = int.parse(parts[1]);
  int shamsiDay = int.parse(parts[2]);
  Jalali shamsiDate = Jalali(shamsiYear, shamsiMonth, shamsiDay);
  return shamsiDate;
}

Jalali _finishDate(Jalali? startDate, int? day) {
  Jalali finishDate = startDate! + day!;
  return finishDate;
}

class RestaurantTextStyle extends StatelessWidget {
  final String text;

  const RestaurantTextStyle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 34.sp,
        fontFamily: IranSansWeb,
        color: BlackColor,
      ),
    );
  }
}
