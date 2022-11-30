import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shradhanjali_card/Screens/main_screen.dart';

class DivdaScreen extends StatefulWidget {
  final Color? color;
  final Color? colorBorder;
  final String? type;
  final String image;
  final String deadName;
  final String deadDate;
  final String age;
  final String village;
  final String address;
  const DivdaScreen(
      {Key? key,
      this.color,
      this.colorBorder,
      this.type,
      required this.image,
      required this.deadName,
      required this.deadDate,
      required this.age,
      required this.village,
      required this.address})
      : super(key: key);

  @override
  State<DivdaScreen> createState() => _DivdaScreenState();
}

class _DivdaScreenState extends State<DivdaScreen> {
  List<String> data = [
    'assets/fg1.png',
    'assets/fg2.png',
    'assets/fg3.png',
    'assets/fg4.png',
    'assets/fg5.png',
    'assets/fg6.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/bg.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 3,
          sigmaX: 3,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
            title: Text(
              'Select Components',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            centerTitle: true,
            leading: IconButton(
              splashRadius: 20,
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios,
              ),
            ),
          ),
          body: MasonryGridView.count(
            padding: EdgeInsets.zero,
            itemCount: data.length,
            physics: BouncingScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(
                    () => MainScreen(
                      address: widget.address,
                      age: widget.age,
                      deadDate: widget.deadDate,
                      deadName: widget.deadName,
                      village: widget.village,
                      color: widget.color!,
                      component: data[index],
                      colorBorder: widget.colorBorder!,
                      image: widget.image,
                      type: widget.type.toString(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 250,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white24,
                    ),
                    child: Image.asset('${data[index]}'),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
