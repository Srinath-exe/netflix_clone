import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MovieShimmerCard extends StatefulWidget {
  const MovieShimmerCard({super.key});

  @override
  State<MovieShimmerCard> createState() => _MovieShimmerCardState();
}

class _MovieShimmerCardState extends State<MovieShimmerCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ZoomTapAnimation(
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Stack(
              children: [
                Shimmer(
                  loop: 0,
                  period: const Duration(milliseconds: 4000),
                  gradient: LinearGradient(colors: [lightgrey, lightgrey]),
                  child: Column(children: [
                    Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        height: Config().deviceHeight(context) * 0.22,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: grey),
                          width: 100,
                          height: 20,
                        )),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
