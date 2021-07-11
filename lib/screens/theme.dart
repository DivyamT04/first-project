import 'package:flutter/material.dart';
import 'package:todos_project/screens/menu_screen.dart';

class Themes extends StatelessWidget {
  const Themes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: (){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MenuScreen())
        );
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Themes', style: TextStyle(color: Colors.white,fontSize: 20, fontFamily: 'Comfortaa', fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 70.0,
              child: ListTile(
                title: Text('Heat Map',
                    style: TextStyle(color: Colors.white,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                tileColor: Colors.cyan[900],
                contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 16.0),
              ),
            ),

            Container(
              height: 70,
              child: ListTile(
                  leading: Text('Shangri La',
                      style: TextStyle(color: Colors.white,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                  tileColor: Colors.cyan.withOpacity(0.58),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 16.0)
              ),
            ),
            Container(
              height: 70,
              child: ListTile(
                  leading: Text('Draw',
                      style: TextStyle(color: Colors.white,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                  tileColor: Colors.cyan.withOpacity(0.63),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 16.0)
              ),
            ),
            Container(
              height: 70,
              child: ListTile(
                  leading: Text('Graphite',
                      style: TextStyle(color: Colors.white,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                  tileColor: Colors.cyan.withOpacity(0.68),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 16.0)
              ),
            ),
            Container(
              height: 70,
              child: ListTile(
                  leading: Text('Pretty Princess',
                      style: TextStyle(color: Colors.white,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                  tileColor: Colors.cyan.withOpacity(0.73),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 16.0)
              ),
            ),
            Container(
              height: 70,
              child: ListTile(
                  leading: Text('Lucky Clover',
                      style: TextStyle(color: Colors.white,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                  tileColor: Colors.cyan.withOpacity(0.78),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 16.0)
              ),
            ),
            Container(
              height: 70,
              child: ListTile(
                  leading: Text('Theme Noir',
                      style: TextStyle(color: Colors.white,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                  tileColor: Colors.cyan.withOpacity(0.83),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 16.0)
              ),
            ),
            Container(
              height: 70,
              child: ListTile(
                  leading: Text('Magnificent',
                      style: TextStyle(color: Colors.white,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                  tileColor: Colors.cyan.withOpacity(0.88),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 16.0)
              ),
            ),
            Container(
              height: 70,
              child: ListTile(
                  leading: Text('Whale',
                      style: TextStyle(color: Colors.white,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                  tileColor: Colors.cyan.withOpacity(0.93),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 16.0)
              ),
            )
          ],
        ),
      ),
    );
  }
}
