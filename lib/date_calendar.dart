// import 'package:flutter/material.dart';
// import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
// import 'package:intl/intl.dart';

// class DateCalendar extends StatefulWidget {
//   @override
//   _DateCalendarState createState() => _DateCalendarState();
// }

// class _DateCalendarState extends State<DateCalendar> {
//   DateTime? selectedDay;
//   List? selectedEvent;

//   final Map<DateTime, List<CleanCalendarEvent>> _events = {
//     DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
//       CleanCalendarEvent('Event A',
//           startTime: DateTime(DateTime.now().year, DateTime.now().month,
//               DateTime.now().day, 12, 0),
//           endTime: DateTime(DateTime.now().year, DateTime.now().month,
//               DateTime.now().day + 1, 12, 0),
//           ),
//     ],
//     DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2):
//         [
//       CleanCalendarEvent(
//         'Event B',
//         startTime: DateTime(DateTime.now().year, DateTime.now().month,
//             DateTime.now().day + 3, 12, 0),
//         endTime: DateTime(DateTime.now().year, DateTime.now().month,
//             DateTime.now().day + 4, 12, 0),
//         color: Colors.black,
//       ),
//     ],
//   };

//   void _handleData(date) {
//     setState(() {
//       selectedDay = date;
//       selectedEvent = _events[selectedDay] ?? [];
//     });
//     print(selectedDay);
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     selectedEvent = _events[selectedDay] ?? [];
//     super.initState();
//   }

//   Widget _buildEventList() {
//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: ListView.builder(
//         shrinkWrap: true,
//         padding: EdgeInsets.all(0.0),
//         itemBuilder: (BuildContext context, int index) {
//           final CleanCalendarEvent event = selectedEvent![index];
//           final String start =
//               DateFormat('HH:mm').format(event.startTime).toString();
//           final String end =
//               DateFormat('HH:mm').format(event.endTime).toString();
//           return ListTile(
//             contentPadding:
//                 EdgeInsets.only(left: 2.0, right: 8.0, top: 2.0, bottom: 2.0),
//             leading: Container(
//               width: 10.0,
//               color: event.color,
//             ),
//             title: Text(event.summary),
//             subtitle:
//                 event.description.isNotEmpty ? Text(event.description) : null,
//             trailing: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [Text(start), Text(end)],
//             ),
//             onTap: () {
//               print('Tapped');
//             },
//           );
//         },
//         itemCount: selectedEvent!.length,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Calender'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           children: [
//             Container(
//               height: 500,
//               width: double.infinity,
//               child: Calendar(
//                 startOnMonday: true,
//                 selectedColor: Colors.blue,
//                 todayColor: Colors.red,
//                 eventColor: Colors.green,
//                 eventDoneColor: Colors.amber,
//                 onRangeSelected: (range) {
//                   print('Selected Day ${range.from}, ${range.to}');
//                 },
//                 onDateSelected: (date) {
//                   return _handleData(date);
//                 },
//                 events: Map<DateTime, List<CleanCalendarEvent>>(),
//                 isExpanded: true,
//                 dayOfWeekStyle: TextStyle(
//                   fontSize: 13,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w900,
//                 ),
//                 bottomBarTextStyle: TextStyle(
//                   color: Colors.white,
//                 ),
//                 hideBottomBar: false,
//                 isExpandable: false,
//                 hideArrows: false,
//                 weekDays: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
//               ),
//             ),
//             _buildEventList(),
//           ],
//         ),
//       ),
//     );
//   }
// }