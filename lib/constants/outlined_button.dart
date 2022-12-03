import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/constants.dart';

class CustomOutlinedButton extends StatefulWidget {
  Function()? onTap;
  String text;
  CustomOutlinedButton({Key? key, required this.text, this.onTap})
      : super(key: key);

  @override
  State<CustomOutlinedButton> createState() => _CustomOutlinedButtonState();
}

class _CustomOutlinedButtonState extends State<CustomOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    bool pressed = false;
    return SizedBox(
      width: Config().deviceWidth(context) * 0.6,
      height: 70,
      child: OutlinedButton(
        onHover: (state) {
          setState(() {
            pressed = state;
          });
        },
        onPressed: widget.onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            return Colors.transparent;
          }),
          overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.pressed)) {
              return accent;
            }
            return Colors.transparent;
          }),
          side: MaterialStateProperty.resolveWith((states) {
            Color _borderColor = accent;
            return BorderSide(color: _borderColor, width: 2);
          }),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
            return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50));
          }),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
              color: pressed ? black : white,
              fontSize: 15,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
