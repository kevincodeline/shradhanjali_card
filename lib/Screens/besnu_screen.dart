import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shradhanjali_card/Screens/select_theme.dart';

class BesnuScreen extends StatefulWidget {
  const BesnuScreen({Key? key}) : super(key: key);

  @override
  State<BesnuScreen> createState() => _BesnuScreenState();
}

class _BesnuScreenState extends State<BesnuScreen> {
  String? userTypeValue;
  TextEditingController _deadName = TextEditingController();
  TextEditingController _relation = TextEditingController();
  TextEditingController _deadDate = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _villageName = TextEditingController();
  TextEditingController _antimDate = TextEditingController();
  TextEditingController _startTime = TextEditingController();
  TextEditingController _endTime = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _liName1 = TextEditingController();
  TextEditingController _liName2 = TextEditingController();
  TextEditingController _liName3 = TextEditingController();
  TextEditingController _mono1 = TextEditingController();
  TextEditingController _mono2 = TextEditingController();
  TextEditingController _mono3 = TextEditingController();
  DateFormat formatter = DateFormat('dd-MM-yyyy');
  late XFile? selectedImage = null;

  Future getImage() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      selectedImage = image;
    });
  }

  bool val = false;
  bool add = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'બેસણું',
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
              SizedBox(
                height: Get.height * 0.08,
                child: TextFormField(
                  controller: _deadName,
                  onChanged: (val) {
                    setState(() {});
                  },
                  cursorColor: Colors.black,
                  style: TextStyle(color: Colors.black),
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
              SizedBox(
                height: Get.height * 0.08,
                child: TextFormField(
                  controller: _relation,
                  cursorColor: Colors.black,
                  onChanged: (val) {
                    setState(() {});
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
                    height: Get.height * 0.08,
                    width: Get.width * 0.50,
                    child: TextFormField(
                      controller: _deadDate,
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
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.08,
                    width: Get.width * 0.40,
                    child: TextFormField(
                      controller: _age,
                      cursorColor: Colors.black,
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
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.black, width: 2),
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
                    width: Get.width * 0.47,
                    child: Text(
                      'બેસણાં ની તારીખ',
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
                    height: Get.height * 0.08,
                    width: Get.width * 0.45,
                    child: TextFormField(
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
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.black, width: 2),
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
                        hintText: 'બેસણાં ની તારીખ',
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
                    'પ્રારંભ સમય',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                  Container(
                    width: Get.width * 0.47,
                    child: Text(
                      'સમાપ્તિ સમય',
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
                  Expanded(
                    child: TextFormField(
                      controller: _startTime,
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
                            _startTime.text = formattedTime;
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
                        hintText: 'પ્રારંભ સમય',
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.5), width: 2),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _endTime,
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
                            _endTime.text = formattedTime;
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
                        hintText: 'સમાપ્તિ સમય',
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.black, width: 2),
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
              SizedBox(
                height: 10,
              ),
              Container(
                height: Get.height * 0.08,
                width: Get.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Radio(
                        value: false,
                        groupValue: val,
                        onChanged: (value) {
                          setState(() {
                            val = value!;
                            add = false;
                          });
                        }),
                    Text(
                      'ટેલિફોનિક',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Radio(
                        value: true,
                        groupValue: val,
                        onChanged: (value) {
                          setState(() {
                            val = value!;
                            add = true;
                          });
                        }),
                    Text(
                      'લૈકિક',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              add == true
                  ? Text(
                      'સરનામું',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    )
                  : SizedBox(),
              add == true
                  ? TextFormField(
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
                    )
                  : SizedBox(),
              SizedBox(
                height: 10,
              ),
              Text(
                'વર્ણન ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black.withOpacity(0.5))),
                child: Text(
                    '${'દિલગીરી સાથે જણાવવાનું છે કે અમારા ${_relation.text} શ્રી સ્વ.'}${_deadName.text} સ્વર્ગવાસ પામેલ છે. આપ અમારા પરિવારની સાથે છો. હાલના સંજોગો ને ધ્યાનમાં રાખીને સદ્દગત નું બેસણું તથા લૌકિક ક્રિયા બંધ રાખેલ છે. તેથી આપ ટેલીફોનીક બેસણું આપશો તો પણ અમો રૂબરૂ મળીયાની તુલ્ય સમજીશુ.'),
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
                    Get.to(() => SelectThemeScreen());
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
    );
  }
}
