import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/constants/buttons.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/controller/AuthController.dart';
import 'package:netflix_clone/screens/homeScreen/MoviesMain.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
// import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final AuthController controller = Get.find();
  bool incomplete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      extendBodyBehindAppBar: true,
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/images/img1.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Enter your OTP code number",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 60,
              ),
              Obx(() => Column(
                    children: [
                      OTPTextField(
                        length: 6,
                        width: MediaQuery.of(context).size.width * 0.8,
                        fieldWidth: 40,
                        hasError: controller.isInvalid.value,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 8),
                        outlineBorderRadius: 50,
                        style: TextStyle(
                            fontSize: 20,
                            color: black,
                            fontWeight: FontWeight.w600),
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldStyle: FieldStyle.underline,
                        otpFieldStyle: OtpFieldStyle(
                            enabledBorderColor: black, focusBorderColor: black),
                        onChanged: (pin) {},
                        onCompleted: (pin) {
                          controller.otp.value = pin;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      incomplete
                          ? const Text(
                              "Incomplete OTP",
                              style: TextStyle(color: Colors.red),
                            )
                          : Container(),
                      controller.isInvalid.value
                          ? const Text(
                              "Wrong OTP",
                              style: TextStyle(color: Colors.red),
                            )
                          : Container(),
                      const SizedBox(
                        height: 20,
                      ),
                      ThemeButton(
                          width: Config().deviceWidth(context) * 0.8,
                          height: 60,
                          onTap: () async {
                            if (!controller.isLoading.value) {
                              setState(() {
                                if (controller.otp.value.length < 6) {
                                  incomplete = true;
                                } else {
                                  incomplete = false;
                                }
                              });
                              if (controller.otp.value.length == 6) {
                                var loggedin = await controller.verifyOTP();
                                if (loggedin) {
                                  Navigator.pop(context);
                                  log("LOGGED IN SUCCESSFULLY");
                                }
                              }
                            }
                          },
                          text: "Verify",
                          child: controller.isLoading.value
                              ? CircularProgressIndicator(
                                  color: white,
                                )
                              : Text(
                                  "Verify",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: white,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1),
                                )),
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Edit Phone Number ?",
                                style: TextStyle(color: Colors.black),
                              ))
                        ],
                      ),
                      controller.isOtpSent.value
                          ? TextButton(
                              style: const ButtonStyle(),
                              onPressed: () => controller.resendOTP.value
                                  ? controller.resendOtp()
                                  : null,
                              child: Text(
                                controller.resendOTP.value
                                    ? "Resend New Code"
                                    : "Wait ${controller.resendAfter} seconds",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          : Container(),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
