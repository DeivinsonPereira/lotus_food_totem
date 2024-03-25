// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors_in_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:lotus_food_totem/services/dependencies.dart';
import 'package:lotus_food_totem/services/image_slider_tratment.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../option/option_page.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  int activeIndex = 0;
  final controller = CarouselController();
  var sliderController = Dependencies.sliderController();

  var size = Get.size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: Image.file(File(sliderController.backgroundImage.value),
                fit: BoxFit.cover),
          ),
          Positioned(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarouselSlider.builder(
                    carouselController: controller,
                    itemCount: sliderController.urlImagesSlide.length,
                    itemBuilder: (context, index, realIndex) {
                      final urlImage =
                          sliderController.slideImages[index].path_image;
                      return buildImage(urlImage, index);
                    },
                    options: CarouselOptions(
                      height: size.height * 0.9,
                      autoPlay: true,
                      enableInfiniteScroll: false,
                      autoPlayAnimationDuration: const Duration(seconds: 2),
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) =>
                          setState(() => activeIndex = index),
                    ),
                  ),
                  const SizedBox(height: 12),
                  buildIndicator()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: const ExpandingDotsEffect(
            dotWidth: 15, activeDotColor: Colors.blue),
        activeIndex: activeIndex,
        count: sliderController.urlImagesSlide.length,
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}

Widget buildImage(String urlImage, int index) => InkWell(
      onTap: () async {
        var menuController = Dependencies.menuController();
        var paymentController = Dependencies.paymentController();
        menuController.clearAll();
        paymentController.clearAll();
        await Get.to(() => const OptionPage());
      },
      child: Container(
        child: ImageSliderTratment().buildSlider(urlImage),
      ),
    );
