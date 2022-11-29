import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class DivdaScreen extends StatefulWidget {
  const DivdaScreen({Key? key}) : super(key: key);

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
                    () => DivdaScreen(),
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
