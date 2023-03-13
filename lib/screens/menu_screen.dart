import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todos_project/screens/guide_one.dart';
import 'package:todos_project/screens/privacy_policy.dart';
import 'package:todos_project/screens/theme.dart';
import 'package:todos_project/screens/tips_an_tricks.dart';
import 'package:todos_project/widgets/todo_app.dart';
import 'package:rating_dialog/rating_dialog.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  void show(){
    showDialog(
        context: context,
        builder: (context){
          return RatingDialog(
            image: Image.asset("assets/images/todo_icon.jpeg", height: 100) ,
            title: Text("Tasks Todo"),
            message: Text("How much do you love our app ?"),
            submitButtonText: "Rate",
            onSubmitted: (response){
              print('rating : ${response.rating}');
            },
            onCancelled: () => print('cancelled'),
          );
        }
    );
  }

  @override
  var firestoreDB = FirebaseFirestore.instance.collection("tasks").snapshots();
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('Menu', style: TextStyle(color: Colors.white,fontSize: 20, fontFamily: 'Comfortaa', fontWeight: FontWeight.bold)),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: ListView(
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  navigateToTodoList(context);
                },
                child: Container(
                  height: 70.0,
                  child: StreamBuilder<QuerySnapshot<Object?>>(
                    stream: firestoreDB,
                    builder: (context, snapshot) {
                      return ListTile(
                        title: Text('My List',
                            style: TextStyle(color: Colors.white,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0)),
                        tileColor: Colors.grey[900],
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 16.0),
                        trailing: Container(
                          width: 60.0,
                          height: 150.0,
                          color: Colors.grey[850],
                          child: Center(child: Text("${(snapshot.data)?.docs.length}", style: TextStyle(fontSize: 27.0, color: Colors.white),)),
                        ),
                      );
                      },
                  ),
                ),
                ),

              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Themes())
                  );
                },
                child: Container(
                  height: 70,
                  child: ListView(
                    children: [ListTile(
                        leading: Text('Themes',
                            style: TextStyle(color: Colors.white,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.bold,
                                fontSize: 25)),
                        tileColor: Colors.grey[850],
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 16.0)
                    ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  navigateToGuideOne(context);
                },
                child: Container(
                  height: 70,
                  child: ListTile(
                      leading: Text('Guide',
                          style: TextStyle(color: Colors.white,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold,
                              fontSize: 25)),
                      tileColor: Colors.grey[800],
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 16.0)
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  navigateToTipsAnTricks(context);
                },
                child: Container(
                  height: 70,
                  child: ListTile(
                      leading: Text('Tips an Tricks',
                          style: TextStyle(color: Colors.white,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold,
                              fontSize: 25)),
                      tileColor: Colors.grey.withOpacity(0.5),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 16.0)
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  navigateToPrivacyPolicy(context);
                },
                child: Container(
                  height: 70,
                  child: ListTile(
                      leading: Text('Privacy policy',
                          style: TextStyle(color: Colors.white,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold,
                              fontSize: 25)),
                      tileColor: Colors.grey.withOpacity(0.55),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 16.0)
                  ),
                ),
              ),
              Container(
                height: 70,
                child: ListTile(
                    leading: Text('Feedback',
                        style: TextStyle(color: Colors.white,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                    tileColor: Colors.grey.withOpacity(0.6),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 16.0)
                ),
              ),
              GestureDetector(
                onTap: (){show(); },
                child: Container(
                  height: 70,
                  child: ListTile(
                      leading: Text('Rate',
                          style: TextStyle(color: Colors.white,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold,
                              fontSize: 25)),
                      tileColor: Colors.grey.withOpacity(0.65),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 16.0)
                  ),
                ),
              )
            ],
          ),
        );
  }

  navigateToTodoList(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => TodoApp()),
    );
  }
  navigateToTipsAnTricks(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => TipsAnTricks()),
    );
  }
  navigateToGuideOne(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => GuideOne()),
    );
  }
  navigateToPrivacyPolicy(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => PrivacyPolicy()),
    );
  }
}