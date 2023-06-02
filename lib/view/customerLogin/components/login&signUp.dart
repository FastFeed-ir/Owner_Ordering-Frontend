import 'package:owner_ordering_frontend/view/customerLogin/components/verifyCode.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:FastFeed/view/verifyCode/components/verifyCode.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/constants.dart';

class PhoneNumberScreen extends StatefulWidget {
  @override
  PhoneNumberScreen({Key? key}) : super(key: key);
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  late String _phoneController = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text("لطفا شماره تلفن همراه خود را وارد کنید",style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: IranSansWeb,
                ),),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 300, height: 80),
                    child: TextFormField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.phone,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontFamily: "IranSansWeb",
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: YellowColor),
                        ),
                        labelText: "شماره تلفن همراه",
                        helperText: "شماره با ۹ شروع می‌شود",
                        hintText: "9123456789",
                        helperStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      style: TextStyle(

                        color: Colors.black,
                        fontFamily: IranSansWeb,
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) {
                        _phoneController = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty || value.length != 10) {
                          return "لطفا شماره خود را وارد کنید";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 150, height: 30),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: YellowColor,
                        // fixedSize: Size.fromHeight(30),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0),),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState?.validate() == true) {
                          FirebaseAuth auth = FirebaseAuth.instance;
                          try {
                            await auth.verifyPhoneNumber(
                              phoneNumber: '+98${_phoneController}',
                              verificationCompleted: (PhoneAuthCredential credential) async {},
                              verificationFailed: (e) {
                                throw Exception(e.toString());
                              },
                              codeSent: ((String verificationId, int? resendToken) async {
                                await Future.delayed(Duration(seconds: 2));
                                Get.to(() => ConfirmationScreen(
                                  phoneNumber: '+98${_phoneController}',
                                  verificationId: verificationId,
                                ));
                              }),
                              codeAutoRetrievalTimeout: (String verificationId) {},
                            );
                          } on FirebaseAuthException catch (e) {
                            print(e.toString());
                          }
                        }
                      },
                      child: Text(
                        "تایید",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: "IranSansWeb",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
