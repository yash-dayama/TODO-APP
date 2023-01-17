import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Models/task.dart';
import '../theme.dart';

/*
author: task_tile.dart (Yash P)
description: where the body of the page is diaplayed
date: 12:01:23
*/

// where the tasks are shown is task tile class
class TaskTile extends StatelessWidget {
  final Task? task;
  TaskTile(this.task);
// where the todo and completed actions are displayed
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    return Container(
      child: LayoutBuilder(builder: (context, constaints) {
        if (constaints.maxWidth < 650) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: currentWidth * 0.06),
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: currentHeight * 0.02),
            child: Container(
              padding: EdgeInsets.all(currentHeight * 0.02),
              //  width: SizeConfig.screenWidth * 0.78,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: _getBGClr(task?.color ?? 0),
              ),
              child: Row(children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task?.title ?? "",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: currentHeight * 0.01,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey[200],
                            size: 25,
                          ),
                          SizedBox(width: currentWidth * 0.015),
                          Text(
                            "${task!.startTime} - ${task!.endTime}",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 14, color: Colors.grey[100]),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: currentHeight * 0.015),
                      Text(
                        task?.note ?? "",
                        style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(fontSize: 16, color: Colors.grey[100]),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: currentWidth * 0.02),
                  height: 60,
                  width: 0.5,
                  color: Colors.grey[200]!.withOpacity(0.7),
                ),
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    task!.isCompleted == 1 ? "COMPLETED" : "TO:- DO",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ]),
            ),
          );
        } else {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: currentWidth * 0.03),
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: currentHeight * 0.02),
            child: Container(
              padding: EdgeInsets.all(currentHeight * 0.02),
              //  width: SizeConfig.screenWidth * 0.78,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: _getBGClr(task?.color ?? 0),
              ),
              child: Row(children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(currentWidth * 0.01),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task?.title ?? "",
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: currentHeight * 0.01,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.access_time_rounded,
                              color: Colors.grey[200],
                              size: 25,
                            ),
                            SizedBox(width: currentWidth * 0.015),
                            Text(
                              "${task!.startTime} - ${task!.endTime}",
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 14, color: Colors.grey[100]),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: currentHeight * 0.015),
                        Text(
                          task?.note ?? "",
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 16, color: Colors.grey[100]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: currentWidth * 0.02),
                  height: 60,
                  width: 0.5,
                  color: Colors.grey[200]!.withOpacity(0.7),
                ),
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    task!.isCompleted == 1 ? "COMPLETED" : "TO:- DO",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ]),
            ),
          );
        }
      }),
    );
  }

  _getBGClr(int no) {
    switch (no) {
      case 0:
        return bluishClr;
      case 1:
        return pinkClr;
      case 2:
        return yellowClr;
      default:
        return bluishClr;
    }
  }
}
