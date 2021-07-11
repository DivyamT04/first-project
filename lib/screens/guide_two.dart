import 'guide_three.dart';
import 'package:flutter/material.dart';

class GuideTwo extends StatelessWidget {
  const GuideTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        navigateToGuideThree(context);
      },
      child: Image(
        image: AssetImage('assets/images/two.jpeg'),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
  navigateToGuideThree(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GuideThree())
    );
  }
}
