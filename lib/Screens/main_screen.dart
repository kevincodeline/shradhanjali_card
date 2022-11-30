import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  final Color color;
  final Color colorBorder;
  final String component;
  final String type;
  final String image;
  final String deadName;
  final String deadDate;
  final String age;
  final String village;
  final String address;
  const MainScreen(
      {Key? key,
      required this.color,
      required this.component,
      required this.colorBorder,
      required this.type,
      required this.image,
      required this.deadName,
      required this.deadDate,
      required this.age,
      required this.village,
      required this.address})
      : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            '${widget.type}',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.download,
                color: Colors.white,
                size: 30,
              ),
            ),
            SizedBox(
              width: 5,
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                color: widget.color,
                border: Border.all(
                  color: widget.colorBorder,
                  width: 10,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '|| ${widget.type} ||',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 25),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 90,
                        width: 70,
                        child: Image.asset('${widget.component}'),
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 130,
                            width: 90,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset(
                              '${widget.image}',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            top: -28,
                            right: -18,
                            child: SizedBox(
                                height: 100,
                                child: Image.asset('assets/flower.png')),
                          )
                        ],
                      ),
                      Container(
                        height: 90,
                        width: 70,
                        child: Image.asset('${widget.component}'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'સ્વ.____',
                    style: TextStyle(
                        color: widget.colorBorder,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'તા.29-11-2022,સોમવાર (ઉં.વર્ષ.23)(ગામ.bagdana)',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Text(
                        '${'દિલગીરી સાથે જણાવવાનું છે કે અમારા ${''} શ્રી સ્વ.'}${''} સ્વર્ગવાસ પામેલ છે. આપ અમારા પરિવારની સાથે છો. હાલના સંજોગો ને ધ્યાનમાં રાખીને સદ્દગત નું બેસણું તથા લૌકિક ક્રિયા બંધ રાખેલ છે. તેથી આપ ટેલીફોનીક બેસણું આપશો તો પણ અમો રૂબરૂ મળીયાની તુલ્ય સમજીશુ.',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                        textAlign: TextAlign.center),
                  ),
                  Container(
                    height: 20,
                    width: 40,
                    decoration: BoxDecoration(
                      color: widget.colorBorder,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        'લી.',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'mihir-784578454',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'pinju-784578454',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'birju-784578454',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    height: 20,
                    width: 40,
                    decoration: BoxDecoration(
                      color: widget.colorBorder,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        'સ્થળ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text('F-420, લિબર્ટી ઇલેવન મોટાવરાછા સુરત 394101',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                      textAlign: TextAlign.center),
                  SizedBox(
                    height: 2,
                  ),
                  Text('બેસણું 30-11-2022, બુધવાર ના રોજ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                      textAlign: TextAlign.center),
                  Text('સાંજે 07:00 થી 08:00 વાગ્યા સુધી રાખેલ છે',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                      textAlign: TextAlign.center),
                ],
              ),
            ),
            Image.asset('assets/flower1.png', height: 90),
            Positioned(
                right: 0,
                top: 2,
                child: Transform.rotate(
                    angle: 1.5,
                    child: Image.asset(
                      'assets/flower1.png',
                      height: 90,
                    ))),
          ],
        ),
      ),
    );
  }
}
