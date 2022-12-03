import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:netflix_clone/constants/buttons.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/controller/AuthController.dart';
import 'package:netflix_clone/screens/Authentication/OtpScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController countryController = TextEditingController();
  final authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    countryController.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/img1.png',
                  width: 300,
                  // height: 150,
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
                  "We need to register your phone before getting started!",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() => TextFormField(
                      initialValue: authController.phoneNo.value,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      onTap: () {
                        authController.showPrefix.value = true;
                      },
                      onChanged: (val) {
                        authController.phoneNo.value = val;
                      },
                      onTapOutside: (event) {
                        if (authController.phoneNo.value.isEmpty) {
                          authController.showPrefix.value = false;
                        }
                      },
                      onSaved: (val) => authController.phoneNo.value = val!,
                      validator: (val) => (val!.isEmpty || val.length < 10)
                          ? "Enter valid number"
                          : null,
                      cursorColor: black,
                      decoration: InputDecoration(
                        hintText: "Mobile Number",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10)),
                        prefix: authController.showPrefix.value
                            ? const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  '(+91)',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            : null,
                        suffixIcon: _buildSuffixIcon(),
                      ),
                    )),
                const SizedBox(
                  height: 22,
                ),
                ThemeButton(
                    width: Config().deviceWidth(context) * 0.8,
                    height: 60,
                    onTap: () {
                      final form = _formKey.currentState;
                      if (form!.validate()) {
                        form.save();
                        // authController.getOtp();
                        Nav().goTo(const OtpScreen(), context);
                      }
                    },
                    text: "Send the code")
                // SizedBox(
                //   width: double.infinity,
                //   height: 45,
                //   child: ElevatedButton(
                //       style: ElevatedButton.styleFrom(
                //           primary: Colors.green.shade600,
                //           shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(10))),
                //       onPressed: () {
                //         Navigator.of(context).push(
                //             MaterialPageRoute(builder: (context) => OtpScreen()));
                //       },
                //       child: const Text("Send the code")),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSuffixIcon() {
    return AnimatedOpacity(
        opacity: authController.phoneNo.value.length == 10 ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 250),
        child: const Icon(Icons.check_circle, color: Colors.green, size: 32));
  }
}
