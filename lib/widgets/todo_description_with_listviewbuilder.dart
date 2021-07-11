import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:todos_project/models/todos_changenotifier.dart';
import 'package:intl/intl.dart';
import 'package:todos_project/utils.dart';
import 'package:timezone/timezone.dart'as tz;
import 'package:timezone/data/latest.dart' as tz;

class TodoDescriptionListViewBuilder extends StatefulWidget {
  @override
  _TodoDescriptionListViewBuilderState createState() => _TodoDescriptionListViewBuilderState();
}

class _TodoDescriptionListViewBuilderState extends State<TodoDescriptionListViewBuilder> {
  //late TextEditingController descInputController;

  DateTime dateTime = DateTime.now();
  FlutterLocalNotificationsPlugin fltrNotification = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    var androidInitilize = new AndroidInitializationSettings('todo_icon');
    var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings =
    new InitializationSettings(android: androidInitilize, iOS: iOSinitilize);
    //fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings);
    //onSelectNotification: notificationSelected);
  }
  Widget slideRightBackground() {
    return Container(
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
              height: 30,
            ),
            Icon(
              Icons.check,
              color: Colors.lightGreenAccent,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }
  Widget slideLeftBackground() {
    return Container(
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.red,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  Widget buildDateTimePicker() => SizedBox(
    height: 180.0,
    child: CupertinoDatePicker(
      initialDateTime: dateTime,
      mode: CupertinoDatePickerMode.dateAndTime,
      onDateTimeChanged: (dateTime) => setState(() => this.dateTime = dateTime),
    ),
  );

  // await fltrNotification.show(
  //     0, "Task", "You created a Task",
  //     generalNotificationDetails, payload: "Task");
  // fltrNotification.schedule(1, "Reminder", "task", value, generalNotificationDetails);

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoChangeNotifier>(
      builder: (context, todolistCNIntance,__) =>todolistCNIntance.list.isNotEmpty ? ListView.builder(
          itemCount: todolistCNIntance.list.length,
          itemBuilder:(BuildContext context, int index){
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                switch (direction) {
                  case DismissDirection.endToStart:
                    var docId = todolistCNIntance.docID[index];

                    FirebaseFirestore.instance
                        .collection('tasks')
                        .doc(todolistCNIntance.uid)
                        .collection('subtitle')
                        .doc(docId)
                        .delete();
                    break;

                  case DismissDirection.startToEnd:
                    break;
                  default:
                    break;
                }
              },
              background: slideRightBackground(),
              secondaryBackground: slideLeftBackground(),
              child: Card(
                elevation: 0,
                child: Container(
                  height: 70.0,
                  child: ListTile(
                    onTap: () => Utils.showSheet(
                      context,
                      child:buildDateTimePicker(),
                      onClicked: () {
                        final value =
                        DateFormat('MM/dd/yyyy HH:mm').format(dateTime);
                        _showNotification(value);
                        Navigator.pop(context);
                      },
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 16.0),
                    tileColor: Colors.cyan[600],
                    title: Text(
                      todolistCNIntance.list[index],
                      style: TextStyle(fontSize: 27.0, color: Colors.white),
                    ),
                    subtitle: Text("Add Reminder", style: TextStyle(fontSize: 14, color: Colors.white),),
                  ),
                ),
              ),
            );
          }
      ): Text("No doc"),
    );
  }
  Future _showNotification(value) async {
    var androidDetails = new AndroidNotificationDetails(
        "Channel ID", "Divyam programmer", "This is my channel",
        importance: Importance.high);
    var iSODetails = new IOSNotificationDetails();
    var generalNotificationDetails =
    new NotificationDetails(android: androidDetails, iOS: iSODetails);

    fltrNotification.zonedSchedule(0,
        "Reminder",
        "TODO Task",
        tz.TZDateTime.now(tz.local).add(Duration(seconds: 3),),
        //tz.TZDateTime.from(value, tz.local),
        generalNotificationDetails,
        uiLocalNotificationDateInterpretation:UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle:true
    );
  }
}
