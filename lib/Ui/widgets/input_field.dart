import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_todo/Ui/theme.dart';
import 'package:get/get.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const MyInputField(
      {super.key,
      required this.title,
      required this.hint,
      this.controller,
      this.widget});

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: currentHeight * 0.02),
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 650) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: titleStyle,
              ),
              Container(
                height: currentHeight * 0.065,
                margin: EdgeInsets.only(top: currentHeight * 0.01),
                padding: EdgeInsets.only(left: currentWidth * 0.01),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        readOnly: widget == null ? false : true,
                        autofocus: false,
                        cursorColor: Get.isDarkMode
                            ? Colors.grey[100]
                            : Colors.grey[700],
                        controller: controller,
                        style: subTitleStyle,
                        decoration: InputDecoration(
                          
                          border: InputBorder.none,
                          hintText: hint,
                          contentPadding: EdgeInsets.all(currentHeight * 0.01),
                          hintStyle: subTitleStyle,
                        ),
                      ),
                    ),
                    widget == null ? Container() : Container(child: widget)
                  ],
                ),
              ),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: titleStyle,
              ),
              Container(
                height: currentHeight * 0.15,
                margin: EdgeInsets.only(top: currentHeight * 0.01),
                padding: EdgeInsets.only(left: currentWidth * 0.01),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        readOnly: widget == null ? false : true,
                        autofocus: false,
                        cursorColor: Get.isDarkMode
                            ? Colors.grey[100]
                            : Colors.grey[700],
                        controller: controller,
                        style: subTitleStyle,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: hint,
                          contentPadding: EdgeInsets.all(currentHeight * 0.02),
                          hintStyle: subTitleStyle,
                        ),
                      ),
                    ),
                    widget == null ? Container() : Container(child: widget)
                  ],
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
