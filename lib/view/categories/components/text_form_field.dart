import 'package:flutter/material.dart';

Widget textFormField(
    TextEditingController controller, String label, bool isMandatory) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: TextFormField(
      controller: controller,
      textAlign: TextAlign.right,
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
        if (isMandatory && (value == null || value.isEmpty)) {
          return 'لطفا اطلاعات مورد نظر را کامل کنید';
        }
        return null;
      },
    ),
  );
}
