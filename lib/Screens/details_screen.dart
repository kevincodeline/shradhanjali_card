import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shradhanjali_card/Screens/select_theme.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String? userTypeValue;
  TextEditingController _deadName = TextEditingController();
  TextEditingController _relation = TextEditingController();
  TextEditingController _deadDate = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _villageName = TextEditingController();
  TextEditingController _antimDate = TextEditingController();
  TextEditingController _antimTime = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _liName1 = TextEditingController();
  TextEditingController _liName2 = TextEditingController();
  TextEditingController _liName3 = TextEditingController();
  TextEditingController _mono1 = TextEditingController();
  TextEditingController _mono2 = TextEditingController();
  TextEditingController _mono3 = TextEditingController();
  DateFormat formatter = DateFormat('dd-MM-yyyy');
  late XFile? selectedImage = null;
  final _formKey = GlobalKey<FormState>();
  Future getImage() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'શ્રદ્ધાંજલિ',
          style: TextStyle(color: Colors.white),
        ),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    getImage();
                  },
                  child: Align(
                    child: selectedImage != null
                        ? Container(
                            height: Get.height * 0.14,
                            width: Get.height * 0.14,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                File(selectedImage!.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Container(
                            height: Get.height * 0.14,
                            width: Get.height * 0.14,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                'છબી અપલોડ કરો',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'મૃત વ્યક્તિનું નામ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
                TextFormField(
                  controller: _deadName,
                  cursorColor: Colors.black,
                  style: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'મૃત વ્યક્તિનું નામ દાખલ કરો';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'મૃત વ્યક્તિનું નામ દાખલ કરો',
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'સંબંધ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
                TextFormField(
                  controller: _relation,
                  cursorColor: Colors.black,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'સંબંધ દાખલ કરો';
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'સંબંધ',
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'દેવલોક પામિયાની તારીખ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'ઉંમર',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width * 0.50,
                      child: TextFormField(
                        controller: _deadDate,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'મૃત્યુની તારીખ દાખલ કરો';
                          }
                          return null;
                        },
                        cursorColor: Colors.black,
                        onTap: () async {
                          DateTime? date = DateTime(1900);
                          FocusScope.of(context).requestFocus(FocusNode());
                          date = (await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              currentDate: DateTime(2016),
                              lastDate: DateTime(2050)));
                          var x = DateTime.now()
                              .toString()
                              .split(' ')[1]
                              .split(':')
                              .first;

                          var y = 'AM';

                          if (int.parse(x) > 12) {
                            x = x == 10
                                ? "${int.parse(x) - 12}"
                                : x == 11
                                    ? "${int.parse(x) - 12}"
                                    : x == 12
                                        ? "${int.parse(x) - 12}"
                                        : '0${int.parse(x) - 12}';
                            y = 'PM';
                          } else {
                            y = 'AM';
                          }

                          log('TODAY DATE ${date.toString().split(' ').first} , ${x}:${DateTime.now().toString().split(' ')[1].split(':')[1]} $y');
                          _deadDate.text = "${formatter.format(date!)}";
                          // ${DateTime.now().timeZoneOffset}
                          // ${x}:${DateTime.now().toString().split(' ')[1].split(':')[1]}
                        },
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.calendar_month_outlined),
                          ),
                          hintText: 'મૃત્યુની તારીખ',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.40,
                      child: TextFormField(
                        controller: _age,
                        cursorColor: Colors.black,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'ઉંમર દાખલ કરો';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'ઉંમર',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ગામનું નામ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                    Container(
                      width: Get.width * 0.50,
                      child: Text(
                        'અંતીમ સંસ્કાર ની તારીખ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width * 0.45,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'ગામનું નામ દાખલ કરો';
                          }
                          return null;
                        },
                        controller: _villageName,
                        cursorColor: Colors.black,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'ગામનું નામ',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.08,
                      width: Get.width * 0.48,
                      child: TextFormField(
                        controller: _antimDate,
                        cursorColor: Colors.black,
                        onTap: () async {
                          DateTime? date = DateTime(1900);
                          FocusScope.of(context).requestFocus(FocusNode());
                          date = (await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              currentDate: DateTime(2016),
                              lastDate: DateTime(2050)));
                          var x = DateTime.now()
                              .toString()
                              .split(' ')[1]
                              .split(':')
                              .first;

                          var y = 'AM';

                          if (int.parse(x) > 12) {
                            x = x == 10
                                ? "${int.parse(x) - 12}"
                                : x == 11
                                    ? "${int.parse(x) - 12}"
                                    : x == 12
                                        ? "${int.parse(x) - 12}"
                                        : '0${int.parse(x) - 12}';
                            y = 'PM';
                          } else {
                            y = 'AM';
                          }

                          log('TODAY DATE ${date.toString().split(' ').first} , ${x}:${DateTime.now().toString().split(' ')[1].split(':')[1]} $y');
                          _antimDate.text = "${formatter.format(date!)}";
                          // ${DateTime.now().timeZoneOffset}
                          // ${x}:${DateTime.now().toString().split(' ')[1].split(':')[1]}
                        },
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.calendar_month_outlined),
                          ),
                          hintText: 'અંતીમ સંસ્કાર ની તારીખ',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'અંતીમ સંસ્કાર નો સમય',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: Get.height * 0.08,
                      width: Get.width * 0.60,
                      child: TextFormField(
                        controller: _antimTime,
                        cursorColor: Colors.black,
                        readOnly: true,
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            initialTime: TimeOfDay.now(),
                            context: context,
                          );

                          if (pickedTime != null) {
                            var formattedTime = pickedTime.format(context);
                            print('SELECT TIME :- ${formattedTime}');
                            setState(() {
                              _antimTime.text = formattedTime;
                            });
                          } else {
                            print("Time is not selected");
                          }
                        },
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.watch_later_outlined,
                            color: Colors.black,
                          ),
                          hintText: 'અંતીમ સંસ્કાર નો સમય',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.5), width: 2),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'સરનામું',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
                TextFormField(
                  controller: _address,
                  cursorColor: Colors.black,
                  style: TextStyle(color: Colors.black),
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'સરનામું',
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'લી.નામ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                    Container(
                      width: Get.width * 0.50,
                      child: Text(
                        'મોબાઇલ નંબર',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: Get.height * 0.08,
                          width: Get.width * 0.45,
                          child: TextFormField(
                            controller: _liName1,
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'લી.નામ',
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.08,
                          width: Get.width * 0.50,
                          child: TextFormField(
                            controller: _mono1,
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'મોબાઇલ નંબર',
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: Get.height * 0.08,
                          width: Get.width * 0.45,
                          child: TextFormField(
                            controller: _liName2,
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'લી.નામ',
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.08,
                          width: Get.width * 0.50,
                          child: TextFormField(
                            controller: _mono2,
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'મોબાઇલ નંબર',
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: Get.height * 0.08,
                          width: Get.width * 0.45,
                          child: TextFormField(
                            controller: _liName3,
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'લી.નામ',
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.08,
                          width: Get.width * 0.50,
                          child: TextFormField(
                            controller: _mono3,
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'મોબાઇલ નંબર',
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      if (selectedImage == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("Please Pick Image"),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 1)),
                        );
                      } else {
                        if (_formKey.currentState!.validate()) {
                          Get.to(() => SelectThemeScreen(
                                address: _address.text,
                                age: _age.text,
                                deadDate: _deadDate.text,
                                deadName: _deadName.text,
                                village: _villageName.text,
                                image: '${selectedImage!.path}',
                                type: 'બેસણું',
                              ));
                        }
                      }
                    },
                    child: Container(
                      height: Get.height * 0.06,
                      width: Get.width * 0.30,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          'સાચવો',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
