import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/screens/homeScreen/MoviesMain.dart';

class AuthController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var showPrefix = false.obs;
  var isLogin = true;
  var phoneNo = "".obs;
  var otp = "".obs;
  var isLoading = false.obs;
  var isInvalid = false.obs;
  var isOtpSent = false.obs;
  var resendAfter = 30.obs;
  var resendOTP = false.obs;
  var firebaseVerificationId = "";
  var statusMessage = "".obs;
  var statusMessageColor = Colors.black.obs;

  var timer;

  AuthController() {}

  @override
  onInit() async {
    super.onInit();
  }

  getOtp() async {
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91${phoneNo.value}',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        firebaseVerificationId = verificationId;
        isOtpSent.value = true;
        startResendOtpTimer();
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  resendOtp() async {
    resendOTP.value = false;
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91${phoneNo.value}',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        firebaseVerificationId = verificationId;
        isOtpSent.value = true;
        startResendOtpTimer();
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<bool> verifyOTP() async {
    isLoading.value = true;
    isInvalid.value = false;
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: firebaseVerificationId, smsCode: otp.value);
      // Sign the user in (or link) with the credential
      var user = await auth.signInWithCredential(credential);
      isLoading.value = false;

      return true;
    } catch (e) {
      isLoading.value = false;
      log("LOGIN ERROR : $e");
      isInvalid.value = true;
      statusMessage.value = "Invalid  OTP";
      statusMessageColor = Colors.red.obs;
      return false;
    }
  }

  startResendOtpTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendAfter.value != 0) {
        resendAfter.value--;
      } else {
        resendAfter.value = 30;
        resendOTP.value = true;
        timer.cancel();
      }
      update();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
