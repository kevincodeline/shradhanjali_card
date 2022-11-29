import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shradhanjali_card/Screens/details_screen.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
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
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/bg1.jpg',
                      height: 140,
                      width: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CommonOption(
                      onTap: () {
                        Get.to(() => DetailsScreen());
                      },
                      text: 'શ્રદ્ધાંજલિ'),
                  SizedBox(
                    height: 20,
                  ),
                  CommonOption(onTap: () {}, text: 'બેસણું '),
                  SizedBox(
                    height: 20,
                  ),
                  CommonOption(onTap: () {}, text: 'પાણીઢોળ'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget CommonOption({onTap, text}) {
  return SizedBox(
    height: 50,
    width: Get.width,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white54,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      onPressed: onTap,
      child: Text(
        '$text',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
