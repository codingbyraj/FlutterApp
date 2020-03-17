// import 'package:flutter/material.dart';

// import './model/lesson.dart';
// import './detail_page.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(primaryColor: Color.fromRGBO(58, 66, 86, 1.0)),
//       home: ListPage(title: 'Lessons'),
//     );
//   }
// }

// class ListPage extends StatefulWidget {
//   ListPage({Key key, this.title}) : super(key: key);
//   final String title;
//   @override
//   State<StatefulWidget> createState() {
//     return _ListPageState();
//   }
// }

// class _ListPageState extends State<ListPage> {
//   List lessons;

//   List getLessons() {
//     return [
//       Lesson(
//           title: "Introduction to Driving",
//           level: "Beginner",
//           indicatorValue: 0.33,
//           price: 20,
//           content:
//               "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
//       Lesson(
//           title: "Reversing around the corner",
//           level: "Intermidiate",
//           indicatorValue: 0.66,
//           price: 30,
//           content:
//               "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
//       Lesson(
//           title: "Incorrect Use of Signal",
//           level: "Advanced",
//           indicatorValue: 1.0,
//           price: 50,
//           content:
//               "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
//       Lesson(
//           title: "Engine Challenges",
//           level: "Advanced",
//           indicatorValue: 1.0,
//           price: 50,
//           content:
//               "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
//       Lesson(
//           title: "Self Driving Car",
//           level: "Advanced",
//           indicatorValue: 1.0,
//           price: 50,
//           content:
//               "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.  ")
//     ];
//   }

//   @override
//   void initState() {
//     lessons = getLessons();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final makeBottom = Container(
//       height: 55.0,
//       child: BottomAppBar(
//         color: Color.fromRGBO(58, 66, 86, 1.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             IconButton(
//               icon: Icon(Icons.home, color: Colors.white),
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: Icon(Icons.blur_on, color: Colors.white),
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: Icon(Icons.hotel, color: Colors.white),
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: Icon(Icons.account_box, color: Colors.white),
//               onPressed: () {},
//             )
//           ],
//         ),
//       ),
//     );

//     ListTile makeListTile(Lesson lesson) => ListTile(
//           contentPadding: EdgeInsets.symmetric(
//             horizontal: 20.0,
//             vertical: 10.0,
//           ),
//           leading: Container(
//             padding: EdgeInsets.only(right: 12.0),
//             decoration: BoxDecoration(
//               border: Border(
//                 right: BorderSide(
//                   width: 1.0,
//                   color: Colors.white24,
//                 ),
//               ),
//             ),
//             child: Icon(Icons.autorenew, color: Colors.white),
//           ),
//           title: Text(
//             "Introduction to Driving",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//           // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

//           subtitle: Row(
//             children: <Widget>[
//               Expanded(
//                 flex: 1,
//                 child: Container(
//                   child: LinearProgressIndicator(
//                     backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
//                     value: lesson.indicatorValue,
//                     valueColor: AlwaysStoppedAnimation(Colors.green),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 4,
//                 child: Container(
//                     child: Padding(
//                   padding: EdgeInsets.only(left: 10.0),
//                   child: Text(
//                     lesson.level,
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 )),
//               )
//             ],
//           ),
//           trailing: Icon(
//             Icons.keyboard_arrow_right,
//             color: Colors.white,
//             size: 30.0,
//           ),
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => DetailPage()),
//             );
//           },
//         );
//     // method

//     Card makeCard(Lesson lesson) => Card(
//           elevation: 8.0,
//           margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
//           child: Container(
//             decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
//             child: makeListTile(lesson),
//           ),
//         );

//     final makeBody = Container(
//       child: ListView.builder(
//         scrollDirection: Axis.vertical,
//         shrinkWrap: true,
//         itemCount: lessons.length,
//         itemBuilder: (BuildContext context, int index) {
//           return makeCard(lessons[index]);
//         },
//       ),
//     );
//     final topAppBar = AppBar(
//       elevation: 0.7,
//       backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
//       actions: <Widget>[
//         IconButton(
//           icon: Icon(Icons.list),
//           onPressed: () {
//             print("hi");
//           },
//         )
//       ],
//       title: Text(widget.title),
//     );

//     return Scaffold(
//         backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
//         appBar: topAppBar,
//         body: makeBody,
//         bottomNavigationBar: makeBottom);
//   }
// }
