import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final Color color;
  final Color colorBorder;
  final String component;
  const MainScreen(
      {Key? key,
      required this.color,
      required this.component,
      required this.colorBorder})
      : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: widget.color,
            border: Border.all(
              color: widget.colorBorder,
              width: 10,
            ),
          ),
        ),
      ),
    );
  }
}
