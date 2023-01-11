import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_todo/Ui/theme.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  MyButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0), color: primaryClr),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
