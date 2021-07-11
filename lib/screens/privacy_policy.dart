import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:todos_project/screens/menu_screen.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: (){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder:(context) => MenuScreen() ));
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(20.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            title: Text('Private Policy',style: TextStyle(fontSize: 15, fontFamily: 'Comfortaa', fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
        ),
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [Container(
            height: 270,
            width: 500,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/clear_todo.jpeg",),
                    fit: BoxFit.fill
                )
            ),
          ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: ListTile(
                title: Text('Information we collect', style: TextStyle(fontSize: 20, color: Colors.cyan)),
              ),
            ),
            ListTile(
              title: Text('''We do not collect or store any personal data on our any 3rd-party servers.All personal data is stored locally on the user's device and is protected from access by other applications. We do collect anonymous statistical usage data in the form of analytics.This is stored on 3rd-party servers(Google Analytics) and is used to improve the application, service and bug fix along with users feedback.''',
                maxLines: 20, style: TextStyle(fontSize: 14.0, color: Colors.black, height: 1.6),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: ListTile(
                  title: Text('How to contact us',style: TextStyle(fontSize: 20, color: Colors.cyan))
              ),
            ),
            ListTile(
              title: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'If you have any questions about our Privacy Policy of the Services, please contact us at  ',
                    style: TextStyle(fontSize: 15.0, color: Colors.black, height: 1.6),

                  ),
                  TextSpan(
                      text: 'divyam.thapliyal@publicissapient.com',
                      style: TextStyle(fontSize: 16.0, color: Colors.blue, decoration: TextDecoration.underline,height: 1.6),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('You clicked on me!');
                        }
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
