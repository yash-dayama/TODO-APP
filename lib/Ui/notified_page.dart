import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

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
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                child: Text("You Have a new Reminder!",
                    style: TextStyle(
                      color: Colors.black,
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
                      color: Get.isDarkMode ? Colors.white : Colors.blue[800]),
                  child: Center(
                    child: Text(
                      this.label.toString().split("|")[1],
                      style: TextStyle(
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                          fontSize: 30),
                    ),
                  )),
            ],
          ),
        ));
  }
}
