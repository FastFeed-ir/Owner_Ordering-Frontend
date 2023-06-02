import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

Widget textFormFieldNumber(TextEditingController controller, String label,
    bool isMandatory, bool isDiscount) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: TextFormField(
      controller: controller,
      textAlign: TextAlign.right,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: label,
        alignLabelWithHint: true,
        filled: true,
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white10)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          if (isMandatory) {
            return 'لطفا اطلاعات مورد نظر را کامل کنید';
          }
        } else {
          if (isDiscount) {
            //is string or number
            var englishDigit = value.toEnglishDigit();
            if (englishDigit.isNumeric()) {
              //is number
              //check is 0 <= value <= 100 and maximum two decimal places
              var decimalsCount = 0;
              if (englishDigit.contains('.')) {
                decimalsCount = englishDigit.split('.')[1].length;
              }
              var number = double.parse(englishDigit);
              if (decimalsCount > 2 || number < 0.0 || number > 100.0) {
                return 'اطلاعات وارد شده معتبر نیست';
              }
            } else {
              //is string
              return 'اطلاعات وارد شده معتبر نیست';
            }
          }
        }
        return null;
      },
    ),
  );
}
