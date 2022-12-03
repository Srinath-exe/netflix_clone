import 'package:flutter/material.dart';

class ThemeButton extends StatefulWidget {
  String text;
  Function()? onTap;
  Color? bgColor;
  EdgeInsetsGeometry? padding;
  double? width;
  double? height;
  double? elevation;
  Color? txtColor;
  bool? outlineButton;
  double? fontsize;
  Widget? child;
  double borderRadius;
  BoxConstraints constraints;
  ThemeButton(
      {Key? key,
      this.onTap,
      this.constraints = const BoxConstraints(),
      this.borderRadius = 50,
      this.txtColor = Colors.white,
      this.elevation = 2,
      required this.text,
      this.bgColor = Colors.black,
      this.padding = const EdgeInsets.all(10),
      this.height = 70,
      this.fontsize = 18,
      this.outlineButton = false,
      this.child,
      this.width = 240})
      : super(key: key);

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding!,
      child: Container(
        constraints: widget.constraints,
        width: widget.width,
        height: widget.height,
        child: ElevatedButton(
            onPressed: widget.onTap ?? () {},
            style: OutlinedButton.styleFrom(
                backgroundColor:
                    widget.outlineButton! ? Colors.transparent : widget.bgColor,
                shape: RoundedRectangleBorder(
                    side: widget.outlineButton!
                        ? BorderSide(width: 2, color: widget.bgColor!)
                        : const BorderSide(width: 1, color: Colors.transparent),
                    borderRadius: BorderRadius.circular(widget.borderRadius)),
                elevation: widget.elevation,
                primary: Colors.white),
            child: widget.child == null
                ? Text(widget.text,
                    style: TextStyle(
                        // letterSpacing: 1,
                        fontSize: widget.fontsize,
                        color: widget.outlineButton!
                            ? Colors.black
                            : widget.txtColor,
                        fontWeight: FontWeight.w500))
                : widget.child!),
      ),
    );
  }
}

class CustomBack extends StatefulWidget {
  Color color;
  CustomBack({super.key, required this.color});

  @override
  State<CustomBack> createState() => _CustomBackState();
}

class _CustomBackState extends State<CustomBack> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        child: Row(children: [
          Icon(
            Icons.keyboard_backspace,
            color: widget.color,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "back",
            style: TextStyle(color: widget.color, fontSize: 16),
          )
        ]),
      ),
    );
  }
}
