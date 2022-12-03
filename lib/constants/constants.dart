import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

String movieAPIKEY = "396d153beb96e51413771c157c98d7c9";
String imagebaseULR = "https://www.themoviedb.org/t/p/w220_and_h330_face/";

class Config {
  double deviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double deviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}

//Colors
// Color secondary = Color(0xFFFFECB3);
Color secondary = Colors.white;
Color accent = const Color(0xffA8FF35);

Color grey = const Color(0xff171717);
Color black = Colors.black;
Color white = Colors.white;
Color lightgrey = Colors.grey.shade200;

class Nav {
  goTo(Widget child, BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return child;
    }));
  }
}

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Config().deviceHeight(context) * 0.4,
      child: Lottie.asset(
        'assets/lottie/notFound.json',
      ),
    );
  }
}
