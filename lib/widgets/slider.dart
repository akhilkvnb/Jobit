import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CusSlider extends StatelessWidget {
  const CusSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: [
          Container(
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('asset/login.png'), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('asset/login.png'), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('asset/login.png'), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
        options: CarouselOptions(
            height: MediaQuery.of(context).size.height * .29,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8));
  }
}
