import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String? userTypeValue;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'શ્રદ્ધાંજલિ',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: Get.height * 0.06,
                width: Get.width * 0.30,
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
              SizedBox(
                height: 10,
              ),
              TextFormField(
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
              SizedBox(
                height: 10,
              ),
              Container(
                  // width:400,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(
                    vertical: 3,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: DropdownButton<String>(
                    // isExpanded: true,
                    value: userTypeValue,
                    hint: const Text(
                      "સંબંધ પસંદ કરો",
                      maxLines: 1,
                      style: TextStyle(color: Colors.black),
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    isExpanded: true,
                    elevation: 16,
                    // style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 0.10,
                      color: Colors.transparent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        userTypeValue = newValue!;
                      });
                    },
                    items: <String>[
                      'પિતા',
                      'માતા',
                      'દાદી',
                      'દાદા',
                      'ભાઈ',
                      'બહેન',
                      'મોટો ભાઈ',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  )),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width * 0.50,
                    child: TextFormField(
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
                        // _event_on.text = "${formatter.format(date!)}";
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
                    width: Get.width * 0.40,
                    child: TextFormField(
                      cursorColor: Colors.black,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
