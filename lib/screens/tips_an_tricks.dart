import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:todos_project/screens/menu_screen.dart';

class TipsAnTricks extends StatelessWidget {
  const TipsAnTricks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MenuScreen())
        );
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(preferredSize: Size.fromHeight(20.0),
          child: AppBar(
            backgroundColor: Colors.black,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text('Tips an Tricks',style: TextStyle(fontSize: 15, fontFamily: 'Comfortaa', fontWeight: FontWeight.bold),),
          ),
        ),
        body: ListView(
          children: [
            Container(
              height: 80.0,
              child: ListTile(
                title:Marquee(text: 'Swipe right to complete               ',style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  blankSpace: 20.0,
                  velocity: 30.0,
                  pauseAfterRound: Duration(seconds: 5),
                  startPadding: 5.0,
                  accelerationDuration: Duration(seconds: 1),
                  accelerationCurve: Curves.linear,
                  decelerationDuration: Duration(milliseconds: 1000),
                  decelerationCurve: Curves.easeOut,
                ),
                tileColor: Colors.cyan[900],
                contentPadding: EdgeInsets.symmetric(
                    vertical: 19.0, horizontal: 16.0),
              ),
            ),
            Container(
              height: 80.0,
              child: ListTile(
                title: Text('Swipe to the left to Delete',
                    style: TextStyle(color: Colors.white,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                tileColor: Colors.cyan.withOpacity(0.58),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
              ),
            ),
            Container(
              height: 80.0,
              child: ListTile(
                title: Marquee(text: 'Press button to create an item               ',style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  blankSpace: 20.0,
                  velocity: 30.0,
                  pauseAfterRound: Duration(seconds: 5),
                  startPadding: 5.0,
                  accelerationDuration: Duration(seconds: 1),
                  accelerationCurve: Curves.linear,
                  decelerationDuration: Duration(milliseconds: 1000),
                  decelerationCurve: Curves.easeOut,
                ),
                tileColor: Colors.cyan.withOpacity(0.63),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 19.0, horizontal: 16.0),
              ),
            ),
            Container(
              height: 80.0,
              child: ListTile(
                title: Text('Double tap to go back',
                    style: TextStyle(color: Colors.white,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                tileColor: Colors.cyan.withOpacity(0.68),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
              ),
            ),
            Container(
              height: 80.0,
              child: ListTile(
                title: Text('Tap on a title to edit',
                    style: TextStyle(color: Colors.white,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                tileColor: Colors.cyan.withOpacity(0.73),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
              ),
            ),
            Container(
              height: 80.0,
              child: ListTile(
                title: Marquee(text: 'Tap on the list to see its content               ',style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  blankSpace: 20.0,
                  velocity: 30.0,
                  pauseAfterRound: Duration(seconds: 5),
                  startPadding: 5.0,
                  accelerationDuration: Duration(seconds: 1),
                  accelerationCurve: Curves.linear,
                  decelerationDuration: Duration(milliseconds: 1000),
                  decelerationCurve: Curves.easeOut,
                ),
                tileColor: Colors.cyan.withOpacity(0.78),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 19.0, horizontal: 16.0),
              ),
            ),
            Container(
              height: 80.0,
              child: ListTile(
                title: Marquee(text: 'Tap on an item to show Reminder               ',style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  blankSpace: 20.0,
                  velocity: 30.0,
                  pauseAfterRound: Duration(seconds: 5),
                  startPadding: 5.0,
                  accelerationDuration: Duration(seconds: 1),
                  accelerationCurve: Curves.linear,
                  decelerationDuration: Duration(milliseconds: 1000),
                  decelerationCurve: Curves.easeOut,
                ),
                tileColor: Colors.cyan.withOpacity(0.83),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 19.0, horizontal: 16.0),
              ),
            ),
            Container(
              height: 80.0,
              child: ListTile(
                title: Marquee(text: 'Tap on the description item to add/edit time             ',style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  blankSpace: 20.0,
                  velocity: 30.0,
                  pauseAfterRound: Duration(seconds: 5),
                  startPadding: 5.0,
                  accelerationDuration: Duration(seconds: 1),
                  accelerationCurve: Curves.linear,
                  decelerationDuration: Duration(milliseconds: 1000),
                  decelerationCurve: Curves.easeOut,
                ),
                tileColor: Colors.cyan.withOpacity(0.88),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 19.0, horizontal: 16.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}