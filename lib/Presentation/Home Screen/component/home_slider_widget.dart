import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zone/Data/Ads%20Cubit/ads_cubit.dart';
import 'package:zone/Models/ads/ads.dart';

class HomeSliderWidget extends StatefulWidget {
  const HomeSliderWidget({super.key, required this.image,});
  final String image;

  @override
  State<HomeSliderWidget> createState() => _HomeSliderWidgetState();
}

class _HomeSliderWidgetState extends State<HomeSliderWidget> {

  @override
  Widget build(BuildContext context) {
      return  Container(
                width: MediaQuery.of(context).size.width*0.98,
                margin: const EdgeInsets.all(8),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(widget.image,fit: BoxFit.fill)),
);
  }
}
