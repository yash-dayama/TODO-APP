import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_todo/Models/task.dart';
import 'package:flutter_todo/Ui/theme.dart';
import 'package:flutter_todo/Ui/widgets/button.dart';
import 'package:flutter_todo/Ui/widgets/input_field.dart';
import 'package:flutter_todo/controllers/task_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

/*
author: add_task_bar.dart(Yash D)
description: add task button
date: 10:01:23
*/
class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  String _endTime = "9:30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];
  String _selectedRepeat = "None";
  List<String> repeatList = ["None", "Daily", "Weekly", "monthly"];
  int _selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: _appBar(context),
      body: Container(
        padding: EdgeInsets.only(
            left: currentWidth * 0.04, right: currentWidth * 0.04),
        child: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth < 650) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Text(
                    'Add Task',
                    style: headingStyle,
                  ),
                  MyInputField(
                    title: 'Title',
                    hint: 'Enter title here (30 char max.)',
                    controller: _titleController,
                  ),
                  MyInputField(
                    title: 'Note',
                    hint: 'Enter note here (30 char max.)',
                    controller: _noteController,
                  ),
                  InkWell(
                    onTap: () {
                      return _getDateFromUser();
                    },
                    child: MyInputField(
                      title: 'Date',
                      hint: DateFormat.yMd().format(_selectedDate),
                      widget: IconButton(
                        icon: Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          print("Hi there");
                          _getDateFromUser();
                        },
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: MyInputField(
                        title: "Start Time",
                        hint: _startTime,
                        widget: IconButton(
                            onPressed: () {
                              _getTimeFromUser(isStartTime: true);
                            },
                            icon: Icon(
                              Icons.access_time_rounded,
                              color: Colors.grey,
                            )),
                      )),
                      SizedBox(
                        width: currentWidth * 0.02,
                      ),
                      Expanded(
                          child: MyInputField(
                        title: "End Time",
                        hint: _endTime,
                        widget: IconButton(
                            onPressed: () {
                              _getTimeFromUser(isStartTime: false);
                            },
                            icon: Icon(
                              Icons.access_time_rounded,
                              color: Colors.grey,
                            )),
                      ))
                    ],
                  ),
                  MyInputField(
                    title: "Remind",
                    hint: "$_selectedRemind minutes early",
                    widget: DropdownButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      iconSize: 32,
                      elevation: 4,
                      style: subTitleStyle,
                      underline: Container(
                        height: 0,
                      ),
                      onChanged: (String? newvalue) {
                        setState(() {
                          _selectedRemind = int.parse(newvalue!);
                        });
                      },
                      items:
                          remindList.map<DropdownMenuItem<String>>((int value) {
                        return DropdownMenuItem<String>(
                            value: value.toString(),
                            child: Text(value.toString()));
                      }).toList(),
                    ),
                  ),
                  MyInputField(
                    title: "Repeat",
                    hint: "$_selectedRepeat",
                    widget: DropdownButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      iconSize: 32,
                      elevation: 4,
                      style: subTitleStyle,
                      underline: Container(
                        height: 0,
                      ),
                      onChanged: (String? newvalue) {
                        setState(() {
                          _selectedRepeat = newvalue!;
                          print(_selectedRepeat);
                        });
                      },
                      items: repeatList
                          .map<DropdownMenuItem<String>>((String? value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value!,
                                style: TextStyle(color: Colors.grey)));
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: currentHeight * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _colorPallete(),
                      Container(
                          height: currentHeight * 0.07,
                          width: currentWidth * 0.3,
                          child: MyButton(
                              label: "+ Create", onTap: () => _validateDate()))
                    ],
                  )
                ],
              ),
            );
          } else {
            return Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Text(
                      'Add Task',
                      style: headingStyle,
                    ),
                    MyInputField(
                      title: 'Title',
                      hint: 'Enter title here (30 char max.)',
                      controller: _titleController,
                    ),
                    MyInputField(
                      title: 'Note',
                      hint: 'Enter note here (30 char max.)',
                      controller: _noteController,
                    ),
                    InkWell(
                      onTap: () {
                        return _getDateFromUser();
                      },
                      child: MyInputField(
                        title: 'Date',
                        hint: DateFormat.yMd().format(_selectedDate),
                        widget: IconButton(
                          icon: Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            print("Hi there");
                            _getDateFromUser();
                          },
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: MyInputField(
                            title: "Start Time",
                            hint: _startTime,
                            widget: IconButton(
                                onPressed: () {
                                  _getTimeFromUser(isStartTime: true);
                                },
                                icon: Icon(
                                  Icons.access_time_rounded,
                                  color: Colors.grey,
                                )),
                          ),
                        ),
                        SizedBox(
                          width: currentWidth * 0.02,
                        ),
                        Expanded(
                            child: MyInputField(
                          title: "End Time",
                          hint: _endTime,
                          widget: IconButton(
                              onPressed: () {
                                _getTimeFromUser(isStartTime: false);
                              },
                              icon: Icon(
                                Icons.access_time_rounded,
                                color: Colors.grey,
                              )),
                        ))
                      ],
                    ),
                    MyInputField(
                      title: "Remind",
                      hint: "$_selectedRemind minutes early",
                      widget: DropdownButton(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                        iconSize: 32,
                        elevation: 4,
                        style: subTitleStyle,
                        underline: Container(
                          height: 0,
                        ),
                        onChanged: (String? newvalue) {
                          setState(() {
                            _selectedRemind = int.parse(newvalue!);
                          });
                        },
                        items: remindList
                            .map<DropdownMenuItem<String>>((int value) {
                          return DropdownMenuItem<String>(
                              value: value.toString(),
                              child: Text(value.toString()));
                        }).toList(),
                      ),
                    ),
                    MyInputField(
                      title: "Repeat",
                      hint: "$_selectedRepeat",
                      widget: DropdownButton(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                        iconSize: 32,
                        elevation: 4,
                        style: subTitleStyle,
                        underline: Container(
                          height: 0,
                        ),
                        onChanged: (String? newvalue) {
                          setState(() {
                            _selectedRepeat = newvalue!;
                            print(_selectedRepeat);
                          });
                        },
                        items: repeatList
                            .map<DropdownMenuItem<String>>((String? value) {
                          return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value!,
                                  style: TextStyle(color: Colors.grey)));
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: currentHeight * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _colorPallete(),
                        MyButton(
                            label: "+ Create", onTap: () => _validateDate())
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }

  _validateDate() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      // add to database
      _addTaskToDb();
      Get.back();
    } else if (_titleController.text.isEmpty || _noteController.text.isEmpty) {
      Get.snackbar("Required", "All fields are required !",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: pinkClr,
          icon: Icon(Icons.warning_amber_rounded, color: Colors.red));
    }
  }

  _addTaskToDb() async {
    int value = await _taskController.addTask(
        task: Task(
      note: _noteController.text,
      title: _titleController.text,
      date: DateFormat.yMd().format(_selectedDate),
      startTime: _startTime,
      endTime: _endTime,
      remind: _selectedRemind,
      repeat: _selectedRepeat,
      color: _selectedColor,
      isCompleted: 0,
    ));
    print("My id is" + "$value");
  }

  _colorPallete() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: titleStyle,
        ),
        SizedBox(
          height: 8,
        ),
        Wrap(
            children: List<Widget>.generate(3, (int index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColor = index;
                  print("$index");
                });
              },
              child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: index == 0
                        ? primaryClr
                        : index == 1
                            ? pinkClr
                            : yellowClr,
                    child: _selectedColor == index
                        ? Icon(Icons.done, color: Colors.white, size: 16)
                        : Container(),
                  )));
        }))
      ],
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage(
            'images/profiles.jpg',
          ),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2121),
    );
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {
      print('Something is wrong');
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("Time canceled");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = _formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
          //_startTime--> 10:30AM
          hour: int.parse(_startTime.split(":")[0]),
          minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
        ));
  }
}
