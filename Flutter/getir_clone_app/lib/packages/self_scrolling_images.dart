import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';

class SelfScrollingImages extends StatefulWidget {
  const SelfScrollingImages({super.key});

  @override
  State<SelfScrollingImages> createState() => _SelfScrollingImagesState();
}

class _SelfScrollingImagesState extends State<SelfScrollingImages> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
              height: MediaQuery.of(context).size.height/3.5,
              child: AnotherCarousel(
                animationCurve: Curves.ease,
                animationDuration: const Duration(milliseconds: 800) ,
                autoplayDuration: const Duration(seconds: 4),
                indicatorBgPadding: 0,
                showIndicator: true,
                dotSize: 6,
                dotSpacing: 20,
                dotColor: Colors.white60,
                dotIncreasedColor: Colors.white,
                dotPosition: DotPosition.bottomRight,
                dotHorizontalPadding: 20,
                dotBgColor: Colors.transparent,
                images: [
                  Image.asset("images/indirim.jpg",fit: BoxFit.fill,),         
                  Image.asset("images/indirim2.jpg",fit: BoxFit.fill),
                  Image.asset("images/indirim3.jpg",fit: BoxFit.fill),
                  Image.asset("images/indirim4.jpg",fit: BoxFit.fill),
                  Image.asset("images/indirim5.jpg",fit: BoxFit.fill)
                ],
              ),
            );
  }
}