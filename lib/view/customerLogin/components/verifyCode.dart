import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../model/entity/owner.dart';
import '../../../utils/constants.dart';
import '../../../view_model/owner_viewmodel.dart';
import 'login&signUp.dart';

class ConfirmationScreen extends StatefulWidget {
  String? phoneNumber;
  final verificationId;

  ConfirmationScreen({required this.phoneNumber, required this.verificationId});
  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  TextEditingController t0 = TextEditingController(),
      t1 = TextEditingController(),
      t2 = TextEditingController(),
      t3 = TextEditingController(),
      t4 = TextEditingController(),
      t5 = TextEditingController();
  int? id;
  verifyOTP(String verificationId, String userOTP) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOTP);
      await auth.signInWithCredential(credential);
      _confirmCode();
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  // final _codeController = TextEditingController();
  Timer? _timer;
  int _resendSeconds = 100;

  final _viewModel = OwnerViewModel();
  final List<Owner> _owners = [];

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startResendTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_resendSeconds > 0) {
          _resendSeconds--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void _resendCode() {
    // code to resend the confirmation code to the user's phone number
    _resendSeconds = 100;
    _startResendTimer();
  }

  void _confirmCode() {
    // print(code);
    // code to verify the confirmation code entered by the user
    _viewModel.searchPhone(widget.phoneNumber!);
    _viewModel.owners.stream.listen((list) async {
      setState(() {
        _owners.addAll(list);
      });
      if (_owners.isNotEmpty) {
        for (Owner i in _owners) {
          id = i.id;
        }
      } else {
        Owner owner = await Owner(
            phone_number: widget.phoneNumber, first_name: "", last_name: "");
        await Future.delayed(const Duration(seconds: 5));
        owner = await _viewModel.addOwner(owner);
        id = owner.id;
        loading();
      }
      //TODO got to subscription
      // Get.toNamed(HomePage, arguments: id);----------------------------------------------
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              ' لطفا کد ارسال شده به شماره ${widget.phoneNumber} را وارد نمایید ',
              style: TextStyle(
                fontFamily: 'IranSansWeb',
                  fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildDigitInput(0, t5),
                _buildDigitInput(1, t4),
                _buildDigitInput(2, t3),
                _buildDigitInput(3, t2),
                _buildDigitInput(4, t1),
                _buildDigitInput(5, t0),
              ],
            ),
          ),
          SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(
                  visible: (_resendSeconds != 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.timer_outlined, size: 17),
                      Text(
                        ' $_resendSeconds ثانیه تا ارسال مجدد  ',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'IranSansWeb',
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: (_resendSeconds == 0),
                  child: ElevatedButton.icon(
                    onPressed: (_resendSeconds == 0) ? _resendCode : null,
                    icon: Icon(
                      Icons.restart_alt_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                    label: Text(
                      "ارسال مجدد",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: "IranSansWeb",
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: RedColor,
                      fixedSize: Size.fromWidth(150),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: YellowColor,
                  fixedSize: Size.fromWidth(150),
                ),
                child: Text(
                  'تایید',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: "IranSansWeb",
                  ),
                ),
                onPressed: () async {
                  verifyOTP(widget.verificationId,
                      t0.text + t1.text + t2.text + t3.text + t4.text + t5.text);
                }),
          ),
          SizedBox(height: 16),
          Center(
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: YellowColor,
                  fixedSize: Size.fromWidth(150),
                ),
                child: Text(
                  'اصلاح شماره',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: "IranSansWeb",
                  ),
                ),
                onPressed: () async {
                  Get.to(() => PhoneNumberScreen());
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildDigitInput(int index, TextEditingController t) {
    return SizedBox(
      width: 42,
      child: TextField(
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        controller: t,
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'IranSansWeb',
        ),
        decoration: InputDecoration(
          counter: SizedBox.shrink(),
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            if (index < 6 && index != 0) {
              FocusScope.of(context).previousFocus();
            }
          }
          if (value.isEmpty && index < 5) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
