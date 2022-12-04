import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/screens/widgets/textfield.dart';

class CustomSearchBar extends StatefulWidget {
  TextEditingController controller;
  Function(String) onSubmit;
  Function() onClose;
  CustomSearchBar(
      {super.key,
      required this.controller,
      required this.onSubmit,
      required this.onClose});

  @override
  State<CustomSearchBar> createState() => Custom_SearchStateBar();
}

class Custom_SearchStateBar extends State<CustomSearchBar> {
  FocusNode focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: CustomTextField(
          name: "Search",
          focus: focus,
          controller: widget.controller,
          icon: Icons.person_outlined,
          onSubmit: widget.onSubmit,
          onClose: widget.onClose),
    );
  }
}
