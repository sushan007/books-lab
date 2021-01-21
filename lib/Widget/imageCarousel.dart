import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        child: Carousel(
          boxFit: BoxFit.cover,
          images: [
            AssetImage('assets/images/CarouselImages/c1.jpeg'),
            AssetImage('assets/images/CarouselImages/c2.jpeg'),
            AssetImage('assets/images/CarouselImages/c3.jpeg'),
            AssetImage('assets/images/CarouselImages/c4.jpeg'),
            AssetImage('assets/images/CarouselImages/c5.jpeg'),
          ],
          autoplay: false,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 1000),
          dotSize: 7.0,
          indicatorBgPadding: 2.0,
          dotSpacing: 30,
        ),
      ),
    );
  }
}
