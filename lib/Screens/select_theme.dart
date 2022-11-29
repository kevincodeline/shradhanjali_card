import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shradhanjali_card/Screens/divada_screen.dart';

class SelectThemeScreen extends StatefulWidget {
  const SelectThemeScreen({Key? key}) : super(key: key);

  @override
  State<SelectThemeScreen> createState() => _SelectThemeScreenState();
}

class _SelectThemeScreenState extends State<SelectThemeScreen> {
  List<Color> data = [
    Colors.yellow.shade200,
    Colors.green.shade200,
    Colors.red.shade200,
    Colors.blue.shade200,
    Colors.pink.shade200,
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
            backgroundColor: Colors.black,
            title: Text(
              'Select Background',
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
                    height: 300,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white54,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: data[index],
                      ),
                    ),
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
