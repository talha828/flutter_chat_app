import 'package:flutter/material.dart';
class Buttons extends StatelessWidget {
  Buttons({this.text,this.onTap});
  final text;
  final onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        margin: EdgeInsets.all(7),
        alignment: Alignment.center,
        width: 150,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
