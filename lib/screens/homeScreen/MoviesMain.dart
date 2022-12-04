import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_clone/constants/buttons.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/controller/MovieController.dart';
import 'package:netflix_clone/models/sample_data.dart';
import 'package:netflix_clone/screens/widgets/OvalCard.dart';

class MoviesMain extends StatefulWidget {
  const MoviesMain({super.key});

  @override
  State<MoviesMain> createState() => _MoviesMainState();
}

class _MoviesMainState extends State<MoviesMain> {
  final MovieController controller = Get.find();
  CarouselController carouselController = new CarouselController();
  int curr = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: Container(
            child: Obx(
          () => Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AnimatedSwitcher(
                      switchInCurve: Curves.bounceInOut,
                      duration: const Duration(milliseconds: 200),
                      child: Container(
                        key: Key(controller.mainMovieList[curr].backdropPath),
                        width: Config().deviceWidth(context),
                        height: Config().deviceHeight(context) * 0.6,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: CachedNetworkImageProvider(
                            imagebaseULR +
                                controller.mainMovieList[curr].backdropPath,
                            errorListener: () {},
                          ),
                        )),
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                Colors.transparent,
                                Colors.transparent,
                                Colors.transparent,
                                white.withOpacity(0.2),
                                white.withOpacity(0.8),
                                white.withOpacity(1),
                              ])),
                        ),
                      ),
                      transitionBuilder: (child, animation) {
                        return FadeTransition(opacity: animation, child: child);
                      }),
                ],
              ),
              // Positioned(
              //     top: 10,
              //     left: 20,
              //     child: SafeArea(
              //         child: CustomBack(
              //       color: white,
              //     ))),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 100.0),
                  child: SizedBox(
                    height: 600,
                    child: CarouselSlider(
                      carouselController: carouselController,
                      options: CarouselOptions(
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 2000),
                          onPageChanged: (i, r) {
                            setState(() {
                              curr = i;
                            });
                          },
                          height: 600.0,
                          clipBehavior: Clip.none,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          viewportFraction: 0.8),
                      items: List.generate(
                          controller.mainMovieList.length,
                          (index) =>
                              OvalCard(movie: controller.mainMovieList[index])),
                    ),
                  ),
                ),
              )
            ],
          ),
        )));
  }
}

// CarouselSlider(
//         carouselController: controller,
//         options: CarouselOptions(
//             height: 600.0,
//             clipBehavior: Clip.none,
//             autoPlay: false,
//             enlargeCenterPage: true,
//             enlargeStrategy: CenterPageEnlargeStrategy.scale,
//             viewportFraction: 0.8),
//         items: List.generate(
//             newList.length, (index) => OvalCard(movie: newList[index])),
//       ),