import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
/*
author: notified_page.dart
description: add task button
date: 12:01:23
*/

// the page after the calling of notification which displays the time title description
class NotifiedPage extends StatelessWidget {
  final String? label;
  const NotifiedPage({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.grey[600] : Colors.white,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_ios,
                color: Get.isDarkMode ? Colors.white : Colors.grey),
          ),
          title: Text(
            this.label.toString().split("|")[0],
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                child: Text("Hello",
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                child: Text("You Have a new Reminder!",
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 20,
                    )),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                  height: 400,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Get.isDarkMode ? Colors.grey : Colors.blue[800]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.text_format,
                            color: Colors.white,
                            size: 20,
                          ),
                          Text("Title",
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 20, color: Colors.grey[100]))),
                        ],
                      ),
                      Text(
                        this.label.toString().split("|")[0],
                        style: TextStyle(
                            color: Get.isDarkMode ? Colors.black : Colors.white,
                            fontSize: 30),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.description,
                            color: Colors.white,
                            size: 20,
                          ),
                          Text("Description",
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 20, color: Colors.grey[100]))),
                        ],
                      ),
                      Text(
                        this.label.toString().split("|")[1],
                        style: TextStyle(
                            color: Get.isDarkMode ? Colors.black : Colors.white,
                            fontSize: 25),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey[200],
                            size: 20,
                          ),
                          Text("Time",
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 20, color: Colors.grey[100]))),
                        ],
                      ),
                      Text(
                        this.label.toString().split("|")[2],
                        style: TextStyle(
                            color: Get.isDarkMode ? Colors.black : Colors.white,
                            fontSize: 25),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
