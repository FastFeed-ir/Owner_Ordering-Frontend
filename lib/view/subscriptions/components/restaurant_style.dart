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
        fontSize: 50,
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
        fontSize: 24,
        fontFamily: IranSansWeb,
        color: BlackColor,
      ),
    );
  }
}

Widget restaurantTitle(String? name, String? cratedAt, int? period, int? businessOwner, int? storeId) {
  List<String>? dateHour = cratedAt?.split(' ') ;
  String startDate = dateHour![0];
  var date = startDate.split('/');
  int startYear = int.parse(date[0]);
  int startMonth = int.parse(date[1]);
  int startDay = int.parse(date[2]);
  Jalali startJal = Jalali(startYear, startMonth, startDay);
  Jalali finishJal = _finishDate(startJal, period);
  int finishYear = finishJal.year;
  int finishMonth = finishJal.month;
  int finishDay = finishJal.day;
  return Row(
    //alignment: WrapAlignment.spaceBetween,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            name ?? '',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: IranSansWeb,
              color: BlackColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "شروع اشتراک: " ,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: IranSansWeb,
                  color: BlackColor,
                ),
              ),
              SizedBox(width: 6,),
              Text(
                "${startYear.toString().toPersianDigit()}/${startMonth.toString().toPersianDigit()}/${startDay.toString().toPersianDigit()}",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: IranSansWeb,
                  color: BlackColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("پایان اشتراک: ", style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                fontFamily: IranSansWeb,
                color: BlackColor,
              ),),
              SizedBox(width: 5,),
              Text(
                "${finishYear.toString().toPersianDigit()}/${finishMonth.toString().toPersianDigit()}/${finishDay.toString().toPersianDigit()}",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: IranSansWeb,
                  color: BlackColor,
                ),
              ),
            ],
          ),
        ],
      ),
      Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(OrderPage, arguments: [businessOwner, storeId]);
              },
              child: SubButtonTextStyle(
                text: 'انتخاب',
              ),
              style:
              buttonStyle_build(90, 40, 10, YellowColor),
            ),
          ),
        ],
      ),
    ],
  );
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
        fontSize: 20,
        fontFamily: IranSansWeb,
        color: BlackColor,
      ),
    );
  }
}
