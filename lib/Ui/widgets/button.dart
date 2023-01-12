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
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: currentHeight * 0.07,
        width: currentWidth * 0.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0), color: primaryClr),
        child: Padding(
          padding: EdgeInsets.all(currentHeight * 0.025),
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
