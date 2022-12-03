import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/controller/MovieController.dart';

class CustomTextField extends StatefulWidget {
  String name;
  TextEditingController controller;
  IconData icon;
  bool? isPassword;
  FocusNode focus;
  Function(String) onSubmit;
  void Function() onClose;
  CustomTextField(
      {Key? key,
      this.isPassword = false,
      required this.name,
      required this.focus,
      required this.icon,
      required this.onClose,
      required this.onSubmit,
      required this.controller})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _passwordVisible;
  final MovieController controller = Get.find();
  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 0),
      child: Material(
        elevation: 1,
        color: white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Container(
          constraints: const BoxConstraints(minWidth: 100, maxWidth: 600),
          width: MediaQuery.of(context).size.width * 0.9,
          alignment: Alignment.center,
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: black,
                radius: 28,
                child: Icon(
                  Icons.search_rounded,
                  size: 30,
                  color: white,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 16, top: 5),
                  child: TextFormField(
                    onFieldSubmitted: widget.onSubmit,
                    focusNode: widget.focus,
                    textAlignVertical: TextAlignVertical.center,
                    controller: widget.controller,
                    textAlign: TextAlign.left,
                    enabled: true,
                    cursorHeight: 26,
                    cursorColor: black,
                    textInputAction: TextInputAction.search,
                    keyboardType: TextInputType.name,
                    style: TextStyle(fontSize: 16, color: black),
                    obscureText: _passwordVisible,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          splashRadius: 20,
                          onPressed: () {
                            controller.showTopRelated(0);
                            setState(() {
                              widget.controller.clear();
                              FocusManager.instance.primaryFocus?.unfocus();
                            });
                          },
                          icon: Icon(
                            Icons.close_rounded,
                            color: black,
                          )),
                      suffixIconConstraints: BoxConstraints(minWidth: 60),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      hintText: widget.name,
                      hintStyle: TextStyle(color: grey, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
