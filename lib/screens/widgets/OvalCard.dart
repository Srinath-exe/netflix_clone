import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/constants/HeroWidget.dart';
import 'package:netflix_clone/constants/buttons.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/controller/MovieController.dart';
import 'package:netflix_clone/models/MoviesModel.dart';
import 'package:netflix_clone/screens/homeScreen/MovieDetails.dart';
import 'package:number_slide_animation/number_slide_animation.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';


class OvalCard extends StatefulWidget {
  MoviesModel movie;
  OvalCard({super.key, required this.movie});

  @override
  State<OvalCard> createState() => _OvalCardState();
}

class _OvalCardState extends State<OvalCard> {
  final MovieController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      end: 0.98,
      onTap: () {
        controller.getMovieDetails(widget.movie.id.toString());
        Navigator.of(context).push(PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 400),
            reverseTransitionDuration: Duration(milliseconds: 100),
            pageBuilder: ((context, animation, secondaryAnimation) {
              final curvedAnimation =
                  CurvedAnimation(parent: animation, curve: Interval(0, 0.5));

              return FadeTransition(
                opacity: curvedAnimation,
                child: MovieDetailsScreen(
                  m1: widget.movie,
                ),
              );
            })));
      },
      child: Material(
        elevation: 40,
        borderRadius: BorderRadius.circular(200),
        child: Container(
          // height: 600,
          // width: 300,
          clipBehavior: Clip.hardEdge,
          constraints: BoxConstraints(maxHeight: 700, minHeight: 500),
          decoration: BoxDecoration(
            boxShadow: [
              // BoxShadow(
              //     offset: Offset(0, 50),
              //     blurRadius: 100.0,
              //     color: lightgrey.withOpacity(0)),
            ],
            color: white,
            borderRadius: BorderRadius.circular(200),
          ),
          child: Stack(
            fit: StackFit.passthrough,
            alignment: AlignmentDirectional.center,
            children: [
              Positioned(
                  bottom: -10,
                  child: ThemeButton(
                    text: "See more",
                    height: 80,
                    borderRadius: 40,
                  )),
              Container(
                width: 300,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Hero(
                        tag: widget.movie.posterPath,
                        child: Container(
                          height: 350,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(
                                  imagebaseULR + widget.movie.posterPath,
                                  errorListener: () {},
                                ),
                              )),
                        ),
                      ),
                    ),
                    HeroWidget(
                      tag: widget.movie.title,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              widget.movie.title,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          NumberSlideAnimation(
                            number:
                                (widget.movie.voteAverage).toInt().toString(),
                            duration: const Duration(seconds: 2),
                            curve: Curves.bounceIn,
                            textStyle: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),
                          const Text(
                            ".",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          NumberSlideAnimation(
                            number: ((widget.movie.voteAverage -
                                        widget.movie.voteAverage.toInt()) *
                                    100)
                                .toInt()
                                .toString(),
                            duration: const Duration(seconds: 2),
                            curve: Curves.bounceIn,
                            textStyle: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),
                          const Text(
                            "  /  ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            "10",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    RatingBarIndicator(
                      rating: widget.movie.voteAverage / 2,
                      unratedColor: Colors.grey.shade200,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 26.0,
                      direction: Axis.horizontal,
                    ),
                    // IconTheme(
                    //   data: IconThemeData(
                    //     color: Colors.amber,
                    //     size: 48,
                    //   ),

                    //   child: StarDisplay(
                    //       value: (widget.movie.voteAverage / 2).toInt()),
                    // ),

                    // SizedBox(
                    //   height: 100,
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
