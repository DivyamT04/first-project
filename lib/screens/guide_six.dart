import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todos_project/screens/tips_an_tricks.dart';

import 'menu_screen.dart';

class GuideSix extends StatelessWidget {
  const GuideSix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 300),
        child: ListView(
          children: <Widget>[
            Container(
              child: Text(
                "Are you ready?                                      "
                    "Make sure you understand",
                style: TextStyle(fontSize: 20, fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.bold, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 50, top: 20),
                    child: SizedBox(height: 70,width: 100,
                      child: ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.black)
                                )
                            )),
                        child: Text('YES,'
                            'I got it',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontFamily: 'Comfortaa'),),
                        onPressed: (){navigateToMenuPage(context);},
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: SizedBox(height: 70,width: 170,
                      child: ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.black)
                                )
                            )),
                        child: Text('NO,'
                            'I want to see tutorial', textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontFamily: 'Comfortaa'),),
                        onPressed: (){navigateToTipsAnTricksPage(context);},),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  navigateToMenuPage(BuildContext context){
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MenuScreen())
    );
  }
  navigateToTipsAnTricksPage(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TipsAnTricks())
    );
  }
}
