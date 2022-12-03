import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:netflix_clone/constants/HeroWidget.dart';
import 'package:netflix_clone/constants/buttons.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/controller/MovieController.dart';
import 'package:netflix_clone/models/MovieDetailsModel.dart';
import 'package:netflix_clone/models/MoviesModel.dart';
import 'package:number_slide_animation/number_slide_animation.dart';


class MovieDetailsScreen extends StatefulWidget {
  // MoviesDetailsModel movie;

  MoviesModel m1;
  MovieDetailsScreen({super.key, required this.m1});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final MovieController controller = Get.find();
  int produtionCompanyCount = 0;
  List<ProductionCompany> productionCompanieslist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: ClampingScrollPhysics()),
        child: Stack(
          children: [
            Column(
              children: [
                Hero(
                  tag: widget.m1.posterPath,
                  child: Container(
                    child: CachedNetworkImage(
                      imageUrl: imagebaseULR + widget.m1.posterPath,
                      width: Config().deviceWidth(context),
                      // height: Config().deviceHeight(context) * 0.22,
                      fit: BoxFit.fitWidth,
                      placeholder: (context, url) => Lottie.asset(
                          'assets/lottie/newsload.json',
                          width: 80,
                          reverse: false,
                          repeat: false),
                    ),
                  ),
                ),
                HeroWidget(
                  tag: widget.m1.title,
                  child: Container(
                    width: Config().deviceWidth(context),
                    // height: 200,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            widget.m1.title,
                            style: const TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        // Text(
                        //   widget.m1.voteAverage.toString(),
                        //   style: const TextStyle(
                        //       fontSize: 16, fontWeight: FontWeight.w500),
                        // ),
                      ],
                    ),
                  ),
                ),
                RatingBarIndicator(
                  rating: widget.m1.voteAverage / 2,
                  unratedColor: Colors.grey.shade200,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 26.0,
                  direction: Axis.horizontal,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      NumberSlideAnimation(
                        number: (widget.m1.voteAverage).toInt().toString(),
                        duration: const Duration(seconds: 2),
                        curve: Curves.bounceIn,
                        textStyle: const TextStyle(
                            fontSize: 36.0, fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        ".",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w500),
                      ),
                      NumberSlideAnimation(
                        number: ((widget.m1.voteAverage -
                                    widget.m1.voteAverage.toInt()) *
                                100)
                            .toInt()
                            .toString(),
                        duration: const Duration(seconds: 2),
                        curve: Curves.bounceIn,
                        textStyle: const TextStyle(
                            fontSize: 28.0, fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        "  /  ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        "10",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Obx(() {
                  int companyCount() {
                    int count = 0;
                    List.generate(
                        controller.movieDetail.value!.productionCompanies
                            .length, (index) {
                      if (controller.movieDetail.value!
                              .productionCompanies[index].logoPath !=
                          null) {
                        count++;
                        productionCompanieslist.add(controller
                            .movieDetail.value!.productionCompanies[index]);
                      }
                    });
                    return count;
                  }

                  if (controller.isMovieDetailLoading.value ||
                      controller.movieDetail.value == null) {
                    return CircularProgressIndicator();
                  }
                  return Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              controller.movieDetail.value!.genres.length,
                              (index) => chips(
                                  controller.movieDetail.value!.genres[index])),
                        ),
                      ),
                      title("\" ${controller.movieDetail.value!.tagline} \""),
                      title("Overview"),
                      title(controller.movieDetail.value!.overview,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                infoUI(
                                  "Revenue",
                                  MoneyFormatter(
                                    amount: controller
                                                .movieDetail.value!.revenue ==
                                            0
                                        ? 10000000
                                        : controller.movieDetail.value!.revenue
                                            .toDouble(),
                                  ).output.compactSymbolOnLeft,
                                ),
                                infoUI(
                                  "Budget",
                                  MoneyFormatter(
                                    amount: controller.movieDetail.value!.budget
                                        .toDouble(),
                                  ).output.compactSymbolOnLeft,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                infoUI(
                                    "Release Date",
                                    formatDate(
                                        controller
                                            .movieDetail.value!.releaseDate,
                                        [d, ' ', M, '\' ', yy])),
                                infoUI(
                                    "Runtime",
                                    controller.movieDetail.value!.runtime
                                            .toString() +
                                        " min"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      companyCount() > 0
                          ? Column(
                              children: [
                                title("Production Companies"),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(
                                        productionCompanieslist.length,
                                        (index) {
                                      return productionCompany(
                                          productionCompanieslist[index]);

                                      // return const SizedBox();
                                    }),
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                    ],
                  );
                }),
              ],
            ),
            Positioned(
                top: 10,
                left: 20,
                child: SafeArea(child: CustomBack(color: black))),
          ],
        ),
      ),
    );
  }

  chips(Genre genre) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chip(
        backgroundColor: Colors.transparent,
        shape: const StadiumBorder(side: BorderSide()),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
        label: Text(
          genre.name,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  title(String txt, {TextStyle? style}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Wrap(
        children: [
          Text(
            txt,
            style: style == null
                ? const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)
                : style,
          ),
        ],
      ),
    );
  }

  productionCompany(ProductionCompany comp) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Config().deviceWidth(context) * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CachedNetworkImage(
                imageUrl: imagebaseULR + comp.logoPath,
                width: 60,
                height: 60,
                fit: BoxFit.contain,
                placeholder: (context, url) => Lottie.asset(
                    'assets/lottie/newsload.json',
                    width: 80,
                    reverse: false,
                    repeat: false),
                errorWidget: (context, url, error) {
                  return const NotFound();
                },
              ),
            ),
            Text(
              comp.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  infoUI(String title, String data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Config().deviceWidth(context) * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              data,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
